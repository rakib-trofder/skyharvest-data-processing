WITH RasterData AS (
    SELECT rast
    FROM wyvern_dragonette_aus
    WHERE rid = 8
),
PixelPoints AS (
    SELECT
        (ST_PixelAsPoints(rd.rast, gs.band_idx)).geom AS pixel_geometry,
        (ST_PixelAsPoints(rd.rast, gs.band_idx)).val AS pixel_value,
        gs.band_idx AS band_number
    FROM
        RasterData AS rd,
        GENERATE_SERIES(1, (ST_Metadata(rd.rast)).numbands) AS gs(band_idx)
)
SELECT
    ST_AsText(pp.pixel_geometry) AS pixel_coordinates,
    pp.band_number,
    pp.pixel_value
FROM
    PixelPoints AS pp
ORDER BY
    ST_X(pp.pixel_geometry), ST_Y(pp.pixel_geometry), pp.band_number;
