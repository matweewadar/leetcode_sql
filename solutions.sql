--Employee Bonus--
SELECT name, bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus<1000 OR b.bonus IS NULL
--Immediate Food Delivery--
SELECT ROUND(AVG(order_date = customer_pref_delivery_date)*100,2) AS immediate_percentage
FROM delivery
WHERE(customer_id, order_date) IN (
SELECT customer_id, MIN(order_date)
FROM delivery
GROUP BY customer_id
)
--Biggest Single Number--
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num)=1)
--Employee Whoose Manager Left the Company--
SELECT employee_id 
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN(
    SELECT employee_id FROM Employees
    )
ORDER BY employee_id
--Investment in 2016--
ELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM insurance
WHERE tiv_2015 IN (
  SELECT tiv_2015
  FROM insurance
  GROUP BY tiv_2015
  HAVING COUNT(tiv_2015) > 1
)
AND (lat, lon) IN (
  SELECT lat,lon
  FROM insurance
  GROUP BY lat, lon
  HAVING COUNT(lat) = 1
)