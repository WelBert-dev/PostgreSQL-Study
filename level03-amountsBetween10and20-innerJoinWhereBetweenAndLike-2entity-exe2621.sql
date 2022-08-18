-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2621

-- Challenge description:
  -- When it comes to delivering the report on how many products the company has in stock, a part of the report has become corrupted, 
  -- so the stock keeper asked for help, he wants you to display the following data for him.
  -- Display the name of products whose amount are between 10 and 20 and whose name of the supplier starts with the letter 'P'.
  
----> Soluction:

SELECT prod.name
FROM products AS prod
INNER JOIN providers AS prov ON (prod.id_providers = prov.id)
WHERE prod.amount BETWEEN 10 AND 20 AND prov.name LIKE 'P%'; 
