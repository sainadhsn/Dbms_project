-- Retrieve all populated places in a specific country
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE adm0name = 'Vatican';

-- Retrieve cities with a population greater than a certain threshold
SELECT name, geom
FROM ne_110m_populated_places_simple
