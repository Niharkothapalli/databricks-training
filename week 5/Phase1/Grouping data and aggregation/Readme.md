# Week 5 - Phase 1: Grouping and Aggregation in PySpark

---

## What We Did Today

### Spark Session

- Created a SparkSession
- Loaded the products dataset from a CSV file
- Grouped data using one or more columns

### Grouping Data

- Grouped records by a single column
- Grouped records by multiple columns
- Prepared grouped DataFrames for aggregation

### Aggregation Operations

- Calculated the total price for each category
- Renamed aggregated columns using aliases
- Performed multiple aggregations in a single query
- Calculated sum, average, minimum, maximum, count, and distinct count

### SQL and PySpark Comparison

- Wrote SQL queries for grouping and aggregation
- Implemented the same operations using PySpark DataFrame APIs
- Compared SQL aggregation functions with their PySpark equivalents

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `groupBy()` | Groups rows based on one or more columns |
| `sum()` | Calculates the total of a numeric column |
| `avg()` | Calculates the average value |
| `count()` | Counts the number of rows |
| `min()` | Returns the minimum value |
| `max()` | Returns the maximum value |
| `countDistinct()` | Counts distinct values |
| `agg()` | Performs one or more aggregate functions |
| `alias()` | Renames the aggregated column |
| `show()` | Displays DataFrame contents |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Grouping | Organize data into categories |
| Single Column Grouping | Aggregate records using one column |
| Multiple Column Grouping | Group data using more than one column |
| Aggregations | Generate summary statistics |
| Aggregate Functions | Calculate totals, averages, counts, minimums, and maximums |
| Distinct Count | Count unique values within a group |
| SQL to PySpark | Convert SQL GROUP BY queries into PySpark operations |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL queries demonstrating grouping and aggregation operations |
| `PySpark.py` | PySpark implementation of grouping and aggregation using DataFrame APIs |
| `README.md` | Documentation for Week 5 Phase 1 |
| `Output screenshots/` | Output screenshots captured during execution |

---

## Note

The PySpark source file contains comments indicating the corresponding screenshot file names for each output. This makes it easy to match the generated output with the screenshots stored in the repository.