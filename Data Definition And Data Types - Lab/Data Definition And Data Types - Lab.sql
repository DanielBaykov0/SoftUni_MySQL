#0. Create New Database
CREATE SCHEMA `gamebar`;

#1. Create Tables
CREATE TABLE `gamebar`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `gamebar`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `gamebar`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`));
 
 #2. Insert Data in Tables
INSERT INTO employees (first_name, last_name) 
VALUES ('George', 'Petkov'),
		('Petar', 'Georgiev'),
		('Ivan', 'Dimitrov');

#3. Alter Tables
ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(45) NOT NULL;

#4. Adding Constraints
ALTER TABLE categories
ADD CONSTRAINT fk_category_product FOREIGN KEY(category_id)
REFERENCES products(id);  

#5. Modifying Columns
ALTER TABLE employees
MODIFY middle_middle_namename VARCHAR(100);