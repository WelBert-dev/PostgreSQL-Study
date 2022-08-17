-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2619

-- Challenge description:
  -- Our company is looking to make a new contract for the supply of new super luxury products, and for this we need some data of our products.
  -- Your job is to display the name of the products, the name of the providers and the price, for the products whose price is greater than 1000 and its category is' Super Luxury.

-- Schemas and Tables in the Bee Crowd: https://www.beecrowd.com.br/judge/en/problems/view/2617

----> Soluction:

SELECT products.name, providers.name, products.price
FROM products
INNER JOIN providers ON (products.id_providers = providers.id)
INNER JOIN categories ON (products.id_categories = categories.id)
WHERE products.price > 1000 AND categories.name = 'Super Luxury';
