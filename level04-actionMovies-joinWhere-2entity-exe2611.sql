-- A video store contractor hired her services to catalog her movies. 
-- They need you to select the code and the name of the movies whose description of the genre is 'Action'.

-- Schema:
    -- [_movies_]__________________[_genres_]_______________ 
    -- |_Column_________|_Type____||_Column______|_Type____|
    -- | id (PK)        | numeric || id (PK)     | numeric |
    -- | name           | varchar ||_description_|_varchar_|
    -- |_id_genres (FK)_|_numeric_|
    
-- Tables:
    -- [_movies_]_______________________________________[_genres_]__________
    -- |_id_|_name_________________________|_id_genres_||_id_|_description_|
    -- | 1  | Batman                       | 3         || 1  | Animation   |
    -- | 2  | The Battle of the Dark River | 3         || 2  | Horror      |
    -- | 3  | White Duck                   | 1         || 3  | Action      |
    -- | 4	| Breaking Barriers	           | 4         || 4  | Drama       |
    -- |_5__|_The Two Hours________________|_2_________||_5__|_Comedy______|

-- Output Sample:
    -- |_id_|_name_________________________|
    -- | 1  | Batman                       |
    -- |_2__|_The Battle of the Dark River_|
    
----> Make the Structure:

CREATE TABLE IF NOT EXISTS genres (
  id SERIAL PRIMARY KEY,
  description VARCHAR(30)
);

INSERT INTO genres VALUES (1,	'Animation'),
                          (2, 'Horror'),
                          (3, 'Action'),
                          (4,	'Drama'),
                          (5, 'Comedy');

CREATE TABLE IF NOT EXISTS movies (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  id_genres INT NOT NULL,
  
  FOREIGN KEY (id_genres) REFERENCES genres(id)
);

INSERT INTO movies VALUES (1, 'Batman',                       3),
                          (2, 'The Battle of the Dark River',	3),
                          (3,	'White Duck',                   1),
                          (4,	'Breaking Barriers',            4),
                          (5,	'The Two Hours',                2);
                          
----> Soluction:
SELECT movies.id, movies.name 
FROM movies
INNER JOIN genres ON (movies.id_genres = genres.id)
WHERE genres.description = 'Action';
 
----> OutPut:
-- |_id_|_name_________________________|
-- | 1  | Batman                       |
-- |_2__|_The Battle of the Dark River_|
                          
