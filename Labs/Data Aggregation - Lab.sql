#1.Departments Info
SELECT 
    department_id, COUNT(salary) AS `Number of employees`
FROM
    employees
GROUP BY department_id
ORDER BY department_id , `Number of employees`;

#2.Average Salary
SELECT 
    department_id, FORMAT(AVG(salary), 2) AS `Average Salary`
FROM
    employees
GROUP BY department_id
ORDER BY department_id;

#3.Min Salary
SELECT 
    department_id, FORMAT(MIN(salary), 2) AS `Min Salary`
FROM
    employees
GROUP BY department_id
HAVING MIN(salary) > 800;

#4.Appetizers Count
SELECT 
    COUNT(id)
FROM
    products
WHERE
    category_id = 2 AND price > 8;

#5.Menu Prices
SELECT 
    category_id,
    FORMAT(AVG(price), 2) AS `Average Price`,
    FORMAT(MIN(price), 2) AS `Cheapest Product`,
    FORMAT(MAX(price), 2) AS `Most Expensive Product`
FROM
    products
GROUP BY category_id;











