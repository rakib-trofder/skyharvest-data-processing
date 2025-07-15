
# Geospatial Data Conversion

This document explains the different geospatial data formats used in this project and provides documentation for the conversion scripts found in the `conversions` folder.

## Data Formats

### GeoJSON

GeoJSON is a format for encoding a variety of geographic data structures. It is based on the JSON (JavaScript Object Notation) format. A GeoJSON object may represent a geometry, a feature, or a collection of features. The geometries are represented by a list of coordinates.

### PostGIS Polygon

PostGIS is a spatial database extender for PostgreSQL object-relational database. It adds support for geographic objects allowing location queries to be run in SQL. A PostGIS polygon is represented by a string of coordinate pairs.

### GeoPandas Polygon

GeoPandas is an open source project to make working with geospatial data in python easier. It extends the datatypes used by pandas to allow spatial operations on geometric types. A GeoPandas polygon is represented by a list of tuples, where each tuple is a coordinate pair.

## Conversion Scripts

### `geojson_to_geopandas.py`

This script converts GeoJSON data to GeoPandas format.

**Function:** `convert_geojson_to_geopandas(input_data)`

- **Input:** A list of lists of coordinate pairs (GeoJSON format).
- **Output:** A list of tuples of coordinate pairs (GeoPandas format).

### `geojson_to_postgis.py`

This script converts GeoJSON data to PostGIS format.

**Function:** `convert_geojson_to_postgis(boundary_coordinates)`

- **Input:** A list of lists of coordinate pairs (GeoJSON format).
- **Output:** A string of coordinate pairs (PostGIS format).

### `geopandas_to_geojson.py`

This script converts GeoPandas data to GeoJSON format.

**Function:** `convert_geopandas_to_geojson(geopandas_coords)`

- **Input:** A list of tuples of coordinate pairs (GeoPandas format).
- **Output:** A list of lists of coordinate pairs (GeoJSON format).

### `geopandas_to_postgis.py`

This script converts GeoPandas data to PostGIS format.

**Function:** `convert_geopandas_to_postgis(geopandas_coords)`

- **Input:** A list of tuples of coordinate pairs (GeoPandas format).
- **Output:** A string of coordinate pairs (PostGIS format).

### `postgis_to_geojson.py`

This script converts PostGIS data to GeoJSON format.

**Function:** `convert_postgis_to_geojson(postgis_str)`

- **Input:** A string of coordinate pairs (PostGIS format).
- **Output:** A list of lists of coordinate pairs (GeoJSON format).

### `postgis_to_geopandas.py`

This script converts PostGIS data to GeoPandas format.

**Function:** `convert_postgis_to_geopandas(postgis_str)`

- **Input:** A string of coordinate pairs (PostGIS format).
- **Output:** A list of tuples of coordinate pairs (GeoPandas format).
