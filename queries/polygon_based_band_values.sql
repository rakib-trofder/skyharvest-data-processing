WITH
input_polygon AS (
    -- Define the polygon in its original WGS 84 CRS
    SELECT ST_GeomFromText(
            'POLYGON((151.4513078789194 -27.52624129657206,
                        151.45131539968017 -27.52619466785564,
                        151.45213095   -27.52627465823798,
                        151.45204716969752 -27.526796328712646,
                        151.4512529773663  -27.526712096192664,
                        151.4513078789194  -27.52624129657206))',
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