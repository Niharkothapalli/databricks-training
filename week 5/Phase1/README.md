# 📘 Phase 1 – PySpark Fundamentals

Phase 1 covers the core concepts of Apache Spark and PySpark through hands-on exercises. Each topic includes both **SQL** and **PySpark** implementations, followed by execution and output verification using screenshots. This phase builds the foundation required for data engineering and analytics using Spark.

---

## 🎯 Objective

Learn the fundamentals of PySpark by performing common DataFrame operations and understanding how SQL queries translate into PySpark code.

---

## 🛠 Technologies Used

- Apache Spark
- PySpark
- SQL
- Python
- Databricks

---

## 📂 Folder Structure

```
Phase1/
│
├── csv/
├── filter&where/
├── Grouping data and aggregation/
├── Joining data/
├── json/
├── PivotingData/
├── Read&Write/
├── ReferringToColumns/
└── selCol/
```

Each folder contains:

- SQL implementation
- Equivalent PySpark implementation
- Executed outputs
- Output screenshots

---

# 📚 Topics Covered

## 📁 csv

- Reading CSV files
- Loading datasets into Spark DataFrames
- Schema inference
- Header options

**Concepts**
- `spark.read.csv()`
- `inferSchema`
- `header`

---

## 📁 json

- Reading JSON files
- Parsing nested data
- Displaying JSON records

**Concepts**
- `spark.read.json()`

---

## 📁 Read&Write

- Reading datasets
- Writing DataFrames
- Saving files in different formats

**Concepts**
- Read APIs
- Write APIs
- Save modes

---

## 📁 selCol

- Selecting required columns
- Column projection

**Concepts**
- `select()`
- `alias()`

---

## 📁 ReferringToColumns

- Accessing DataFrame columns
- Using column expressions
- Renaming columns

**Concepts**
- `col()`
- `withColumn()`
- `withColumnRenamed()`

---

## 📁 filter&where

- Filtering rows
- Applying multiple conditions
- Conditional expressions

**Concepts**
- `filter()`
- `where()`
- Logical operators

---

## 📁 Grouping data and aggregation

- Grouping records
- Aggregate functions
- Summary statistics

**Concepts**
- `groupBy()`
- `count()`
- `sum()`
- `avg()`
- `min()`
- `max()`

---

## 📁 Joining data

- Combining multiple DataFrames
- Different join operations

**Concepts**
- Inner Join
- Left Join
- Right Join
- Full Outer Join

---

## 📁 PivotingData

- Pivot tables
- Cross-tab style reporting
- Data summarization

**Concepts**
- `pivot()`
- `groupBy()`
- Aggregations

---

# 📝 Implementation Approach

For every topic:

1. Understand the SQL query.
2. Write the SQL solution.
3. Convert the SQL query into PySpark.
4. Execute both implementations.
5. Compare the outputs.
6. Capture screenshots of the results.

---

# 🔥 PySpark Concepts Covered

- SparkSession
- DataFrames
- Reading CSV
- Reading JSON
- Selecting Columns
- Filtering
- Grouping
- Aggregations
- Joins
- Pivot Tables
- Column Operations
- Reading & Writing Data

---

# 🗄 SQL Concepts Covered

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- JOIN
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- PIVOT
- Aliases

---

# ▶️ How to Run

1. Open Databricks Workspace.
2. Attach a Spark Cluster.
3. Navigate to any topic folder.
4. Execute the SQL queries.
5. Run the equivalent PySpark code.
6. Verify the outputs using the provided screenshots.

---

# 🎓 Learning Outcomes

After completing Phase 1, you will be able to:

- Read data from multiple file formats.
- Work with Spark DataFrames.
- Perform filtering and selection operations.
- Group and aggregate large datasets.
- Join multiple DataFrames.
- Create pivot tables for reporting.
- Translate SQL queries into PySpark DataFrame operations.
- Understand the fundamentals of Apache Spark.

---

# 🚀 Skills Demonstrated

- Apache Spark
- PySpark
- SQL
- DataFrames
- Data Transformation
- Data Aggregation
- Data Analysis
- Data Engineering Fundamentals
- Databricks

---

## 📸 Output Verification

Each topic includes execution screenshots demonstrating:

- SQL query execution
- PySpark implementation
- Result comparison
- Correctness verification

---

## 📌 Repository

This project is part of the **Databricks Training** repository and serves as the foundation for learning Apache Spark and PySpark. It demonstrates the translation of SQL concepts into PySpark DataFrame operations through practical exercises and verified outputs.