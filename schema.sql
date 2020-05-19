
CREATE DATABASE employee_management_systemDB;

USE employee_management_systemDB;



CREATE TABLE managers
(
  id INTEGER
  AUTO_INCREMENT NOT NULL,
  firstName VARCHAR
  (100),
  lastName VARCHAR
  (100),
  title VARCHAR
  (100),
  departmentId INTEGER
  (10),
  salary DECIMAL
  (10,2) NULL,  
  PRIMARY KEY
  (id)
);

  CREATE TABLE employees
  (
    id INTEGER
    AUTO_INCREMENT NOT NULL,
        
  firstName VARCHAR
    (30),
  lastName VARCHAR
    (30),
  rollId VARCHAR
    (30),
  salary DECIMAL
    (10,2) NULL,     
  PRIMARY KEY
    (id)
);

        