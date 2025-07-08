
WITH input_boundary AS (
  SELECT ST_GeomFromText(
----------------------------------------------------------------------
--------------------- Small Area 12 Points ---------------------
            'POLYGON((151.45191179600488	-27.526421418791138,
                    151.45191781261346	-27.526261978664035,
                    151.45209229426197	-27.52627702018546,
                    151.4521013191747	-27.526430443703987,
                    151.45191179600488	-27.526421418791138,
                    151.45191179600488	-27.526421418791138))',
----------------------------------------------------------------------------------
--------------------- Medium Area 186 Points -----------------------------------
--          'POLYGON((151.4513078789194	-27.52624129657206,
--                 151.45131539968017	-27.52619466785564,
--                 151.45213095	-27.52627465823798,
--                 151.45204716969752	-27.526796328712646,
--                 151.4512529773663	-27.526712096192664,
--                 151.4513078789194	-27.52624129657206))',
----------------------------------------------------------------------------------
----------------- Large Area 133245 Points ------------------------------------
--         'POLYGON((151.33163918327432 -27.3417327017376,
--          151.33163918327432 -27.3186303641849,
--          151.3575448970572 -27.3186303641849,
--          151.3575448970572 -27.3417327017376,
--          151.33163918327432 -27.3417327017376))',
----------------------------------------------------------------------------------
----------------- Digi Farm's Field Boundary -------------------------------
--         'POLYGON((11.157073742 60.754691924,
--         11.157212869 60.755148947,
--         11.159729062 60.753077731,
--         11.157212869 60.755148947,
--         11.157138821 60.754531992,
--         11.157073742 60.754691924))',
    4326
  ) AS geom_wgs84
),
target_rasters AS (
  SELECT
    r.rast,
    ST_Transform(ib.geom_wgs84, ST_SRID(r.rast)) AS geom_proj -- Reproject boundary to raster SRID
  FROM
    wyvern_dragonette_aus r,
    input_boundary ib
  WHERE
    ST_Intersects(r.rast, ST_Transform(ib.geom_wgs84, ST_SRID(r.rast))) -- Filter only relevant raster tiles
),
all_tile_pixels AS (
  SELECT
    (ST_PixelAsCentroids(tr.rast, 1)).*, -- Get centroids for all pixels in the tile (band 1 is arbitrary here)
    tr.geom_proj
  FROM
    target_rasters tr
),
unique_intersecting_pixels AS (
  SELECT DISTINCT ON (x, y, ST_AsEWKB(geom)) -- Ensure uniqueness based on pixel coordinates and geometry
    ST_AsText(ST_Transform(geom, 4326)) AS pixel_center_coordinates_wgs84-- Convert centroid to WGS84 WKT
  FROM
    all_tile_pixels
  WHERE
    ST_Intersects(geom, geom_proj) -- Filter pixels whose centroids are within the reprojected boundary
  ORDER BY x, y, ST_AsEWKB(geom) -- Required for DISTINCT ON
)
SELECT *
FROM unique_intersecting_pixels;
