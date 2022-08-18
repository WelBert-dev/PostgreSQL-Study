-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2622

-- Challenge description:
  -- The sales industry wants to make a promotion for all clients that are legal entities. 
  -- For this you must display the name of the customers that are legal entity.
  
----> Soluction:
  
SELECT customers.name
FROM customers 
LEFT OUTER JOIN legal_person ON (customers.id = legal_person.id_customers)
WHERE legal_person.id_customers IS NOT NULL;
