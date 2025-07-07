
WITH poly AS (
  SELECT ST_Transform(
    ST_GeomFromText(
      'POLYGON((151.4513078789194	-27.52624129657206,
                151.45131539968017	-27.52619466785564,
                151.45213095	-27.52627465823798,
                151.45204716969752	-27.526796328712646,
                151.4512529773663	-27.526712096192664,
                151.4513078789194	-27.52624129657206))',
      4326
    ),
    3857 -- Using Web Mercator for measurement (EPSG:3857)
  ) AS geom
),
envelope AS (
  SELECT
    ST_OrientedEnvelope(geom) AS oriented_rect
  FROM poly
)
SELECT
  ST_Area(p.geom) AS area_sq_meters,
  ST_Area(p.geom)/10000 AS area_hectares,
  -- Calculate length and width from the oriented rectangle
  ST_Distance(
    ST_PointN(ST_Boundary(e.oriented_rect), 1),
    ST_PointN(ST_Boundary(e.oriented_rect), 2)
  ) AS length_meters,
  ST_Distance(
    ST_PointN(ST_Boundary(e.oriented_rect), 2),
    ST_PointN(ST_Boundary(e.oriented_rect), 3)
  ) AS width_meters,
  ST_AsText(ST_Centroid(ST_Transform(p.geom, 4326))) AS centroid
FROM poly p, envelope e;
