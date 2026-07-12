# 📘 Phase 3 – ETL Pipeline with PySpark

Phase 3 focuses on building an end-to-end ETL (Extract, Transform, Load) pipeline using Apache Spark and PySpark. This module introduces real-world data engineering concepts including data ingestion, data cleaning, transformation, aggregation, and reporting.

---

## 🎯 Objective

Develop a reusable ETL pipeline by reading data from multiple file formats, cleaning and validating records, performing business transformations, and generating analytical reports using PySpark.

---

## 🛠 Technologies Used

- Apache Spark
- PySpark
- SQL
- Python
- Databricks

---

## 📂 Files

| File | Description |
|------|-------------|
| `phase3.sql` | SQL solutions for all ETL and business pipeline exercises |
| `phase3.py` | Complete PySpark ETL implementation |
| `pyspark_phase3.pdf` | Phase 3 assignment and instructions |

---

## 📊 Datasets Used

### Sample Files
- `customers.csv`
- `sales.csv`
- `products.json`
- `titanic.parquet`

### DataFrames Created
- Customers DataFrame
- Sales DataFrame

---

# 🏗 ETL Workflow

## 1️⃣ Extract

Read data from multiple sources:

- CSV Files
- JSON Files
- Parquet Files

Implemented using:

- `spark.read.csv()`
- `spark.read.json()`
- `spark.read.parquet()`

---

## 2️⃣ Transform

Performed several data cleaning and transformation operations:

- Inspect Schema
- Display Dataset
- Identify Missing Values
- Remove Null Records
- Fill Missing Values
- Filter Invalid Records
- Join Multiple DataFrames
- Aggregate Data
- Calculate Business Metrics

---

## 3️⃣ Load

Generated cleaned datasets and reporting tables using:

- `display()`
- `show()`

---

# 📚 Hands-on Ingestion Tasks

✅ Read CSV files

✅ Display dataset

✅ Print schema

✅ Identify missing values

✅ Clean data using:

- `dropna()`
- `fillna()`

✅ Filter invalid records

✅ Read JSON files

✅ Read Parquet files

---

# 💼 Business Pipeline Exercises

## 1. Daily Sales Report

- Read sales dataset
- Remove null order amounts
- Filter invalid sales
- Calculate total sales for each day

---

## 2. City-wise Revenue

- Clean customer dataset
- Join customers and sales
- Calculate revenue generated from every city

---

## 3. Repeat Customers

- Count orders placed by each customer
- Identify customers having more than two orders

---

## 4. Highest Spending Customer in Each City

- Calculate customer-wise spending
- Apply Window Functions
- Rank customers within each city
- Retrieve highest spender

---

## 5. Final Reporting Table

Generated a complete reporting table containing:

- Customer ID
- Customer Name
- City
- Total Spend
- Order Count

---

# 🔥 PySpark Concepts Covered

- SparkSession
- DataFrame API
- Reading CSV
- Reading JSON
- Reading Parquet
- Schema Inspection
- Null Handling
- Data Cleaning
- Filtering
- Aggregations
- GroupBy
- Joins
- Sorting
- Window Functions
- Rank
- Coalesce
- ETL Pipeline Design

---

# 🗄 SQL Concepts Covered

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- SUM()
- COUNT()
- JOIN
- INNER JOIN
- LEFT JOIN
- HAVING
- Window Functions
- RANK()

---

# 📈 Business Reports Generated

- Daily Sales Report
- City Revenue Report
- Repeat Customer Report
- Highest Spending Customer by City
- Customer Spending Summary

---

# ▶️ How to Run

1. Open Databricks Workspace.
2. Attach a Spark Cluster.
3. Import `phase3.py`.
4. Execute all notebook cells.
5. Compare the outputs with the SQL queries in `phase3.sql`.

---

# 🎓 Learning Outcomes

After completing this phase, you will be able to:

- Build an end-to-end ETL pipeline using PySpark.
- Read data from multiple file formats.
- Perform data validation and cleaning.
- Handle missing and invalid data.
- Translate SQL logic into PySpark transformations.
- Use Window Functions for analytical reporting.
- Create reusable data engineering workflows.
- Generate business reports using Spark DataFrames.

---

# 🚀 Skills Demonstrated

- ETL Pipeline Development
- Data Ingestion
- Data Cleaning
- Data Transformation
- Data Aggregation
- Window Functions
- SQL to PySpark Translation
- Business Analytics
- Apache Spark
- Databricks
- Big Data Processing

---

## 📌 Repository

This project is part of the **Databricks Training** repository and demonstrates practical ETL development using Apache Spark and PySpark. It showcases industry-standard data engineering workflows, including ingestion, transformation, validation, and reporting.