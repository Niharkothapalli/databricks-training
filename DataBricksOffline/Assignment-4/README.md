# Assignment 4 – Window Functions, Subqueries & CTEs

## 📌 Overview

This assignment demonstrates advanced SQL concepts using a sample Employee-Department database. It focuses on solving real-world analytical problems using Window Functions, Subqueries, and Common Table Expressions (CTEs).

The database consists of two tables:
 
- **Departments**
- **Employees**

A total of **45 SQL queries** are implemented to strengthen understanding of advanced SQL techniques frequently used in interviews and data analytics.

---

## 📂 Database Schema

### Departments

| Column | Data Type |
|---------|-----------|
| DepartmentID | INT (Primary Key) |
| DepartmentName | VARCHAR(50) |

### Employees

| Column | Data Type |
|---------|-----------|
| EmployeeID | INT (Primary Key) |
| EmployeeName | VARCHAR(50) |
| Gender | VARCHAR(10) |
| DepartmentID | INT |
| Salary | INT |
| Experience | INT |
| ManagerID | INT |
| JoiningDate | DATE |
| City | VARCHAR(50) |

---

## 🚀 Topics Covered

### 1. ROW_NUMBER()

- Assign row numbers
- Department-wise row numbering
- Highest paid employee per department
- Second highest employee
- Latest joined employee
- Oldest employee
- Top 3 employees department-wise
- Joining order

---

### 2. RANK()

- Global salary ranking
- Department-wise ranking
- Highest ranked  employees
- Top 5 salaries
- Top ranks within departments
- Understanding ranking gaps

---

### 3. DENSE_RANK()

- Dense salary ranking
- Second highest salary
- Top 3 salaries by department
- Difference between RANK()  and DENSE_RANK()
- Finding duplicate salaries

---

### 4. LEAD()

- Next employee salary
- Salary difference
- Employees whose next salary  is greater
- Next joining date
- Next employee name

---

### 5. LAG()

- Previous employee salary
- Salary increment calculation
- Employees earning  more than  previous employee
- Previous  joining date
- Previous employee name

---

### 6. Subqueries

- Above average salary
- Below average salary
- Highest salary
- Second highest salary
- Departments with more than three employees
- Department with maximum employees
- Employees with same salary as Amit
- Employees earning more than their managers

---

### 7. Common Table Expressions (CTEs)

- Employee details with department names
- Top 3 salaries department-wise
- Above average salary
- Duplicate salaries
- Departments with average salary greater than 70,000
- Total salary department-wise
- Employees with more than 5 years of experience
- Removing duplicate employee records using ROW_NUMBER()

---

## 🛠 SQL Concepts Practiced

- Window Functions
  - ROW_NUMBER()
  - RANK()
  - DENSE_RANK()
  - LEAD()
  - LAG()

- Aggregate Functions
  - COUNT()
  - SUM()
  - AVG()
  - MAX()

- Common Table Expressions (CTEs)

- Subqueries
  - Scalar Subqueries
  - Correlated Subqueries

- JOIN Operations

- GROUP BY

- HAVING

- ORDER BY

- PARTITION BY

- OVER Clause

- DELETE using CTE

---

## 📊 Learning Outcomes

After completing this assignment, you will be able to:

- Use Window Functions effectively.
- Compare ROW_NUMBER(), RANK(), and DENSE_RANK().
- Analyze  sequential data using LEAD() and LAG().
- Write efficient Subqueries.
- Build reusable queries using CTEs.
- Solve ranking and  analytical SQL interview problems.
- Detect and remove duplicate records.
- Perform department-wise analytics.

---

## 💻 Tools Used

- MySQL 8.0+
- MySQL Workbench.

---

## Author

**Nihar Kothapalli**

B.Tech Electronics and Communication Engineering  Student (Minor in Computer Science) at VITb

---

## 🎯 Total Questions

| Section | Questions |
|----------|-----------|
| ROW_NUMBER() | 8 |
| RANK() | 6 |
| DENSE_RANK() | 5 |
| LEAD() | 5 |
| LAG() | 5 |
| Subqueries | 8 |
| CTE | 8 |

**Total:** **45 SQL Queries**

---

## ⭐ Key Takeaways

This assignment provides hands-on practice with advanced SQL concepts commonly asked in technical interviews and used in data analytics, business intelligence, and data engineering. It demonstrates how to perform ranking, sequential analysis, departmental reporting, salary analysis, duplicate detection, and data transformation using modern SQL techniques.
