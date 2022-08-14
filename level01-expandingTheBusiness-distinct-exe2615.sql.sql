-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2615

-- Challenge description:
  -- The video store company has the objectives of creating several franchises spread throughout Brazil. For this we want to know in which cities our customers live.
  -- For you to help us select the name of all the cities where the rental company has clients. But please do not repeat the name of the city.

-- Schema's:
  -- [customers]_____________________
  -- |_Column_____________|_Type____|
  -- | id (PK)            | numeric |
  -- | name               | varchar |
  -- | street             | varchar |
  -- |_city_______________|_varchar_|
    
-- Tables:
  -- [customers]__________________________________________________________________________
  -- |_id_|_name________________________|_street_________________________|_city__________|
  -- | 1  | Giovanna Goncalves Oliveira | Rua Mato Grosso                | Canoas        |
  -- | 2  | Kauã Azevedo Ribeiro        | Travessa Ibiá                  | Uberlândia    |
  -- | 3  | Rebeca Barbosa Santos       | Rua Observatório Meteorológico | Salvador      |
  -- | 4  | Sarah Carvalho Correia      | Rua Antônio Carlos da Silva    | Uberlândia    |
  -- | 5  | João Almeida Lima           | Rua Rio Taiuva                 | Ponta Grossa  |
  -- |_6__|_Diogo Melo Dias_____________|_Rua Duzentos e Cinqüenta_______|_Várzea Grande_|
  
-- Output Sample:
  -- |_city__________|
  -- | Uberlândia    |
  -- | Canoas        |
  -- | Ponta Grossa  |
  -- | Várzea Grande |
  -- |_Salvador______| 
  
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
                             (4, 'Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Uberlândia'),
                             (5, 'João Almeida Lima',	'Rua Rio Taiuva',	'Ponta Grossa'),
                             (6,	'Diogo Melo Dias', 'Rua Duzentos e Cinqüenta', 'Várzea Grande');

----> Soluction:

SELECT DISTINCT city
FROM customers;
