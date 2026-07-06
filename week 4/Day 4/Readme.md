# Week 4 - Day 4 - Mini ETL Project Using PySpark.

## Overview

Day 4 focused on building a complete **ETL (Extract, Transform, Load) pipeline** using PySpark in Databricks.

We worked with a sales dataset containing missing values, duplicate records, and invalid data. The project involved cleaning data, performing transformations, generating business summaries, and loading the processed results into Delta tables.

---

## What We Did Today

### Extract

- Created a raw sales dataset
- Loaded data into a PySpark DataFrame
- Explored the dataset schema and records

### Transform

- Removed duplicate records
- Handled missing values
- Filtered invalid data
- Converted date columns into proper datatype
- Created calculated columns
- Added business classification logic

### Aggregations

- Generated city-wise sales summary
- Generated category-wise sales summary
- Calculated revenue, order count, and average order value

### Load

- Saved transformed data as Delta tables
- Stored summary reports for future analysis

### Validation

- Compared raw and cleaned record counts
- Verified data quality after transformation

---

## Key Concepts Learned

| Concept | Purpose |
|----------|----------|
| ETL Pipeline | Process data from raw to usable format |
| Data Cleaning | Improve data quality |
| Data Transformation | Create meaningful business fields |
| Aggregations | Generate summarized insights |
| Delta Tables | Store processed data efficiently |
| Data Validation | Verify transformation results |
| Business Rules | Categorize data using conditions |
| Reporting | Create analytical summaries |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Mini ETL Project.ipynb` | Databricks notebook implementing the complete ETL pipeline |
| `README.md` | Documentation for Week 4 Day 4 |

---

## Outcome

By the end of Day 4, we built a complete ETL workflow using PySpark. We learned how to extract raw data, clean and transform records, generate business summaries, load processed data into Delta tables, and validate the final output. This project provided practical experience with a real-world data engineering workflow.
