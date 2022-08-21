-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2624

-- Challenge description:
  -- The company board asked you for a simple report on how many cities the company has already reached.
  -- To do this you must display the number of distinct cities in the customers table.

----> Soluction:
SELECT COUNT (DISTINCT city) 
FROM customers;
