SELECT
  rid,
  ST_Width(rast) AS width,
  ST_Height(rast) AS height,
  ST_NumBands(rast) AS num_bands,
  ST_SRID(rast) AS srid,
  ST_ScaleX(rast) AS scale_x,
  ST_ScaleY(rast) AS scale_y,
  ST_SkewX(rast) AS skew_x,
  ST_SkewY(rast) AS skew_y,
  ST_UpperLeftX(rast) AS ul_x,
  ST_UpperLeftY(rast) AS ul_y,
  ST_Metadata(rast) AS metadata_json,
  ST_Envelope(rast) AS bounding_box_geom
FROM wyvern_dragonette_aus;