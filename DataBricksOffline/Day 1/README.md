# SQL Practice Queries


## Overview

This project contains a collection of beginner-to-intermediate SQL queries designed to practice fundamental SQL concepts using a sample **Employees** table. The queries cover data retrieval, filtering, grouping, sorting, and pattern matching, making it a useful resource for students preparing for interviews, coding assessments, and database courses.

---

## Database Used

- MySQL 8.0+
- MySQL Workbench

---

## Table Structure

The project uses a single table named **Employees** with the following columns:

| Column | Data Type | Description |
|---------|-----------|-------------|
| emp_id | INT | Employee ID |
| emp_name | VARCHAR(50) | Employee Name |
| department | VARCHAR(50) | Department Name |
| salary | INT | Employee Salary |
| city | VARCHAR(50) | Employee City |
| experience | INT | Years of Experience |

---

## Sample Dataset

The Employees table contains **15 sample records** from various departments such as:

- IT
- HR
- Finance
- Sales

The data includes employees from multiple cities with different salary ranges and years of experience.

---

## Topics Covered

### SELECT Statements
- Display all records
- Retrieve specific columns
- Filter data using SELECT

### WHERE Clause
- Comparison conditions
- Equality and inequality operators
- Filtering based on department, city, salary, and experience

### GROUP BY
- SUM()
- AVG()
- COUNT()
- MAX()
- MIN()

### HAVING Clause
- Filtering grouped data
- Aggregate function conditions

### ORDER BY & LIMIT (TOP Equivalent)
- Highest salary
- Highest experience
- Top N records

### DISTINCT
- Unique departments
- Unique cities
- Unique salaries
- Distinct column combinations

### Comparison Operators
- >
- <
- >=
- <=
- <>
- =

### Logical Operators
- AND
- OR
- NOT

### IN & NOT IN
- Multiple value filtering
- Excluding specific values

### BETWEEN
- Range-based filtering
- NOT BETWEEN

### LIKE Operator
- Starts with
- Ends with
- Contains
- Pattern matching

---

## Learning Outcomes

After completing these queries, you will understand how to:

- Retrieve data using SELECT
- Filter records using WHERE
- Group data using GROUP BY
- Filter grouped data using HAVING
- Sort records using ORDER BY
- Retrieve top records using LIMIT
- Remove duplicate values using DISTINCT
- Use comparison and logical operators
- Filter records using IN, NOT IN, and BETWEEN
- Perform pattern matching using LIKE
- Apply aggregate functions such as SUM(), AVG(), COUNT(), MAX(), and MIN()

---

## How to Run

1. Open **MySQL Workbench**.
2. Create a new SQL script.
3. Execute the `CREATE TABLE` statement.
4. Run the `INSERT INTO` statements to populate the table.
5. Execute the practice queries one by one or run the entire script.

---

## Skills Practiced

- SQL Basics
- Data Retrieval
- Data Filtering
- Aggregate Functions
- Sorting
- Grouping
- Pattern Matching
- Query Optimization Basics
- MySQL Syntax

---

## Author

**Nihar Kothapalli**

B.Tech Electronics and Communication Engineering (Minor in Computer Science)

Passionate about Java, SQL, Full Stack Development, and Generative AI.

---

## DataBricks Offlie class

Day - 01 and 02
Date : 13/07/2026 (Mon) - 14/07/2026 (Tue)

---

## License

This project is created for educational and practice purposes.
