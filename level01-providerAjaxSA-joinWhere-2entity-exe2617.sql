-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2617

-- Challenge description:
  -- The financial sector has encountered some problems in the delivery of one of our providers, the delivery of the products does not match the invoice.
  -- Your job is to display the name of the products and the name of the provider, for the products supplied by the provider 'Ajax SA'.

-- Schemas and Tables in the Bee Crowd: https://www.beecrowd.com.br/judge/en/problems/view/2617

----> Make's the structure:

CREATE TABLE IF NOT EXISTS providers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(2)
);

INSERT INTO providers VALUES (1, 'Ajax SA', 'Presidente Castelo Branco', 'Porto Alegre', 'RS'),
                             (2, 'Sansul SA', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
                             (3, 'South Chairs', 'Av Moinho', 'Santa Maria', 'RS'),
                             (4, 'Elon Electro', 'Apolo', 'São Paulo', 'SP'),
                             (5,'Mike Electro','Pedro da Cunha','Curitiba','PR');

CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  amount INT,
  price DECIMAL,
  id_providers INT NOT NULL,
  
  FOREIGN KEY (id_providers) REFERENCES providers(id)
);

INSERT INTO products VALUES (1, 'Blue Chair', 30, 300.00, 5),
                            (2, 'Red Chair', 50, 2150.00, 1),
                            (3, 'Disney Wardrobe', 400, 829.50, 4),
                            (4, 'Blue Toaster', 20, 9.90, 3),
                            (5, 'Solar Panel', 30, 3000.25, 4);
                            
----> Soluction:

SELECT p.name, f.name
FROM products AS p
JOIN providers AS f ON (p.id_providers = f.id)
WHERE f.name = 'Ajax SA';
 
