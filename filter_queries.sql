use company_db;
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT,
    bonus DECIMAL(10,2)
);
select * from employees;
INSERT INTO employees (name, age, department, salary, experience, bonus) VALUES
('Amit', 28, 'IT', 45000, 4, 5000),
('Ravi', 26, 'HR', 30000, 2, NULL),
('Anjali', 30, 'Finance', 55000, 6, 7000),
('Kiran', 35, NULL, 40000, 5, NULL),
('Arjun', 27, 'IT', 60000, 3, 8000),
('Sneha', 24, 'HR', 25000, 1, NULL);
SELECT * FROM employees
WHERE salary > 40000;
SELECT * FROM employees
WHERE department = 'IT';
SELECT * FROM employees
WHERE age BETWEEN 25 AND 30;
SELECT * FROM employees
WHERE name LIKE 'A%';
SELECT * FROM employees
WHERE department <> 'HR';
SELECT * FROM employees
WHERE salary BETWEEN 30000 AND 60000
AND department = 'IT';
SELECT * FROM employees
WHERE department IS NULL;
SELECT * FROM employees
WHERE name LIKE '%a%';
SELECT * FROM employees
WHERE bonus IS NOT NULL;
SELECT * FROM employees
WHERE salary > 30000
AND experience > 3;



