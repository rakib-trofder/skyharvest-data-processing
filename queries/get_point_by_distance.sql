WITH input_point AS (
  SELECT ST_SetSRID(ST_MakePoint(151.436272644, -27.341744021), 4326) AS geom
)
SELECT 
  ST_X(ST_Transform(
    ST_Project(
      ST_Transform(geom, 3857),  -- Convert to Web Mercator (EPSG:3857) for accurate distance
      10,                        -- 10 meters
      radians(90)                -- Bearing in radians (90° = East)
    )::geometry,
    4326                         -- Convert back to WGS84 (EPSG:4326)
  )) AS new_lon,
  ST_Y(ST_Transform(
    ST_Project(
      ST_Transform(geom, 3857),
      10,
      radians(90)
    )::geometry,
    4326
  )) AS new_lat
FROM input_point;