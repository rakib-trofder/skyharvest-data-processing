# Wyvern Satellite 23-Band Spectral Analysis

This document provides a visual and analytical overview of the 23-band multispectral data captured by the Wyvern satellite. The analysis covers the distribution of wavelengths across bands, the spectral region classification, and the corresponding visual color associations.

---

## Wavelength Distribution by Band

The bar chart below illustrates the relationship between band numbers and their corresponding wavelengths in nanometers (nm). The color of each bar represents its approximate position in the visible to near-infrared (NIR) electromagnetic spectrum.

![Wavelengths by Band Number](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/Band-Wavelength-Spectrum-Mapping.png)

---

## Electromagnetic Spectrum Classification

The scatter plot below shows how each band fits into the electromagnetic spectrum. Each dot represents a band and is color-coded according to its spectral region (e.g., green, red, NIR).

![Electromagnetic Spectrum Region by Wavelength](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/Electromagnetic-Spectrum-Region-By-Wavelngth.png)

---

## Band-Spectrum Mapping Summary

The table below provides a summary of the band-to-wavelength mapping, including the associated spectral region and visual color name. This mapping is helpful for interpreting and visualizing multispectral imagery for remote sensing applications.

![Band–Wavelength–Spectrum Mapping](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/Band-Wavelength-Spectrum-Mapping.png)

---

## 🌿 Vegetation Indices Using Wyvern Bands

### 1. NDVI – Normalized Difference Vegetation Index
**Formula:**  
`NDVI = (NIR - Red) / (NIR + Red)`

- Healthy vegetation: **0.2 – 0.8**
- Bare soil: **~0.1**
- Water: **< 0**

**Applications:**  
Crop health monitoring, drought assessment, biomass analysis.

---

### 2. EVI – Enhanced Vegetation Index  
**Formula:**  
`EVI = G × ((NIR - Red) / (NIR + C1 × Red - C2 × Blue + L))`  
*Coefficients:* G=2.5, L=1, C1=6, C2=7.5

- Better performance in high biomass or dense canopy
- Healthy vegetation: **0.4 – 0.9**

**Applications:**  
Rainforest monitoring, canopy density studies.

---

### 3. SAVI – Soil Adjusted Vegetation Index  
**Formula:**  
`SAVI = ((NIR - Red) / (NIR + Red + L)) × (1 + L)`  
*L (soil brightness factor) = 0.5*

- Useful in arid or sparsely vegetated regions  
- Sparse vegetation: **0.2 – 0.4**

**Applications:**  
Dryland agriculture, early growth stages.

---

### 4. NDWI – Normalized Difference Water Index  
**Formula:**  
`NDWI = (Green - NIR) / (Green + NIR)`

- Water bodies: **> 0.3**
- Water-stressed vegetation: **< 0.1**

**Applications:**  
Irrigation monitoring, drought detection, wetland mapping.

---

### 5. NDRE – Normalized Difference Red Edge  
**Formula:**  
`NDRE = (NIR - RedEdge) / (NIR + RedEdge)`

- Sensitive to chlorophyll and nitrogen levels  
- Healthy crops: **0.2 – 0.5**

**Applications:**  
Precision agriculture, early stress detection, crop management.

---

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
 ## SQL Query Reference

This section provides a detailed breakdown of the SQL scripts used for various data processing and analysis tasks on the raster data.

---

### `queries/get_point_by_distance.sql`

**Action:** Calculates a new geographic point that is a specific distance and direction (bearing) from a starting point.

**Process:**
1.  Defines an initial point in WGS 84.
2.  It uses `ST_Project`, a geography function, to find the destination point. This is accurate for measurements in meters.
3.  The calculation is done by providing the starting point, a distance in meters, and a bearing in radians.

```sql
WITH input_point AS (
  SELECT ST_SetSRID(ST_MakePoint(151.436272644, -27.341744021), 4326) AS geom
)
SELECT 
  ST_X(ST_Transform(
    ST_Project(
      ST_Transform(geom, 3857),  -- Convert to Web Mercator (EPSG:3857) for accurate distance
      10,                        -- 10 meters
      radians(90)                -- Bearing in radians (90° = East)
    )::geometry,
    4326                         -- Convert back to WGS84 (EPSG:4326)
  )) AS new_lon,
  ST_Y(ST_Transform(
    ST_Project(
      ST_Transform(geom, 3857),
      10,
      radians(90)
    )::geometry,
    4326
  )) AS new_lat
FROM input_point;
```

---

### `queries/get_points_by_boundary.sql`

**Action:** Retrieves the coordinates of the center of every pixel that falls within a specified polygon boundary.

**Process:** This is similar to `polygon_based_band_values.sql` but stops short of extracting the band values. It finds all pixel centroids within the polygon and returns their WGS 84 coordinates.

```sql
WITH input_boundary AS (
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
target_rasters AS (
  SELECT
    r.rast,
    ST_Transform(ib.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM
    wyvern_dragonette_aus r,
    input_boundary ib
  WHERE
    ST_Intersects(r.rast, ST_Transform(ib.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT
    (ST_PixelAsCentroids(tr.rast, 1)).*,
    tr.geom_proj
  FROM
    target_rasters tr
),
unique_intersecting_pixels AS (
  SELECT DISTINCT ON (x, y, ST_AsEWKB(geom))
    ST_AsText(ST_Transform(geom, 4326)) AS pixel_center_coordinates_wgs84
  FROM
    all_tile_pixels
  WHERE
    ST_Intersects(geom, geom_proj)
  ORDER BY x, y, ST_AsEWKB(geom)
)
SELECT *
FROM unique_intersecting_pixels;
```

---

### `queries/get_area_by_polygon.sql`

**Action:** Calculates the area, dimensions (length and width), and centroid of a given polygon.

**Process:**
1.  Defines a polygon in WGS 84.
2.  Transforms the polygon to a suitable projected CRS for measurement (EPSG:3857, Web Mercator).
3.  Calculates the area using `ST_Area`.
4.  To find length and width, it first calculates the minimum bounding rectangle (`ST_OrientedEnvelope`) and then measures the distance between its corner points.

```sql
WITH poly AS (
  SELECT ST_Transform(
    ST_GeomFromText(
      'POLYGON((151.25392204192568, -27.705639639945662), 
    (151.25392204192568, -27.2955280266322), 
    (151.5801215277816, -27.2955280266322), 
    (151.5801215277816, -27.705639639945662), 
    (151.25392204192568, -27.705639639945662))_,
      4326
    ),
    3857 -- Using Web Mercator for measurement (EPSG:3857)
  ) AS geom
),
envelope AS (
  SELECT
    ST_OrientedEnvelope(geom) AS oriented_rect
  FROM poly
)
SELECT
  ST_Area(p.geom) AS area_sq_meters,
  ST_Area(p.geom)/10000 AS area_hectares,
  ST_Distance(
    ST_PointN(ST_Boundary(e.oriented_rect), 1),
    ST_PointN(ST_Boundary(e.oriented_rect), 2)
  ) AS length_meters,
  ST_Distance(
    ST_PointN(ST_Boundary(e.oriented_rect), 2),
    ST_PointN(ST_Boundary(e.oriented_rect), 3)
  ) AS width_meters,
  ST_AsText(ST_Centroid(ST_Transform(p.geom, 4326))) AS centroid
FROM poly p, envelope e;
```



# Data Visualization

This document outlines the functionality of the Python scripts in the `scripts` folder, which are used for visualizing geospatial data.

## `band_values_of_centroid.py`

This script visualizes the band values of the centroids of different raster areas on a map.

![Centroid's Band Values](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/Centroid-Band-Values.png)

### Functionality

- Defines three polygons: `autralia_full_area`, `autralia_raster_7`, and `autralia_raster_11`.
- Creates GeoDataFrames for each polygon.
- Calculates the intersection of the three areas.
- Creates a Folium map centered on Australia.
- Adds the polygons to the map with different colors.
- Adds markers for the centroids of each area.
- Displays a popup with the band values for the 7th and 11th rasters when the corresponding marker is clicked.

### Usage

Run the script to generate an HTML file containing the map.

## `display_all_point_in_a_boundary.py`

This script displays all the points within a given boundary on a map.

![All Points of A Boudary](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/All-Points.png)

### Functionality

- Defines four polygons: `autralia_full_area`, `autralia_raster_7`, `autralia_raster_11`, and `autralia_raster_points_by_boundary`.
- Creates GeoDataFrames for each polygon.
- Calculates the union of the rasters and the points boundary.
- Creates a Folium map centered on Australia.
- Adds the polygons to the map with different colors.
- Adds markers for all the points within the `autralia_raster_points_by_boundary` polygon.
- Displays a popup with the band values for the 7th and 11th rasters when the corresponding marker is clicked.

### Usage

Run the script to generate an HTML file containing the map.

## `visualize_overlapping_area.py`

This script visualizes the overlapping area of two polygons.

![Overlapping Area](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/Overlapping-Area.png)


### Functionality

- Defines two polygons: `autralia_area_1` and `autralia_area_2`.
- Creates GeoDataFrames for each polygon.
- Calculates the intersection of the two areas.
- Creates a Folium map centered on the area.
- Adds the polygons to the map with different colors.
- Highlights the overlapping area in violet.
- Adds markers for the centroids of each area.

### Usage

Run the script to generate an HTML file containing the map.

# `vegetation_indices.py`

This script visualizes spectral indices (NDVI, GCI, RECI, NDWI, DVI) for land and water areas in Iraq using Folium.

![Vegetation Indices Map](https://raw.githubusercontent.com/rakib-trofder/skyharvest-data-processing/main/images/Vegetation-Indecies.png)

## Functionality

- Defines three polygons:
  - `iraq_full_area`: The overall region.
  - `iraq_land_area`: Subregion representing land.
  - `iraq_water_area`: Subregion representing water.
- Converts these polygons to GeoDataFrames.
- Calculates centroids of each area.
- Visualizes on a Folium map:
  - **Land area** in green with spectral index tooltips.
  - **Water area** in blue with spectral index tooltips.
- Adds colored markers at the centroids.
- Includes a layer control panel for toggling visibility.

### Usage

Run the script to generate an HTML file containing the map.


# Geospatial Data Conversion

This document explains the different geospatial data formats used in this project and provides documentation for the conversion scripts found in the `conversions` folder.

## Data Formats

### GeoJSON

GeoJSON is a format for encoding a variety of geographic data structures. It is based on the JSON (JavaScript Object Notation) format. A GeoJSON object may represent a geometry, a feature, or a collection of features. The geometries are represented by a list of coordinates.

**Example:**
```json
[[[42.442936998, 34.341359141], [42.442936377, 34.341352093], [42.44293411, 34.341345281]]]
```

### PostGIS Polygon

PostGIS is a spatial database extender for PostgreSQL object-relational database. It adds support for geographic objects allowing location queries to be run in SQL. A PostGIS polygon is represented by a string of coordinate pairs.

**Example:**
```
(42.429008612415394 34.32981897724046,42.429008612415394 34.352897489171546,42.45677849293054 34.352897489171546)
```

### GeoPandas Polygon

GeoPandas is an open source project to make working with geospatial data in python easier. It extends the datatypes used by pandas to allow spatial operations on geometric types. A GeoPandas polygon is represented by a list of tuples, where each tuple is a coordinate pair.

**Example:**
```python
[(151.495119503, -27.516232176), (151.492934444, -27.533817593), (151.486941443, -27.550684795)]
```

## Conversion Scripts

This section describes the functions that convert between the different geospatial data formats.

The following input variables are used in the examples below:
```python
geojson_input_data = [[[42.442936998,34.341359141],[42.442936377,34.341352093],[42.44293411,34.341345281],[42.442936998,34.341359141]]]
postgis_input_data = "(42.429008612415394 34.32981897724046,42.429008612415394 34.32981897724046)"
geopandas_input_data = [(151.495119503, -27.516232176), (151.487886558, -27.481612191), (151.493414426, -27.498604591), (151.495119503, -27.516232176)]
```

### `geojson_to_geopandas.py`

This script converts GeoJSON data to GeoPandas format.

```python
def convert_geojson_to_geopandas(input_data):
    if not input_data or not input_data[0]:
        return []

    coordinates_list = input_data[0]
    output_tuples = [tuple(coord) for coord in coordinates_list]

    return output_tuples

geopandas_output_data = convert_geojson_to_geopandas(geojson_input_data)
print(geopandas_output_data)
```

### `geojson_to_postgis.py`

This script converts GeoJSON data to PostGIS format.

```python
def convert_geojson_to_postgis(boundary_coordinates):
    if not boundary_coordinates or not boundary_coordinates[0]:
        return ()

    formatted_points = []
    for point in boundary_coordinates[0]:
        formatted_points.append(f"{point[0]} {point[1]}")

    output_string = "(" + ", ".join(formatted_points) + ")"
    return output_string

postgis_output_data = convert_geojson_to_postgis(geojson_input_data)
print(postgis_output_data)
```

### `geopandas_to_geojson.py`

This script converts GeoPandas data to GeoJSON format.

```python
def convert_geopandas_to_geojson(geopandas_coords):
    return [[list(coord) for coord in geopandas_coords]]

geojson_output_data = convert_geopandas_to_geojson(geopandas_input_data)
print(geojson_output_data)
```

### `geopandas_to_postgis.py`

This script converts GeoPandas data to PostGIS format.

```python
def convert_geopandas_to_postgis(geopandas_coords):
    if not geopandas_coords:
        return ""
    
    formatted = ", ".join(f"{lon} {lat}" for lon, lat in geopandas_coords)
    return f"({formatted})"


postgis_output_data = convert_geopandas_to_postgis(geopandas_input_data)
print(postgis_output_data)
```

### `postgis_to_geojson.py`

This script converts PostGIS data to GeoJSON format.

```python
def convert_postgis_to_geojson(postgis_str):
    cleaned = postgis_str.strip("()")
    pairs = cleaned.split(",")

    coordinates = []
    for pair in pairs:
        lon, lat = map(float, pair.strip().split())
        coordinates.append([lon, lat])
    
    return [coordinates]

geojson_output_data = convert_postgis_to_geojson(postgis_input_data)
print(geojson_output_data)
```

### `postgis_to_geopandas.py`

This script converts PostGIS data to GeoPandas format.

```python
def convert_postgis_to_geopandas(postgis_str):

    cleaned = postgis_str.strip("()")
    pairs = cleaned.split(",")
    
    coords = []
    for pair in pairs:
        x, y = pair.strip().split()
        coords.append((float(x), float(y)))
    return coords

geopandas_output_data = convert_postgis_to_geopandas(postgis_input_data)
print(geopandas_output_data)
```