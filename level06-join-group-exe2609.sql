-- USEI ONLINE: https://extendsclass.com/postgresql-online.html 

-- As usual the sales industry is doing an analysis of how many products we have in stock, and you can help them.

-- Then your job will display the name and amount of products of each category.

-- Schema:
    -- [products]_____________________|[categories]_________
    -- |_Column_____________|_Type____||_Column__|_Type____|
    -- | id (PK)           -| numeric || id (PK) | numeric |
    -- | name	           -| varchar ||_name____|_varchar_|
    -- | amount            -| numeric |
    -- | price	           -| numeric |
    -- |_id_categories (FK)_|_numeric_| 
    
-- Tables:
    -- [products]__________________________________________________|[categories]_________
    -- |_id_|_name_______________|_amount_|_price__|_id_categories_||_id_|_name_________|
    -- | 1 -| Two-doors wardrobe | 100    | 800	   | 1             || 1  | wood         |
    -- | 2 -| Dining table	     | 1000	  | 560	   | 3             || 2  | luxury       |
    -- | 3 -| Towel holder	     | 10000  | 25.50  | 4             || 3  | vintage      |
    -- | 4 -| Computer desk	     | 350	  | 320.50 | 2             || 4  | modern       |
    -- | 5 -| Chair	             | 3000	  | 210.64 | 4             ||_5 _|_super luxury_|
    -- |_6__|_Single bed_________|_750____|_460____|_1_____________|  

----> Make the structure:

CREATE TABLE IF NOT EXISTS tbl_categories(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
);

INSERT INTO categories VALUES (1, 'wood'), 
                              (2, 'luxury'), 
                              (3, 'vintage'), 
                              (4, 'modern'), 
                              (5, 'super luxury');

CREATE TABLE IF NOT EXISTS products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  amount INT,
  price DECIMAL,
  id_categories INT NOT NULL,
  
  FOREIGN KEY (id_categories) REFERENCES categories(id)
);

INSERT INTO products VALUES (1, 'Two-doors wardrobe', 100,   800,     1), 
                            (2, 'Dining table',       1000,	 560,     3), 
                            (3,	'Towel holder',	      10000, 25.50, 	4), 
                            (4,	'Computer desk',      350,	 320.50,	2), 
                            (5,	'Chair',              3000,  210.64,  4),
                            (6,	'Single bed',	        750,   460,    	1);


----> Soluction:

SELECT categories.name AS name, SUM(products.amount) AS sum 
FROM products
INNER JOIN categories ON (products.id_categories = categories.id)
GROUP BY categories.name
ORDER BY name ASC;

----> OUTPUT:
    -- |_nam_____|_sum___|
    -- | luxury  | 350   |
    -- | modern  | 13000 |
    -- | vintage | 1000  |
    -- |_wood____|_850___|
