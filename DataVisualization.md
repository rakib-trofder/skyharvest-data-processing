
# Data Visualization

This document outlines the functionality of the Python scripts in the `scripts` folder, which are used for visualizing geospatial data.

## `band_values_of_centroid.py`

This script visualizes the band values of the centroids of different raster areas on a map.

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
