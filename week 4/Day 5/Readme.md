# Week 4 - Day 5 - Student Performance ETL Project

## Overview

Day 5 focused on building a complete **ETL (Extract, Transform, Load) project** using PySpark in Databricks.

We worked with a Student Performance dataset containing duplicate records, missing values, inconsistent data formats, and invalid marks. The project involved cleaning the data, applying business rules, generating performance insights, and storing the final processed dataset.

---

## What We Did Today

### Extract

- Created a Student Performance dataset
- Loaded raw student records into a PySpark DataFrame
- Explored the dataset structure and schema

### Transform

- Removed duplicate student records
- Handled missing values
- Standardized department and city names
- Filtered invalid marks
- Created grade and result classifications
- Added performance categories
- Renamed columns for better readability

### Analytics

- Generated department-wise performance reports
- Generated city-wise student reports
- Created grade distribution reports
- Analyzed student performance categories
- Built pivot reports for department and grade analysis

### Load

- Saved the cleaned dataset as a Delta table
- Prepared the dataset for future reporting and analytics

### Validation

- Compared raw and cleaned record counts
- Verified the effectiveness of data cleaning operations

---

## Key Concepts Learned

| Concept | Purpose |
|----------|----------|
| Data Cleaning | Improve data quality and consistency |
| Data Transformation | Create meaningful business attributes |
| Data Validation | Verify data correctness |
| Conditional Logic | Categorize records using business rules |
| Aggregations | Generate analytical summaries |
| Pivot Reports | Analyze data across multiple dimensions |
| Delta Tables | Store processed datasets efficiently |
| ETL Workflow | Build end-to-end data pipelines |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Student_Performance_ETL_Project.ipynb` | Databricks notebook implementing the complete ETL pipeline |
| `README.md` | Documentation for Week 4 Day 5 |

---

## Outcome

By the end of Day 5, we successfully built a Student Performance ETL pipeline using PySpark. We learned how to clean raw data, apply business rules, generate analytical reports, and store processed data for future use. This project provided practical experience in designing and implementing real-world ETL workflows in Databricks.