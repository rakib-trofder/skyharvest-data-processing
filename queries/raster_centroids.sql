SELECT
  ST_Y(ST_Centroid(ST_Envelope(rast))) AS center_latitude,
  ST_X(ST_Centroid(ST_Envelope(rast))) AS center_longitude
FROM wyvern_dragonette_aus;