-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2616

-- Challenge description:
  -- The video store company intends to do a promotion for customers who have not yet done any rental.
  -- Your job is to deliver us the ID and the name of the customers who have not done any rental. Sort the output by ID.

-- Schema's:
  -- [customers]_____________________|[locations]_____________________
  -- |_Column_____________|_Type____||_Column______________|_Type____|
  -- | id (PK)            | numeric || id (PK)             | numeric |
  -- | name               | varchar || locations_date      | date    |
  -- | street             | varchar ||_id_customers (FK)___|_numeric_|
  -- |_city_______________|_varchar_|
  
-- Tables:
  -- [customers]_________________________________________________________________________|[locations]_________________________
  -- |_id_|_name________________________|_street_________________________|_city__________||_id_|_rentals_date_|_id_customers_|
  -- | 1  | Giovanna Goncalves Oliveira | Rua Mato Grosso                | Canoas        || 1  | 2016-10-09   | 3            |
  -- | 2  | Kauã Azevedo Ribeiro        | Travessa Ibiá                  | Uberlândia    || 2  | 2016-09-02   | 1            |
  -- | 3  | Rebeca Barbosa Santos       | Rua Observatório Meteorológico | Salvador      || 3  | 2016-08-02   | 4            |
  -- | 4  | Sarah Carvalho Correia      | Rua Antônio Carlos da Silva    | Apucarana     || 4  | 2016-09-02   | 2            |
  -- | 5  | João Almeida Lima           | Rua Rio Taiuva                 | Ponta Grossa  || 5  | 2016-03-02   | 6            |
  -- |_6__|_Diogo Melo Dias_____________|_Rua Duzentos e Cinqüenta_______|_Várzea Grande_||_6__|_2016-04-04___|_4____________|
  
-- Output Sample:
  -- |_id_|_name______________|
  -- |_5__|_João Almeida Lima_|
    
----> Make's the structure:

CREATE TABLE IF NOT EXISTS customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  street VARCHAR(30),
  city VARCHAR(30) 
);

INSERT INTO customers VALUES (1, 'Giovanna Goncalves Oliveira', 'Rua Mato Grosso', 'Canoas'),
                             (2, 'Kauã Azevedo Ribeiro', 'Travessa Ibiá', 'Uberlândia'),
                             (3, 'Rebeca Barbosa Santos',	'Rua Observatório Meteorológico',	'Salvador'),
                             (4, 'Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Apucarana'),
                             (5, 'João Almeida Lima',	'Rua Rio Taiuva',	'Ponta Grossa'),
                             (6,	'Diogo Melo Dias', 'Rua Duzentos e Cinqüenta', 'Várzea Grande');
                           
CREATE TABLE IF NOT EXISTS locations (
  id SERIAL PRIMARY KEY,
  locations_date DATE,
  id_customers INT NOT NULL,
  
  FOREIGN KEY (id_customers) REFERENCES customers(id)
);

INSERT INTO locations VALUES (1, '2016-10-09', 3),
                             (2, '2016-09-02', 1),
                             (3, '2016-08-02', 4),
                             (4, '2016-09-02', 2),
                             (5, '2016-03-02', 6),
                             (6, '2016-04-04', 4);

----> Soluction:
