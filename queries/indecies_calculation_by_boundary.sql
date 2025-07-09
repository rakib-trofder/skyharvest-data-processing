SELECT
    pixel_center_coordinates,
    -- Pre-calculate band averages using a CTE or subquery
    red_avg AS red,
    nir_avg AS nir,
    green_avg AS green,
    red_edge_avg AS red_edge,

    -- Spectral indices calculations using the pre-calculated averages
    -- NDVI = (NIR - Red) / (NIR + Red)
    (nir_avg - red_avg) / NULLIF((nir_avg + red_avg), 0) AS ndvi,

    -- GCI = (NIR / Green) - 1
    (nir_avg / NULLIF(green_avg, 0)) - 1 AS gci,

    -- RECI = (NIR / RedEdge) - 1
    (nir_avg / NULLIF(red_edge_avg, 0)) - 1 AS reci,

    -- NDWI = (Green - NIR) / (Green + NIR)
    (green_avg - nir_avg) / NULLIF((green_avg + nir_avg), 0) AS ndwi,

    -- DVI = NIR - Red
    (nir_avg - red_avg) AS dvi
FROM (
    SELECT
        pixel_center_coordinates,
        AVG(CASE WHEN band_number BETWEEN 9 AND 14 THEN pixel_value ELSE NULL END) AS red_avg,
        AVG(CASE WHEN band_number BETWEEN 16 AND 23 THEN pixel_value ELSE NULL END) AS nir_avg,
        AVG(CASE WHEN band_number BETWEEN 2 AND 5 THEN pixel_value ELSE NULL END) AS green_avg,
        AVG(CASE WHEN band_number BETWEEN 13 AND 16 THEN pixel_value ELSE NULL END) AS red_edge_avg
    FROM
        point_data
    GROUP BY
        pixel_center_coordinates
) AS precalculated_bands;