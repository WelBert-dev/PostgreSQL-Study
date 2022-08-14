-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2618

-- Challenge description:
  -- Our company's import sector needs a report on the import of products from our Sansul providers.
  -- Your task is to display the name of the products, the name of the supplier and the name of the category, for the products supplied by the supplier 'Sansul SA' and whose category name is 'Imported'.

-- Schemas and Tables in the Bee Crowd: https://www.beecrowd.com.br/judge/en/problems/view/2618

----> Make's the structure:

CREATE TABLE IF NOT EXISTS providers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(2)
);

INSERT INTO providers VALUES (1, 'Ajax SA', 'Rua Presidente Castelo Branco', 'Porto Alegre', 'RS'),
                             (2, 'Sansul SA', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
                             (3, 'South Chairs', 'Rua do Moinho', 'Santa Maria', 'RS'),
                             (4, 'Elon Electro', 'Rua Apolo', 'São Paulo', 'SP'),
                             (5,'Mike Electro','Rua Pedro da Cunha','Curitiba','PR');


CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO categories VALUES (1, 'Super Luxury'),
                              (2, 'Imported'),
                              (3, 'Tech'),
                              (4, 'Vintage'),
                              (5, 'Supreme');


CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  amount INT,
  price DECIMAL,
  id_providers INT NOT NULL,
  id_categories INT NOT NULL,
  
  FOREIGN KEY (id_providers) REFERENCES providers(id),
  FOREIGN KEY (id_categories) REFERENCES categories(id)
);

INSERT INTO products VALUES (1, 'Blue Chair', 30, 300.00, 5, 5),
                            (2, 'Red Chair', 50, 2150.00, 2, 1),
                            (3, 'Disney Wardrobe', 400, 829.50, 4, 1),
                            (4, 'Blue Toaster', 20, 9.90, 3, 1),
                            (5, 'TV', 30, 3000.25, 2, 2);
                            

----> Soluction:
                           
  
