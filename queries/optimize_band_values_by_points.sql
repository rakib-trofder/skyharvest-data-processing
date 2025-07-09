WITH input_boundary AS (
  SELECT ST_GeomFromText(
            'POLYGON((151.45191179600488 -27.526421418791138,
                    151.45191781261346 -27.526261978664035,
                    151.45209229426197 -27.52627702018546,
                    151.4521013191747 -27.526430443703987,
                    151.45191179600488 -27.526421418791138,
                    151.45191179600488 -27.526421418791138))',
            4326
        ) AS geom_wgs84
),
target_rasters AS (
  SELECT
    r.rast,
    ST_Transform(ib.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
  FROM
    wyvern_dragonette_aus r,
    input_boundary ib
  WHERE
    ST_Intersects(r.rast, ST_Transform(ib.geom_wgs84, ST_SRID(r.rast)))
),
pixel_data AS (
  SELECT
    px.x,
    px.y,
    px.geom,
    tr.geom_proj,
    (
      SELECT jsonb_object_agg(
        'band' || band_num, 
        ST_Value(tr.rast, band_num, px.x, px.y)
      FROM generate_series(1, 23) AS band_num
    ) AS band_values,
    ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates_wgs84
  FROM
    target_rasters tr,
    ST_PixelAsCentroids(tr.rast, 1) AS px
  WHERE
    ST_Intersects(px.geom, tr.geom_proj)
)
)
SELECT DISTINCT ON (x, y, ST_AsEWKB(geom))
  x,
  y,
  pixel_center_coordinates_wgs84,
  band_values
FROM
  pixel_data
ORDER BY x, y, ST_AsEWKB(geom);