WITH specific_point AS (
  SELECT ST_Transform(
    ST_SetSRID(
      ST_MakePoint(151.45131539968017, -27.52619466785564),
      4326
    ),
    (SELECT ST_SRID(rast) FROM wyvern_dragonette_aus LIMIT 1)
  ) AS geom_proj
),
target_rasters AS (
  SELECT
    r.rast,
    sp.geom_proj
  FROM
    wyvern_dragonette_aus r,
    specific_point sp
  WHERE
    ST_Intersects(r.rast, sp.geom_proj)
),
pixel_data AS (
  SELECT
    (ST_WorldToRasterCoordX(tr.rast, ST_X(tr.geom_proj)))::int AS x,
    (ST_WorldToRasterCoordY(tr.rast, ST_Y(tr.geom_proj)))::int AS y,
    jsonb_object_agg(
      band_num,
      ST_Value(tr.rast, band_num,
        (ST_WorldToRasterCoordX(tr.rast, ST_X(tr.geom_proj)))::int,
        (ST_WorldToRasterCoordY(tr.rast, ST_Y(tr.geom_proj)))::int
      )
    ) AS band_values,
    ST_AsText(ST_Transform(tr.geom_proj, 4326)) AS point_coordinates_wgs84
  FROM
    target_rasters tr,
    generate_series(1, 23) AS band_num
  GROUP BY tr.rast, tr.geom_proj
)
SELECT
  x,
  y,
  point_coordinates_wgs84,
  band_values
FROM
  pixel_data;