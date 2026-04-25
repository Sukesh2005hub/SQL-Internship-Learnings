# 🗄️ SQL Learnings — MySQL Workbench Practice

![MySQL](https://img.shields.io/badge/MySQL-Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-In%20Progress-green?style=for-the-badge)

---

## 📌 Description

This project demonstrates SQL operations using MySQL Workbench — from basic table creation to advanced JOIN queries. All tasks are hands-on practice files covering real-world database scenarios including student management, employee records, department operations, and course enrollments.

---

## 🧠 Concepts Covered

### 🏗️ Database & Table Operations
- `CREATE DATABASE` — Create a new database
- `USE` — Switch to a database
- `CREATE TABLE` — Define table structure with data types
- `PRIMARY KEY` & `AUTO_INCREMENT` — Unique row identification
- `FOREIGN KEY` — Link tables with referential integrity
- `NOT NULL` — Enforce mandatory fields
- `DESCRIBE` — View table structure
- `SHOW TABLES` — List all tables in a database

### ✏️ DML — Data Manipulation
- `INSERT INTO` — Add single and multiple records
- `SELECT *` — Retrieve all records
- `SELECT` with specific columns — Fetch targeted data
- `UPDATE` — Modify existing records using `WHERE`
- `UPDATE` without `WHERE` — Bulk update all rows
- `DELETE` — Remove specific records

### 🏗️ DDL — Data Definition
- `ALTER TABLE` — Add & drop columns
- `TRUNCATE` — Remove all records, keep structure
- `DROP TABLE` — Delete table permanently
- `DROP DATABASE` — Delete entire database

### 🔢 Aggregate Functions
- `SUM()` — Total of a column
- `AVG()` — Average value
- `MAX()` / `MIN()` — Highest and lowest values
- `COUNT(*)` — Total number of rows
- `GROUP BY` — Aggregate results per category

### 🔤 String Functions
- `UPPER()` / `LOWER()` — Case conversion
- `LENGTH()` — Character count of a string
- `SUBSTRING()` — Extract part of a string
- `CONCAT()` — Join two or more strings
- `TRIM()` / `LTRIM()` / `RTRIM()` — Remove spaces
- `LIKE` with `%` and `_` — Pattern matching

### 🔍 Filtering & Sorting
- `WHERE` — Filter rows by condition
- `ORDER BY ASC / DESC` — Sort results
- `LIKE 'A%'` — Find names starting with a letter
- `IS NULL` / `IS NOT NULL` — Find missing values
- `AND` / `OR` — Combine multiple conditions

### 🔗 JOIN Operations
| JOIN Type | Description |
|---|---|
| `INNER JOIN` | Only matching rows from both tables |
| `LEFT JOIN` | All rows from left + NULL if no match on right |
| `RIGHT JOIN` | All rows from right + NULL if no match on left |
| `FULL OUTER JOIN` | All records from both (simulated via UNION in MySQL) |
| `CROSS JOIN` | Every possible combination of rows |
| `SELF JOIN` | Table joins itself (e.g., employee ↔ manager) |

### 🏢 Multi-Table Schema Design
- One-to-Many relationships (departments → employees)
- Many-to-Many relationships via Junction Tables (students ↔ courses via enrollments)
- Foreign Key constraints and creation order rules

---

## 🛠 Tools Used

- **MySQL Workbench** — Query execution and schema design
- **GitHub** — Version control and project hosting

---

## 📂 Files

| File | Database | Operations Covered |
|---|---|---|
| `college_db1.sql` | college_db | CREATE TABLE, INSERT, SELECT, UPDATE students |
| `employees_task.sql` | employees_db | Employee records, salary updates, DELETE |
| `filter_queries.sql` | employees_db | WHERE, LIKE, ORDER BY, IS NULL filtering |
| `aggregation_task.sql` | company_db | SUM, AVG, MAX, MIN, COUNT, GROUP BY |
| `joins_practice.sql` | college_db | INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF JOIN |
| `college_db_practice.sql` | college_db | 5-table schema — departments, students, employees, courses, enrollments |

---

## 📊 Database Schemas

### college_db — students table
```sql
CREATE TABLE students (
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    age     INT,
    course  VARCHAR(50),
    marks   INT
);
```

### 5-Table Schema (college_db_practice.sql)
```
departments ──< employees      (dept_id FK)
students    ──< enrollments    (student_id FK)
courses     ──< enrollments    (course_id FK)
employees   ──< employees      (manager_id SELF FK)
```

---

## 🚀 Author

**Sukeshkrishna E**
- 🔗 [LinkedIn](https://linkedin.com/in/sukeshkrishna-e-19426027a)
- 💻 Fresher Java & SQL Developer | Bengaluru, India

---

## 📈 Progress

- [x] Database & Table creation
- [x] INSERT, SELECT, UPDATE, DELETE
- [x] ALTER TABLE, TRUNCATE, DROP
- [x] Aggregate functions
- [x] String functions
- [x] Filtering & Sorting queries
- [x] All 6 JOIN types with practice queries
- [x] Multi-table schema with Foreign Keys
- [ ] Subqueries
- [ ] Views
- [ ] Stored Procedures
- [ ] Indexes
