-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2613

-- Challenge description:
  -- In the past the studio has made an event where several movies were on sale, we want to know what movies these were.
  -- Your job to help us is to select the ID and name of movies whose price is less than 2.00.

-- Schema's:
  -- [_movies_]__________________[_prices_]_______________ 
  -- |_Column_________|_Type____||_Column______|_Type____|
  -- | id (PK)        | numeric || id (PK)     | numeric |
  -- | name           | varchar || categorie   | varchar |
  -- |_id_prices_(FK)_|_numeric_||_value_______|_numeric_|

-- Tables:
  -- [_movies_]_______________________________________[_prices_]__________________
  -- |_id_|_name_________________________|_id_prices_||_id_|_categorie___|_value_|
  -- | 1  | Batman                       | 3         || 1  | Releases    | 3.50  |
  -- | 2  | The Battle of the Dark River | 3         || 2  | Bronze Seal | 2.00  |
  -- | 3  | White Duck                   | 5         || 3  | Silver Seal | 2.50  |
  -- | 4  | Breaking Barriers            | 4         || 4  | Gold Seal   | 3.00  |
  -- |_5__|_The Two Hours________________|_2_________||_5__|_Promotion___|_1.50__|

-- Output Sample:
  --|_id_|__name_______
  --|_3__|_White Duck_|
  
----> Make's the Structure:

CREATE TABLE IF NOT EXISTS prices (
  id SERIAL PRIMARY KEY,
  categorie VARCHAR(30),
  value DECIMAL
);

INSERT INTO prices VALUES (1,	'Releases',    3.50),
                          (2, 'Bronze Seal', 2.00),
                          (3,	'Silver Seal', 2.50),
                          (4,	'Gold Seal',   3.00),
                          (5, 'Promotion',   1.50);                       

CREATE TABLE IF NOT EXISTS movies (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  id_prices INT NOT NULL,
  
  FOREIGN KEY (id_prices) REFERENCES prices(id)
);

INSERT INTO movies VALUES (1, 'Batman',                       3),
                          (2, 'The Battle of the Dark River',	3),
                          (3,	'White Duck',                   5),
                          (4,	'Breaking Barriers',            4),
                          (5,	'The Two Hours',                2);
                          
----> Soluction:

SELECT movies.id, movies.name 
FROM movies
INNER JOIN prices ON (movies.id_prices = prices.id)
WHERE prices.value < 2.00;
