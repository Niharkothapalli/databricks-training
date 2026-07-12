# 📘 Phase 2 – SQL to PySpark: Joins & Aggregations

This phase focuses on translating SQL queries into PySpark DataFrame operations using real-world customer and order datasets. The exercises demonstrate how SQL concepts such as joins, grouping, aggregation, filtering, and sorting map directly to PySpark transformations.

---

## 🎯 Objective

Bridge the gap between SQL and PySpark by solving practical data engineering problems using Spark DataFrames. Each task is first solved using SQL and then implemented using the PySpark DataFrame API.

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
| `phase2.sql` | SQL solutions for all Phase 2 exercises |
| `phase2.py` | Equivalent PySpark DataFrame implementations |
| `pyspark_phase2.pdf` | Assignment instructions and problem statement |

---

## 📊 Dataset

Two sample datasets are used:

### Customers

| Column | Description |
|---------|-------------|
| customer_id | Unique customer ID |
| customer_name | Customer name |
| city | Customer city |

### Orders

| Column | Description |
|---------|-------------|
| order_id | Unique order ID |
| customer_id | Customer placing the order |
| order_amount | Order value |

---

## 📝 Tasks Completed

### 1. Total Order Amount for Each Customer
- Joined Customers and Orders
- Calculated total spending for every customer
- Replaced null values with zero

### 2. Top 3 Customers by Total Spend
- Aggregated customer spending
- Sorted in descending order
- Retrieved the top three customers

### 3. Customers with No Orders
- Used an outer join
- Filtered customers without matching orders

### 4. City-wise Total Revenue
- Joined datasets
- Grouped by city
- Calculated total revenue generated from each city

### 5. Average Order Amount Per Customer
- Computed average spending for every customer

### 6. Customers with More Than One Order
- Counted orders placed by each customer
- Filtered customers having multiple orders

### 7. Sort Customers by Total Spend
- Calculated total spending
- Sorted customers from highest to lowest spender

---

## 🔍 PySpark Concepts Covered

- SparkSession
- DataFrame Creation
- Joins
- GroupBy
- Aggregations
- Sum
- Average
- Count
- Filtering
- Sorting
- Null Handling
- Column Functions

---

## 📈 SQL Concepts Covered

- INNER/OUTER JOIN
- GROUP BY
- SUM()
- AVG()
- COUNT()
- ORDER BY
- LIMIT
- WHERE
- IS NULL

---

## ▶️ How to Run

1. Open Databricks or any PySpark environment.
2. Create a Spark Session.
3. Execute `phase2.py`.
4. Compare the output with the SQL queries in `phase2.sql`.

---

## 🎓 Learning Outcomes

After completing this phase, you will be able to:

- Convert SQL queries into PySpark DataFrame operations.
- Perform joins and aggregations efficiently.
- Analyze customer-order relationships.
- Work with grouped data and aggregate functions.
- Handle missing values in Spark.
- Build scalable ETL transformations using PySpark.

---

## 🚀 Skills Demonstrated

- SQL to PySpark Translation
- Data Wrangling
- Data Aggregation
- ETL Development
- Spark DataFrames
- Business Data Analysis
- Big Data Processing

---

## 📌 Repository

Part of the **Databricks Training** repository, showcasing hands-on practice with Apache Spark and PySpark for Data Engineering.