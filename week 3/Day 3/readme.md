# Week 3 - Day 3 - PySpark DataFrame Transformations

## Overview

Day 3 focused on learning advanced **PySpark DataFrame transformation operations** in Databricks.

We worked with an Employee DataFrame and practiced renaming columns, creating new columns, converting data types, sorting records, and limiting results. These transformations are commonly used in real-world data engineering and analytics workflows.

---

## What We Did Today

### Data Transformation

* Renamed existing DataFrame columns
* Created new calculated columns
* Applied conditional logic to generate derived columns
* Combined multiple columns into a single column
* Extracted information from date fields

### Data Processing

* Converted columns between different data types
* Sorted records using single and multiple columns
* Retrieved top and bottom records using sorting
* Limited output for quick data analysis and validation

---

## PySpark Functions Used

| Function              | Description                                    |
| --------------------- | ---------------------------------------------- |
| `withColumnRenamed()` | Renames an existing column                     |
| `withColumn()`        | Creates or modifies a column                   |
| `cast()`              | Converts a column to a different datatype      |
| `when()`              | Applies conditional logic                      |
| `otherwise()`         | Specifies alternative condition output         |
| `concat_ws()`         | Concatenates multiple columns with a separator |
| `year()`              | Extracts year from a date column               |
| `length()`            | Calculates string length                       |
| `substring()`         | Extracts part of a string                      |
| `upper()`             | Converts text to uppercase                     |
| `orderBy()`           | Sorts DataFrame records                        |
| `limit()`             | Restricts the number of rows returned          |

---

## Key Concepts Learned

| Concept             | Purpose                                        |
| ------------------- | ---------------------------------------------- |
| Column Renaming     | Improve schema readability and standardization |
| Derived Columns     | Create new business-related metrics            |
| Conditional Columns | Categorize and classify records                |
| Type Casting        | Convert data into appropriate datatypes        |
| String Functions    | Manipulate and transform text data             |
| Date Functions      | Extract useful date information                |
| Sorting             | Organize data for analysis                     |
| Data Limiting       | Display manageable subsets of data             |

---

## Files in This Folder

| File                       | Description                                                                                        |
| -------------------------- | -------------------------------------------------------------------------------------------------- |
| `PySpark_Exercise_2.ipynb` | Databricks notebook covering WITHCOLUMNRENAMED, WITHCOLUMN, TYPECASTING, SORT and LIMIT operations |
| `README.md`                | Documentation for Week 3 Day 3                                                                     |

---

## Outcome

By the end of Day 3, we gained hands-on experience with DataFrame transformations in PySpark. We learned how to rename columns, create derived fields, perform datatype conversions, sort records, and limit results efficiently. These skills are fundamental for building scalable data engineering pipelines and preparing data for analytics.
