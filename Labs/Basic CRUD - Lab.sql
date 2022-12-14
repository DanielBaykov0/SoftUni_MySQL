#1.Select Employee Information
SELECT 
    id, first_name, last_name, job_title
FROM
    employees;

#2.Select Employees with Filter
SELECT 
    id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    job_title,
    salary
FROM
    employees
WHERE
    salary > 1000.00;

#3.Update Employees Salary
UPDATE employees 
SET 
    salary = salary + 100
WHERE
    job_title = 'Manager';

SELECT salary FROM employees;

#4.Top Paid Employee
CREATE OR REPLACE VIEW top_paid AS
    SELECT 
        id, first_name, last_name, job_title, department_id, salary
    FROM
        employees
    ORDER BY salary DESC
    LIMIT 1;

SELECT * FROM top_paid;

#5.Select Employees by Multiple Filters
SELECT 
    *
FROM
    employees
WHERE
    department_id = 4 AND salary >= 1000;

#6.Delete from Table
DELETE FROM employees 
WHERE
    department_id IN (2 , 1);

SELECT 
    *
FROM
    employees;
