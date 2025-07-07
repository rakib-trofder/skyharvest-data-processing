WITH SingleRaster AS (
    SELECT rast, ST_Centroid(rast::geometry) AS center_point
    FROM wyvern_dragonette_aus where rid = 7
)
SELECT
    gs.band_idx AS band_number,
    ST_Value(sr.rast, gs.band_idx, sr.center_point, TRUE) AS pixel_value
FROM
    SingleRaster AS sr,
    GENERATE_SERIES(1, (ST_Metadata(sr.rast)).numbands) AS gs(band_idx);