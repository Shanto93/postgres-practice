select * FROM employees2;

--View to get the average salary of employees in each department
CREATE VIEW department_avg_salary AS
SELECT department_name, round(avg(salary))
FROM employees2
GROUP BY
    department_name;

SELECT * FROM department_avg_salary;

--Function to count the number of employees
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

--Function to  delete an employee
CREATE FUNCTION delete_employee(p_employee_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
DELETE FROM employees2
WHERE employee_id = p_employee_id;
$$

SELECT * FROM delete_employee (20);

--Procedure to remove an employee
CREATE OR REPLACE PROCEDURE remove_empl(p_em_id INT)
LANGUAGE plpgsql
AS
$$
DECLARE
    v_em_id INT;
BEGIN
    SELECT employee_id INTO v_em_id FROM employees2
    WHERE employee_id = p_em_id;
    DELETE FROM employees2
    WHERE employee_id = v_em_id;
    RAISE NOTICE 'Employee id % has been removed', v_em_id;
END
$$;
--Procedure to remove an employee
CREATE OR REPLACE PROCEDURE remove_empl(p_em_id INT)
LANGUAGE plpgsql
AS
$$
DECLARE
    v_em_id INT;
BEGIN
    SELECT employee_id INTO v_em_id FROM employees2
    WHERE employee_id = p_em_id;
    DELETE FROM employees2
    WHERE employee_id = v_em_id;
    RAISE NOTICE 'Employee id % has been removed', v_em_id;
END
$$;

CALL remove_empl (18);

SELECT * FROM employees2