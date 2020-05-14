DROP DATABASE IF EXISTS employee_management_systemDB;

CREATE DATABASE employee_management_systemDB;

USE employee_management_systemDB;



CREATE TABLE managers
(
    id INTEGER(11)
    AUTO_INCREMENT NOT NULL,
  firstName VARCHAR
    (100),
  lastName VARCHAR
    (100),
  title VARCHAR
    (100),
  departmentId INTEGER
    (10),
  PRIMARY KEY
    (id)
);

    CREATE TABLE employees
    (
        id INTEGER(11)
        AUTO_INCREMENT NOT NULL,
  firstName VARCHAR
        (100),
  lastName VARCHAR
        (100),
  rollId VARCHAR
        (100),
  PRIMARY KEY
        (id)
);

        INSERT INTO employees
            (firstName, lastName, rollId)
        values
            ('King', 'Jong Un', 'sales person');
        INSERT INTO  employees
            (firstName, lastName, rollId)
        values
            ('Ben', 'Affleck', 'accountant');
        INSERT INTO  employees
            (firstName, lastName, rollId)
        values
            ('Nikola', 'Tesla', 'engineer');
        INSERT INTO  employees
            (firstName, lastName, rollId)
        values
            ('Bill', 'Gates', 'sofware engineer');
        INSERT INTO managers
            (firstName, lastName, title, departmentId)
        values
            ('Donald', 'Trump', 'sales leader', 'sales');
        INSERT INTO managers
            (firstName, lastName,title, departmentId)
        values
            ('Thomas', 'Edison', 'lead engineer', 'engineering');
        INSERT INTO managers
            (firstName, lastName,title, departmentId)
        values
            ('Darth', 'Vader', 'team leader', 'legal team');
        INSERT INTO lawyer
            (firstName, lastName, title, departmentId)
        values
            ('Vladimir', 'Dracula', 'lawyer', null);

        SELECT *
        FROM employees;
        SELECT *
        FROM managers;
        SELECT *
        FROM lawyer;

        SELECT firstName, lastName, roleId
        FROM employees
            INNER JOIN employees ON employees.roleId = employees.id;

        SELECT title, firstName, lastName
        FROM managers
            LEFT JOIN managers ON managers.departmentId = managers.id;  

            