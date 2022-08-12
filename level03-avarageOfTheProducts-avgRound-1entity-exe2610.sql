-- In the company that you work is being done a survey on the values of the products that are marketed.

-- To help the industry that is doing this survey you should calculate and display the average value of the price of the products.

-- OBS: Show the value with two numbers after the period.

-- Schema:
    -- [products]
    -- |_Column__|_Type____| 
    -- | id (PK) | numeric |
    -- | name    | varchar |
    -- | amount	 | numeric |
    -- |_price___|_numeric_|
    
-- Tables:
  -- [products]
  -- |_id_|_name_______________|_amount_|_price__|
  -- | 1  | Two-doors wardrobe | 100    | 800    |
  -- | 2  | Dining table       | 1000   | 560    |
  -- | 3  | Towel holder       | 10000  | 25.50  |
  -- | 4  | Computer desk      | 350    | 320.50 |
  -- | 5  | Chair              | 3000   | 210.64 |
  -- |_6 _|_Single bed_________|_750____|_460____|
  
-- Output Sample
    -- |_price__|
    -- |_396.10_| --> .2floats
    
----> Make the Structure:

CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  amount INT,
  price DECIMAL
);

INSERT INTO products VALUES (1, 'Two-doors wardrobe', 100,     800),
                            (2, 'Dining table',       1000,    560),
                            (3, 'Towel holder',       10000, 25.50),
                            (4, 'Computer desk',      350,  320.50),
                            (5, 'Chair',              3000, 210.64),
                            (6, 'Single bed',         750,      46);

----> Soluction:

SELECT round(AVG(price), 2) AS price
FROM products;
