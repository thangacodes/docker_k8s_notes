-- init.sql
-- Create tables called devops_tools, employee_id and employee_name
-- Insert values into the respective tables devops_tools, employee_id and employee_name

CREATE TABLE IF NOT EXISTS devops_tools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS employee_id (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS employee_name (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO devops_tools (name) 
VALUES ('git'),
       ('cicd'), 
       ('jenkins'), 
       ('ansible'),
       ('docker'),
       ('kubernetes'), 
       ('terraform'),
       ('linux-os'), 
       ('windows-os');

INSERT INTO employee_id (name) 
VALUES ('1000'),
       ('1001'), 
       ('1002'), 
       ('1003'), 
       ('1004');

INSERT INTO employee_name (name) 
VALUES ('anvi'),
       ('chris'),
       ('rebacca'),
       ('sudhir'), 
       ('webster'), 
       ('vedhiksha');

-- SELECT * FROM devops_tools;
-- SELECT * FROM employee_name;
-- SELECT * FROM employee_id;

