# Week 3 - Day 4 - Data Quality & Cleaning Challenge

## Overview

Day 4 focused on understanding the importance of **data quality and cleaning in PySpark**.

We worked with a dataset containing null values, duplicate records, and invalid data. The objective was to identify data quality issues, clean the dataset, validate the results, and perform basic aggregation using PySpark.

---

## What We Did Today

### Data Quality Analysis

* Examined a dataset with multiple data quality issues
* Identified null values, duplicates, and invalid records
* Analyzed the dataset before cleaning

### Data Cleaning & Validation

* Removed unwanted records
* Handled missing values
* Eliminated duplicate entries
* Validated the cleaned dataset using row counts

### Aggregation

* Performed grouping operations
* Generated customer counts by city
* Verified results after cleaning

---

## PySpark Functions Used

| Function           | Description                             |
| ------------------ | --------------------------------------- |
| `filter()`         | Filters rows based on conditions        |
| `isNull()`         | Checks for null values                  |
| `isNotNull()`      | Checks for non-null values              |
| `fillna()`         | Replaces missing values                 |
| `dropDuplicates()` | Removes duplicate rows                  |
| `count()`          | Returns the number of records           |
| `groupBy()`        | Groups data for aggregation             |
| `orderBy()`        | Sorts the results                       |
| `display()`        | Displays DataFrame output in Databricks |

---

## Key Concepts Learned

| Concept             | Purpose                                |
| ------------------- | -------------------------------------- |
| Data Cleaning       | Improve data quality before processing |
| Null Handling       | Manage missing values effectively      |
| Duplicate Removal   | Prevent inaccurate results             |
| Data Validation     | Verify data after cleaning             |
| Aggregation         | Generate meaningful summaries          |
| Data Quality Checks | Ensure reliable analytics              |

---

## Files in This Folder

| File                                   | Description                                               |
| -------------------------------------- | --------------------------------------------------------- |
| `Data Quality Exercise` | Databricks notebook covering data cleaning and validation |
| `README.md`                            | Documentation for Week 3 Day 4                            |

---

## Outcome

By the end of Day 4, we understood the importance of data cleaning in real-world data engineering. We learned how to identify data quality issues, clean datasets, validate results, and perform basic aggregations using PySpark.
