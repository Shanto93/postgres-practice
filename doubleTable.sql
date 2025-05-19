CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user" (id) ON DELETE CASCADE NOT NULL
);



SELECT * FROM post;

SELECT * FROM "user";

DELETE FROM "user" WHERE id BETWEEN 5 and 8;

--input values for user table
INSERT INTO
    "user" (username)
VALUES ('Shanto'),
    ('Sanjida'),
    ('Rabbi'),
    ('Shamim');

--Input values for post table
INSERT INTO
    post (title, user_id)
VALUES ('How to Learn SQL Quickly', 1),
    ('The Art of Programming', 2),
    (
        'Data Science for Beginners',
        3
    ),
    (
        'Why PostgreSQL is Amazing',
        4
    ),
    (
        'Building Scalable Web Apps',
        1
    ),
    (
        'Machine Learning Trends in 2024',
        2
    ),
    ('Debugging Like a Pro', 3),
    (
        'Best Practices for Database Design',
        4
    ),
    (
        'Getting Started with Docker',
        1
    ),
    (
        'Python vs JavaScript: Which to Learn?',
        2
    ),
    ('My Journey into Tech', 3),
    ('The Future of AI', 4),
    ('How I Built My First App', 1),
    ('Understanding Blockchain', 2),
    (
        'Tips for Remote Work Success',
        3
    ),
    ('Why Open Source Matters', 4),
    (
        'Getting Hired as a Junior Developer',
        1
    ),
    (
        'The Psychology of Code Reviews',
        2
    ),
    ('How to Stay Productive', 3),
    (
        'The Rise of NoSQL Databases',
        4
    ),
    (
        'Functional Programming Explained',
        1
    ),
    (
        'Why I Switched from Windows to Linux',
        2
    ),
    (
        'A Day in the Life of a Data Engineer',
        3
    ),
    (
        'The Best Books for Coders',
        4
    ),
    (
        'How to Ace Technical Interviews',
        1
    ),
    (
        'My Experience with Cloud Computing',
        2
    ),
    ('The Ethics of AI', 3),
    (
        'Why You Should Learn Rust',
        4
    ),
    (
        'Freelancing as a Developer',
        1
    ),
    (
        'How to Contribute to Open Source',
        2
    );

ALTER TABLE post ALTER COLUMN user_id set NOT NULL;

DELETE FROM "user" WHERE id = 4;

ALTER TABLE post
DROP CONSTRAINT IF EXISTS post_user_id_fkey,
ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE;

DROP TABLE post;

DROP TABLE "user";

SELECT * FROM post;

SELECT * FROM "user";

--show username and title
SELECT
    title,
    p.id as postId,
    username,
    u.id as userId
FROM post as p
    JOIN "user" as u on p.id = u.id;

INSERT INTO
    post (title, user_id)
VALUES ('Test Title', NULL);

INSERT INTO "user" (username) VALUES ('Test');

ALTER TABLE post
 ALTER COLUMN user_id DROP NOT NULL;

SELECT * FROM post
INNER JOIN "user" on post.user_id = "user".id;


SELECT *  FROM post;

DROP Table post;

INSERT INTO
    post (title, user_id)
VALUES ('How to Learn SQL Quickly', 1),
    ('The Art of Programming', 2),
    (
        'Data Science for Beginners',
        4
    ),
    (
        'Why PostgreSQL is Amazing',
        4
    ),
    (
        'Building Scalable Web Apps',
        1
    ),
    (
        'Machine Learning Trends in 2024',
        2
    );


DELETE FROM post WHERE id BETWEEN 5 AND 6;

ALTER TABLE post
ALTER COLUMN user_id DROP NOT NULL;

SELECT * FROM post
LEFT OUTER JOIN "user" on post.user_id = "user".id;
SELECT * FROM post
RIGHT OUTER JOIN "user" on post.user_id = "user".id;
SELECT * FROM post
FULL OUTER JOIN "user" on post.user_id = "user".id;
INSERT INTO post (title, user_id)
VALUES ('Test Title', NULL);