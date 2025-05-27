-- Create tables
CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER,
    duration_minutes INTEGER,
    director_id INTEGER REFERENCES directors(director_id),
    imdb_rating NUMERIC(3,1),
    box_office_gross NUMERIC(12,2)
);

CREATE TABLE movie_genres (
    movie_id INTEGER REFERENCES movies(movie_id),
    genre_id INTEGER REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);



CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

CREATE TABLE movie_actors (
    movie_id INTEGER REFERENCES movies(movie_id),
    actor_id INTEGER REFERENCES actors(actor_id),
    role VARCHAR(100),
    is_lead_role BOOLEAN,
    PRIMARY KEY (movie_id, actor_id)
);


-- Insert directors
INSERT INTO directors (first_name, last_name, birth_date, nationality) VALUES
('Christopher', 'Nolan', '1970-07-30', 'British'),
('Quentin', 'Tarantino', '1963-03-27', 'American'),
('Greta', 'Gerwig', '1983-08-04', 'American'),
('Bong', 'Joon-ho', '1969-09-14', 'South Korean'),
('Martin', 'Scorsese', '1942-11-17', 'American');

-- Insert genres
INSERT INTO genres (genre_name) VALUES
('Sci-Fi'), ('Action'), ('Drama'), ('Comedy'), ('Thriller'), 
('Crime'), ('Adventure'), ('Horror'), ('Romance'), ('Animation');

-- Insert movies
INSERT INTO movies (title, release_year, duration_minutes, director_id, imdb_rating, box_office_gross) VALUES
('Inception', 2010, 148, 1, 8.8, 836836967),
('Pulp Fiction', 1994, 154, 2, 8.9, 213928762),
('Little Women', 2019, 135, 3, 7.8, 218800000),
('Parasite', 2019, 132, 4, 8.6, 258889589),
('The Dark Knight', 2008, 152, 1, 9.0, 1004558444),
('The Irishman', 2019, 209, 5, 7.8, 84800000),
('Barbie', 2023, 114, 3, 7.3, 1446000000),
('Kill Bill: Vol. 1', 2003, 111, 2, 8.2, 180949000),
('Memories of Murder', 2003, 132, 4, 8.1, 12000000),
('Interstellar', 2014, 169, 1, 8.6, 731000000);

-- Insert actors
INSERT INTO actors (first_name, last_name, birth_date, nationality) VALUES
('Leonardo', 'DiCaprio', '1974-11-11', 'American'),
('Joseph', 'Gordon-Levitt', '1981-02-17', 'American'),
('John', 'Travolta', '1954-02-18', 'American'),
('Uma', 'Thurman', '1970-04-29', 'American'),
('Saoirse', 'Ronan', '1994-04-12', 'Irish'),
('Emma', 'Watson', '1990-04-15', 'British'),
('Song', 'Kang-ho', '1967-01-17', 'South Korean'),
('Christian', 'Bale', '1974-01-30', 'British'),
('Heath', 'Ledger', '1979-04-04', 'Australian'),
('Robert', 'De Niro', '1943-08-17', 'American'),
('Margot', 'Robbie', '1990-07-02', 'Australian'),
('Ryan', 'Gosling', '1980-11-12', 'Canadian');

-- Insert movie_genres
INSERT INTO movie_genres VALUES
(1, 1), (1, 2), (1, 3),  -- Inception: Sci-Fi, Action, Drama
(2, 3), (2, 5), (2, 6),  -- Pulp Fiction: Drama, Thriller, Crime
(3, 3), (3, 4), (3, 9),  -- Little Women: Drama, Comedy, Romance
(4, 3), (4, 5), (4, 6),  -- Parasite: Drama, Thriller, Crime
(5, 2), (5, 3), (5, 6),  -- The Dark Knight: Action, Drama, Crime
(6, 3), (6, 6),          -- The Irishman: Drama, Crime
(7, 3), (7, 4), (7, 9),  -- Barbie: Drama, Comedy, Romance
(8, 2), (8, 5), (8, 6),  -- Kill Bill: Action, Thriller, Crime
(9, 3), (9, 5), (9, 6),  -- Memories of Murder: Drama, Thriller, Crime
(10, 1), (10, 3), (10, 7); -- Interstellar: Sci-Fi, Drama, Adventure

-- Insert movie_actors
INSERT INTO movie_actors VALUES
(1, 1, 'Cobb', TRUE), (1, 2, 'Arthur', FALSE),
(2, 3, 'Vincent Vega', TRUE), (2, 4, 'Mia Wallace', TRUE),
(3, 5, 'Jo March', TRUE), (3, 6, 'Meg March', FALSE),
(4, 7, 'Kim Ki-taek', TRUE),
(5, 8, 'Bruce Wayne/Batman', TRUE), (5, 9, 'Joker', TRUE),
(6, 10, 'Frank Sheeran', TRUE),
(7, 11, 'Barbie', TRUE), (7, 12, 'Ken', TRUE),
(8, 4, 'The Bride', TRUE),
(9, 7, 'Detective Park', TRUE),
(10, 8, 'Cooper', TRUE);

-------------------Medium Queries-------------------
--1. Find all movies directed by Christopher Nolan.
SELECT * FROM movies
JOIN directors ON movies.director_id = directors.director_id
WHERE concat(first_name,' ',last_name) = 'Christopher Nolan';

--2. List all actors who played lead roles (is_lead_role = TRUE).
SELECT * FROM actors AS a
JOIN movie_actors AS ma ON a.actor_id = ma.actor_id
WHERE is_lead_role = True;

--3. Show the average duration of movies by director (include director name).
SELECT concat(d.first_name, ' ', d.last_name) AS director_name,avg(m.duration_minutes) FROM movies AS m
JOIN directors AS d ON m.director_id = d.director_id
GROUP BY director_name;


--4. Find all movies that are both "Drama" and "Crime" genres.
SELECT m.title, g.genre_name, m.box_office_gross, m.release_year FROM movies AS m
JOIN movie_genres AS mg ON m.movie_id = mg.movie_id
JOIN genres AS g ON mg.genre_id = g.genre_id
WHERE g.genre_name IN('Drama', 'Crime');
--5. List movies along with their lead actor(s).


--------------------Simple Problem----------------
--1. List all movies released after 2010.
SELECT * FROM movies WHERE release_year > 2010;

--2. Find all actors with the first name starting with 'J'.
SELECT * FROM actors
WHERE first_name ILIKE 'j%';

--3. Show movies with an IMDB rating above 8.5.
SELECT * FROM movies
WHERE imdb_rating > 8.5;

--4. Count how many movies are in each genre.
SELECT genre_name, count(movie_id) FROM genres
JOIN movie_genres ON genres.genre_id = movie_genres.genre_id
GROUP BY genre_name;

--5. List all directors sorted by last name.
SELECT * FROM directors
ORDER BY last_name;