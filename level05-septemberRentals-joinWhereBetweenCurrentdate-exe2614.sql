-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2614

-- Challenge description:
  -- The video store is making its semi-annual report and needs your help. 
  -- All you have to do is select the name of the clients and the date of rental, from the rentals made in September 2016.

-- Schema's:
  -- [customers]_____________________|[rentals]_____________________
  -- |_Column_____________|_Type____||_Column____________|_Type____|
  -- | id (PK)            | numeric || id (PK)           | numeric |
  -- | name               | varchar || rentals_date      | date    |
  -- | street             | varchar ||_id_customers (FK)_|_numeric_|
  -- |_city_______________|_varchar_|

-- Tables:
  -- [customers]_________________________________________________________________________|[rentals]___________________________
  -- |_id_|_name________________________|_street_________________________|_city__________||_id_|_rentals_date_|_id_customers_|
  -- | 1  | Giovanna Goncalves Oliveira | Rua Mato Grosso                | Canoas        || 1  | 2016-09-10   | 3            |
  -- | 2  | Kauã Azevedo Ribeiro        | Travessa Ibiá                  | Uberlândia    || 2  | 2016-02-09   | 1            |
  -- | 3  | Rebeca Barbosa Santos       | Rua Observatório Meteorológico | Salvador      || 3  | 2016-02-08   | 4            |
  -- | 4  | Sarah Carvalho Correia      | Rua Antônio Carlos da Silva    | Apucarana     || 4  | 2016-02-09   | 2            |
  -- | 5  | João Almeida Lima           | Rua Rio Taiuva                 | Ponta Grossa  || 5  | 2016-02-03   | 6            |
  -- |_6__|_Diogo Melo Dias_____________|_Rua Duzentos e Cinqüenta_______|_Várzea Grande_||_6__|_2016-04-04___|_4____________|
    
-- Output Sample:
  -- |_name__________________|_rentals_date_|
  -- |_Rebeca Barbosa Santos_|_2016-09-10___| 

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
                           
CREATE TABLE IF NOT EXISTS rentals (
  id SERIAL PRIMARY KEY,
  rentals_date DATE,
  id_customers INT NOT NULL,
  
  FOREIGN KEY (id_customers) REFERENCES customers(id)
);

INSERT INTO rentals VALUES (1, '2016-09-10', 3),
                           (2, '2016-02-09', 1),
                           (3, '2016-02-08', 4),
                           (4, '2016-02-09', 2),
                           (5, '2016-02-03', 6),
                           (6, '2016-04-04', 4);

----> Soluction:

SELECT customers.name, rentals.rentals_date
FROM customers 
JOIN rentals ON (customers.id = rentals.id_customers)
WHERE extract(month from rentals.rentals_date) = 9;
