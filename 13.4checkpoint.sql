--1. Return all records, sorted from oldest to newest by year.
SELECT *
FROM planes
ORDER BY year;

--2. Return all records, sorted from Z to A by manufacturer.
SELECT *
FROM planes
ORDER BY manufacturer DESC;

--3. Return all records, sorted oldest to newest, then by manufacturer, then by model, both A-Z.
SELECT *
FROM planes
ORDER BY year, manufacturer, model;

--4. Return all records, sorted low to high by engines, then high to low by seats.
SELECT *
FROM planes
ORDER BY engine, seats DESC;

--5. Return all records of planes built before 2000, sorted A-Z by engine.
SELECT *
FROM planes
WHERE year < 2000
ORDER BY engine;

--6. Return the top 10 records, sorted high to low by seats
SELECT *
FROM planes
ORDER BY seats DESC
LIMIT 10;

--7. Return the top 10 records of planes built before 1990, sorted high to low by seats.
SELECT *
FROM planes
WHERE year < 1990
ORDER BY seats DESC
LIMIT 10;

--8. Count the number of all records, the number of speed records, and the number of year records. Name these fields count_total, count_speed, and count_year, respectively
SELECT COUNT (*) AS count_total,
		COUNT (speed) AS count_speed,
		COUNT (year) AS count_year
FROM planes; 

--9. Count the number of speed records where year is before 1980
SELECT COUNT (speed) AS count_speed
FROM planes
WHERE year < 1980;

--10. List the distinct values for the engine field
SELECT DISTINCT engine
FROM planes;

--11. List the distinct values of combinations for year, manufacturer, and model, sorted by manufacturer A-Z, then year oldest to newest, and then model A-Z.
SELECT DISTINCT year, manufacturer, model
FROM planes
ORDER BY manufacturer, year, model;
