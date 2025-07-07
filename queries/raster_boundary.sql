SELECT ST_AsText(ST_Extent(rast::geometry)) AS raster_extent_wkt
FROM wyvern_dragonette_aus where rid = 11;