CREATE Table students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age SMALLINT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO
    students (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES (
        'Emma',
        'Johnson',
        18,
        'A',
        'CSE',
        'emma.johnson@example.com',
        '2005-03-15',
        'A+',
        'USA'
    ),
    (
        'Liam',
        'Smith',
        19,
        'B+',
        'Mathematics',
        'liam.smith@example.com',
        '2004-07-22',
        'O-',
        'Canada'
    ),
    (
        'Olivia',
        'Williams',
        20,
        'A-',
        'Physics',
        'olivia.williams@example.com',
        '2003-11-05',
        'B+',
        'USA'
    ),
    (
        'Noah',
        'Brown',
        22,
        'B',
        'Biology',
        'noah.brown@example.com',
        '2005-01-30',
        'AB+',
        'Australia'
    ),
    (
        'Ava',
        'Jones',
        19,
        'A',
        'Chemistry',
        'ava.jones@example.com',
        '2004-09-12',
        'O+',
        'New Zealand'
    ),
    (
        'William',
        'Garcia',
        24,
        'C+',
        'CSE',
        'william.garcia@example.com',
        '2003-12-18',
        'A-',
        'Spain'
    ),
    (
        'Sophia',
        'Miller',
        24,
        'B-',
        'Biology',
        'sophia.miller@example.com',
        '2005-05-25',
        'B-',
        'Germany'
    ),
    (
        'Benjamin',
        'Davis',
        19,
        'A+',
        'Biology',
        NULL,
        '2004-02-08',
        'AB-',
        'France'
    ),
    (
        'Isabella',
        'Rodriguez',
        20,
        'B',
        'Biology',
        'isabella.rodriguez@example.com',
        '2003-08-14',
        'O+',
        'USA'
    ),
    (
        'James',
        'Martinez',
        18,
        'C',
        'CSE',
        'james.martinez@example.com',
        '2005-06-09',
        'A+',
        'Spain'
    ),
    (
        'Mia',
        'Hernandez',
        21,
        'A-',
        'Physics',
        'mia.hernandez@example.com',
        '2004-04-03',
        'B+',
        'Spain'
    ),
    (
        'Elijah',
        'Lopez',
        20,
        'D',
        'Physics',
        'elijah.lopez@example.com',
        '2003-10-27',
        'O-',
        'India'
    ),
    (
        'Charlotte',
        'Gonzalez',
        18,
        'B+',
        'Chemistry',
        'charlotte.gonzalez@example.com',
        '2005-07-19',
        'AB+',
        'Canada'
    ),
    (
        'Lucas',
        'Wilson',
        24,
        'A+',
        'Mathematics',
        'lucas.wilson@example.com',
        '2004-01-11',
        'A-',
        'Australia'
    ),
    (
        'Amelia',
        'Anderson',
        20,
        'C-',
        'Mathematics',
        'amelia.anderson@example.com',
        '2003-09-23',
        'B-',
        'Canada'
    ),
    (
        'Mason',
        'Thomas',
        18,
        'A+',
        'Mathematics',
        'mason.thomas@example.com',
        '2005-12-07',
        'O+',
        'India'
    ),
    (
        'Harper',
        'Taylor',
        19,
        'A+',
        'CSE',
        NULL,
        '2004-08-31',
        'AB-',
        'Bangladesh'
    ),
    (
        'Ethan',
        'Moore',
        20,
        'B',
        'Chemistry',
        'ethan.moore@example.com',
        '2003-04-16',
        'A+',
        'Bangladesh'
    ),
    (
        'Evelyn',
        'Jackson',
        21,
        'D+',
        'CSE',
        'evelyn.jackson@example.com',
        '2005-02-28',
        'B+',
        'Australia'
    ),
    (
        'Alexander',
        'Martin',
        19,
        'C',
        'Chemistry',
        'alexander.martin@example.com',
        '2004-10-10',
        'O-',
        'Bangladesh'
    );

SELECT DISTINCT country FROM students ORDER BY country ASC;

SELECT * FROM students;

TRUNCATE TABLE students;

SELECT * FROM students WHERE grade = 'A' AND course = 'CSE';

SELECT * FROM students WHERE blood_group = 'B-'

SELECT *
FROM students
WHERE (
        (
            country = 'USA'
            OR country = 'Australia'
        )
        AND age = '20'
    );

SELECT *
FROM students
WHERE (
        course = 'CSE'
        AND (
            grade = 'A+'
            OR grade = 'B'
        )
    )
    OR (
        course = 'Mathematics'
        AND (
            grade = 'A+'
            OR grade = 'B'
        )
    );

-- Scalar functions
SELECT concat(first_name, ' ', last_name) as fullname from students

SELECT lower(first_name) from students;

SELECT upper(first_name) from students;

SELECT length(first_name) FROM students

-- Aggregate  functions

SELECT count(age) FROM students;

SELECT max(age) as maxAge FROM students;

SELECT min(age) as minAge FROM students;

SELECT sum(age) as "Total Age" FROM students;

SELECT COALESCE(email, 'default@gmail.com') as email, age
from students;

SELECT * FROM students WHERE first_name ILIKE '_a%';

SELECT * FROM students WHERE first_name ILIKE 'a_%';

SELECT *
FROM students
WHERE
    age IN (18, 19, 20)
LIMIT 3
OFFSET
    3;

SELECT * FROM students LIMIT 5 OFFSET 5;

SELECT * FROM students WHERE email IS NOT NULL;

SELECT email FROM students;

UPDATE students 
    SET email = 'default@gmail.com' 
    WHERE email IS NULL;