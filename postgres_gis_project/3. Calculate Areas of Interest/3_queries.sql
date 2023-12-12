-- Calculate the area of a specific country
SELECT name, ST_Area(geom::geography)/1000000 as area_sqkm 
FROM ne_110m_admin_0_countries WHERE name = 'Germany';
