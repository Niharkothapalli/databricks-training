# Week 5 - Phase 1: Joining Data with PySpark

---

## What We Did Today

### Data Preparation

- Created two DataFrames for employees and projects
- Loaded sample employee and project information
- Used a common column (`emp_id`) to perform joins

### Join Operations

- Performed Inner Join to retrieve matching records
- Used Left Join to keep all employee records
- Applied Right Join to keep all project records
- Performed Full Outer Join to include all records from both DataFrames
- Executed Cross Join to generate the Cartesian product
- Used Left Semi Join to retrieve employees having projects
- Used Left Anti Join to identify employees without projects

### Advanced Join Techniques

- Joined DataFrames using multiple columns
- Applied custom join conditions
- Used DataFrame column notation for joins
- Selected specific columns after joining
- Renamed output columns using aliases
- Sorted joined data based on salary

---

## PySpark Functions Used

| Function | Description |
|----------|-------------|
| `join()` | Combines two DataFrames |
| `select()` | Retrieves required columns |
| `alias()` | Renames output columns |
| `orderBy()` | Sorts DataFrame records |
| `crossJoin()` | Produces Cartesian product |
| `left_semi` | Returns matching rows from the left DataFrame |
| `left_anti` | Returns non-matching rows from the left DataFrame |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Inner Join | Returns matching records from both DataFrames |
| Left Join | Preserves all records from the left DataFrame |
| Right Join | Preserves all records from the right DataFrame |
| Full Outer Join | Includes all records from both DataFrames |
| Cross Join | Generates all possible combinations |
| Left Semi Join | Retrieves only matching rows from the left DataFrame |
| Left Anti Join | Retrieves unmatched rows from the left DataFrame |
| Multiple Join Conditions | Joins using more than one column |
| Custom Join Condition | Uses expressions for joining |
| Column Selection | Retrieves only required output columns |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Query.sql` | SQL queries demonstrating different join operations |
| `PySpark.py` | PySpark implementation of join operations |
| `Readme.md` | Documentation for Week 5 Phase 1 - Joining Data |
| `Output Screenshots/` | Screenshots of outputs captured during execution |

---

## Note

The SQL queries were written first and then implemented using PySpark to compare the outputs. The PySpark source file contains output references that correspond to the screenshots stored in the repository.