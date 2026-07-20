# Databricks Training – Assignment 2

## Overview

This repository contains the solutions for **Assignment 2** of the Databricks Offline Training Program.

The assignment focuses on implementing different types of SQL joins and set operators using multiple datasets. It is designed to improve SQL query writing skills and understanding of relational database concepts.

---

## Objectives

- Learn different SQL Join operations.
- Practice Set Operators.
- Understand table relationships.
- Handle missing and unmatched records.
- Solve real-world SQL scenarios.
- Improve analytical thinking using SQL.

---

## Technologies Used

- Databricks Community Edition
- Apache Spark SQL
- SQL
- Delta Tables (Data bricks)

---

## Dataset

The assignment uses the following tables:

### Join Assignment Tables

- Departments
- Employees
- Projects
- EmployeeProjects

### Set Operator Tables

- CurrentEmployees
- FormerEmployees
- DomesticCustomers
- InternationalCustomers
- OnlineOrders
- StoreOrders

---

# Assignment Topics

## 1. SQL Joins

### Basic Level

### INNER JOIN

- Employee and Department details
- Project and Department details
- Employee with Project details
- Salary with Department Location
- Employees working on projects

### LEFT JOIN

- Employees without departments
- Departments without employees
- Projects with department names
- Employee project assignments
- Employees without projects

### RIGHT JOIN

- Departments without employees
- Projects without employees
- Department employee mapping
- Projects with departments
- Project assignments

### FULL JOIN

- Employees and Departments
- Departments and Projects
- Employees and Projects
- Departments including unmatched records
- Projects including unmatched records

---

## Intermediate Level

Implemented SQL queries for:

- Department-wise filtering
- Budget-based filtering
- Employee-Department-Project reports
- Aggregate functions
- Employee counts
- Average salary calculations
- NULL handling
- Departments without employees
- Projects without departments
- Project counts
- Employee counts

---

## Advanced Level

Implemented solutions for:

- Highest salary in each department
- Department with highest average salary
- Highest budget project
- Manager and employee hierarchy
- Employees working on multiple projects
- Departments without projects
- Employee project counts
- Department project counts

---

## Anti Joins

Implemented:

### LEFT ANTI JOIN

- Employees without departments
- Employees without projects
- Departments without employees
- Departments without projects
- Projects without departments

### RIGHT ANTI JOIN

- Departments without employees
- Projects without employees
- Departments without projects
- Invalid department references
- Invalid project references

### FULL ANTI JOIN

- Unmatched employees
- Unmatched departments
- Projects without departments
- Employees without projects
- Orphan records

---

## Expert Level Challenges

Implemented queries for:

- Department with highest project budget
- Employees in departments without projects
- Projects having multiple employees
- Cross-department project assignments
- Departments where every employee has a project
- Employees sharing the same manager
- Departments without managers
- Managers supervising multiple employees
- Employees hired before their manager
- Comprehensive employee report including:
  - Employee Name
  - Department
  - Project
  - Budget
  - Manager Name
  - Salary
  - Department Location

---

# Set Operators

## UNION

Implemented queries for:

- Employee names
- Departments
- Customer names
- Cities
- Order amounts
- Employee IDs
- Customer IDs
- Salaries
- Order IDs

---

## UNION ALL

Implemented queries for:

- Employee names with duplicates
- Departments with duplicates
- Customer records
- Cities
- Order amounts
- Source table identification

---

## EXCEPT

Implemented queries for:

- Current employees only
- Former employees only
- Domestic customers only
- Online orders only
- Unique departments
- Unique customer cities

---

## INTERSECT

Implemented queries for:

- Common employees
- Common departments
- Common customers
- Common cities
- Common orders
- Common salaries

---

# Concepts Covered

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- LEFT ANTI JOIN
- RIGHT ANTI JOIN
- FULL ANTI JOIN
- UNION
- UNION ALL
- EXCEPT
- INTERSECT
- Aggregate Functions
- GROUP BY
- HAVING
- ORDER BY
- NULL Handling
- Aliases
- Multi-table Joins
- Nested Queries
- Self Join
- SQL Reporting

---

# Learning Outcomes

After completing this assignment, I learned how to:

- Write SQL queries using different join types.
- Retrieve related data from multiple tables.
- Handle missing and unmatched records.
- Use aggregate functions for analysis.
- Perform set operations on multiple datasets.
- Build reports using multiple joins.
- Solve real-world SQL interview questions.
- Improve SQL problem-solving skills.

---

## DataBricks Offlie class

Day - 03 and 04
Date : 15/07/2026 (Wed) - 16/07/2026 (Thu)

---

## Author

**Nihar Kothapalli**

B.Tech Electronics and Communication Engineering (Minor in Computer Science)

Passionate about Java, SQL, Full Stack Development, and Generative AI.

---

# Conclusion

This assignment provided hands-on experience with SQL joins and set operators in Databricks. It improved my understanding of relational databases, data retrieval techniques, aggregation, and query optimization. These concepts form a strong foundation for advanced SQL development and real-world data engineering tasks.
