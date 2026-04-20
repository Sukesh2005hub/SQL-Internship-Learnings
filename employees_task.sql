create database company_db;
use company_db;
create table employees(
emp_id int auto_increment primary key,
employee_name varchar(100),
department varchar(50),
salary decimal(10,2),
age int);
INSERT INTO employees (employee_name, department, salary, age) VALUES
('Amit', 'Finance', 25000, 30),
('Rohit', 'IT', 40000, 28),
('Neha', 'Finance', 28000, 36),
('Priya', 'HR', 35000, 32),
('Karan', 'IT', 20000, 40);
select * from employees;
SELECT employee_name, department FROM employees;
DELETE FROM employees WHERE emp_id = 2;
DELETE FROM employees WHERE department = 'Finance';
DELETE FROM employees WHERE salary < 30000;
DELETE FROM employees WHERE age > 35;
TRUNCATE TABLE employees;
ALTER TABLE employees ADD email VARCHAR(100);
ALTER TABLE employees ADD phone_number VARCHAR(15);
ALTER TABLE employees ADD hire_date DATE;
DESC employees;
DROP TABLE employees;