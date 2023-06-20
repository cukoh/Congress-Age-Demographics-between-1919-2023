CREATE DATABASE politician_age;

SELECT * FROM politician_age.politicians;


SET sql_safe_updates = 0;

UPDATE politicians
SET birthday = CASE
	WHEN birthday LIKE'%/%'THEN date_format(str_to_date(birthday,'%m/%d/%Y'),'%Y-%m-%d')
	WHEN birthday LIKE'%/%'THEN date_format(str_to_date(birthday,'%d/%m/%Y'),'%Y-%m-%d')
    WHEN birthday LIKE'%-%'THEN date_format(str_to_date(birthday,'%Y-%m-%d'),'%Y-%m-%d')
	ELSE NULL
END;

ALTER TABLE politicians
MODIFY COLUMN birthday DATE;

ALTER TABLE politicians
MODIFY COLUMN start_date DATE;

ALTER TABLE politicians
MODIFY COLUMN age_years INT;

SELECT 
	min(age_years) as youngest,
    max(age_years) as oldest
FROM politicians;
		



-- Questions --

-- Average Age of Politicians within the Generations
SELECT generation, AVG(age_years), start_date
FROM politicians
GROUP BY generation, age_years, start_date
ORDER BY generation, age_years, start_date asc;

-- Separate by party_code count
-- 100 = Democratic; 200 = Republican; Else = Third Party
SELECT party_code, COUNT(*) AS count
FROM politicians
GROUP BY party_code
ORDER BY COUNT(party_code) desc;

-- Biggest Generational Share
SELECT generation, COUNT(*) AS count
FROM politicians
GROUP BY generation
ORDER BY COUNT(generation) desc;

-- Most common political party by generation
SELECT generation, party_code, COUNT(*) AS count
FROM politicians
GROUP BY generation, party_code
ORDER BY party_code, COUNT(generation) desc;

-- Most common age range in general
SELECT
	CASE
    WHEN age_years >= 20 AND age_years <=29 THEN '20-29'
    WHEN age_years >= 30 AND age_years <=39 THEN '30-39'
    WHEN age_years >= 40 AND age_years <=49 THEN '40-49'
    WHEN age_years >= 50 AND age_years <=59 THEN '50-59'
    WHEN age_years >= 60 AND age_years <=69 THEN '60-69'
    WHEN age_years >= 70 AND age_years <=79 THEN '70-79'
    WHEN age_years >= 80 AND age_years <=89 THEN '80-89'
    WHEN age_years >= 90 AND age_years <=99 THEN '90-99'
    ELSE NULL
END AS age_group,
COUNT(*) AS count
FROM politicians
GROUP BY age_group
ORDER BY COUNT(age_group) desc;
    
SELECT 
	min(start_date) as oldest,
    max(start_date) as youngest
FROM politicians;


SELECT 
	min(age_years) as oldest,
    max(age_years) as youngest
FROM politicians;


-- Generation cohort dominance by decade

SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1910-01-01' AND start_date <='1919-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1920-01-01' AND start_date <='1929-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1930-01-01' AND start_date <='1939-12-31' 
GROUP BY generation
ORDER BY generation asc;
 

SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1940-01-01' AND start_date <='1949-12-31' 
GROUP BY generation
ORDER BY generation asc;

  
SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1950-01-01' AND start_date <='1959-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1960-01-01' AND start_date <='1969-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1970-01-01' AND start_date <='1979-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1980-01-01' AND start_date <='1989-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1990-01-01' AND start_date <='1999-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '2000-01-01' AND start_date <='2009-12-31' 
GROUP BY generation
ORDER BY generation asc;

SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '2010-01-01' AND start_date <='2019-12-31' 
GROUP BY generation
ORDER BY generation asc;


SELECT generation, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '2020-01-01' AND start_date <='2029-12-31' 
GROUP BY generation
ORDER BY generation asc;


-- Age range by decade
SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1910-01-01' AND start_date <='1919-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1910-01-01' AND start_date <='1919-12-31' 
GROUP BY age_years
ORDER BY age_years asc;


SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1920-01-01' AND start_date <='1929-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1920-01-01' AND start_date <='1929-12-31' 
GROUP BY age_years
ORDER BY age_years asc;


SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1930-01-01' AND start_date <='1939-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1930-01-01' AND start_date <='1939-12-31' 
GROUP BY age_years
ORDER BY age_years asc;    

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1940-01-01' AND start_date <='1949-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1940-01-01' AND start_date <='1949-12-31' 
GROUP BY age_years
ORDER BY age_years asc;    

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1950-01-01' AND start_date <='1959-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1950-01-01' AND start_date <='1959-12-31' 
GROUP BY age_years
ORDER BY age_years asc;  

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1960-01-01' AND start_date <='1969-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1960-01-01' AND start_date <='1969-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1970-01-01' AND start_date <='1979-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1970-01-01' AND start_date <='1979-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1980-01-01' AND start_date <='1989-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1980-01-01' AND start_date <='1989-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '1990-01-01' AND start_date <='1999-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '1990-01-01' AND start_date <='1999-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '2000-01-01' AND start_date <='2009-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '2000-01-01' AND start_date <='2009-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '2010-01-01' AND start_date <='2019-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '2010-01-01' AND start_date <='2019-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

SELECT start_date, age_years, COUNT(*) AS count 
FROM politicians
WHERE start_date >= '2020-01-01' AND start_date <='2029-12-31' 
GROUP BY start_date, age_years
ORDER BY age_years asc;

SELECT start_date, avg(age_years) 'Average Age'
FROM politicians
WHERE start_date >= '2020-01-01' AND start_date <='2029-12-31' 
GROUP BY age_years
ORDER BY age_years asc; 

-- Conclusion: Has Congress become older with time?
-- Generally, yes

