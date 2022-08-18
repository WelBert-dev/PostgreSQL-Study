-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2623

-- Challenge description:
  -- The sales industry needs a report to know what products are left in stock.
  -- To help the sales industry, display the product name and category name for products 
  -- whose amount is greater than 100 and the category ID is 1,2,3,6 or 9. 
  -- Show the results in ascendent order by category ID.
  
----> Soluction:

SELECT prod.name, cat.name
FROM products AS prod
INNER JOIN categories AS cat ON (prod.id_categories = cat.id)
WHERE prod.amount > 100 AND prod.id_categories IN (1, 2, 3, 6, 9);
