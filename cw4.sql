/* 4) */

CREATE TABLE cw4.tableB AS SELECT cw4.popp.* FROM cw4.popp, cw4.majrivers 
WHERE popp.f_codedesc LIKE 'Building' GROUP BY popp.gid 
HAVING MIN(ST_Distance(majrivers.geom, popp.geom)) < 100000;

SELECT COUNT(gid) FROM cw4.tableB;

/* 5) */

CREATE TABLE cw4.airportsNew(gid SERIAL, name VARCHAR(50), geom GEOMETRY, elev NUMERIC);
INSERT INTO cw4.airportsNew (name, geom, elev) SELECT name, geom, elev FROM cw4.airports;

/* a) */

SELECT cw4.airportsNew.*, ST_Y(geom) AS y FROM cw4.airportsNew ORDER BY y DESC LIMIT 1;
SELECT cw4.airportsNew.*, ST_Y(geom) AS y FROM cw4.airportsNew ORDER BY y LIMIT 1;

/* b) */

INSERT INTO cw4.airportsNew(name, geom, elev) VALUES
('airportB', 
CONCAT('Point(',
    (SELECT((SELECT ST_Y(geom) FROM cw4.airportsNew ORDER BY ST_Y(geom) DESC LIMIT 1) + (SELECT ST_Y(geom) FROM cw4.airportsNew ORDER BY ST_Y(geom) LIMIT 1))/2),
	' ',
	(SELECT((SELECT ST_X(geom) AS x FROM cw4.airportsNew ORDER BY x DESC LIMIT 1) + (SELECT ST_X(geom) AS x FROM cw4.airportsNew ORDER BY x LIMIT 1))/2),
    ')'),
1000);


/* 6) */

SELECT ST_Area(ST_Buffer(ST_ShortestLine((SELECT geom FROM cw4.lakes WHERE names LIKE 'Iliamna Lake'),(SELECT geom FROM cw4.airports WHERE name LIKE 'AMBLER')), 1000));

/* 7) */

SELECT vegdesc, SUM(area_km2) FROM (SELECT vegdesc, trees.area_km2 FROM cw4.trees JOIN cw4.tundra ON trees.geom = tundra.geom) AS trees_tundra GROUP BY vegdesc;
SELECT vegdesc, SUM(area_km2) FROM (SELECT vegdesc, trees.area_km2 FROM cw4.trees JOIN cw4.swamp ON trees.geom = swamp.geom) AS trees_swamp GROUP BY vegdesc;
