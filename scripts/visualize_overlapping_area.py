import geopandas as gpd
from shapely.geometry import Polygon
import folium
from folium.features import GeoJson

autralia_area_1 = Polygon(
[(151.535502928, -27.496002039), (151.533324823, -27.513588409), (151.527339156, -27.530457688),
 (151.517774496, -27.545961076), (151.504997488, -27.559502065), (151.489498908, -27.570559474), 
 (151.471874841, -27.578707598), (151.452803697, -27.58363269), (151.433019974, -27.585145111), 
 (151.413285782, -27.583186677), (151.394361273, -27.577832902), (151.376975163, -27.56929006), 
 (151.361796498, -27.557887176), (151.349408807, -27.544063268), (151.340287645, -27.528350352), 
 (151.334782396, -27.511352879), (151.333103019, -27.493724414), (151.335312228, -27.476142465), 
 (151.341323358, -27.45928244), (151.350903964, -27.443791728), (151.363684973, -27.430264909), 
 (151.379175, -27.419221006), (151.396779262, -27.411083668), (151.415822364, -27.406165), 
 (151.435574078, -27.404653663), (151.455277167, -27.406607677), (151.474176213, -27.411952198), 
 (151.491546377, -27.420482363), (151.506721041, -27.431871077), (151.519117285, -27.445681479), 
 (151.528258252, -27.46138361), (151.533791542, -27.478374659), (151.535502928, -27.496002039)]
    
)

autralia_area_2 = Polygon(
[(151.495119503, -27.516232176), (151.492934444, -27.533817593), (151.486941443, -27.550684795), 
 (151.477369351, -27.566185061), (151.464585101, -27.579722001), (151.449079752, -27.590774587), 
 (151.43144965, -27.5989173), (151.412373443, -27.603836602), (151.392585826, -27.605343079), 
 (151.37284906, -27.603378775), (151.3539234, -27.598019436), (151.336537603, -27.58947155), 
 (151.321360702, -27.578064338), (151.308976156, -27.564236985), (151.299859394, -27.54852164), 
 (151.294359627, -27.531522847), (151.292686601, -27.51389422), (151.294902783, -27.496313269), 
 (151.300921238, -27.479455363), (151.310509242, -27.463967807), (151.323297439, -27.450445056), 
 (151.338794169, -27.439405978), (151.356404398, -27.431274035), (151.375452504, -27.426361126), 
 (151.39520807, -27.424855693), (151.414913713, -27.426815529), (151.433813919, -27.432165573), 
 (151.451183803, -27.440700749), (151.466356758, -27.452093772), (151.478749923, -27.465907617), 
 (151.487886558, -27.481612191), (151.493414426, -27.498604591), (151.495119503, -27.516232176)]
    
)

# Create GeoDataFrames
gdf1 = gpd.GeoDataFrame(geometry=[autralia_area_1], crs="EPSG:4326")
gdf2 = gpd.GeoDataFrame(geometry=[autralia_area_2], crs="EPSG:4326")

# Calculate the intersection
intersection = gpd.overlay(gdf1, gdf2, how='intersection')

# Create a base map centered on Bangladesh
m = folium.Map(location=[-27.520210632, 151.402243397], zoom_start=11)

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
    name='Autralia Area 1'
).add_to(m)

folium.GeoJson(
    gdf2,
    style_function=lambda x: style_function('blue'),
    name='Autralia Area 2'
).add_to(m)

# Add intersection (violet) if it exists
if not intersection.empty:
    folium.GeoJson(
        intersection,
        style_function=lambda x: style_function('violet', weight=3),
        name='Overlapping Area'
    ).add_to(m)


map_center_1 = [gdf1.unary_union.centroid.y, gdf1.unary_union.centroid.x]
map_center_2 = [gdf2.unary_union.centroid.y, gdf2.unary_union.centroid.x]

# m1 = folium.Map(location=map_center_1)
# m2 = folium.Map(location=map_center_2)

folium.Marker(
    location=map_center_1, 
    tooltip="Autralia Area 1 Center" 
).add_to(m)
folium.Marker(
    location=map_center_2, 
    tooltip="Autralia Area 2 Center" 
).add_to(m)


# Add layer control and title
folium.LayerControl().add_to(m)

m