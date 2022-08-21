-- Challenge Link: https://www.beecrowd.com.br/judge/en/problems/view/2737

-- Challenge description:
  -- The manager of Mangojata Lawyers requested a report on the current lawyers.
  -- The manager wants you to show him the name of the lawyer with the most clients, 
  -- the one with the fewest and the client average considering all lawyers.

  -- OBS: Before presenting the average, show a field called Average to make the report more readable.
  -- The average must be presented as an integer.

----> Soluction:

(
SELECT name, customers_number
FROM lawyers
ORDER BY customers_number DESC
LIMIT 1
)

UNION ALL

(
SELECT name, customers_number
FROM lawyers
ORDER BY customers_number ASC
LIMIT 1
)

UNION ALL

(
SELECT 'Average', round(AVG(customers_number), 0)
FROM lawyers
)



