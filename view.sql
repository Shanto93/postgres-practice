select * FROM employees2;

CREATE VIEW department_avg_salary AS
SELECT department_name, round(avg(salary)) FROM employees2
GROUP BY department_name;

SELECT * FROM department_avg_salary;