WITH specific_point AS (
  SELECT ST_Transform(
    ST_SetSRID(
      ST_MakePoint(151.45131539968017, -27.52619466785564),
      4326
    ),
    (SELECT ST_SRID(rast) FROM wyvern_dragonette_aus LIMIT 1)
  ) AS geom_proj
),
target_rasters AS (
  SELECT
    r.rast,
    sp.geom_proj
  FROM
    wyvern_dragonette_aus r,
    specific_point sp
  WHERE
    ST_Intersects(r.rast, sp.geom_proj)
),
band_values AS (
  SELECT
    (ST_WorldToRasterCoordX(tr.rast, ST_X(tr.geom_proj)))::int AS x,
    (ST_WorldToRasterCoordY(tr.rast, ST_Y(tr.geom_proj)))::int AS y,
    ST_AsText(ST_Transform(tr.geom_proj, 4326)) AS point_coordinates_wgs84,
    jsonb_object_agg(
      band_num,
      ST_Value(tr.rast, band_num, 
        (ST_WorldToRasterCoordX(tr.rast, ST_X(tr.geom_proj)))::int,
        (ST_WorldToRasterCoordY(tr.rast, ST_Y(tr.geom_proj)))::int
      )
    ) AS band_values
  FROM
    target_rasters tr,
    generate_series(1, 23) AS band_num
  GROUP BY tr.rast, tr.geom_proj
),
averages AS (
  SELECT
    x,
    y,
    point_coordinates_wgs84,
    -- Calculate band averages from JSON
    ((band_values->>'9')::numeric + (band_values->>'10')::numeric + 
     (band_values->>'11')::numeric + (band_values->>'12')::numeric +
     (band_values->>'13')::numeric + (band_values->>'14')::numeric) / 6.0 AS red_avg,
    
    ((band_values->>'16')::numeric + (band_values->>'17')::numeric + 
     (band_values->>'18')::numeric + (band_values->>'19')::numeric +
     (band_values->>'20')::numeric + (band_values->>'21')::numeric +
     (band_values->>'22')::numeric + (band_values->>'23')::numeric) / 8.0 AS nir_avg,
    
    ((band_values->>'2')::numeric + (band_values->>'3')::numeric + 
     (band_values->>'4')::numeric + (band_values->>'5')::numeric) / 4.0 AS green_avg,
    
    ((band_values->>'13')::numeric + (band_values->>'14')::numeric + 
     (band_values->>'15')::numeric + (band_values->>'16')::numeric) / 4.0 AS red_edge_avg
  FROM
    band_values
)
SELECT
  point_coordinates_wgs84,
  red_avg,
  nir_avg,
  green_avg,
  red_edge_avg,
  -- 1. NDVI (Normalized Difference Vegetation Index)
  (nir_avg - red_avg) / NULLIF((nir_avg + red_avg), 0) AS ndvi,
  
  -- 2. GCI (Green Chlorophyll Index)
  (nir_avg / NULLIF(green_avg, 0)) - 1 AS gci,
  
  -- 3. RECI (Red Edge Chlorophyll Index)
  (nir_avg / NULLIF(red_edge_avg, 0)) - 1 AS reci,
  
  -- 4. NDWI (Normalized Difference Water Index)
  (green_avg - nir_avg) / NULLIF((green_avg + nir_avg), 0) AS ndwi,
  
  -- 5. DVI (Difference Vegetation Index)
  (nir_avg - red_avg) AS dvi
FROM
  averages;