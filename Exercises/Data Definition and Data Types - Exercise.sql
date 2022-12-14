#0.Create Database
create schema minions;

#1.Create Tables
CREATE TABLE minions.minions(
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`age` INT NOT NULL,
PRIMARY KEY(`id`));

CREATE TABLE minions.towns(
town_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY(town_id));

#2.Alter Minions Table
ALTER TABLE minions.minions ADD column town_id INT;

ALTER TABLE minions.minions
ADD CONSTRAINT fk_minions_towns FOREIGN KEY(town_id)
REFERENCES towns(id);

#3.Insert Records in Both Tables
INSERT INTO minions.minions(name, age, town_id)
VALUES ('Kevin', 22, 1),
		('Bob', 15, 3),
        ('Steward', NULL, 2);
        
INSERT INTO minions.towns(name)
VALUES ('Sofia'),
		('Plovdiv'),
        ('Varna');

#4.Truncate Table Minions
TRUNCATE TABLE minions.minions;

#5.Drop All Tables
DROP TABLE minions.minions;
DROP TABLE minions.towns;

#6.Create Table People
CREATE TABLE minions.people(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
picture BLOB,
height DOUBLE(3,2),
weight DOUBLE(5,2),
gender ENUM('m', 'f') NOT NULL,
birthdate DATE NOT NULL,
biography TEXT);

INSERT INTO minions.people
(name, picture, height, weight, gender, birthdate, biography)
VALUES
('Gosho', 'qwe', 1.11, 2.22, 'm', '2022-01-01', 'whatever'),
('Pesho', 'qwe', 1.11, 2.22, 'm', '2022-01-01', 'whatever'),
('Mihaela', 'qwe', 1.11, 2.22, 'f', '2022-01-01', 'whatever'),
('Desi', 'qwe', 1.11, 2.22, 'f', '2022-01-01', 'whatever'),
('Ivan', 'qwe', 1.11, 2.22, 'm', '2022-01-01', 'whatever');

#7.Create Table Users
CREATE TABLE minions.users(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(30) UNIQUE NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture BLOB,
last_login_time DATETIME,
is_deleted tinyint(1));

INSERT INTO minions.users
(username, password, profile_picture, last_login_time, is_deleted)
VALUES
('Gosho', '123', 'qwe', '2020-01-01 15:30:21', 1),
('Ivan', '123', 'qwe', '2020-01-01 15:30:21', 1),
('Pesho', '123', 'qwe', '2020-01-01 15:30:21', 0),
('Mimi', '123', 'qwe', '2020-01-01 15:30:21', 1),
('Ana', '123', 'qwe', '2020-01-01 15:30:21', 0);

#8.Change Primary Key
ALTER TABLE minions.users ALTER id DROP DEFAULT;

ALTER TABLE minions.users
CHANGE COLUMN id id INT(11) NOT NULL FIRST,
DROP PRIMARY KEY;

ALTER TABLE minions.users
ADD CONSTRAINT PRIMARY KEY(id, username);

#9.Set Default Value of a Field
ALTER TABLE minions.users
CHANGE COLUMN last_login_time last_login_time
TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

#10.Set Unique Field
ALTER TABLE minions.users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id);

ALTER TABLE minions.users
CHANGE COLUMN username username VARCHAR(30) UNIQUE NOT NULL;

#11.Movies Database
CREATE SCHEMA movies;

CREATE TABLE directors(
id INTEGER AUTO_INCREMENT,
director_name VARCHAR(50) NOT NULL,
notes TEXT,
PRIMARY KEY(id));

CREATE TABLE genres(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
genre_name VARCHAR(50) NOT NULL,
notes TEXT);

CREATE TABLE categories(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
notes TEXT);

CREATE TABLE movies(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(50) NOT NULL,
director_id INT NOT NULL,
copyright_year DATE,
lenght VARCHAR(50),
genre_id INT NOT NULL,
category_id INT NOT NULL,
rating INT(10),
notes TEXT);

ALTER TABLE movies
ADD INDEX fk_movie_director(director_id ASC),
ADD INDEX fk_movie_category(category_id ASC),
ADD INDEX fk_movie_genre(genre_id ASC);

ALTER TABLE movies
ADD CONSTRAINT fk_movie_director
FOREIGN KEY(director_id)
REFERENCES movies.directors(id)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
ADD CONSTRAINT fk_movie_category
FOREIGN KEY(category_id)
REFERENCES movies.categories(id)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
ADD CONSTRAINT fk_movie_genre
FOREIGN KEY(genre_id)
REFERENCES movies.genres(id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

INSERT INTO directors (director_name, notes)
VALUES
('Petar', 'whatever'),
('Ivan', 'whatever'),
('Gosho', 'whatever'),
('Sisi', 'whatever'),
('Magi', 'whatever');

INSERT INTO genres (genre_name, notes)
VALUES
('Horror', 'whatever'),
('Comedy', 'whatever'),
('Action', 'whatever'),
('Love', 'whatever'),
('Sci-fi', 'whatever');

INSERT INTO categories (category_name, notes)
VALUES
('category1', 'whatever'),
('category2', 'whatever'),
('category3', 'whatever'),
('category4', 'whatever'),
('category5', 'whatever');

INSERT INTO movies(title, director_id, genre_id, category_id, rating, notes)
VALUES
('Bad Movie', 5, 1, 2, 5, 'something'),
('Bad Movie', 4, 2, 3, 3, 'something'),
('Bad Movie', 3, 3, 5, 4, 'something'),
('Bad Movie', 2, 4, 1, 9, 'something'),
('Bad Movie', 1, 5, 4, 7, 'something');

#12.Car Rental Database
CREATE DATABASE car_rental;
use car_rental;

CREATE TABLE categories(
id INT AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(50) NOT NULL,
daily_rate DECIMAL(5, 2),
weekly_rate DECIMAL(5, 2),
montly_rate DECIMAL(5 , 2),
weekend_rate DECIMAL(5, 2));

CREATE TABLE cars(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
plate_number INT UNIQUE NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
car_year INT NOT NULL,
category_id INT NOT NULL,
doors INT,
picture BLOB,
car_condition VARCHAR(50),
available ENUM('Y', 'N'));

CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
title VARCHAR(50),
notes TEXT);

CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
driver_licence_number VARCHAR(20) NOT NULL,
full_name VARCHAR(50) NOT NULL,
address VARCHAR(50),
city VARCHAR(20),
zip_code VARCHAR(20),
notes TEXT);

CREATE TABLE rental_orders(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
employee_id INT NOT NULL,
customer_id INT NOT NULL,
car_id INT NOT NULL,
car_condition VARCHAR(50),
tank_level DECIMAL(5, 2),
kilometrage_start INT,
kilometrage_end INT,
total_kilometrage INT,
start_date DATE,
end_date DATE,
total_days INT,
rate_applied INT,
tax_rate INT,
order_status VARCHAR(20),
notes TEXT);

INSERT INTO categories(category)
VALUES
('first'),
('second'),
('third');

INSERT INTO cars(plate_number, make, model, car_year, category_id)
VALUES
(2, 'VW', 'Polo', 2000, 5),
(3, 'Honda', 'Civic', 2010, 2),
(1, 'Opel', 'Corsa', 2007, 3);

INSERT INTO employees(first_name, last_name)
VALUES
('Ivan', 'Petrov'),
('Petar', 'Dimitrov'),
('Gosho', 'Ivanov');

INSERT INTO customers(driver_licence_number, full_name)
VALUES
(12345, 'Ivan Petrov'),
(96754, 'Petar Dimitrov'),
(64363, 'Gosho Ivanov');

INSERT INTO rental_orders(employee_id, customer_id, car_id)
VALUES
(1, 2, 3),
(1, 3, 2),
(3, 2, 1);

#13.Basic Insert
CREATE DATABASE soft_uni;
use soft_uni;

CREATE TABLE towns(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50));

CREATE TABLE addresses(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
address_text VARCHAR(50),
town_id INT,
CONSTRAINT fk_addresses_town FOREIGN KEY(town_id) REFERENCES towns(id));

CREATE TABLE departments(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50));

CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
middle_name VARCHAR(50),
last_name VARCHAR(50),
job_title VARCHAR(50),
department_id INT,
hire_date DATE,
salary DECIMAL(10, 2),
address_id INT,
CONSTRAINT fk_employees_department FOREIGN KEY(department_id) REFERENCES departments(id),
CONSTRAINT fk_employees_address FOREIGN KEY(address_id) REFERENCES addresses(id));

INSERT INTO towns(name)
VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO departments(name)
VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

#14.Basic Select All Fields
SELECT * FROM towns;

SELECT * FROM departments;

SELECT * FROM employees;

#15.Basic Select All Fields and Order Them
SELECT * FROM towns ORDER BY name;

SELECT * FROM departments ORDER BY name;

SELECT * FROM employees ORDER BY salary DESC;

#16.Basic Select Some Fields
SELECT name FROM towns ORDER BY name;

SELECT name FROM departments ORDER BY name;

SELECT first_name, last_name, job_title, salary FROM employees ORDER BY salary DESC;

#17.Increase Employees Salary
UPDATE employees
SET salary = salary + salary * 0.1;

SELECT salary FROM employees;































