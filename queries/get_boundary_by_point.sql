SELECT
  rid,
  ST_AsGeoJSON(
    ST_Transform(
      ST_Buffer(
        ST_SetSRID(ST_MakePoint(151.43526203840585 -27.3417327017376), 4326)::geography,
        100
      )::geometry,
      ST_SRID(rast)
    )
  )::json->'coordinates' AS boundary_coordinates
FROM wyvern_dragonette_aus;