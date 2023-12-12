-- Analyze query performance
EXPLAIN ANALYZE
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE adm0name = 'Doha';
