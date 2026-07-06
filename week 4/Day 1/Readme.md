# Week 4 - Day 1 - Advanced PySpark DataFrame Transformations

## Overview

Day 1 of Week 4 focused on practicing a wide range of **PySpark DataFrame transformations and actions** using an Employee dataset.

We explored data selection, filtering, column transformations, aggregation, joins, unions, sorting, sampling, and other commonly used operations in PySpark. These concepts are essential for building real-world data engineering and analytics pipelines.

---

## What We Did Today

### Data Exploration

* Selected specific columns from DataFrames
* Filtered records using different conditions
* Retrieved employee information based on business requirements

### Data Transformation

* Created new columns using calculations
* Renamed existing columns
* Removed unnecessary columns
* Generated derived values from existing data

### Data Analysis

* Identified distinct values
* Removed duplicate records
* Sorted data using different columns
* Performed aggregations and summary calculations

### Data Integration

* Joined employee and department datasets
* Combined multiple DataFrames using union operations
* Worked with DataFrames having different schemas

### Data Sampling

* Retrieved limited records
* Generated random samples from datasets
* Compared sampled data with complete datasets

---

## PySpark Functions Used

| Function              | Description                        |
| --------------------- | ---------------------------------- |
| `select()`            | Selects required columns           |
| `filter()`            | Filters rows based on conditions   |
| `where()`             | Alternative method for filtering   |
| `withColumn()`        | Creates or modifies columns        |
| `withColumnRenamed()` | Renames columns                    |
| `drop()`              | Removes columns                    |
| `distinct()`          | Returns unique values              |
| `dropDuplicates()`    | Removes duplicate rows             |
| `orderBy()`           | Sorts records                      |
| `groupBy()`           | Groups data for aggregation        |
| `agg()`               | Performs aggregate calculations    |
| `join()`              | Combines DataFrames                |
| `union()`             | Merges DataFrames with same schema |
| `unionByName()`       | Merges DataFrames by column names  |
| `limit()`             | Restricts number of rows           |
| `sample()`            | Returns random sample data         |

---

## Key Concepts Learned

| Concept               | Purpose                         |
| --------------------- | ------------------------------- |
| Data Selection        | Retrieve specific information   |
| Data Filtering        | Extract relevant records        |
| Column Transformation | Create and modify columns       |
| Schema Management     | Rename and remove columns       |
| Distinct Values       | Identify unique data            |
| Duplicate Handling    | Improve data quality            |
| Sorting               | Organize records                |
| Aggregation           | Generate summaries and insights |
| Joins                 | Combine related datasets        |
| Union Operations      | Merge multiple datasets         |
| Sampling              | Analyze subsets of data         |

---

## Files in This Folder

| File                       | Description                                                             |
| -------------------------- | ----------------------------------------------------------------------- |
| `PySpark Assignment.ipynb` | Databricks notebook covering advanced PySpark DataFrame transformations |
| `README.md`                | Documentation for Week 4 Day 1                                          |

---