# Week 4 - Day 2 - Advanced PySpark Operations

## Overview

Day 2 focused on learning advanced **PySpark DataFrame operations** used for data transformation, integration, and analysis.

We worked with employee and department datasets and practiced joins, unions, string functions, conditional transformations, sampling, pivoting, and window functions.
---

## PySpark Functions Used

| Function | Description |
|-----------|-------------|
| `join()` | Combines DataFrames |
| `union()` | Merges DataFrames with same schema |
| `unionByName()` | Merges DataFrames using column names |
| `explode()` | Converts array elements into rows |
| `split()` | Splits strings into arrays |
| `concat()` | Combines multiple columns |
| `concat_ws()` | Concatenates columns with separators |
| `cast()` | Converts datatypes |
| `alias()` | Renames output columns |
| `lit()` | Creates constant values |
| `when()` | Applies conditional logic |
| `substring()` | Extracts a portion of a string |
| `regexp_replace()` | Replaces matching patterns |
| `like()` | Filters using string patterns |
| `isin()` | Filters values from a list |
| `between()` | Filters values within a range |
| `pivot()` | Converts row values into columns |
| `sample()` | Returns a random sample |
| `rank()` | Assigns rank values |
| `dense_rank()` | Assigns dense rankings |
| `row_number()` | Generates row numbers |
| `lead()` | Accesses next row values |
| `lag()` | Accesses previous row values |

---

## Key Concepts Learned

| Concept | Purpose |
|----------|----------|
| Joins | Combine related datasets |
| Union Operations | Merge multiple DataFrames |
| String Functions | Transform and manipulate text |
| Conditional Logic | Create business rules |
| Sampling | Analyze subsets of data |
| Pivoting | Generate summarized reports |
| Window Functions | Perform advanced analytics |
| Data Integration | Build complete datasets |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `PySpark Assignment.ipynb` | Databricks notebook covering advanced PySpark operations |
| `README.md` | Documentation for Week 4 Day 2 |

---

## Outcome

By the end of Day 2, we gained practical experience with advanced PySpark operations including joins, unions, string transformations, conditional columns, pivoting, sampling, and window functions. These concepts are essential for data engineering, analytics, and large-scale data processing workflows.