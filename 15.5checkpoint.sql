--2. 
SELECT namefirst, namelast, inducted
FROM people LEFT OUTER JOIN hof_inducted
ON people.playerid = hof_inducted.playerid;


--3. 
SELECT salaries.yearid, salaries.playerid, teamid, lgid, category
FROM salaries INNER JOIN hof_inducted
ON salaries.playerid = hof_inducted.playerid;

--4. 
SELECT salaries.playerid, salaries.yearid, teamid, lgid, salary, inducted
FROM salaries FULL OUTER JOIN hof_inducted
ON salaries.playerid = hof_inducted.playerid;

--5. 
SELECT * FROM hof_inducted
UNION ALL
SELECT * FROM hof_not_inducted;

SELECT playerid FROM hof_inducted
UNION ALL 
SELECT playerid FROM hof_not_inducted;

--6. 
SELECT namefirst, namelast, SUM(salary) AS total_salary
FROM people INNER JOIN salaries
ON people.playerid = salaries.playerid
GROUP BY people.playerid, namelast, namefirst;

--7. 
SELECT hof_inducted.playerid, yearid, namefirst, namelast
FROM hof_inducted LEFT OUTER JOIN people
ON hof_inducted.playerid = people.playerid
UNION ALL
SELECT hof_not_inducted.playerid, yearid, namefirst, namelast
FROM hof_not_inducted LEFT OUTER JOIN people
ON hof_not_inducted.playerid = people.playerid;

--8. 
SELECT concat (namelast, ', ', namefirst) AS namefull, yearid, inducted
FROM hof_inducted LEFT OUTER JOIN people
ON hof_inducted.playerid = people.playerid
WHERE yearid >= 1980

UNION ALL

SELECT concat ( namelast, ', ', namefirst) AS namefull, yearid, inducted
FROM hof_not_inducted LEFT OUTER JOIN people
ON hof_not_inducted.playerid = people.playerid
WHERE yearid >= 1980
ORDER BY yearid, inducted DESC, namefull;

--9. 
WITH max AS
(SELECT MAX(salary) AS max_salary, teamid, yearid
FROM salaries
GROUP BY teamid, yearid)
SELECT salaries.yearid, salaries.teamid, playerid, max.max_salary
FROM max LEFT OUTER JOIN salaries
ON salaries.teamid = max.teamid AND salaries.yearid = max.yearid AND salaries.salary = max.max_salary
ORDER BY max.max_salary DESC;

--10. 
SELECT birthyear, deathyear, namefirst, namelast
FROM people
WHERE birthyear > ANY
	(SELECT birthyear
	FROM people
	WHERE playerid = 'ruthba01')
ORDER BY birthyear;

--11. 
SELECT namefirst, namelast,
	CASE
			WHEN birthcountry = 'USA' THEN 'USA'
			ELSE 'non-USA'
	END as usaborn
FROM people
ORDER BY 3; 

--12. 
SELECT
ROUND (AVG(CASE WHEN throws = 'R' THEN height END)) AS right_height,
ROUND (AVG(CASE WHEN throws = 'L' THEN height END)) AS left_height
FROM people;

--13. 
WITH max_sal_by_team_by_year AS
(
SELECT teamid, yearid, MAX(salary) AS max_sal
FROM salaries
GROUP BY teamid, yearid
)
SELECT teamid, AVG(max_sal) AS avg_max_sal_since_2010
FROM max_sal_by_team_by_year
WHERE yearid >= 2010
GROUP BY teamid;
