-- Calculate distance between two specific cities
SELECT ST_Distance(
    (SELECT geom FROM ne_110m_populated_places_simple WHERE name = 'Juba'),
    (SELECT geom FROM ne_110m_populated_places_simple WHERE name = 'Doha')
) AS distance;
= 28.57


-- Calculate distances from a specific city to all other cities
SELECT name, ST_Distance(
    (SELECT geom FROM ne_110m_populated_places_simple WHERE name = 'Doha'),
    geom
) AS distance
FROM ne_110m_populated_places_simple
WHERE name != 'Doha' ORDER BY distance DESC LIMIT 10;
