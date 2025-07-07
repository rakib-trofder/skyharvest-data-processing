SELECT
    (ST_SummaryStats(rast, 1, FALSE)).count AS total_pixels, -- Get total pixels including NoData
    (ST_SummaryStats(rast, 1, TRUE)).count AS data_pixels,    -- Get count of only data pixels
    ((ST_SummaryStats(rast, 1, FALSE)).count - (ST_SummaryStats(rast, 1, TRUE)).count) AS nodata_pixels,
    CASE
        WHEN (ST_SummaryStats(rast, 1, FALSE)).count = 0 THEN 0
        ELSE ROUND(CAST(((ST_SummaryStats(rast, 1, FALSE)).count - (ST_SummaryStats(rast, 1, TRUE)).count) AS NUMERIC) * 100 / (ST_SummaryStats(rast, 1, FALSE)).count, 2)
    END AS nodata_percentage
FROM wyvern_dragonette_aus WHERE rid = 7;