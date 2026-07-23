# Assignment 3 – PySpark DataFrame Transformations & Operations (Databricks)

## Overview
This assignment focuses on practicing PySpark DataFrame operations in Databricks. It covers DataFrame creation, data transformation, filtering, sorting, joins, unions, aggregations, string functions, date functions, handling missing values, window functions, and advanced analytical operations.

---

## Objectives
- Create and manipulate DataFrames.
- Perform DataFrame transformations.
- Handle NULL values using `fillna()` and `dropna()`.
- Work with date and time functions.
- Perform joins between multiple DataFrames.
- Use union operations.
- Apply aggregation functions.
- Use string manipulation functions.
- Solve advanced analytical problems using Window Functions.
- Generate a final employee report.

---

## Dataset

### Employee DataFrame
Contains employee information:
- Employee ID
- Name
- Age
- Department
- Salary
- City
- Joining Date
- Manager ID

### Department DataFrame
Contains:
- Department Name
- Department Location

### Manager DataFrame
Contains:
- Manager ID
- Manager Name

### Additional Employee DataFrame
Used for Union operations.

---

# Topics Covered

## Part A – DataFrame Creation
- Create Employee DataFrame
- Create Department DataFrame
- Create Manager DataFrame
- Display schema
- Display sample records

---

## Part B – Select Operations
- Select specific columns
- Alias columns
- Filter selected columns
- Perform arithmetic operations during selection

---

## Part C – withColumn()
- Add Bonus column
- Annual Salary calculation
- Experience Bonus using `when()`
- Convert names to uppercase
- Add constant value columns

---

## Part D – withColumnRenamed()
- Rename single column
- Rename multiple columns

---

## Part E – Filter Operations
- Filter by salary
- Filter by age
- Multiple conditions
- NULL filtering
- Range filtering
- String filtering
- NOT NULL filtering

---

## Part F – Sorting
- Ascending sort
- Descending sort
- Multi-column sorting
- Top N records

---

## Part G – Handling Missing Values
### fillna()
- Replace NULL salary
- Replace NULL city
- Replace NULL age
- Replace multiple columns

### dropna()
- Drop rows containing NULL values
- Drop rows based on subset
- Drop rows where all values are NULL

---

## Part H – Date Functions
Covered the following PySpark functions:

- `current_date()`
- `current_timestamp()`
- `to_date()`
- `year()`
- `month()`
- `dayofmonth()`
- `date_add()`
- `date_sub()`
- `datediff()`

Operations performed:
- Convert String to Date
- Extract Year
- Extract Month
- Extract Day
- Employees joined after 2022
- Calculate Years Worked
- Employees joined this year
- Add 30 days
- Difference between dates

---

## Part I – Joins
Performed:

- Inner Join
- Left Join
- Right Join
- Full Outer Join
- Employee-Manager Join
- Employee-Department Join
- Multiple DataFrame Join
- Departments without employees

---

## Part J – Union
- Union
- Union By Name
- Remove Duplicates
- Count after Union

---

## Part K – Other Transformations
- Distinct
- GroupBy
- Count
- Average
- Maximum
- Minimum
- Sum
- Drop Columns
- Drop Duplicates

---

## Part L – String Functions
Used:

- `lower()`
- `upper()`
- `length()`
- `substring()`
- `concat()`
- `regexp_replace()`

---

## Part M – Aggregations
Performed:

- Total Salary
- Average Salary
- Highest Salary
- Lowest Salary
- Employee Count

---

## Part N – Advanced Questions
Implemented:

- Department Average Salary
- Second Highest Salary
- Duplicate Cities
- Recent Employees
- Replace NULL Manager IDs
- Salary Grades
- Employee ID Formatting
- Employees by Name Pattern
- Sort by Joining Date
- Employees with More Than 3 Years Experience

---

## Challenge Questions
Solved advanced problems using Window Functions:

- Rank Employees by Salary
- Top 2 Salaries per Department
- Departments with High Average Salary
- Employees without Managers
- Employee + Manager + Department Report
- Identify Missing Values
- Replace Salary using Department Average
- Monthly Tax Calculation
- Weekend Joining Employees
- Final Employee Report

---

# Additional PySpark Functions Practiced

## Date Functions
- `current_date()`
- `current_timestamp()`
- `date_add()`
- `date_sub()`
- `datediff()`

---

## NULL Handling
### fillna()
- Replace NULL values
- Replace specific columns
- Replace multiple columns

### dropna()
- Drop Any NULL
- Drop All NULL
- Drop using subset

---

## String Functions
- `split()`
- Indexing after split
- `explode()`

---

## Concepts Practiced
- DataFrame API
- Column Expressions
- Conditional Columns
- Filtering
- Sorting
- Grouping
- Aggregations
- Window Functions
- Date Functions
- String Functions
- NULL Handling
- Joins
- Union Operations
- Data Cleaning
- Report Generation

---

## Total Questions Solved

| Section | Questions |
|---------|----------:|
| DataFrame Creation | 5 |
| Select | 5 |
| withColumn | 5 |
| Rename | 3 |
| Filter | 7 |
| Sort | 5 |
| FillNA & DropNA | 7 |
| Date Functions | 11 |
| Joins | 8 |
| Union | 4 |
| Other Transformations | 10 |
| String Functions | 5 |
| Aggregations | 5 |
| Advanced Questions | 10 |
| Challenge Questions | 10 |
| **Total** | **100+** |

---

## Technologies Used
- Databricks Community Edition
- Apache Spark
- PySpark
- Python

---

## Learning Outcomes
After completing this assignment, I gained hands-on experience with:
- PySpark DataFrame API
- Data Cleaning Techniques
- Column Transformations
- Date & Time Processing
- NULL Value Handling
- String Manipulation
- Joins and Union Operations
- Aggregations
- Window Functions
- Advanced Data Analysis
- End-to-End DataFrame Transformations in Databricks

---


## DataBricks Offlie class

Day - 05 and 06
Date : 17/07/2026 (Fri) - 18/07/2026 (Sat)

---

## Author

**Nihar Kothapalli**

B.Tech Electronics and Communication Engineering Student (Minor in Computer Science) at VITb


---

## Author

**Nihar**  
Databricks Learning Series – Assignment 3
