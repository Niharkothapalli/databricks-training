# Phase 4A – Bucketing & Segmentation in PySpark

This phase demonstrates how continuous numerical data can be converted into meaningful categories using different bucketing and segmentation techniques in SQL and PySpark. The project focuses on customer segmentation based on total spending and compares various methods used in real-world analytics.

## 📂 Repository Structure

```
Phase4A/
│── phase4a.py              # PySpark implementation
│── phase4a.sql             # SQL queries
│── pyspark_phase4a.pdf     # Output screenshots
│── Phase4_ans.txt          # Reflection question answers
└── README.md
```

## 🎯 Objective

- Understand the concept of bucketing and segmentation.
- Learn different methods of customer segmentation in PySpark.
- Compare business rule-based segmentation with statistical techniques.

## 📋 Tasks Completed

- Created Gold, Silver, and Bronze customer segments using Conditional Logic.
- Grouped customers by segment and counted the number of customers in each category.
- Performed Quantile-based Segmentation using `approxQuantile()`.
- Compared different bucketing methods:
  - Conditional Logic
  - SQL CASE Statement
  - Bucketizer (MLlib)
  - Quantile-based Segmentation
  - Window-based Ranking
- Answered reflection questions related to segmentation and bucketing.

## 🛠️ Technologies Used

- Apache Spark (PySpark)
- SQL (MySQL)
- Python

## 📊 Dataset

A sample customer dataset containing:

- Customer ID
- Customer Name
- City
- Total Spend

The dataset is used to classify customers into different spending categories.

## 📖 Key Concepts

- Conditional Logic
- SQL CASE Statement
- Bucketizer (MLlib)
- Quantile-based Segmentation
- Window Functions
- Customer Segmentation

## 📌 Learning Outcomes

After completing this phase, I learned how to:

- Convert continuous values into meaningful categories.
- Implement customer segmentation using multiple approaches.
- Compare business segmentation with technical bucketing.
- Use PySpark functions for data transformation and analysis.
- Apply segmentation techniques for business analytics.

----

Part of my **Databricks & PySpark Training** repository.
