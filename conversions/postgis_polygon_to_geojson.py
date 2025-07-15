

def convert_postgis_to_geojson(postgis_str):
    cleaned = postgis_str.strip("()")
    pairs = cleaned.split(",")

    coordinates = []
    for pair in pairs:
        lon, lat = map(float, pair.strip().split())
        coordinates.append([lon, lat])
    
    return [coordinates]