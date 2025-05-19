SHOW timezone;

SELECT now();

CREATE TABLE timezone(
    tz TIMESTAMP without time zone,
    tzx TIMESTAMP with time zone
);

SELECT * FROM timezone;

INSERT INTO timezone VALUES('2025-04-19 09:10:00', '2025-04-19 09:10:00');

SELECT now()::time;

SELECT now():: date;

SELECT CURRENT_DATE;

SELECT current_time;

SELECT to_char(now(), 'dd/mm/yyyy');

SELECT current_date - INTERVAL '1 year';


SELECT age(CURRENT_DATE, '1998-11-01');

SELECT extract(YEAR FROM current_date::date);

SELECT 
    date_part('year', current_date) AS year,
    date_part('month', current_date) AS month;

SELECT 
    extract(YEAR FROM current_date) AS year,
    extract(MONTH FROM current_date) AS month;

--Count student born in each year
SELECT extract(YEAR FROM dob) as each_year, count(*) as total FROM students
 GROUP BY each_year;


-- Show the average age of students from each country only if the average age is greater than 19;
SELECT country, avg(age) as avg_age FROM students
    GROUP BY country
    HAVING avg(age) >=20;

SELECT age(CURRENT_DATE,dob) as Age FROM students;

