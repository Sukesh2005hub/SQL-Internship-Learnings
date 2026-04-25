-- Step 0 — Database setup

CREATE DATABASE college_db1;
USE college_db1;

-- Step 1 — Create all 5 tables


-- department table
CREATE TABLE departments (
    dept_id    INT          PRIMARY KEY AUTO_INCREMENT,
    dept_name  VARCHAR(100) NOT NULL
);

-- students table
CREATE TABLE students (
    student_id    INT          PRIMARY KEY AUTO_INCREMENT,
    student_name  VARCHAR(100) NOT NULL
);

-- employees table
CREATE TABLE employees (
    emp_id    INT            PRIMARY KEY AUTO_INCREMENT,
    emp_name  VARCHAR(100)  NOT NULL,
    salary    DECIMAL(10,2),
    dept_id   INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- cources table
CREATE TABLE courses (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL
);

-- enrollments table
CREATE TABLE enrollments (
 enrollment_id  INT  PRIMARY KEY AUTO_INCREMENT,
    student_id     INT,
    course_id      INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

-- Step 2 — Insert sample data
-- departments:
INSERT INTO departments (dept_name) VALUES
    ('Computer Science'),
    ('Mathematics'),
    ('Physics'),
    ('Commerce');
    
    -- students:
    INSERT INTO students (student_name) VALUES
    ('Arjun'),
    ('Ravi'),
    ('Sneha'),
    ('Priya'),
    ('Kiran');
    
   -- employees:
    INSERT INTO employees (emp_name, salary, dept_id) VALUES
    ('Amit',   55000, 1),
    ('Neha',   62000, 2),
    ('Rohit',  48000, 1),
    ('Divya',  71000, 3),
    ('Suresh', 45000, 4),
    ('Ananya', 58000, 2);
    
    
-- courses:
INSERT INTO courses (course_name) VALUES
    ('Java Programming'),
    ('Database Management'),
    ('Data Structures'),
    ('Web Development');
    
   -- enrollments:
    INSERT INTO enrollments (student_id, course_id) VALUES
    (1, 1),  -- Arjun → Java Programming
    (1, 2),  -- Arjun → Database Management
    (2, 1),  -- Ravi  → Java Programming
    (3, 3),  -- Sneha → Data Structures
    (4, 4),  -- Priya → Web Development
    (5, 2);  -- Kiran → Database Management
    
   -- Step 3 — Basic SELECT queries
    
    -- Display all records from each table:
SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM employees;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- Employees with salary above 50000:
SELECT emp_name, salary
FROM employees
WHERE salary > 50000;

-- Students whose name starts with 'A':
SELECT * FROM students
WHERE student_name LIKE 'A%';

-- Employees sorted by salary (highest first):
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC;

-- Step 4 — Aggregate queries:
-- Total, average, max, min salary:
SELECT
    SUM(salary)   AS total_salary,
    AVG(salary)   AS avg_salary,
    MAX(salary)   AS max_salary,
    MIN(salary)   AS min_salary,
    COUNT(*)      AS total_employees
FROM employees;

-- Total salary department-wise:
SELECT dept_id, SUM(salary) AS dept_total
FROM employees
GROUP BY dept_id;

-- Count of students enrolled per course:
SELECT course_id, COUNT(*) AS total_enrolled
FROM enrollments
GROUP BY course_id;

-- Step 5 — JOIN queries:
-- Employee name with their department name
SELECT e.emp_name, d.dept_name, e.salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- Students with the courses they enrolled in:
SELECT s.student_name, c.course_name
FROM enrollments e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses  c ON e.course_id  = c.course_id;

-- Count of students per course (with course name):
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Department-wise salary total with dept name:
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Step 6 — UPDATE & DELETE:
-- Update salary of employee with emp_id = 1:

UPDATE employees
SET    salary = 60000
WHERE  emp_id = 1;

-- Give all CS dept employees a 10% raise:

UPDATE employees
SET    salary = salary * 1.10
WHERE  dept_id = 1;  -- dept_id 1 = Computer Science

-- DELETE:
-- Remove a student's enrollment:
DELETE FROM enrollments
WHERE student_id = 5 AND course_id = 2;

-- Step 7 — String function queries:
-- Employee names in UPPERCASE:
SELECT UPPER(emp_name) AS emp_upper FROM employees;

-- Length of each student name:
SELECT student_name, LENGTH(student_name) AS name_len FROM students;

-- First 3 characters of employee names:
SELECT emp_name, SUBSTRING(emp_name, 1, 3) AS short_name FROM employees;

-- Concatenate employee name + department name:
SELECT CONCAT(e.emp_name, ' - ', d.dept_name) AS emp_dept
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- Remove spaces from student names:
SELECT student_name, TRIM(student_name) AS trimmed FROM students;

-- Step 8 — Verify table structure anytime:
DESCRIBE departments;
DESCRIBE students;
DESCRIBE employees;
DESCRIBE courses;
DESCRIBE enrollments;

-- Check all tables in the database
SHOW TABLES;













    
    
    
    
    
    
  

    
    
    
    
    








