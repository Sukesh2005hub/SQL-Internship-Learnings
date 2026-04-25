CREATE TABLE department1 (
    dept_id    INT          PRIMARY KEY AUTO_INCREMENT,
    dept_name  VARCHAR(100) NOT NULL
);

CREATE TABLE employees1 (
    emp_id     INT           PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100)  NOT NULL,
    dept_id    INT,           -- NULL = no department
    manager_id INT,           -- NULL = no manager (top-level)
    salary     DECIMAL(10,2),
    FOREIGN KEY (dept_id)    REFERENCES department(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
-- Departments (one extra dept with no employees)
INSERT INTO department (dept_name) VALUES
    ('IT'), ('HR'), ('Finance'), ('Marketing');
-- dept_id: 1=IT, 2=HR, 3=Finance, 4=Marketing

-- Employees (emp_id 5 has no dept; manager_id references emp within same table)
INSERT INTO employees1 (name, dept_id, manager_id, salary) VALUES
    ('Arjun',  1,    NULL, 80000),  -- emp_id=1, IT Manager (no manager)
    ('Ravi',   1,    1,    55000),  -- emp_id=2, IT, reports to Arjun
    ('Sneha',  2,    NULL, 70000),  -- emp_id=3, HR Manager
    ('Priya',  2,    3,    48000),  -- emp_id=4, HR, reports to Sneha
    ('Kiran',  NULL, NULL, 45000),  -- emp_id=5, NO department
    ('Ananya', 3,    1,    62000);  -- emp_id=6, Finance, reports to Arjun

-- INNER JOIN — only matching records
-- Employee names with their department names
SELECT e.name, d.dept_name
FROM employees1 e
INNER JOIN department d ON e.dept_id = d.dept_id;

-- Employees who belong to valid departments only
SELECT e.emp_id, e.name, d.dept_name, e.salary
FROM employees1 e
INNER JOIN department d ON e.dept_id = d.dept_id;

select * from employees1;

-- LEFT JOIN — all left + matching right
-- All employees with their department (include no-dept employees)
SELECT e.name, d.dept_name
FROM employees1 e
LEFT JOIN department d ON e.dept_id = d.dept_id;

-- Employees NOT assigned to any department
SELECT e.name, e.salary
FROM employees1 e
LEFT JOIN department d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- RIGHT JOIN — all right + matching left
-- All departments with employee names (include empty depts)
SELECT e.name, d.dept_name
FROM employees1 e
RIGHT JOIN department d ON e.dept_id = d.dept_id;

-- Departments that have NO employees
SELECT d.dept_name
FROM employees1 e
RIGHT JOIN department d ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- FULL OUTER JOIN — everything (matched + unmatched)
SELECT e.name, d.dept_name
FROM employees1 e
LEFT JOIN department d ON e.dept_id = d.dept_id

UNION

SELECT e.name, d.dept_name
FROM employees1 e
RIGHT JOIN department d ON e.dept_id = d.dept_id;

-- Records where either employee or department data is missing
SELECT e.name, d.dept_name
FROM employees1 e
LEFT JOIN  department d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL

UNION

SELECT e.name, d.dept_name
FROM employees1 e
RIGHT JOIN department d ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

SELECT e.name, d.dept_name
FROM employees1 e
LEFT JOIN  department d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL

UNION

SELECT e.name, d.dept_name
FROM employees1 e
RIGHT JOIN department d ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- CROSS JOIN — every possible combination
-- All possible combinations of employees and departments
SELECT e.name, d.dept_name
FROM employees1 e
CROSS JOIN department d;
-- Count total number of combinations
SELECT COUNT(*) AS total_combinations
FROM employees1
CROSS JOIN department;

-- SELF JOIN — table joins itself (employee ↔ manager)
-- SELF JOIN
-- Employee name with their manager name
SELECT
    e.name        AS employee_name,
    m.name        AS manager_name
FROM  employees1 e
INNER JOIN employees1 m ON e.manager_id = m.emp_id;

-- Employees who do NOT have a manager
SELECT e.name AS top_level_employee
FROM  employees1 e
LEFT JOIN employees1 m ON e.manager_id = m.emp_id
WHERE e.manager_id IS NULL;

--- Employee-manager pairs in the same department
SELECT
    e.name     AS employee_name,
    m.name     AS manager_name,
    d.dept_name
FROM  employees1 e
INNER JOIN employees1  m ON e.manager_id = m.emp_id
INNER JOIN department d ON e.dept_id    = d.dept_id
WHERE e.dept_id = m.dept_id;


SHOW TABLES;

DESCRIBE department1;
DESCRIBE employees1;




