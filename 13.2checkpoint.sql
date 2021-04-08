--1. Built since 2000
SELECT *
From planes
WHERE year >= 2000;
--2025 records

--2. Manufacturer is BOEING
SELECT *
FROM planes
WHERE manufacturer = 'BOEING';
--1630 records

--3. Built between 1980 and 1990
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990;
--315 records

--4. Manufacturer is either CESSNA, BOEING or AIRBUS
SELECT *
FROM planes
WHERE manufacturer IN ('CESSNA', 'BOEING', 'AIRBUS');
--1975 records

--5. Year field is unknown
SELECT *
FROM planes
WHERE year IS NULL;
-- 70 records

--6. The speed field isn't unknown
SELECT *
FROM planes
WHERE speed IS NOT NULL;
--23 records

--7. Do not seat between 50 and 200
SELECT *
FROM planes
WHERE seats NOT BETWEEN 50 AND 200;
--417 records

--8. The engine field starts with TURBO
SELECT *
FROM planes
WHERE engine ILIKE 'TURBO%';
--3292 records

--9. Model name in the format "XXX-XXX"
SELECT *
FROM planes
WHERE model LIKE '___-___';
--1496 records

--10. Built before 1980 and and seat more than 100
SELECT *
FROM planes
WHERE year < 1980 AND seats > 100;
-- 9 rows

--11. Built after 2000 or have a reciprocating engine
SELECT *
FROM planes
WHERE year > 2000 OR engine = 'Reciprocating';
--1806 records

--12. Built between 1980 and 1990, are not two-engine planes, have a nonmissing value for speed, and were either manufactured by BOEING or CESSNA
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990
	AND engines <> 2
	AND speed IS NOT NULL
	AND manufacturer IN('BOEING', 'CESSNA');
--1 record

--13.  Either built between 1980 and 1990, and are not two-engine planes, and have a nonmissing value for speed, or were manufactured by either BOEING or CESSNA
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990
	AND engines <> 2
	AND speed IS NOT NULL
	OR manufacturer IN('BOEING', 'CESSNA');
--1639 records

--14. Both built between 1980 and 1990, and are not two-engine planes. In addition to that, return the records that either have nonmissing values for speed, or were manufactured either by BOEING or CESSNA.
SELECT *
FROM planes
WHERE year BETWEEN 1980 AND 1990
	AND engines <> 2
	AND (speed IS NOT NULL
		OR manufacturer IN('BOEING', 'CESSNA'));
--2 records
