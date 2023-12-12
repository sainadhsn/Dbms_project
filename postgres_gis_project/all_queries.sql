1: all: 
SELECT * FROM "public"."ne_110m_populated_places_simple" LIMIT 10

1. Retrieve Locations of Specific Features

-- Retrieve all populated places in a specific country
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE adm0name = 'Vatican';

-- Retrieve cities with a population greater than a certain threshold
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE pop_max > 1000000;

2. Calculate Distance Between Points

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

3. Calculate Areas of Interest

-- Calculate the area of a specific country
SELECT name, ST_Area(geom::geography)/1000000 as area_sqkm 
FROM ne_110m_admin_0_countries WHERE name = 'Germany';

4. Analyze Query

-- Analyze query performance
EXPLAIN ANALYZE
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE adm0name = 'Doha';


5.Sorting, Limiting

-- Retrieve top 10 most populous cities
SELECT name, pop_max
FROM ne_110m_populated_places_simple
ORDER BY pop_max DESC
LIMIT 10;

6. 
-- Create spatial index on the populated places table
CREATE INDEX idx_ne_110m_populated_places_geom ON ne_110m_populated_places_simple USING GIST (geom);

-- Run the query after creating the spatial index
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE adm0name = 'Doha';



7.

-- Cluster the table based on a spatial index
CLUSTER ne_110m_populated_places_simple USING idx_ne_110m_populated_places_geom;

-- Run the query after clustering
SELECT name, geom
FROM ne_110m_populated_places_simple
WHERE name = 'Tokyo';


