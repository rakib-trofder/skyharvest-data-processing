

def convert_geopandas_to_postgis(geopandas_coords):
    if not geopandas_coords:
        return ""
    
    formatted = ", ".join(f"{lon} {lat}" for lon, lat in geopandas_coords)
    return f"({formatted})"