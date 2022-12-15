#1.Find Book Titles
SELECT 
    title
FROM
    books
WHERE
    title LIKE 'The%';
    
#2.Replace Titles
UPDATE books 
SET 
    title = REPLACE(title, 'The', '***');

SELECT 
    title
FROM
    books
WHERE
    title LIKE '***%';
    
#3.Sum Cost of All Books
SELECT 
    FORMAT(SUM(cost), 2) AS cost
FROM
    books;    
    
#4.Days Lived
SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    TIMESTAMPDIFF(DAY, born, died) AS 'Days Lived'
FROM
    authors;
    
#5.Harry Potter Books
    SELECT 
    title
FROM
    books
WHERE
    title LIKE 'Harry Potter%';
    
    