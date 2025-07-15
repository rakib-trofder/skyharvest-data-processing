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
