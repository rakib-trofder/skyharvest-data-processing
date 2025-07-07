WITH
input_polygon AS (
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
        ST_SRID(rast)
    ) AS geom
    FROM wyvern_dragonette_aus
),
relevant_raster AS (
    SELECT rast
    FROM wyvern_dragonette_aus, input_polygon
    WHERE ST_Intersects(rast, input_polygon.geom)
),
band_series AS (
    SELECT generate_series(1, (ST_Metadata(rast)).numbands) AS band_idx
    FROM relevant_raster
),
pixel_values AS (
    SELECT
        bs.band_idx,
        (ST_PixelAsCentroids(
            ST_Clip(r.rast, ip.geom, TRUE),
            bs.band_idx,
            TRUE
        )).*
    FROM
        relevant_raster r,
        input_polygon ip,
        band_series bs
)
SELECT
    band_idx AS band_number,
    ST_AsText(ST_Transform(geom, 4326)) AS pixel_center_coordinates,
    val AS pixel_value,
    x AS pixel_column,
    y AS pixel_row
FROM
    pixel_values
ORDER BY
    band_number, y, x;