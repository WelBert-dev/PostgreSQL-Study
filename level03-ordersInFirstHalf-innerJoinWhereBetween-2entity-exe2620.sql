-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2620

-- Challenge description:
  -- The company's financial audit is asking us for a report for the first half of 2016. 
  -- Then display the customers name and order number for customers who placed orders in the first half of 2016.
  
----> Soluction:
  
SELECT customers.name, orders.id
FROM customers
INNER JOIN orders ON (customers.id = orders.id_customers)
WHERE orders.orders_date BETWEEN '2016-01-01' AND '2016-06-30';
