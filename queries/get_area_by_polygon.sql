
WITH poly AS (
  SELECT ST_Transform(
    ST_GeomFromText(
      'POLYGON((151.25392204192568, -27.705639639945662), 
    (151.25392204192568, -27.2955280266322), 
    (151.5801215277816, -27.2955280266322), 
    (151.5801215277816, -27.705639639945662), 
    (151.25392204192568, -27.705639639945662))',
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
