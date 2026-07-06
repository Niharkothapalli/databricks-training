# Week 3 - Day 5 - PySpark Recap

## Overview

Day 5 focused on revising the core **PySpark DataFrame concepts** learned throughout the week. We practiced the most commonly used DataFrame operations using a sample dataset to strengthen our understanding of data manipulation and transformation in Databricks.

---

## What We Did Today

### DataFrame Revision

- Created sample DataFrames
- Practiced selecting and filtering data
- Renamed and created new columns
- Performed sorting and limiting operations
- Worked with grouping and aggregations
- Explored joins and union operations
- Applied string, array, and date functions
- Practiced data transformation techniques

---

## PySpark Functions Revised

| Function | Description |
|----------|-------------|
| `select()` | Selects required columns |
| `filter()` / `where()` | Filters rows based on conditions |
| `withColumn()` | Creates or updates columns |
| `withColumnRenamed()` | Renames existing columns |
| `drop()` | Removes columns |
| `distinct()` | Retrieves unique values |
| `dropDuplicates()` | Removes duplicate rows |
| `orderBy()` | Sorts records |
| `limit()` | Returns a limited number of rows |
| `groupBy()` | Groups data for aggregation |
| `agg()` | Performs aggregate calculations |
| `join()` | Combines DataFrames |
| `union()` | Appends DataFrames |
| `unionByName()` | Merges DataFrames by column names |
| `cast()` | Converts column datatypes |
| `when()` / `otherwise()` | Applies conditional logic |
| `concat_ws()` | Concatenates multiple columns |
| `substring()` | Extracts part of a string |
| `upper()` / `lower()` | Changes text case |
| `length()` | Calculates string length |
| `split()` | Splits strings into arrays |
| `explode()` | Expands array elements into rows |
| `array_contains()` | Checks for values in arrays |
| `pivot()` | Creates pivot tables |
| `cube()` | Generates multidimensional summaries |
| `rollup()` | Generates hierarchical summaries |
| `crossJoin()` | Produces Cartesian products |
| `broadcast()` | Optimizes joins with smaller DataFrames |
| `exceptAll()` | Returns rows from one DataFrame not present in another |
| `intersect()` | Returns common rows between DataFrames |

---

## Key Concepts Learned

| Concept | Purpose |
|----------|---------|
| DataFrame Operations | Manipulate structured data efficiently |
| Data Filtering | Retrieve relevant records |
| Column Transformations | Create and modify columns |
| Data Aggregation | Summarize data for analysis |
| Data Integration | Combine multiple datasets |
| String & Array Functions | Process textual and array data |
| Advanced Transformations | Perform analytical operations |
| PySpark Syntax Practice | Reinforce commonly used DataFrame operations |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `pyspark_recap.ipynb` | Databricks notebook containing PySpark syntax revision and practice examples |
| `README.md` | Documentation for Week 3 Day 5 |

---

## Outcome

By the end of Day 5, we revised the essential PySpark DataFrame operations used in data engineering workflows. This recap strengthened our understanding of DataFrame transformations, aggregations, joins, and analytical functions, providing a solid foundation for building larger PySpark projects.