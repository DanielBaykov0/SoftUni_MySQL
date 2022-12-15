#Part I – Queries for SoftUni Database

#1.Find Names of All Employees by First Name
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name LIKE 'Sa%'
ORDER BY employee_id;

#2.Find Names of All Employees by Last Name
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%ei%'
ORDER BY employee_id;

#3.Find First Names of All Employees
SELECT 
    first_name
FROM
    employees
WHERE
    department_id = 3
        OR department_id = 10
        AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id; 

#4.Find All Employees Except Engineers
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

#5.Find Towns with Name Length
SELECT 
    name
FROM
    towns
WHERE
    LENGTH(name) = 5 OR LENGTH(name) = 6
ORDER BY name;

#6.Find Towns Starting With
SELECT 
    town_id, name
FROM
    towns
WHERE
    name LIKE 'M%' OR name LIKE 'K%'
        OR name LIKE 'B%'
        OR name LIKE 'E%'
ORDER BY name;

#7.Find Towns Not Starting With
SELECT 
    town_id, name
FROM
    towns
WHERE
    SUBSTRING(name, 1, 1) NOT IN ('R' , 'B', 'D')
ORDER BY name;

#8.Create View Employees Hired After 2000 Year
CREATE OR REPLACE VIEW v_employees_hired_after_2000 AS
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        YEAR(hire_date) > 2000;
        
SELECT 
    *
FROM
    v_employees_hired_after_2000;

#9.Length of Last Name
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    LENGTH(last_name) = 5;

#Part II – Queries for Geography Database

#10.Countries Holding 'A' 3 or More Times
SELECT 
    country_name, iso_code
FROM
    countries
WHERE
    country_name LIKE '%a%a%a%'
ORDER BY iso_code;

#11.Mix of Peak and River Names
SELECT 
    peak_name,
    river_name,
    LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2))) AS 'mix'
FROM
    peaks,
    rivers
ORDER BY peak_name , river_name;

#OR

SELECT 
    peak_name,
    river_name,
    LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2))) AS 'mix'
FROM
    peaks,
    rivers
WHERE
    RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY 'mix';

#Part III – Queries for Diablo Database

#12.Games from 2011 and 2012 Year
SELECT 
    name, DATE_FORMAT(start, '%Y-%m-%d') AS start
FROM
    games
WHERE
    YEAR(start) BETWEEN 2011 AND 2012
ORDER BY start , name
LIMIT 50;

#13.User Email Providers
SELECT 
    u.user_name,
    SUBSTRING_INDEX(u.email, '@', - 1) AS `Email Provider`
FROM
    users AS u
ORDER BY `Email Provider` ASC , u.user_name ASC;

#14.Get Users with IP Address Like Pattern
SELECT 
    u.user_name, u.ip_address
FROM
    users AS u
WHERE
    u.ip_address LIKE '___.1%.%.___'
ORDER BY u.user_name;

#15.Show All Games with Duration and Part of the Day
SELECT 
    g.name AS game,
    CASE
        WHEN EXTRACT(HOUR FROM g.start) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM g.start) < 18 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM g.start) < 24 THEN 'Evening'
    END AS `Part of the Day`,
    CASE
        WHEN g.duration <= 3 THEN 'Extra Short'
        WHEN g.duration <= 6 THEN 'Short'
        WHEN g.duration <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS `Duration`
FROM
    `games` AS g;

#Part IV – Date Functions Queries

#16.Orders Table
SELECT 
    o.product_name,
    o.order_date,
    DATE_ADD(o.order_date, INTERVAL 3 DAY) AS 'pay_due',
    DATE_ADD(o.order_date, INTERVAL 1 MONTH) AS 'deliver_due'
FROM
    `orders` AS o

















