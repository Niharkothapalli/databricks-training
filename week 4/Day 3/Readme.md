# Week 4 - Day 3 - Advanced PySpark DataFrame Operations

## Overview

Day 3 focused on learning advanced **PySpark DataFrame operations** related to data partitioning, caching, handling missing values, set operations, aggregation, and optimization techniques.

We worked with multiple DataFrames and explored how Spark processes large datasets efficiently using transformations and actions commonly used in real-world data engineering projects.

---

## What We Did Today

### Data Optimization

- Repartitioned DataFrames for parallel processing
- Reduced partitions using coalesce
- Cached DataFrames for improved performance
- Used broadcast joins for optimization

### Data Cleaning

- Filled missing values using different strategies
- Replaced existing values with new values
- Removed null records using drop operations

### Data Analysis

- Performed cross joins between datasets
- Compared datasets using except and intersect
- Generated summary reports using cube and rollup
- Worked with nested array data using explode_outer
- Filtered arrays using array_contains

---

## PySpark Functions Used

| Function | Description |
|-----------|-------------|
| `repartition()` | Increases or redistributes partitions |
| `coalesce()` | Reduces the number of partitions |
| `cache()` | Stores DataFrame in memory |
| `unpersist()` | Removes cached DataFrame |
| `fillna()` | Replaces null values |
| `replace()` | Replaces existing values |
| `na.drop()` | Removes rows containing null values |
| `crossJoin()` | Creates Cartesian product of DataFrames |
| `exceptAll()` | Returns rows present in first DataFrame only |
| `intersect()` | Returns common rows between DataFrames |
| `cube()` | Generates multidimensional aggregations |
| `rollup()` | Generates hierarchical aggregations |
| `broadcast()` | Optimizes joins with smaller DataFrames |
| `explode_outer()` | Expands arrays while preserving nulls |
| `array_contains()` | Checks whether an array contains a value |

---

## Key Concepts Learned

| Concept | Purpose |
|----------|----------|
| Partition Management | Improve Spark execution performance |
| Caching | Speed up repeated computations |
| Missing Value Handling | Improve data quality |
| Set Operations | Compare datasets efficiently |
| Aggregation Analysis | Generate summarized reports |
| Broadcast Joins | Optimize join performance |
| Nested Data Processing | Work with array-based data |
| Data Cleaning | Prepare data for analytics |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `PySpark Assignment.ipynb` | Databricks notebook covering advanced DataFrame operations |
| `README.md` | Documentation for Week 4 Day 3 |

---

## Outcome

By the end of Day 3, we gained practical experience with Spark performance optimization, data cleaning techniques, set operations, advanced aggregations, and handling complex data structures. These skills are essential for building efficient and scalable data engineering pipelines.