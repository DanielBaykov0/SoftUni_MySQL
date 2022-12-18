#1.Mountains and Peaks
CREATE TABLE mountains (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE peaks (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    mountain_id INT NOT NULL,
    CONSTRAINT fk_peaks_mountain FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
);

#2.Trip Organization
SELECT 
    driver_id,
    vehicle_type,
    CONCAT(first_name, ' ', last_name) AS driver_name
FROM
    vehicles
        JOIN
    campers ON vehicles.driver_id = campers.id;

#3.SoftUni Hiking
SELECT 
    starting_point AS route_starting_point,
    end_point AS route_ending_point,
    leader_id,
    CONCAT(first_name, ' ', last_name) AS leader_name
FROM
    routes
        JOIN
    campers ON routes.leader_id = campers.id;

#4.Delete Mountains
DROP TABLE mountains, peaks;

#5.Project Management DB*
CREATE DATABASE project_manager;
USE project_manager;

CREATE TABLE clients (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100)
);

CREATE TABLE projects (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_id INT(11) NOT NULL,
    project_lead_id INT(11) NOT NULL,
    CONSTRAINT fk_projects_client FOREIGN KEY (client_id)
        REFERENCES clients (id)
);


CREATE TABLE employees (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT(11) NOT NULL,
    CONSTRAINT fk_empolyees_project FOREIGN KEY (project_id)
        REFERENCES projects (id)
);

ALTER TABLE projects
ADD CONSTRAINT fk_projects_employee FOREIGN KEY (project_lead_id)
REFERENCES employees (id);















