--Creating employees table
CREATE TABLE employees2 (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

--Insering sample data into employees table
INSERT INTO
    employees2 (
        employee_name,
        department_name,
        salary,
        hire_date
    )
VALUES (
        'John Smith',
        'Sales',
        55000.00,
        '2018-03-15'
    ),
    (
        'Emily Johnson',
        'Marketing',
        62000.00,
        '2019-06-22'
    ),
    (
        'Michael Brown',
        'IT',
        78000.00,
        '2017-11-05'
    ),
    (
        'Sarah Davis',
        'HR',
        48000.00,
        '2020-02-10'
    ),
    (
        'Robert Wilson',
        'Finance',
        85000.00,
        '2016-09-18'
    ),
    (
        'Jennifer Lee',
        'Sales',
        52000.00,
        '2021-04-30'
    ),
    (
        'David Miller',
        'IT',
        92000.00,
        '2015-08-12'
    ),
    (
        'Jessica Taylor',
        'Marketing',
        67000.00,
        '2019-01-25'
    ),
    (
        'James Anderson',
        'Operations',
        58000.00,
        '2020-07-14'
    ),
    (
        'Linda Martinez',
        'Finance',
        75000.00,
        '2018-05-09'
    ),
    (
        'Daniel Clark',
        'IT',
        81000.00,
        '2017-10-03'
    ),
    (
        'Amanda Rodriguez',
        'HR',
        53000.00,
        '2022-01-08'
    ),
    (
        'Christopher Lewis',
        'Sales',
        49000.00,
        '2021-11-17'
    ),
    (
        'Patricia Walker',
        'Operations',
        61000.00,
        '2019-09-21'
    ),
    (
        'Matthew Hall',
        'IT',
        95000.00,
        '2016-04-27'
    ),
    (
        'Elizabeth Young',
        'Marketing',
        64000.00,
        '2020-08-11'
    ),
    (
        'Kevin Allen',
        'Finance',
        88000.00,
        '2017-12-04'
    ),
    (
        'Michelle King',
        'HR',
        56000.00,
        '2021-03-19'
    ),
    (
        'Andrew Scott',
        'Sales',
        51000.00,
        '2022-02-28'
    ),
    (
        'Nicole Green',
        'Operations',
        59000.00,
        '2018-10-15'
    );

SELECT * FROM employees2;

--Retrieve all employees whose salary is greater than the highest salaary of HR department
SELECT *
FROM employees2
WHERE
    salary > (
        SELECT max(salary)
        FROM employees2
        WHERE
            department_name = 'HR'
    );