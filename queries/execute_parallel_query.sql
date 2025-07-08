DO $$
DECLARE
  rec RECORD;
  full_query TEXT := '';
BEGIN
  -- Loop through each sub-polygon and build the final UNION ALL query
  FOR rec IN
    WITH original_polygon AS (
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
      ) AS geom
    ),
    original_polygon_3857 AS (
      SELECT ST_Transform(geom, 3857) AS geom_3857 FROM original_polygon
    ),
    grid AS (
      SELECT g.geom AS cell_3857
      FROM original_polygon_3857,
      LATERAL (
        SELECT (ST_SquareGrid(
          GREATEST(
            ST_XMax(geom_3857) - ST_XMin(geom_3857),
            ST_YMax(geom_3857) - ST_YMin(geom_3857)
          ) / 4.0,
          geom_3857
        )).geom AS geom
      ) AS g
    ),
    sub_polygons AS (
      SELECT
        ROW_NUMBER() OVER() as id,
        ST_Transform(ST_Intersection(ST_Transform(o.geom_3857, 3857), g.cell_3857), 4326) AS sub_geom
      FROM original_polygon_3857 o
      JOIN grid g ON ST_Intersects(o.geom_3857, g.cell_3857)
      WHERE NOT ST_IsEmpty(ST_Intersection(o.geom_3857, g.cell_3857))
    )
    SELECT
      id,
      ST_AsText(sub_geom) AS wkt
    FROM sub_polygons
  LOOP
    full_query := full_query || FORMAT($f$
      SELECT
        %s AS sub_polygon_id,
        b.band_num AS band_number,
        ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
        ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
        px.x AS pixel_column,
        px.y AS pixel_row
      FROM (
        WITH input_polygon AS (
          SELECT ST_GeomFromText('%s', 4326) AS geom_wgs84
        ),
        target_raster AS (
          SELECT r.rast,
                 ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
          FROM wyvern_dragonette_aus r, input_polygon ip
          WHERE ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
        ),
        all_tile_pixels AS (
          SELECT (ST_PixelAsCentroids(tr.rast, 1)).*,
                 tr.rast,
                 tr.geom_proj
          FROM target_raster tr
        ),
        intersecting_pixels AS (
          SELECT rast, x, y, geom
          FROM all_tile_pixels
          WHERE ST_Intersects(geom, geom_proj)
        )
        SELECT * FROM intersecting_pixels
      ) px,
      generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
    $f$, rec.id, rec.wkt);

    -- Add UNION ALL between queries
    full_query := full_query || E'\nUNION ALL\n';
  END LOOP;

  -- Remove final UNION ALL
  full_query := regexp_replace(full_query, E'\nUNION ALL\n$', '');

  -- RAISE NOTICE 'Executing: %', full_query; -- For debugging
  EXECUTE full_query;
END $$;
