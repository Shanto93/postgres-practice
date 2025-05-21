select * FROM employees2;

CREATE VIEW department_avg_salary AS
SELECT department_name, round(avg(salary))
FROM employees2
GROUP BY
    department_name;

SELECT * FROM department_avg_salary;

CREATE FUNCTION count_employee()
RETURNS INTEGER
LANGUAGE SQL
AS
$$
    SELECT count(*) FROM employees2;
$$

SELECT * FROM count_employee ();

SELECT count(*) FROM employees2;

SELECT * FROM employees2;

CREATE FUNCTION delete_employee(p_employee_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
DELETE FROM employees2
WHERE employee_id = p_employee_id;
$$

SELECT * FROM delete_employee (20);