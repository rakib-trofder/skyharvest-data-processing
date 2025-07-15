import folium
import geopandas as gpd
from shapely.geometry import Polygon

# Define your polygons
iraq_full_area = Polygon(
    [(42.23461944880937, 34.010731504661976), (42.23461944880937, 34.399054513033725), 
     (42.56785801499113, 34.399054513033725), (42.56785801499113, 34.010731504661976), 
     (42.23461944880937, 34.010731504661976)]
)

iraq_land_area = Polygon(
    [(42.429008612415394, 34.32981897724046), (42.429008612415394, 34.352897489171546), 
     (42.45677849293054, 34.352897489171546), (42.45677849293054, 34.32981897724046), 
     (42.429008612415394, 34.32981897724046)]
)

iraq_water_area = Polygon(
    [(42.345698970869954, 34.30674046530937), (42.345698970869954, 34.32981897724046), 
     (42.3734688513851, 34.32981897724046), (42.3734688513851, 34.30674046530937), 
     (42.345698970869954, 34.30674046530937)]
)

# Create GeoDataFrames
iraq_full_geo_panda_area = gpd.GeoDataFrame(geometry=[iraq_full_area], crs="EPSG:4326")
iraq_land_geo_panda_area = gpd.GeoDataFrame(geometry=[iraq_land_area], crs="EPSG:4326")
iraq_water_geo_panda_area = gpd.GeoDataFrame(geometry=[iraq_water_area], crs="EPSG:4326")

# Calculate centers
iraq_full_center = [iraq_full_geo_panda_area.unary_union.centroid.y, iraq_full_geo_panda_area.unary_union.centroid.x]
iraq_land_center = [iraq_land_geo_panda_area.unary_union.centroid.y, iraq_land_geo_panda_area.unary_union.centroid.x]
iraq_water_center = [iraq_water_geo_panda_area.unary_union.centroid.y, iraq_water_geo_panda_area.unary_union.centroid.x]

# Spectral indices data
land_indices = {
    'NDVI': -0.07631299846161979046,
    'GCI': -0.06498813382903934212,
    'RECI': -0.07681322339173862715,
    'NDWI': 0.03358539291939285774,
    'DVI': -21.1704250971476225
}

water_indices = {
    'NDVI': -0.07883044805573004355,
    'GCI': -0.16425157049722073686,
    'RECI': -0.08656180245692801671,
    'NDWI': 0.08947389950468813153,
    'DVI': -22.5095809300740529
}

# Create map
m = folium.Map(location=iraq_full_center, zoom_start=10)

# Style function
def style_function(color, weight=2):
    return {
        'fillColor': color,
        'color': color,
        'weight': weight,
        'fillOpacity': 0.5
    }

# Function to create HTML tooltip with indices
def create_indices_tooltip(indices, area_type):
    html = f"<b>{area_type} Spectral Indices:</b><br>"
    for name, value in indices.items():
        html += f"{name}: {value:.4f}<br>"
    return html

# Add polygons with indices in tooltips
folium.GeoJson(
    iraq_land_geo_panda_area,
    style_function=lambda x: style_function('green'),
    name='Iraq Land Area',
    tooltip=folium.Tooltip(create_indices_tooltip(land_indices, "Land"))
).add_to(m)

folium.GeoJson(
    iraq_water_geo_panda_area,
    style_function=lambda x: style_function('blue'),
    name='Iraq Water Area',
    tooltip=folium.Tooltip(create_indices_tooltip(water_indices, "Water"))
).add_to(m)

# Add centers
folium.Marker(
    location=iraq_full_center,
    tooltip=f"Iraq Full Area Center ({iraq_full_center[0]:.6f}, {iraq_full_center[1]:.6f})",
    icon=folium.Icon(color='red')
).add_to(m)

folium.Marker(
    location=iraq_land_center,
    tooltip=f"Iraq Land Area Center ({iraq_land_center[0]:.6f}, {iraq_land_center[1]:.6f})",
    icon=folium.Icon(color='green')
).add_to(m)

folium.Marker(
    location=iraq_water_center,
    tooltip=f"Iraq Water Area Center ({iraq_water_center[0]:.6f}, {iraq_water_center[1]:.6f})",
    icon=folium.Icon(color='blue')
).add_to(m)

# Add layer control
folium.LayerControl().add_to(m)

# Display the map
m