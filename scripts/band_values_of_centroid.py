import folium
from folium.features import GeoJson
import pandas as pd


import geopandas as gpd
from shapely.geometry import Polygon
import folium
from folium.features import GeoJson

autralia_full_area = Polygon(
[
(151.25392204192568, -27.705639639945662), 
    (151.25392204192568, -27.2955280266322), 
    (151.5801215277816, -27.2955280266322), 
    (151.5801215277816, -27.705639639945662), 
    (151.25392204192568, -27.705639639945662)
]    
)


autralia_raster_7 = Polygon(
[(151.33163918327432, -27.3417327017376),
 (151.33163918327432, -27.3186303641849), 
 (151.3575448970572, -27.3186303641849), 
 (151.3575448970572, -27.3417327017376), 
 (151.33163918327432, -27.3417327017376) 
]
)

autralia_raster_11 = Polygon(
[(151.43526203840585, -27.3417327017376), 
 (151.43526203840585, -27.3186303641849), 
 (151.46116775218874, -27.3186303641849), 
 (151.46116775218874, -27.3417327017376), 
 (151.43526203840585, -27.3417327017376)
]
)

# Create GeoDataFrames
gdf1 = gpd.GeoDataFrame(geometry=[autralia_full_area], crs="EPSG:4326")
gdf2 = gpd.GeoDataFrame(geometry=[autralia_raster_7], crs="EPSG:4326")
gdf3 = gpd.GeoDataFrame(geometry=[autralia_raster_11], crs="EPSG:4326")

# Calculate the intersection
union = gpd.overlay(gdf2, gdf3, how='union')

intersection = gpd.overlay(gdf1, union, how='intersection')

# Create a base map centered on Autralia
m = folium.Map(location=[-27.2955280266322, 151.5801215277816], zoom_start=13)

# Style function for the polygons
def style_function(color, weight=2):
    return {
        'fillColor': color,
        'color': color,
        'weight': weight,
        'fillOpacity': 0.5
    }

folium.GeoJson(
    gdf1,
    style_function=lambda x: style_function('green'),
    name='Autralia Full Area'
).add_to(m)

folium.GeoJson(
    gdf2,
    style_function=lambda x: style_function('blue'),
    name='Autralia 7th Raster'
).add_to(m)

# Add intersection (violet) if it exists
if not intersection.empty:
    folium.GeoJson(
        intersection,
        style_function=lambda x: style_function('violet', weight=3),
        name='Overlapping Area'
    ).add_to(m)

# Band data for map_center_2 and map_center_3
band_data_2 = {
    'Band': range(1, 24),
    'Value': [
        59.55813980102539, 58.07972717285156, 56.15243911743164, 56.80791091918945, 
        56.999229431152344, 53.213436126708984, 52.039024353027344, 51.32317352294922, 
        50.293968200683594, 49.61350631713867, 46.498451232910156, 47.73588180541992, 
        49.981605529785156, 51.73589324951172, 50.59012985229492, 57.605960845947266, 
        63.04208755493164, 60.550601959228516, 65.2501220703125, 74.38057708740234, 
        61.45732879638672, 68.6386489868164, 64.31470489501953
    ]
}

band_data_3 = {
    'Band': range(1, 24),
    'Value': [
        54.55145263671875, 52.46738815307617, 52.822113037109375, 55.043190002441406, 
        55.30187225341797, 50.5690803527832, 52.25324630737305, 48.10995864868164, 
        49.813289642333984, 46.36872100830078, 44.01035690307617, 45.022708892822266, 
        46.410274505615234, 48.51667404174805, 48.230308532714844, 51.878074645996094, 
        55.86615753173828, 51.20232391357422, 54.31937789916992, 60.24612045288086, 
        52.48594665527344, 58.50151824951172, 55.50347137451172
    ]
}

# Create DataFrames
df2 = pd.DataFrame(band_data_2)
df3 = pd.DataFrame(band_data_3)

# Function to create HTML table
def create_popup_html(df, location_name):
    html = f"<h4>{location_name} - Band Values</h4>"
    html += "<table style='width:100%'><tr><th>Band</th><th>Value</th></tr>"
    for _, row in df.iterrows():
        html += f"<tr><td>{int(row['Band'])}</td><td>{row['Value']:.2f}</td></tr>"
    html += "</table>"
    return html

# Create map (using your existing code)
# m = folium.Map(location=[-27.2955280266322, 151.5801215277816], zoom_start=13)

# Add your existing GeoJSON layers here...

# Add markers with popups

map_center_1 = [gdf1.unary_union.centroid.y, gdf1.unary_union.centroid.x]
map_center_2 = [gdf2.unary_union.centroid.y, gdf2.unary_union.centroid.x]
map_center_3 = [gdf3.unary_union.centroid.y, gdf3.unary_union.centroid.x]

folium.Marker(
    location=map_center_1,
    tooltip="Autralia Main Center",
    icon=folium.Icon(color='black')
).add_to(m)
folium.Marker(
    location=map_center_2,
    tooltip="Autralia 7th Raster Center",
    popup=folium.Popup(create_popup_html(df2, "7th Raster")), 
    icon=folium.Icon(color='blue')
).add_to(m)

folium.Marker(
    location=map_center_3,
    tooltip="Autralia 11th Raster Center",
    popup=folium.Popup(create_popup_html(df3, "11th Raster")), 
    icon=folium.Icon(color='red')
).add_to(m)

# Add layer control
folium.LayerControl().add_to(m)

m