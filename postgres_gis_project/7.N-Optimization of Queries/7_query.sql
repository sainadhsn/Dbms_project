-- Cluster the table based on a spatial index
CLUSTER ne_110m_populated_places_simple USING idx_ne_110m_populated_places_geom;

-- Run the query after clustering
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE name = 'Tokyo';

