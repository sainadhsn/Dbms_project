-- Create spatial index on the populated places table
CREATE INDEX idx_ne_110m_populated_places_geom ON ne_110m_populated_places_simple USING GIST (geom);

-- Run the query after creating the spatial index
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE adm0name = 'Doha';
