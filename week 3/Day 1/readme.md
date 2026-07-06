# Week 3 - Day 1 - Introduction to Databricks & PySpark

## Overview

Day 1 marks the transition from SQL to **Databricks and PySpark**.

---

## What We Did Today

### Databricks Setup
- Signed up for **Databricks Free Edition**
- Explored the Databricks UI — Home, Learn, Workspace and Catalog sections
- Created a **Volume** named `databrick2027` under `workspace > default`
- Uploaded `big_sales.csv` into the `databrick2027` volume

### Notebook Setup
- Created a notebook named `session_1` inside `Users > Databrick2027` folder
- Learned how to read a CSV file from a Databricks Volume using PySpark
- Downloaded the notebook as `.ipynb` (IPython extension) to upload on GitHub

---

## Topics Covered

- Databricks Free Edition signup and navigation
- Understanding Workspace, Catalog and Volumes in Databricks
- What is a Volume and how to store files in it
- Reading a CSV file using `spark.read.format()`
- Using options `header` and `inferSchema` while reading
- Displaying a DataFrame using `df.display()`
- Exporting a Databricks notebook as `.ipynb` for GitHub

---

### Explanation

| Part | Description |
|------|-------------|
| `spark.read.format("csv")` | Tells Spark to read a CSV file |
| `.option("header", True)` | Treats the first row as column headers |
| `.option("inferSchema", True)` | Automatically detects column data types |
| `.load("/Volumes/...")` | Path to the file stored in Databricks Volume |
| `df.display()` | Displays the DataFrame as a table in Databricks |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `session_1.ipynb` | Databricks notebook — reading CSV using PySpark |
| `README.md` | This file |