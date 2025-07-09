WITH
input_polygon AS (
    -- Define the polygon in its original WGS 84 CRS
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
target_raster AS (
    -- Find the relevant raster tile and transform the polygon to the raster's CRS
    SELECT
        r.rast,
        ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)) AS geom_proj
    FROM
        wyvern_dragonette_aus r,
        input_polygon ip
    WHERE
        ST_Intersects(r.rast, ST_Transform(ip.geom_wgs84, ST_SRID(r.rast)))
),
all_tile_pixels AS (
    -- **Step 1: Generate the full set of pixel centroids from the target tile(s).**
    -- No WHERE clause is used here to avoid the error.
    SELECT
        (ST_PixelAsCentroids(tr.rast, 1)).*, -- Get x, y, geom
        tr.rast,                             -- Pass the raster data along
        tr.geom_proj                         -- Pass the projected polygon along
    FROM
        target_raster tr
),
intersecting_pixels AS (
    -- **Step 2: Now, filter the generated pixels.**
    -- This CTE selects only the pixels whose centroids are inside the polygon.
    SELECT
        rast, x, y, geom
    FROM
        all_tile_pixels
    WHERE
        ST_Intersects(geom, geom_proj)
)
-- **Step 3: Extract values for the filtered pixels for each band.**
SELECT
    b.band_num AS band_number,
    ST_AsText(ST_Transform(px.geom, 4326)) AS pixel_center_coordinates,
    -- Use the highly efficient ST_Value to get the value
    ST_Value(px.rast, b.band_num, px.x, px.y) AS pixel_value,
    px.x AS pixel_column,
    px.y AS pixel_row
FROM
    intersecting_pixels px,
    -- Generate the series of bands to iterate over
    generate_series(1, ST_NumBands(px.rast)) AS b(band_num)
ORDER BY
    band_number, y, x;