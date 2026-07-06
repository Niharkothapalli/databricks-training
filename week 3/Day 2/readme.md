# Week 3 - Day 2 - PySpark DataFrame Operations 

## Overview

Day 2 focused on understanding the fundamentals of **PySpark DataFrame operations** in Databricks.

We worked with an Employee DataFrame and practiced selecting columns, using aliases, and filtering records based on various conditions. These operations are essential for data exploration and transformation in PySpark.

---

## What We Did Today

### DataFrame Creation

* Created an Employee DataFrame using Python lists
* Defined column names for employee information
* Loaded data into a PySpark DataFrame
* Displayed data using Databricks notebook environment

### Data Exploration

* Selected individual and multiple columns
* Retrieved specific employee information
* Worked with column aliases for better readability
* Filtered records using various conditions

---

## PySpark Functions Used

| Function       | Description                               |
| -------------- | ----------------------------------------- |
| `select()`     | Selects required columns from a DataFrame |
| `col()`        | References a DataFrame column             |
| `alias()`      | Creates temporary column names            |
| `filter()`     | Filters rows based on conditions          |
| `where()`      | Alternative method for filtering          |
| `between()`    | Filters values within a specified range   |
| `startswith()` | Filters strings starting with a pattern   |
| `endswith()`   | Filters strings ending with a pattern     |
| `contains()`   | Filters strings containing a pattern      |

---

## Key Concepts Learned

| Concept           | Purpose                                      |
| ----------------- | -------------------------------------------- |
| Column Selection  | Retrieve required data from a DataFrame      |
| Aliasing          | Improve readability of output columns        |
| Filtering         | Extract records matching business conditions |
| Logical Operators | Combine multiple filter conditions           |
| String Filters    | Search and match text values                 |
| Range Filters     | Retrieve data within specified limits        |

---

## Files in This Folder

| File              | Description                                                      |
| ----------------- | ---------------------------------------------------------------- |
| `PySpark_Exercise_1.ipynb` | Databricks notebook covering SELECT, ALIAS and FILTER operations |
| `README.md`       | Documentation for Week 3 Day 2                                   |

---

## Outcome

By the end of Day 2, we gained practical experience with PySpark DataFrames by selecting, renaming, and filtering data efficiently. These operations form the foundation for more advanced DataFrame transformations that will be covered in the next session.
