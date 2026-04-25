CREATE DATABASE company1_db;

USE company1_db;
CREATE  TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) not null,
    department VARCHAR(50),
    salary int not null,
    city varchar(20)
    );
select * from employees;
    
insert into employees(name, department, salary, city)values
('Amit', 'Finance', 25000, 'bangalore'),
('Rohit', 'IT', 40000, 'Hassan'),
('Neha', 'Finance', 28000, 'tumkur'),
('Priya', 'HR', 35000, 'mysore'),
('Karan', 'IT', 20000, 'sullia');

SELECT SUM(salary) AS total_salary FROM employees;

SELECT AVG(salary) AS avg_salary FROM employees;

SELECT MAX(salary) AS max_salary FROM employees;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT department, SUM(salary) AS dept_total
FROM employees
GROUP BY department;

SELECT AVG(marks) AS avg_marks FROM students;

SELECT name, LENGTH(name) AS name_length FROM employees;

SELECT name, SUBSTRING(name, 1, 4) AS short_name FROM employees;

SELECT CONCAT(name, ' - ', city) AS name_city FROM employees;

SELECT * FROM employees
WHERE name LIKE 'A%';
SELECT name, TRIM(name) AS trimmed_name FROM employees;

-- Remove only leading spaces
SELECT LTRIM(name) AS left_trimmed FROM employees;

-- Remove only trailing spaces
SELECT RTRIM(name) AS right_trimmed FROM employees;



CREATE TABLE students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) not null,
marks  int,
city VARCHAR(20)
);
INSERT INTO students(name, marks, city)VALUES
('Ravi', 75, 'bangalore'),
('Anjali', 82, 'hassan'),
('Rahul', 86, 'shimogga'),
('Sneha', 90, 'puttur'),
('Kiran', 77, 'sullia');
select * from students;

