-- Retrieve top 10 most populous cities
SELECT name, pop_max
FROM ne_110m_populated_places_simple
ORDER BY pop_max DESC
LIMIT 10;
