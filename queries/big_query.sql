"
-- Query for Sub-Polygon 1
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.340632004345807,151.33209088465568 -27.340632004345807,151.33209088465568 -27.341732701737612,151.33163918327432 -27.341732701737612,151.33163918327432 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 2
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.33918823495865,151.33209088465568 -27.33918823495865,151.33209088465568 -27.340632004345807,151.33163918327432 -27.340632004345807,151.33163918327432 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 3
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.33774444676217,151.33209088465568 -27.33774444676217,151.33209088465568 -27.33918823495865,151.33163918327432 -27.33918823495865,151.33163918327432 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 4
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.336300639757024,151.33209088465568 -27.336300639757024,151.33209088465568 -27.33774444676217,151.33163918327432 -27.33774444676217,151.33163918327432 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 5
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.334856813943894,151.33209088465568 -27.334856813943894,151.33209088465568 -27.336300639757024,151.33163918327432 -27.336300639757024,151.33163918327432 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 6
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.333412969323437,151.33209088465568 -27.333412969323437,151.33209088465568 -27.334856813943894,151.33163918327432 -27.334856813943894,151.33163918327432 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 7
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.33196910589634,151.33209088465568 -27.33196910589634,151.33209088465568 -27.333412969323437,151.33163918327432 -27.333412969323437,151.33163918327432 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 8
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.330525223663265,151.33209088465568 -27.330525223663265,151.33209088465568 -27.33196910589634,151.33163918327432 -27.33196910589634,151.33163918327432 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 9
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.32908132262489,151.33209088465568 -27.32908132262489,151.33209088465568 -27.330525223663265,151.33163918327432 -27.330525223663265,151.33163918327432 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 10
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.32763740278189,151.33209088465568 -27.32763740278189,151.33209088465568 -27.32908132262489,151.33163918327432 -27.32908132262489,151.33163918327432 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 11
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.32619346413493,151.33209088465568 -27.32619346413493,151.33209088465568 -27.32763740278189,151.33163918327432 -27.32763740278189,151.33163918327432 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 12
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.32474950668468,151.33209088465568 -27.32474950668468,151.33209088465568 -27.32619346413493,151.33163918327432 -27.32619346413493,151.33163918327432 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 13
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.323305530431824,151.33209088465568 -27.323305530431824,151.33209088465568 -27.32474950668468,151.33163918327432 -27.32474950668468,151.33163918327432 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 14
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.321861535377025,151.33209088465568 -27.321861535377025,151.33209088465568 -27.323305530431824,151.33163918327432 -27.323305530431824,151.33163918327432 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 15
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.320417521520955,151.33209088465568 -27.320417521520955,151.33209088465568 -27.321861535377025,151.33163918327432 -27.321861535377025,151.33163918327432 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 16
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.318973488864295,151.33209088465568 -27.318973488864295,151.33209088465568 -27.320417521520955,151.33163918327432 -27.320417521520955,151.33163918327432 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 17
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33163918327432 -27.31863036418491,151.33209088465568 -27.31863036418491,151.33209088465568 -27.318973488864295,151.33163918327432 -27.318973488864295,151.33163918327432 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 18
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.340632004345807,151.33371620649228 -27.340632004345807,151.33371620649228 -27.341732701737612,151.33209088465568 -27.341732701737612,151.33209088465568 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 19
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.33918823495865,151.33371620649228 -27.33918823495865,151.33371620649228 -27.340632004345807,151.33209088465568 -27.340632004345807,151.33209088465568 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 20
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.33774444676217,151.33371620649228 -27.33774444676217,151.33371620649228 -27.33918823495865,151.33209088465568 -27.33918823495865,151.33209088465568 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 21
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.336300639757024,151.33371620649228 -27.336300639757024,151.33371620649228 -27.33774444676217,151.33209088465568 -27.33774444676217,151.33209088465568 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 22
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.334856813943894,151.33371620649228 -27.334856813943894,151.33371620649228 -27.336300639757024,151.33209088465568 -27.336300639757024,151.33209088465568 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 23
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.333412969323437,151.33371620649228 -27.333412969323437,151.33371620649228 -27.334856813943894,151.33209088465568 -27.334856813943894,151.33209088465568 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 24
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.33196910589634,151.33371620649228 -27.33196910589634,151.33371620649228 -27.333412969323437,151.33209088465568 -27.333412969323437,151.33209088465568 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 25
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.330525223663265,151.33371620649228 -27.330525223663265,151.33371620649228 -27.33196910589634,151.33209088465568 -27.33196910589634,151.33209088465568 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 26
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.32908132262489,151.33371620649228 -27.32908132262489,151.33371620649228 -27.330525223663265,151.33209088465568 -27.330525223663265,151.33209088465568 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 27
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.32763740278189,151.33371620649228 -27.32763740278189,151.33371620649228 -27.32908132262489,151.33209088465568 -27.32908132262489,151.33209088465568 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 28
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.32619346413493,151.33371620649228 -27.32619346413493,151.33371620649228 -27.32763740278189,151.33209088465568 -27.32763740278189,151.33209088465568 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 29
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.32474950668468,151.33371620649228 -27.32474950668468,151.33371620649228 -27.32619346413493,151.33209088465568 -27.32619346413493,151.33209088465568 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 30
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.323305530431824,151.33371620649228 -27.323305530431824,151.33371620649228 -27.32474950668468,151.33209088465568 -27.32474950668468,151.33209088465568 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 31
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.321861535377025,151.33371620649228 -27.321861535377025,151.33371620649228 -27.323305530431824,151.33209088465568 -27.323305530431824,151.33209088465568 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 32
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.320417521520955,151.33371620649228 -27.320417521520955,151.33371620649228 -27.321861535377025,151.33209088465568 -27.321861535377025,151.33209088465568 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 33
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.318973488864295,151.33371620649228 -27.318973488864295,151.33371620649228 -27.320417521520955,151.33209088465568 -27.320417521520955,151.33209088465568 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 34
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33209088465568 -27.31863036418491,151.33371620649228 -27.31863036418491,151.33371620649228 -27.318973488864295,151.33209088465568 -27.318973488864295,151.33209088465568 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 35
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.340632004345807,151.33534152832885 -27.340632004345807,151.33534152832885 -27.341732701737612,151.33371620649228 -27.341732701737612,151.33371620649228 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 36
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.33918823495865,151.33534152832885 -27.33918823495865,151.33534152832885 -27.340632004345807,151.33371620649228 -27.340632004345807,151.33371620649228 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 37
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.33774444676217,151.33534152832885 -27.33774444676217,151.33534152832885 -27.33918823495865,151.33371620649228 -27.33918823495865,151.33371620649228 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 38
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.336300639757024,151.33534152832885 -27.336300639757024,151.33534152832885 -27.33774444676217,151.33371620649228 -27.33774444676217,151.33371620649228 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 39
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.334856813943894,151.33534152832885 -27.334856813943894,151.33534152832885 -27.336300639757024,151.33371620649228 -27.336300639757024,151.33371620649228 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 40
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.333412969323437,151.33534152832885 -27.333412969323437,151.33534152832885 -27.334856813943894,151.33371620649228 -27.334856813943894,151.33371620649228 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 41
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.33196910589634,151.33534152832885 -27.33196910589634,151.33534152832885 -27.333412969323437,151.33371620649228 -27.333412969323437,151.33371620649228 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 42
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.330525223663265,151.33534152832885 -27.330525223663265,151.33534152832885 -27.33196910589634,151.33371620649228 -27.33196910589634,151.33371620649228 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 43
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.32908132262489,151.33534152832885 -27.32908132262489,151.33534152832885 -27.330525223663265,151.33371620649228 -27.330525223663265,151.33371620649228 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 44
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.32763740278189,151.33534152832885 -27.32763740278189,151.33534152832885 -27.32908132262489,151.33371620649228 -27.32908132262489,151.33371620649228 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 45
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.32619346413493,151.33534152832885 -27.32619346413493,151.33534152832885 -27.32763740278189,151.33371620649228 -27.32763740278189,151.33371620649228 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 46
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.32474950668468,151.33534152832885 -27.32474950668468,151.33534152832885 -27.32619346413493,151.33371620649228 -27.32619346413493,151.33371620649228 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 47
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.323305530431824,151.33534152832885 -27.323305530431824,151.33534152832885 -27.32474950668468,151.33371620649228 -27.32474950668468,151.33371620649228 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 48
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.321861535377025,151.33534152832885 -27.321861535377025,151.33534152832885 -27.323305530431824,151.33371620649228 -27.323305530431824,151.33371620649228 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 49
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.320417521520955,151.33534152832885 -27.320417521520955,151.33534152832885 -27.321861535377025,151.33371620649228 -27.321861535377025,151.33371620649228 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 50
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.318973488864295,151.33534152832885 -27.318973488864295,151.33534152832885 -27.320417521520955,151.33371620649228 -27.320417521520955,151.33371620649228 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 51
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33371620649228 -27.31863036418491,151.33534152832885 -27.31863036418491,151.33534152832885 -27.318973488864295,151.33371620649228 -27.318973488864295,151.33371620649228 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 52
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.340632004345807,151.3369668501655 -27.340632004345807,151.3369668501655 -27.341732701737612,151.33534152832885 -27.341732701737612,151.33534152832885 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 53
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.33918823495865,151.3369668501655 -27.33918823495865,151.3369668501655 -27.340632004345807,151.33534152832885 -27.340632004345807,151.33534152832885 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 54
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.33774444676217,151.3369668501655 -27.33774444676217,151.3369668501655 -27.33918823495865,151.33534152832885 -27.33918823495865,151.33534152832885 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 55
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.336300639757024,151.3369668501655 -27.336300639757024,151.3369668501655 -27.33774444676217,151.33534152832885 -27.33774444676217,151.33534152832885 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 56
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.334856813943894,151.3369668501655 -27.334856813943894,151.3369668501655 -27.336300639757024,151.33534152832885 -27.336300639757024,151.33534152832885 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 57
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.333412969323437,151.3369668501655 -27.333412969323437,151.3369668501655 -27.334856813943894,151.33534152832885 -27.334856813943894,151.33534152832885 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 58
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.33196910589634,151.3369668501655 -27.33196910589634,151.3369668501655 -27.333412969323437,151.33534152832885 -27.333412969323437,151.33534152832885 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 59
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.330525223663265,151.3369668501655 -27.330525223663265,151.3369668501655 -27.33196910589634,151.33534152832885 -27.33196910589634,151.33534152832885 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 60
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.32908132262489,151.3369668501655 -27.32908132262489,151.3369668501655 -27.330525223663265,151.33534152832885 -27.330525223663265,151.33534152832885 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 61
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.32763740278189,151.3369668501655 -27.32763740278189,151.3369668501655 -27.32908132262489,151.33534152832885 -27.32908132262489,151.33534152832885 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 62
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.32619346413493,151.3369668501655 -27.32619346413493,151.3369668501655 -27.32763740278189,151.33534152832885 -27.32763740278189,151.33534152832885 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 63
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.32474950668468,151.3369668501655 -27.32474950668468,151.3369668501655 -27.32619346413493,151.33534152832885 -27.32619346413493,151.33534152832885 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 64
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.323305530431824,151.3369668501655 -27.323305530431824,151.3369668501655 -27.32474950668468,151.33534152832885 -27.32474950668468,151.33534152832885 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 65
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.321861535377025,151.3369668501655 -27.321861535377025,151.3369668501655 -27.323305530431824,151.33534152832885 -27.323305530431824,151.33534152832885 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 66
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.320417521520955,151.3369668501655 -27.320417521520955,151.3369668501655 -27.321861535377025,151.33534152832885 -27.321861535377025,151.33534152832885 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 67
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.318973488864295,151.3369668501655 -27.318973488864295,151.3369668501655 -27.320417521520955,151.33534152832885 -27.320417521520955,151.33534152832885 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 68
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33534152832885 -27.31863036418491,151.3369668501655 -27.31863036418491,151.3369668501655 -27.318973488864295,151.33534152832885 -27.318973488864295,151.33534152832885 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 69
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.340632004345807,151.33859217200208 -27.340632004345807,151.33859217200208 -27.341732701737612,151.3369668501655 -27.341732701737612,151.3369668501655 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 70
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.33918823495865,151.33859217200208 -27.33918823495865,151.33859217200208 -27.340632004345807,151.3369668501655 -27.340632004345807,151.3369668501655 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 71
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.33774444676217,151.33859217200208 -27.33774444676217,151.33859217200208 -27.33918823495865,151.3369668501655 -27.33918823495865,151.3369668501655 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 72
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.336300639757024,151.33859217200208 -27.336300639757024,151.33859217200208 -27.33774444676217,151.3369668501655 -27.33774444676217,151.3369668501655 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 73
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.334856813943894,151.33859217200208 -27.334856813943894,151.33859217200208 -27.336300639757024,151.3369668501655 -27.336300639757024,151.3369668501655 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 74
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.333412969323437,151.33859217200208 -27.333412969323437,151.33859217200208 -27.334856813943894,151.3369668501655 -27.334856813943894,151.3369668501655 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 75
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.33196910589634,151.33859217200208 -27.33196910589634,151.33859217200208 -27.333412969323437,151.3369668501655 -27.333412969323437,151.3369668501655 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 76
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.330525223663265,151.33859217200208 -27.330525223663265,151.33859217200208 -27.33196910589634,151.3369668501655 -27.33196910589634,151.3369668501655 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 77
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.32908132262489,151.33859217200208 -27.32908132262489,151.33859217200208 -27.330525223663265,151.3369668501655 -27.330525223663265,151.3369668501655 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 78
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.32763740278189,151.33859217200208 -27.32763740278189,151.33859217200208 -27.32908132262489,151.3369668501655 -27.32908132262489,151.3369668501655 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 79
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.32619346413493,151.33859217200208 -27.32619346413493,151.33859217200208 -27.32763740278189,151.3369668501655 -27.32763740278189,151.3369668501655 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 80
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.32474950668468,151.33859217200208 -27.32474950668468,151.33859217200208 -27.32619346413493,151.3369668501655 -27.32619346413493,151.3369668501655 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 81
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.323305530431824,151.33859217200208 -27.323305530431824,151.33859217200208 -27.32474950668468,151.3369668501655 -27.32474950668468,151.3369668501655 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 82
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.321861535377025,151.33859217200208 -27.321861535377025,151.33859217200208 -27.323305530431824,151.3369668501655 -27.323305530431824,151.3369668501655 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 83
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.320417521520955,151.33859217200208 -27.320417521520955,151.33859217200208 -27.321861535377025,151.3369668501655 -27.321861535377025,151.3369668501655 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 84
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.318973488864295,151.33859217200208 -27.318973488864295,151.33859217200208 -27.320417521520955,151.3369668501655 -27.320417521520955,151.3369668501655 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 85
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3369668501655 -27.31863036418491,151.33859217200208 -27.31863036418491,151.33859217200208 -27.318973488864295,151.3369668501655 -27.318973488864295,151.3369668501655 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 86
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.340632004345807,151.3402174938387 -27.340632004345807,151.3402174938387 -27.341732701737612,151.33859217200208 -27.341732701737612,151.33859217200208 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 87
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.33918823495865,151.3402174938387 -27.33918823495865,151.3402174938387 -27.340632004345807,151.33859217200208 -27.340632004345807,151.33859217200208 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 88
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.33774444676217,151.3402174938387 -27.33774444676217,151.3402174938387 -27.33918823495865,151.33859217200208 -27.33918823495865,151.33859217200208 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 89
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.336300639757024,151.3402174938387 -27.336300639757024,151.3402174938387 -27.33774444676217,151.33859217200208 -27.33774444676217,151.33859217200208 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 90
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.334856813943894,151.3402174938387 -27.334856813943894,151.3402174938387 -27.336300639757024,151.33859217200208 -27.336300639757024,151.33859217200208 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 91
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.333412969323437,151.3402174938387 -27.333412969323437,151.3402174938387 -27.334856813943894,151.33859217200208 -27.334856813943894,151.33859217200208 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 92
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.33196910589634,151.3402174938387 -27.33196910589634,151.3402174938387 -27.333412969323437,151.33859217200208 -27.333412969323437,151.33859217200208 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 93
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.330525223663265,151.3402174938387 -27.330525223663265,151.3402174938387 -27.33196910589634,151.33859217200208 -27.33196910589634,151.33859217200208 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 94
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.32908132262489,151.3402174938387 -27.32908132262489,151.3402174938387 -27.330525223663265,151.33859217200208 -27.330525223663265,151.33859217200208 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 95
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.32763740278189,151.3402174938387 -27.32763740278189,151.3402174938387 -27.32908132262489,151.33859217200208 -27.32908132262489,151.33859217200208 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 96
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.32619346413493,151.3402174938387 -27.32619346413493,151.3402174938387 -27.32763740278189,151.33859217200208 -27.32763740278189,151.33859217200208 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 97
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.32474950668468,151.3402174938387 -27.32474950668468,151.3402174938387 -27.32619346413493,151.33859217200208 -27.32619346413493,151.33859217200208 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 98
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.323305530431824,151.3402174938387 -27.323305530431824,151.3402174938387 -27.32474950668468,151.33859217200208 -27.32474950668468,151.33859217200208 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 99
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.321861535377025,151.3402174938387 -27.321861535377025,151.3402174938387 -27.323305530431824,151.33859217200208 -27.323305530431824,151.33859217200208 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 100
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.320417521520955,151.3402174938387 -27.320417521520955,151.3402174938387 -27.321861535377025,151.33859217200208 -27.321861535377025,151.33859217200208 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 101
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.318973488864295,151.3402174938387 -27.318973488864295,151.3402174938387 -27.320417521520955,151.33859217200208 -27.320417521520955,151.33859217200208 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 102
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.33859217200208 -27.31863036418491,151.3402174938387 -27.31863036418491,151.3402174938387 -27.318973488864295,151.33859217200208 -27.318973488864295,151.33859217200208 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 103
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.340632004345807,151.3418428156753 -27.340632004345807,151.3418428156753 -27.341732701737612,151.3402174938387 -27.341732701737612,151.3402174938387 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 104
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.33918823495865,151.3418428156753 -27.33918823495865,151.3418428156753 -27.340632004345807,151.3402174938387 -27.340632004345807,151.3402174938387 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 105
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.33774444676217,151.3418428156753 -27.33774444676217,151.3418428156753 -27.33918823495865,151.3402174938387 -27.33918823495865,151.3402174938387 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 106
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.336300639757024,151.3418428156753 -27.336300639757024,151.3418428156753 -27.33774444676217,151.3402174938387 -27.33774444676217,151.3402174938387 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 107
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.334856813943894,151.3418428156753 -27.334856813943894,151.3418428156753 -27.336300639757024,151.3402174938387 -27.336300639757024,151.3402174938387 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 108
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.333412969323437,151.3418428156753 -27.333412969323437,151.3418428156753 -27.334856813943894,151.3402174938387 -27.334856813943894,151.3402174938387 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 109
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.33196910589634,151.3418428156753 -27.33196910589634,151.3418428156753 -27.333412969323437,151.3402174938387 -27.333412969323437,151.3402174938387 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 110
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.330525223663265,151.3418428156753 -27.330525223663265,151.3418428156753 -27.33196910589634,151.3402174938387 -27.33196910589634,151.3402174938387 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 111
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.32908132262489,151.3418428156753 -27.32908132262489,151.3418428156753 -27.330525223663265,151.3402174938387 -27.330525223663265,151.3402174938387 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 112
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.32763740278189,151.3418428156753 -27.32763740278189,151.3418428156753 -27.32908132262489,151.3402174938387 -27.32908132262489,151.3402174938387 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 113
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.32619346413493,151.3418428156753 -27.32619346413493,151.3418428156753 -27.32763740278189,151.3402174938387 -27.32763740278189,151.3402174938387 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 114
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.32474950668468,151.3418428156753 -27.32474950668468,151.3418428156753 -27.32619346413493,151.3402174938387 -27.32619346413493,151.3402174938387 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 115
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.323305530431824,151.3418428156753 -27.323305530431824,151.3418428156753 -27.32474950668468,151.3402174938387 -27.32474950668468,151.3402174938387 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 116
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.321861535377025,151.3418428156753 -27.321861535377025,151.3418428156753 -27.323305530431824,151.3402174938387 -27.323305530431824,151.3402174938387 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 117
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.320417521520955,151.3418428156753 -27.320417521520955,151.3418428156753 -27.321861535377025,151.3402174938387 -27.321861535377025,151.3402174938387 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 118
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.318973488864295,151.3418428156753 -27.318973488864295,151.3418428156753 -27.320417521520955,151.3402174938387 -27.320417521520955,151.3402174938387 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 119
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3402174938387 -27.31863036418491,151.3418428156753 -27.31863036418491,151.3418428156753 -27.318973488864295,151.3402174938387 -27.318973488864295,151.3402174938387 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 120
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.340632004345807,151.3434681375119 -27.340632004345807,151.3434681375119 -27.341732701737612,151.3418428156753 -27.341732701737612,151.3418428156753 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 121
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.33918823495865,151.3434681375119 -27.33918823495865,151.3434681375119 -27.340632004345807,151.3418428156753 -27.340632004345807,151.3418428156753 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 122
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.33774444676217,151.3434681375119 -27.33774444676217,151.3434681375119 -27.33918823495865,151.3418428156753 -27.33918823495865,151.3418428156753 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 123
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.336300639757024,151.3434681375119 -27.336300639757024,151.3434681375119 -27.33774444676217,151.3418428156753 -27.33774444676217,151.3418428156753 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 124
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.334856813943894,151.3434681375119 -27.334856813943894,151.3434681375119 -27.336300639757024,151.3418428156753 -27.336300639757024,151.3418428156753 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 125
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.333412969323437,151.3434681375119 -27.333412969323437,151.3434681375119 -27.334856813943894,151.3418428156753 -27.334856813943894,151.3418428156753 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 126
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.33196910589634,151.3434681375119 -27.33196910589634,151.3434681375119 -27.333412969323437,151.3418428156753 -27.333412969323437,151.3418428156753 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 127
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.330525223663265,151.3434681375119 -27.330525223663265,151.3434681375119 -27.33196910589634,151.3418428156753 -27.33196910589634,151.3418428156753 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 128
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.32908132262489,151.3434681375119 -27.32908132262489,151.3434681375119 -27.330525223663265,151.3418428156753 -27.330525223663265,151.3418428156753 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 129
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.32763740278189,151.3434681375119 -27.32763740278189,151.3434681375119 -27.32908132262489,151.3418428156753 -27.32908132262489,151.3418428156753 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 130
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.32619346413493,151.3434681375119 -27.32619346413493,151.3434681375119 -27.32763740278189,151.3418428156753 -27.32763740278189,151.3418428156753 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 131
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.32474950668468,151.3434681375119 -27.32474950668468,151.3434681375119 -27.32619346413493,151.3418428156753 -27.32619346413493,151.3418428156753 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 132
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.323305530431824,151.3434681375119 -27.323305530431824,151.3434681375119 -27.32474950668468,151.3418428156753 -27.32474950668468,151.3418428156753 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 133
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.321861535377025,151.3434681375119 -27.321861535377025,151.3434681375119 -27.323305530431824,151.3418428156753 -27.323305530431824,151.3418428156753 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 134
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.320417521520955,151.3434681375119 -27.320417521520955,151.3434681375119 -27.321861535377025,151.3418428156753 -27.321861535377025,151.3418428156753 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 135
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.318973488864295,151.3434681375119 -27.318973488864295,151.3434681375119 -27.320417521520955,151.3418428156753 -27.320417521520955,151.3418428156753 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 136
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3418428156753 -27.31863036418491,151.3434681375119 -27.31863036418491,151.3434681375119 -27.318973488864295,151.3418428156753 -27.318973488864295,151.3418428156753 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 137
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.340632004345807,151.34509345934853 -27.340632004345807,151.34509345934853 -27.341732701737612,151.3434681375119 -27.341732701737612,151.3434681375119 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 138
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.33918823495865,151.34509345934853 -27.33918823495865,151.34509345934853 -27.340632004345807,151.3434681375119 -27.340632004345807,151.3434681375119 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 139
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.33774444676217,151.34509345934853 -27.33774444676217,151.34509345934853 -27.33918823495865,151.3434681375119 -27.33918823495865,151.3434681375119 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 140
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.336300639757024,151.34509345934853 -27.336300639757024,151.34509345934853 -27.33774444676217,151.3434681375119 -27.33774444676217,151.3434681375119 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 141
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.334856813943894,151.34509345934853 -27.334856813943894,151.34509345934853 -27.336300639757024,151.3434681375119 -27.336300639757024,151.3434681375119 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 142
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.333412969323437,151.34509345934853 -27.333412969323437,151.34509345934853 -27.334856813943894,151.3434681375119 -27.334856813943894,151.3434681375119 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 143
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.33196910589634,151.34509345934853 -27.33196910589634,151.34509345934853 -27.333412969323437,151.3434681375119 -27.333412969323437,151.3434681375119 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 144
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.330525223663265,151.34509345934853 -27.330525223663265,151.34509345934853 -27.33196910589634,151.3434681375119 -27.33196910589634,151.3434681375119 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 145
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.32908132262489,151.34509345934853 -27.32908132262489,151.34509345934853 -27.330525223663265,151.3434681375119 -27.330525223663265,151.3434681375119 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 146
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.32763740278189,151.34509345934853 -27.32763740278189,151.34509345934853 -27.32908132262489,151.3434681375119 -27.32908132262489,151.3434681375119 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 147
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.32619346413493,151.34509345934853 -27.32619346413493,151.34509345934853 -27.32763740278189,151.3434681375119 -27.32763740278189,151.3434681375119 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 148
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.32474950668468,151.34509345934853 -27.32474950668468,151.34509345934853 -27.32619346413493,151.3434681375119 -27.32619346413493,151.3434681375119 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 149
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.323305530431824,151.34509345934853 -27.323305530431824,151.34509345934853 -27.32474950668468,151.3434681375119 -27.32474950668468,151.3434681375119 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 150
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.321861535377025,151.34509345934853 -27.321861535377025,151.34509345934853 -27.323305530431824,151.3434681375119 -27.323305530431824,151.3434681375119 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 151
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.320417521520955,151.34509345934853 -27.320417521520955,151.34509345934853 -27.321861535377025,151.3434681375119 -27.321861535377025,151.3434681375119 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 152
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.318973488864295,151.34509345934853 -27.318973488864295,151.34509345934853 -27.320417521520955,151.3434681375119 -27.320417521520955,151.3434681375119 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 153
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3434681375119 -27.31863036418491,151.34509345934853 -27.31863036418491,151.34509345934853 -27.318973488864295,151.3434681375119 -27.318973488864295,151.3434681375119 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 154
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.340632004345807,151.34671878118513 -27.340632004345807,151.34671878118513 -27.341732701737612,151.34509345934853 -27.341732701737612,151.34509345934853 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 155
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.33918823495865,151.34671878118513 -27.33918823495865,151.34671878118513 -27.340632004345807,151.34509345934853 -27.340632004345807,151.34509345934853 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 156
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.33774444676217,151.34671878118513 -27.33774444676217,151.34671878118513 -27.33918823495865,151.34509345934853 -27.33918823495865,151.34509345934853 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 157
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.336300639757024,151.34671878118513 -27.336300639757024,151.34671878118513 -27.33774444676217,151.34509345934853 -27.33774444676217,151.34509345934853 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 158
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.334856813943894,151.34671878118513 -27.334856813943894,151.34671878118513 -27.336300639757024,151.34509345934853 -27.336300639757024,151.34509345934853 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 159
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.333412969323437,151.34671878118513 -27.333412969323437,151.34671878118513 -27.334856813943894,151.34509345934853 -27.334856813943894,151.34509345934853 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 160
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.33196910589634,151.34671878118513 -27.33196910589634,151.34671878118513 -27.333412969323437,151.34509345934853 -27.333412969323437,151.34509345934853 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 161
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.330525223663265,151.34671878118513 -27.330525223663265,151.34671878118513 -27.33196910589634,151.34509345934853 -27.33196910589634,151.34509345934853 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 162
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.32908132262489,151.34671878118513 -27.32908132262489,151.34671878118513 -27.330525223663265,151.34509345934853 -27.330525223663265,151.34509345934853 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 163
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.32763740278189,151.34671878118513 -27.32763740278189,151.34671878118513 -27.32908132262489,151.34509345934853 -27.32908132262489,151.34509345934853 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 164
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.32619346413493,151.34671878118513 -27.32619346413493,151.34671878118513 -27.32763740278189,151.34509345934853 -27.32763740278189,151.34509345934853 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 165
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.32474950668468,151.34671878118513 -27.32474950668468,151.34671878118513 -27.32619346413493,151.34509345934853 -27.32619346413493,151.34509345934853 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 166
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.323305530431824,151.34671878118513 -27.323305530431824,151.34671878118513 -27.32474950668468,151.34509345934853 -27.32474950668468,151.34509345934853 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 167
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.321861535377025,151.34671878118513 -27.321861535377025,151.34671878118513 -27.323305530431824,151.34509345934853 -27.323305530431824,151.34509345934853 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 168
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.320417521520955,151.34671878118513 -27.320417521520955,151.34671878118513 -27.321861535377025,151.34509345934853 -27.321861535377025,151.34509345934853 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 169
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.318973488864295,151.34671878118513 -27.318973488864295,151.34671878118513 -27.320417521520955,151.34509345934853 -27.320417521520955,151.34509345934853 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 170
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34509345934853 -27.31863036418491,151.34671878118513 -27.31863036418491,151.34671878118513 -27.318973488864295,151.34509345934853 -27.318973488864295,151.34509345934853 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 171
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.340632004345807,151.34834410302176 -27.340632004345807,151.34834410302176 -27.341732701737612,151.34671878118513 -27.341732701737612,151.34671878118513 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 172
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.33918823495865,151.34834410302176 -27.33918823495865,151.34834410302176 -27.340632004345807,151.34671878118513 -27.340632004345807,151.34671878118513 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 173
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.33774444676217,151.34834410302176 -27.33774444676217,151.34834410302176 -27.33918823495865,151.34671878118513 -27.33918823495865,151.34671878118513 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 174
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.336300639757024,151.34834410302176 -27.336300639757024,151.34834410302176 -27.33774444676217,151.34671878118513 -27.33774444676217,151.34671878118513 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 175
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.334856813943894,151.34834410302176 -27.334856813943894,151.34834410302176 -27.336300639757024,151.34671878118513 -27.336300639757024,151.34671878118513 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 176
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.333412969323437,151.34834410302176 -27.333412969323437,151.34834410302176 -27.334856813943894,151.34671878118513 -27.334856813943894,151.34671878118513 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 177
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.33196910589634,151.34834410302176 -27.33196910589634,151.34834410302176 -27.333412969323437,151.34671878118513 -27.333412969323437,151.34671878118513 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 178
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.330525223663265,151.34834410302176 -27.330525223663265,151.34834410302176 -27.33196910589634,151.34671878118513 -27.33196910589634,151.34671878118513 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 179
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.32908132262489,151.34834410302176 -27.32908132262489,151.34834410302176 -27.330525223663265,151.34671878118513 -27.330525223663265,151.34671878118513 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 180
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.32763740278189,151.34834410302176 -27.32763740278189,151.34834410302176 -27.32908132262489,151.34671878118513 -27.32908132262489,151.34671878118513 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 181
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.32619346413493,151.34834410302176 -27.32619346413493,151.34834410302176 -27.32763740278189,151.34671878118513 -27.32763740278189,151.34671878118513 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 182
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.32474950668468,151.34834410302176 -27.32474950668468,151.34834410302176 -27.32619346413493,151.34671878118513 -27.32619346413493,151.34671878118513 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 183
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.323305530431824,151.34834410302176 -27.323305530431824,151.34834410302176 -27.32474950668468,151.34671878118513 -27.32474950668468,151.34671878118513 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 184
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.321861535377025,151.34834410302176 -27.321861535377025,151.34834410302176 -27.323305530431824,151.34671878118513 -27.323305530431824,151.34671878118513 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 185
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.320417521520955,151.34834410302176 -27.320417521520955,151.34834410302176 -27.321861535377025,151.34671878118513 -27.321861535377025,151.34671878118513 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 186
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.318973488864295,151.34834410302176 -27.318973488864295,151.34834410302176 -27.320417521520955,151.34671878118513 -27.320417521520955,151.34671878118513 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 187
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34671878118513 -27.31863036418491,151.34834410302176 -27.31863036418491,151.34834410302176 -27.318973488864295,151.34671878118513 -27.318973488864295,151.34671878118513 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 188
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.340632004345807,151.34996942485836 -27.340632004345807,151.34996942485836 -27.341732701737612,151.34834410302176 -27.341732701737612,151.34834410302176 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 189
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.33918823495865,151.34996942485836 -27.33918823495865,151.34996942485836 -27.340632004345807,151.34834410302176 -27.340632004345807,151.34834410302176 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 190
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.33774444676217,151.34996942485836 -27.33774444676217,151.34996942485836 -27.33918823495865,151.34834410302176 -27.33918823495865,151.34834410302176 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 191
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.336300639757024,151.34996942485836 -27.336300639757024,151.34996942485836 -27.33774444676217,151.34834410302176 -27.33774444676217,151.34834410302176 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 192
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.334856813943894,151.34996942485836 -27.334856813943894,151.34996942485836 -27.336300639757024,151.34834410302176 -27.336300639757024,151.34834410302176 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 193
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.333412969323437,151.34996942485836 -27.333412969323437,151.34996942485836 -27.334856813943894,151.34834410302176 -27.334856813943894,151.34834410302176 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 194
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.33196910589634,151.34996942485836 -27.33196910589634,151.34996942485836 -27.333412969323437,151.34834410302176 -27.333412969323437,151.34834410302176 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 195
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.330525223663265,151.34996942485836 -27.330525223663265,151.34996942485836 -27.33196910589634,151.34834410302176 -27.33196910589634,151.34834410302176 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 196
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.32908132262489,151.34996942485836 -27.32908132262489,151.34996942485836 -27.330525223663265,151.34834410302176 -27.330525223663265,151.34834410302176 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 197
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.32763740278189,151.34996942485836 -27.32763740278189,151.34996942485836 -27.32908132262489,151.34834410302176 -27.32908132262489,151.34834410302176 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 198
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.32619346413493,151.34996942485836 -27.32619346413493,151.34996942485836 -27.32763740278189,151.34834410302176 -27.32763740278189,151.34834410302176 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 199
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.32474950668468,151.34996942485836 -27.32474950668468,151.34996942485836 -27.32619346413493,151.34834410302176 -27.32619346413493,151.34834410302176 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 200
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.323305530431824,151.34996942485836 -27.323305530431824,151.34996942485836 -27.32474950668468,151.34834410302176 -27.32474950668468,151.34834410302176 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 201
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.321861535377025,151.34996942485836 -27.321861535377025,151.34996942485836 -27.323305530431824,151.34834410302176 -27.323305530431824,151.34834410302176 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 202
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.320417521520955,151.34996942485836 -27.320417521520955,151.34996942485836 -27.321861535377025,151.34834410302176 -27.321861535377025,151.34834410302176 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 203
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.318973488864295,151.34996942485836 -27.318973488864295,151.34996942485836 -27.320417521520955,151.34834410302176 -27.320417521520955,151.34834410302176 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 204
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34834410302176 -27.31863036418491,151.34996942485836 -27.31863036418491,151.34996942485836 -27.318973488864295,151.34834410302176 -27.318973488864295,151.34834410302176 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 205
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.340632004345807,151.35159474669496 -27.340632004345807,151.35159474669496 -27.341732701737612,151.34996942485836 -27.341732701737612,151.34996942485836 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 206
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.33918823495865,151.35159474669496 -27.33918823495865,151.35159474669496 -27.340632004345807,151.34996942485836 -27.340632004345807,151.34996942485836 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 207
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.33774444676217,151.35159474669496 -27.33774444676217,151.35159474669496 -27.33918823495865,151.34996942485836 -27.33918823495865,151.34996942485836 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 208
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.336300639757024,151.35159474669496 -27.336300639757024,151.35159474669496 -27.33774444676217,151.34996942485836 -27.33774444676217,151.34996942485836 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 209
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.334856813943894,151.35159474669496 -27.334856813943894,151.35159474669496 -27.336300639757024,151.34996942485836 -27.336300639757024,151.34996942485836 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 210
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.333412969323437,151.35159474669496 -27.333412969323437,151.35159474669496 -27.334856813943894,151.34996942485836 -27.334856813943894,151.34996942485836 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 211
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.33196910589634,151.35159474669496 -27.33196910589634,151.35159474669496 -27.333412969323437,151.34996942485836 -27.333412969323437,151.34996942485836 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 212
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.330525223663265,151.35159474669496 -27.330525223663265,151.35159474669496 -27.33196910589634,151.34996942485836 -27.33196910589634,151.34996942485836 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 213
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.32908132262489,151.35159474669496 -27.32908132262489,151.35159474669496 -27.330525223663265,151.34996942485836 -27.330525223663265,151.34996942485836 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 214
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.32763740278189,151.35159474669496 -27.32763740278189,151.35159474669496 -27.32908132262489,151.34996942485836 -27.32908132262489,151.34996942485836 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 215
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.32619346413493,151.35159474669496 -27.32619346413493,151.35159474669496 -27.32763740278189,151.34996942485836 -27.32763740278189,151.34996942485836 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 216
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.32474950668468,151.35159474669496 -27.32474950668468,151.35159474669496 -27.32619346413493,151.34996942485836 -27.32619346413493,151.34996942485836 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 217
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.323305530431824,151.35159474669496 -27.323305530431824,151.35159474669496 -27.32474950668468,151.34996942485836 -27.32474950668468,151.34996942485836 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 218
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.321861535377025,151.35159474669496 -27.321861535377025,151.35159474669496 -27.323305530431824,151.34996942485836 -27.323305530431824,151.34996942485836 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 219
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.320417521520955,151.35159474669496 -27.320417521520955,151.35159474669496 -27.321861535377025,151.34996942485836 -27.321861535377025,151.34996942485836 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 220
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.318973488864295,151.35159474669496 -27.318973488864295,151.35159474669496 -27.320417521520955,151.34996942485836 -27.320417521520955,151.34996942485836 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 221
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.34996942485836 -27.31863036418491,151.35159474669496 -27.31863036418491,151.35159474669496 -27.318973488864295,151.34996942485836 -27.318973488864295,151.34996942485836 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 222
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.340632004345807,151.35322006853158 -27.340632004345807,151.35322006853158 -27.341732701737612,151.35159474669496 -27.341732701737612,151.35159474669496 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 223
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.33918823495865,151.35322006853158 -27.33918823495865,151.35322006853158 -27.340632004345807,151.35159474669496 -27.340632004345807,151.35159474669496 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 224
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.33774444676217,151.35322006853158 -27.33774444676217,151.35322006853158 -27.33918823495865,151.35159474669496 -27.33918823495865,151.35159474669496 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 225
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.336300639757024,151.35322006853158 -27.336300639757024,151.35322006853158 -27.33774444676217,151.35159474669496 -27.33774444676217,151.35159474669496 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 226
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.334856813943894,151.35322006853158 -27.334856813943894,151.35322006853158 -27.336300639757024,151.35159474669496 -27.336300639757024,151.35159474669496 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 227
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.333412969323437,151.35322006853158 -27.333412969323437,151.35322006853158 -27.334856813943894,151.35159474669496 -27.334856813943894,151.35159474669496 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 228
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.33196910589634,151.35322006853158 -27.33196910589634,151.35322006853158 -27.333412969323437,151.35159474669496 -27.333412969323437,151.35159474669496 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 229
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.330525223663265,151.35322006853158 -27.330525223663265,151.35322006853158 -27.33196910589634,151.35159474669496 -27.33196910589634,151.35159474669496 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 230
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.32908132262489,151.35322006853158 -27.32908132262489,151.35322006853158 -27.330525223663265,151.35159474669496 -27.330525223663265,151.35159474669496 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 231
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.32763740278189,151.35322006853158 -27.32763740278189,151.35322006853158 -27.32908132262489,151.35159474669496 -27.32908132262489,151.35159474669496 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 232
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.32619346413493,151.35322006853158 -27.32619346413493,151.35322006853158 -27.32763740278189,151.35159474669496 -27.32763740278189,151.35159474669496 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 233
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.32474950668468,151.35322006853158 -27.32474950668468,151.35322006853158 -27.32619346413493,151.35159474669496 -27.32619346413493,151.35159474669496 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 234
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.323305530431824,151.35322006853158 -27.323305530431824,151.35322006853158 -27.32474950668468,151.35159474669496 -27.32474950668468,151.35159474669496 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 235
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.321861535377025,151.35322006853158 -27.321861535377025,151.35322006853158 -27.323305530431824,151.35159474669496 -27.323305530431824,151.35159474669496 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 236
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.320417521520955,151.35322006853158 -27.320417521520955,151.35322006853158 -27.321861535377025,151.35159474669496 -27.321861535377025,151.35159474669496 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 237
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.318973488864295,151.35322006853158 -27.318973488864295,151.35322006853158 -27.320417521520955,151.35159474669496 -27.320417521520955,151.35159474669496 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 238
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35159474669496 -27.31863036418491,151.35322006853158 -27.31863036418491,151.35322006853158 -27.318973488864295,151.35159474669496 -27.318973488864295,151.35159474669496 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 239
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.340632004345807,151.35484539036818 -27.340632004345807,151.35484539036818 -27.341732701737612,151.35322006853158 -27.341732701737612,151.35322006853158 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 240
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.33918823495865,151.35484539036818 -27.33918823495865,151.35484539036818 -27.340632004345807,151.35322006853158 -27.340632004345807,151.35322006853158 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 241
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.33774444676217,151.35484539036818 -27.33774444676217,151.35484539036818 -27.33918823495865,151.35322006853158 -27.33918823495865,151.35322006853158 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 242
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.336300639757024,151.35484539036818 -27.336300639757024,151.35484539036818 -27.33774444676217,151.35322006853158 -27.33774444676217,151.35322006853158 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 243
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.334856813943894,151.35484539036818 -27.334856813943894,151.35484539036818 -27.336300639757024,151.35322006853158 -27.336300639757024,151.35322006853158 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 244
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.333412969323437,151.35484539036818 -27.333412969323437,151.35484539036818 -27.334856813943894,151.35322006853158 -27.334856813943894,151.35322006853158 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 245
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.33196910589634,151.35484539036818 -27.33196910589634,151.35484539036818 -27.333412969323437,151.35322006853158 -27.333412969323437,151.35322006853158 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 246
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.330525223663265,151.35484539036818 -27.330525223663265,151.35484539036818 -27.33196910589634,151.35322006853158 -27.33196910589634,151.35322006853158 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 247
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.32908132262489,151.35484539036818 -27.32908132262489,151.35484539036818 -27.330525223663265,151.35322006853158 -27.330525223663265,151.35322006853158 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 248
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.32763740278189,151.35484539036818 -27.32763740278189,151.35484539036818 -27.32908132262489,151.35322006853158 -27.32908132262489,151.35322006853158 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 249
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.32619346413493,151.35484539036818 -27.32619346413493,151.35484539036818 -27.32763740278189,151.35322006853158 -27.32763740278189,151.35322006853158 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 250
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.32474950668468,151.35484539036818 -27.32474950668468,151.35484539036818 -27.32619346413493,151.35322006853158 -27.32619346413493,151.35322006853158 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 251
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.323305530431824,151.35484539036818 -27.323305530431824,151.35484539036818 -27.32474950668468,151.35322006853158 -27.32474950668468,151.35322006853158 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 252
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.321861535377025,151.35484539036818 -27.321861535377025,151.35484539036818 -27.323305530431824,151.35322006853158 -27.323305530431824,151.35322006853158 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 253
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.320417521520955,151.35484539036818 -27.320417521520955,151.35484539036818 -27.321861535377025,151.35322006853158 -27.321861535377025,151.35322006853158 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 254
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.318973488864295,151.35484539036818 -27.318973488864295,151.35484539036818 -27.320417521520955,151.35322006853158 -27.320417521520955,151.35322006853158 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 255
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35322006853158 -27.31863036418491,151.35484539036818 -27.31863036418491,151.35484539036818 -27.318973488864295,151.35322006853158 -27.318973488864295,151.35322006853158 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 256
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.340632004345807,151.3564707122048 -27.340632004345807,151.3564707122048 -27.341732701737612,151.35484539036818 -27.341732701737612,151.35484539036818 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 257
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.33918823495865,151.3564707122048 -27.33918823495865,151.3564707122048 -27.340632004345807,151.35484539036818 -27.340632004345807,151.35484539036818 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 258
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.33774444676217,151.3564707122048 -27.33774444676217,151.3564707122048 -27.33918823495865,151.35484539036818 -27.33918823495865,151.35484539036818 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 259
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.336300639757024,151.3564707122048 -27.336300639757024,151.3564707122048 -27.33774444676217,151.35484539036818 -27.33774444676217,151.35484539036818 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 260
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.334856813943894,151.3564707122048 -27.334856813943894,151.3564707122048 -27.336300639757024,151.35484539036818 -27.336300639757024,151.35484539036818 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 261
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.333412969323437,151.3564707122048 -27.333412969323437,151.3564707122048 -27.334856813943894,151.35484539036818 -27.334856813943894,151.35484539036818 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 262
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.33196910589634,151.3564707122048 -27.33196910589634,151.3564707122048 -27.333412969323437,151.35484539036818 -27.333412969323437,151.35484539036818 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 263
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.330525223663265,151.3564707122048 -27.330525223663265,151.3564707122048 -27.33196910589634,151.35484539036818 -27.33196910589634,151.35484539036818 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 264
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.32908132262489,151.3564707122048 -27.32908132262489,151.3564707122048 -27.330525223663265,151.35484539036818 -27.330525223663265,151.35484539036818 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 265
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.32763740278189,151.3564707122048 -27.32763740278189,151.3564707122048 -27.32908132262489,151.35484539036818 -27.32908132262489,151.35484539036818 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 266
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.32619346413493,151.3564707122048 -27.32619346413493,151.3564707122048 -27.32763740278189,151.35484539036818 -27.32763740278189,151.35484539036818 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 267
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.32474950668468,151.3564707122048 -27.32474950668468,151.3564707122048 -27.32619346413493,151.35484539036818 -27.32619346413493,151.35484539036818 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 268
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.323305530431824,151.3564707122048 -27.323305530431824,151.3564707122048 -27.32474950668468,151.35484539036818 -27.32474950668468,151.35484539036818 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 269
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.321861535377025,151.3564707122048 -27.321861535377025,151.3564707122048 -27.323305530431824,151.35484539036818 -27.323305530431824,151.35484539036818 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 270
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.320417521520955,151.3564707122048 -27.320417521520955,151.3564707122048 -27.321861535377025,151.35484539036818 -27.321861535377025,151.35484539036818 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 271
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.318973488864295,151.3564707122048 -27.318973488864295,151.3564707122048 -27.320417521520955,151.35484539036818 -27.320417521520955,151.35484539036818 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 272
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.35484539036818 -27.31863036418491,151.3564707122048 -27.31863036418491,151.3564707122048 -27.318973488864295,151.35484539036818 -27.318973488864295,151.35484539036818 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 273
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.340632004345807,151.3575448970572 -27.340632004345807,151.3575448970572 -27.341732701737612,151.3564707122048 -27.341732701737612,151.3564707122048 -27.340632004345807))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 274
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.33918823495865,151.3575448970572 -27.33918823495865,151.3575448970572 -27.340632004345807,151.3564707122048 -27.340632004345807,151.3564707122048 -27.33918823495865))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 275
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.33774444676217,151.3575448970572 -27.33774444676217,151.3575448970572 -27.33918823495865,151.3564707122048 -27.33918823495865,151.3564707122048 -27.33774444676217))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 276
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.336300639757024,151.3575448970572 -27.336300639757024,151.3575448970572 -27.33774444676217,151.3564707122048 -27.33774444676217,151.3564707122048 -27.336300639757024))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 277
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.334856813943894,151.3575448970572 -27.334856813943894,151.3575448970572 -27.336300639757024,151.3564707122048 -27.336300639757024,151.3564707122048 -27.334856813943894))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 278
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.333412969323437,151.3575448970572 -27.333412969323437,151.3575448970572 -27.334856813943894,151.3564707122048 -27.334856813943894,151.3564707122048 -27.333412969323437))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 279
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.33196910589634,151.3575448970572 -27.33196910589634,151.3575448970572 -27.333412969323437,151.3564707122048 -27.333412969323437,151.3564707122048 -27.33196910589634))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 280
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.330525223663265,151.3575448970572 -27.330525223663265,151.3575448970572 -27.33196910589634,151.3564707122048 -27.33196910589634,151.3564707122048 -27.330525223663265))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 281
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.32908132262489,151.3575448970572 -27.32908132262489,151.3575448970572 -27.330525223663265,151.3564707122048 -27.330525223663265,151.3564707122048 -27.32908132262489))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 282
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.32763740278189,151.3575448970572 -27.32763740278189,151.3575448970572 -27.32908132262489,151.3564707122048 -27.32908132262489,151.3564707122048 -27.32763740278189))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 283
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.32619346413493,151.3575448970572 -27.32619346413493,151.3575448970572 -27.32763740278189,151.3564707122048 -27.32763740278189,151.3564707122048 -27.32619346413493))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 284
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.32474950668468,151.3575448970572 -27.32474950668468,151.3575448970572 -27.32619346413493,151.3564707122048 -27.32619346413493,151.3564707122048 -27.32474950668468))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 285
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.323305530431824,151.3575448970572 -27.323305530431824,151.3575448970572 -27.32474950668468,151.3564707122048 -27.32474950668468,151.3564707122048 -27.323305530431824))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 286
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.321861535377025,151.3575448970572 -27.321861535377025,151.3575448970572 -27.323305530431824,151.3564707122048 -27.323305530431824,151.3564707122048 -27.321861535377025))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 287
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.320417521520955,151.3575448970572 -27.320417521520955,151.3575448970572 -27.321861535377025,151.3564707122048 -27.321861535377025,151.3564707122048 -27.320417521520955))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 288
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.318973488864295,151.3575448970572 -27.318973488864295,151.3575448970572 -27.320417521520955,151.3564707122048 -27.320417521520955,151.3564707122048 -27.318973488864295))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
"
-- Query for Sub-Polygon 289
WITH input_polygon AS (
  SELECT ST_GeomFromText('POLYGON((151.3564707122048 -27.31863036418491,151.3575448970572 -27.31863036418491,151.3575448970572 -27.318973488864295,151.3564707122048 -27.318973488864295,151.3564707122048 -27.31863036418491))', 4326) AS geom_wgs84
),
target_raster AS (
  SELECT r.rast,
         ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM wyvern_dragonette_aus r, input_polygon ip
  WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
  SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
         tr.rast,
         tr.geom_proj
  FROM target_raster tr
),
intersecting_pixels AS (
  SELECT rast, x, y, geom
  FROM all_tile_pixels
  WHERE ST_Intersects(geom, geom_proj)
)
SELECT b.band_num AS band_number,
       ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
       ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
       px.x AS pixel_column,
       px.y AS pixel_row
FROM intersecting_pixels px,
     generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY band_number, y, x;
"
