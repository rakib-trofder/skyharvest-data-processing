# Processing Big GeoTIFFs with PostGIS and MinIO

This document outlines the process of ingesting large GeoTIFF raster files into a PostGIS database using an "out-of-db" approach, where the raster pixel data is stored in a MinIO object storage service, and PostGIS only stores the raster metadata and a reference to the data's location.

This method is ideal for very large raster files as it keeps the database size small and leverages the scalability and performance of object storage for the bulky pixel data.

## Overview

The process consists of the following main steps:

1.  **Prerequisites**: Installing necessary command-line tools and Python libraries.
2.  **Configuration**: Setting up connection details for PostGIS and MinIO, and defining the input/output files and raster properties.
3.  **Convert to COG**: The input GeoTIFF is converted into a Cloud-Optimized GeoTIFF (COG). This format is essential for efficient reading of raster data over a network.
4.  **Upload to MinIO**: The COG file is uploaded to a specified bucket in MinIO.
5.  **Ingest Raster Reference**: `raster2pgsql` is used to create and load a raster table into PostGIS. This table does not contain the pixel data itself but points to the COG file stored in MinIO.

## 1. Prerequisites

Before running the script, you must have the following installed and available in your system's PATH:

*   **GDAL**: A translator library for raster and vector geospatial data formats. It provides the `gdal_translate` command-line tool.
*   **PostgreSQL Client**: Provides the `psql` command-line tool for interacting with the PostgreSQL database.
*   **Python 3**: The script is written in Python.
*   **Required Python Libraries**:
    ```bash
    pip install minio psycopg2-binary
    ```

## 2. Configuration

The main script `scripts/raster_data_minio_postgis.py` contains a configuration section where you must provide your specific parameters.

```python
# --- CONFIGURATION ---

# MinIO Connection Details
MINIO_ENDPOINT = "your-minio-server:9000"
MINIO_ACCESS_KEY = "your-access-key"
MINIO_SECRET_KEY = "your-secret-key"
MINIO_SECURE = False  # Set to True if using HTTPS
MINIO_BUCKET_NAME = "your-raster-bucket"

# PostGIS Database Configuration
POSTGRES_DB_CONFIG = {
    'host': 'your-postgis-host',
    'port': 5432,
    'database': 'your-database-name',
    'user': 'your-username',
    'password': 'your-password'
}

# Input/Output Files
INPUT_RASTER_FILE = "/path/to/your/large_raster.tif"
OUTPUT_COG_FILE = "cog_raster.tif" # Temporary local file

# Raster Properties
RASTER_SRID = 4326  # Spatial Reference System Identifier (e.g., 4326 for WGS 84)
RASTER_TILE_WIDTH = 256
RASTER_TILE_HEIGHT = 256
POSTGIS_SCHEMA = "public"
POSTGIS_TABLE_NAME = "my_raster_table"

# --- END CONFIGURATION ---
```

## 3. The Workflow in Detail

### Step 3.1: Database Preparation

The script first connects to your PostGIS database to ensure it's correctly configured for handling out-of-db rasters.
- It creates the `postgis` and `postgis_raster` extensions if they don't exist.
- It enables out-of-db rasters by running:
  `ALTER DATABASE your_database SET postgis.enable_outdb_rasters TO true;`
- It configures the GDAL drivers:
  `ALTER DATABASE your_database SET postgis.gdal_enabled_drivers TO 'GTiff';`

### Step 3.2: Conversion to Cloud-Optimized GeoTIFF (COG)

The `gdal_translate` command is used to convert the source GeoTIFF into a COG.
```bash
gdal_translate input.tif output.cog.tif -of COG -co COMPRESS=LZW -co BLOCKSIZE=512
```
This step is critical. A COG is internally tiled and includes overviews, which allows applications to efficiently stream or download only the portions of the raster they need, without having to read the entire file.

### Step 3.3: Upload to MinIO

The generated COG file is uploaded to the configured MinIO bucket. The script also ensures the bucket has a public read policy. This is necessary so that PostGIS (via GDAL) can access the raster file over HTTP without requiring authentication credentials in the URL itself.

### Step 3.4: Ingesting the Raster Reference into PostGIS

This is the core of the process. The `raster2pgsql` utility is used to generate SQL for creating a raster table in PostGIS.
- The `-R` flag tells `raster2pgsql` to create an "out-of-db" raster. The actual pixel data will not be stored in the database.
- The path to the raster is provided as a `/vsicurl/` path, which is a GDAL virtual filesystem that allows reading files over HTTP.
  `/vsicurl/http://your-minio-server:9000/your-raster-bucket/cog_raster.tif`
- The script sets environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_S3_ENDPOINT`) which `raster2pgsql` uses to access the S3-compatible MinIO storage.
- The output of `raster2pgsql` is piped directly into `psql` to execute the generated SQL against your database.

This creates a table in PostGIS (`public.my_raster_table` in the example) that contains the raster's metadata, spatial footprint, and tiling information. Each tile entry points to the location of the data within the COG file on MinIO.

## 4. Running the Script

Once you have configured the script, you can run it directly:

```bash
python scripts/raster_data_minio_postgis.py
```

The script will print its progress for each step.

## 5. Querying the Data

After the script finishes, you can connect to your PostGIS database and query the raster data as if it were stored in the database. PostGIS will automatically fetch the required pixel data from MinIO when you run spatial queries.

Example Query: Get the value of the first band at a specific point.
```sql
SELECT ST_Value(rast, 1, ST_SetSRID(ST_MakePoint(longitude, latitude), 4326))
FROM my_raster_table
WHERE ST_Intersects(rast, ST_SetSRID(ST_MakePoint(longitude, latitude), 4326));
```

## 6. SQL Query Reference

This section provides a detailed breakdown of the SQL scripts used for various data processing and analysis tasks on the raster data.

---

### `indecies_calculation/average_based_indecies.sql`

**Action:** Calculates multiple vegetation indices (NDVI, GCI, RECI, NDWI, DVI) for a single, specific geographic point.

**Process:**
1.  Defines a specific point of interest.
2.  Finds the raster tile(s) that intersect with that point.
3.  Extracts the values for all 23 spectral bands at that point's pixel location.
4.  Calculates the average values for the Red, NIR, Green, and Red-Edge spectral bands based on predefined band groupings.
5.  Uses these averages to compute the final vegetation indices.

```sql
WITH specific_point AS (
  SELECT ST_Transform(
    ST_SetSRID(
      ST_MakePoint(151.45131539968017, -27.52619466785564),
      4326
    ),
    (SELECT ST_SRID(rast) FROM wyvern_dragonette_aus LIMIT 1)
  ) AS geom_proj
),
target_rasters AS (
  SELECT
    r.rast,
    sp.geom_proj
  FROM
    wyvern_dragonette_aus r,
    specific_point sp
  WHERE
    ST_Intersects(r.rast, sp.geom_proj)
),
band_values AS (
  SELECT
    (ST_WorldToRasterCoordX(tr.rast, ST_X(tr.geom_proj)))::int AS x,
    (ST_WorldToRasterCoordY(tr.rast, ST_Y(tr.geom_proj)))::int AS y,
    ST_AsText(ST_Transform(tr.geom_proj, 4326)) AS point_coordinates_wgs84,
    jsonb_object_agg(
      band_num,
      ST_Value(tr.rast, band_num, 
        (ST_WorldToRasterCoordX(tr.rast, ST_X(tr.geom_proj)))::int,
        (ST_WorldToRasterCoordY(tr.rast, ST_Y(tr.geom_proj)))::int
      )
    ) AS band_values
  FROM
    target_rasters tr,
    generate_series(1, 23) AS band_num
  GROUP BY tr.rast, tr.geom_proj
),
averages AS (
  SELECT
    x,
    y,
    point_coordinates_wgs84,
    -- Calculate band averages from JSON
    ((band_values->>'9')::numeric + (band_values->>'10')::numeric + 
     (band_values->>'11')::numeric + (band_values->>'12')::numeric +
     (band_values->>'13')::numeric + (band_values->>'14')::numeric) / 6.0 AS red_avg,
    
    ((band_values->>'16')::numeric + (band_values->>'17')::numeric + 
     (band_values->>'18')::numeric + (band_values->>'19')::numeric +
     (band_values->>'20')::numeric + (band_values->>'21')::numeric +
     (band_values->>'22')::numeric + (band_values->>'23')::numeric) / 8.0 AS nir_avg,
    
    ((band_values->>'2')::numeric + (band_values->>'3')::numeric + 
     (band_values->>'4')::numeric + (band_values->>'5')::numeric) / 4.0 AS green_avg,
    
    ((band_values->>'13')::numeric + (band_values->>'14')::numeric + 
     (band_values->>'15')::numeric + (band_values->>'16')::numeric) / 4.0 AS red_edge_avg
  FROM
    band_values
)
SELECT
  point_coordinates_wgs84,
  red_avg,
  nir_avg,
  green_avg,
  red_edge_avg,
  -- 1. NDVI (Normalized Difference Vegetation Index)
  (nir_avg - red_avg) / NULLIF((nir_avg + red_avg), 0) AS ndvi,
  
  -- 2. GCI (Green Chlorophyll Index)
  (nir_avg / NULLIF(green_avg, 0)) - 1 AS gci,
  
  -- 3. RECI (Red Edge Chlorophyll Index)
  (nir_avg / NULLIF(red_edge_avg, 0)) - 1 AS reci,
  
  -- 4. NDWI (Normalized Difference Water Index)
  (green_avg - nir_avg) / NULLIF((green_avg + nir_avg), 0) AS ndwi,
  
  -- 5. DVI (Difference Vegetation Index)
  (nir_avg - red_avg) AS dvi
FROM
  averages;
```

---

### `queries/polygon_based_band_values.sql`

**Action:** Extracts the pixel values for all bands for every pixel that intersects with a given input polygon.

**Process:**
1.  Defines a polygon of interest in WGS 84.
2.  Identifies the raster tiles that intersect with this polygon.
3.  Transforms the polygon's CRS to match the raster's CRS.
4.  Generates centroids for all pixels within the intersecting raster tiles.
5.  Filters these centroids to find only those that fall within the transformed polygon.
6.  For each of these filtered pixels, it retrieves the value for every band.

```sql
WITH
input_polygon AS (
    -- Define the polygon in its original WGS 84 CRS
    SELECT ST_GeomFromText(
            'POLYGON((151.45191179600488	-27.526421418791138,
                    151.45191781261346	-27.526261978664035,
                    151.45209229426197	-27.52627702018546,
                    151.4521013191747	-27.526430443703987,
                    151.45191179600488	-27.526421418791138,
                    151.45191179600488	-27.526421418791138))',
            4326
        ) AS geom_wgs84
),
target_raster AS (
    -- Find the relevant raster tile and transform the polygon to the raster's CRS
    SELECT
        r.rast,
        ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
    FROM
        wyvern_dragonette_aus r,
        input_polygon ip
    WHERE
        ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
    -- **Step 1: Generate the full set of pixel centroids from the target tile(s).**
    SELECT
        (ST_PixelAsCentroids(tr.rast, 1)).*, -- Get x, y, geom
        tr.rast,                             -- Pass the raster data along
        tr.geom_proj                         -- Pass the projected polygon along
    FROM
        target_raster tr
),
intersecting_pixels AS (
    -- **Step 2: Now, filter the generated pixels.**
    SELECT
        rast, x, y, geom
    FROM
        all_tile_pixels
    WHERE
        ST_Intersects(geom, geom_proj)
)
-- **Step 3: Extract values for the filtered pixels for each band.**
SELECT
    b.band_num AS band_number,
    ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
    ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
    px.x AS pixel_column,
    px.y AS pixel_row
FROM
    intersecting_pixels px,
    generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY
    band_number, y, x;
```

---

### `queries/subquery_generator.sql`

**Action:** A meta-query that generates a set of independent SQL queries. This is a strategy for parallel processing.

**Process:**
1.  Takes a large input polygon.
2.  Divides that polygon into a grid of smaller, square sub-polygons.
3.  For each sub-polygon, it constructs a complete, self-contained SQL query string.
4.  Each generated query is designed to fetch all band values for all pixels within its respective sub-polygon.
5.  The output is a list of these SQL query strings, which can then be executed in parallel by an external application or script.

```sql
WITH original_polygon AS (
  SELECT ST_GeomFromText(
    'POLYGON((151.45191179600488	-27.526421418791138,
            151.45191781261346	-27.526261978664035,
            151.45209229426197	-27.52627702018546,
            151.4521013191747	-27.526430443703987,
            151.45191179600488	-27.526421418791138,
            151.45191179600488	-27.526421418791138))',
    4326
  ) AS geom
),
original_polygon_3857 AS (
  SELECT ST_Transform(geom, 3857) AS geom_3857 FROM original_polygon
),
grid AS (
  SELECT g.geom AS cell_3857
  FROM original_polygon_3857,
  LATERAL (
    SELECT (ST_SquareGrid(
      GREATEST(
        ST_XMax(geom_3857) - ST_XMin(geom_3857),
        ST_YMax(geom_3857) - ST_YMin(geom_3857)
      ) / 4.0,
      geom_3857
    )).geom AS geom
  ) AS g
),
sub_polygons AS (
  SELECT
    ROW_NUMBER() OVER() as id,
    ST_Transform(ST_Intersection(ST_Transform(o.geom_3857, 3857), g.cell_3857), 4326) AS sub_geom
  FROM original_polygon_3857 o
  JOIN grid g ON ST_Intersects(o.geom_3857, g.cell_3857)
  WHERE NOT ST_IsEmpty(ST_Intersection(o.geom_3857, g.cell_3857))
)
SELECT
  FORMAT(
    $QUERY$
-- Query for Sub-Polygon %s
WITH input_polygon AS (
  SELECT ST_GeomFromText('%s', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
$QUERY$,
    id,
    ST_AsText(sub_geom)
  ) AS parallel_query
FROM sub_polygons;
```

---

### `queries/metadata.sql`

**Action:** Retrieves a comprehensive set of metadata for every raster tile in the table.

**Process:** It queries the `wyvern_dragonette_aus` table and uses various `ST_*` functions to extract metadata for each raster record (`rid`). This includes dimensions, spatial reference, pixel size, and the bounding box.

```sql
SELECT
  rid,
  ST_Width(rast) AS width,
  ST_Height(rast) AS height,
  ST_NumBands(rast) AS num_bands,
  ST_SRID(rast) AS srid,
  ST_ScaleX(rast) AS scale_x,
  ST_ScaleY(rast) AS scale_y,
  ST_SkewX(rast) AS skew_x,
  ST_SkewY(rast) AS skew_y,
  ST_UpperLeftX(rast) AS ul_x,
  ST_UpperLeftY(rast) AS ul_y,
  ST_Metadata(rast) AS metadata_json,
  ST_Envelope(rast) AS bounding_box_geom
FROM wyvern_dragonette_aus;
```
