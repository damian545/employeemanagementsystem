
INSERT INTO employees
    (firstName, lastName, rollId, salary)
values
    ('King', 'Jong Un', 'sales person', '$45000');
INSERT INTO  employees
    (firstName, lastName, rollId, salary)
values
    ('Ben', 'Affleck', 'accountant', '$72000');
INSERT INTO  employees
    (firstName, lastName, rollId, salary)
values
    ('Nikola', 'Tesla', 'engineer', '$95000');
INSERT INTO  employees
    (firstName, lastName, rollId, salary)
values
    ('Bill', 'Gates', 'sofware engineer', '$110000');
INSERT INTO managers
    (firstName, lastName, title, departmentId, salary)
values
    ('Donald', 'Trump', 'sales leader', 'sales', '$65000');
INSERT INTO managers
    (firstName, lastName,title, departmentId, salary)
values
    ('Thomas', 'Edison', 'lead engineer', 'engineering', '$115000');
INSERT INTO managers
    (firstName, lastName,title, departmentId, salary)
values
    ('Darth', 'Vader', 'team leader', 'legal team', '$160000');
INSERT INTO lawyer
    (firstName, lastName, title, departmentId, salary)
values
    ('Vladimir', 'Dracula', 'lawyer', null, null);

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
