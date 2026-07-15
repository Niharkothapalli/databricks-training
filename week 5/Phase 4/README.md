# PySpark Phase 4 – Business Pipeline & Analytics Mini Project

## Project Overview

This project demonstrates an end-to-end business analytics pipeline using **PySpark**. The objective is to transform raw transactional data into meaningful business insights by performing data cleaning, aggregation, joins, and reporting.

The project follows the requirements provided in the **Phase 4 – Mini Project: Business Pipeline & Analytics** assignment.

---

# Technologies Used

* Python 3.x
* Apache Spark
* PySpark
* DataFrame API

---

# Dataset

The project uses two datasets:

### Customers Dataset

| Column        | Description                |
| ------------- | -------------------------- |
| customer_id   | Unique customer identifier |
| customer_name | Customer name              |
| city          | Customer city              |

### Orders Dataset

| Column      | Description         |
| ----------- | ------------------- |
| order_id    | Unique order ID     |
| customer_id | Customer identifier |
| date        | Order date          |
| amount      | Purchase amount     |

---

# Data Cleaning

Before performing analytics, the following cleaning steps were applied:

* Removed rows with null customer IDs.
* Removed duplicate records.
* Filtered invalid transaction amounts (negative values).
* Verified appropriate data types for all columns.

---

# Project Tasks

## Task 1 – Daily Sales

### Objective

Calculate the total sales for each day.

### Method

* Group orders by `date`
* Calculate the sum of `amount`

### Output

| date | total_sales |

---

## Task 2 – City-wise Revenue

### Objective

Calculate total revenue generated from each city.

### Method

* Join Customers and Orders datasets using `customer_id`
* Group data by `city`
* Sum all purchase amounts

### Output

| city | total_revenue |

---

## Task 3 – Top 5 Customers

### Objective

Identify the top five customers based on total spending.

### Method

* Join customer and order datasets
* Group by `customer_name`
* Calculate total spend
* Sort in descending order
* Select the top five records

### Output

| customer_name | total_spend |

---

## Task 4 – Repeat Customers

### Objective

Find customers who placed more than one order.

### Method

* Group orders by `customer_id`
* Count total orders
* Filter customers with `order_count > 1`

### Output

| customer_id | order_count |

---

## Task 5 – Customer Segmentation

### Objective

Categorize customers based on their total spending.

### Business Rules

| Total Spend        | Segment |
| ------------------ | ------- |
| Greater than 10000 | Gold    |
| 5000 – 10000       | Silver  |
| Less than 5000     | Bronze  |

### Method

* Calculate total spending per customer.
* Apply conditional logic using `when()` and `otherwise()`.

### Output

| customer_name | total_spend | segment |

---

## Task 6 – Final Reporting Table

### Objective

Generate a consolidated business report.

### Method

Combine customer information, total spending, order count, and customer segment into a single DataFrame.

### Final Report Columns

* customer_name
* city
* total_spend
* order_count
* segment

---

## Task 7 – Save Output

### Objective

Save the final report as a CSV file.

### Method

Use PySpark's write function with overwrite mode.

Output path:

```
samples/output/report
```

---

# PySpark Concepts Used

* SparkSession
* DataFrames
* createDataFrame()
* select()
* filter()
* groupBy()
* agg()
* sum()
* count()
* orderBy()
* desc()
* join()
* withColumn()
* when()
* otherwise()
* alias()
* write()
* csv()

---

# Project Workflow

1. Load customer and order datasets.
2. Perform data cleaning.
3. Aggregate daily sales.
4. Calculate city-wise revenue.
5. Identify top customers.
6. Detect repeat customers.
7. Segment customers based on spending.
8. Generate the final reporting table.
9. Export the report as a CSV file.

---

# Expected Learning Outcomes

After completing this project, you will be able to:

* Create and manipulate PySpark DataFrames.
* Perform data cleaning operations.
* Apply filtering and aggregation techniques.
* Join multiple DataFrames.
* Build business reports using PySpark.
* Implement customer segmentation logic.
* Export processed data for reporting.

---

# Conclusion

This project provides practical experience in developing a complete data analytics pipeline using PySpark. It demonstrates how transactional data can be cleaned, transformed, analyzed, and converted into meaningful business insights suitable for real-world reporting and decision-making.
