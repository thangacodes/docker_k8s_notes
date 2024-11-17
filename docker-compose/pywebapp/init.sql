-- init.sql
-- Create tables called employee_id and employee_name
-- Insert values into the respective tables employee_id and employee_name

CREATE TABLE IF NOT EXISTS employee_id (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS employee_name (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employee_id (name) 
VALUES ('1000'),
       ('1001'), 
       ('1002'), 
       ('1003'), 
       ('1004');

INSERT INTO employee_name (name) 
VALUES ('anvi'),
       ('chris'), 
       ('sudhir'), 
       ('webster'), 
       ('vedhiksha');

## SELECT query to confirm whether any rows with data exist or not.
  
-- SELECT * FROM employee_name;
-- SELECT * FROM employee_id;
