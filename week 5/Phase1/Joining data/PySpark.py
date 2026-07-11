from pyspark.sql import SparkSession

# Initialize a Spark session
spark = SparkSession.builder \
    .appName("PySpark Join Example") \
    .getOrCreate()

# Sample DataFrame 1
employee_data = [
(101,"Aarav","IT","Hyderabad",65000),
(102,"Bhavya","HR","Bangalore",52000),
(103,"Charan","IT","Chennai",70000),
(104,"Divya","Finance","Mumbai",75000),
(105,"Esha","Marketing","Pune",58000),
(106,"Farhan","IT","Delhi",68000),
(107,"Gopal","Support","Hyderabad",45000),
(108,"Harsha","QA","Chennai",60000),
(109,"Ishita","Analytics","Bangalore",72000),
(110,"John","HR","Mumbai",55000),
(111,"Keerthi","Finance","Hyderabad",80000),
(112,"Lokesh","Support","Pune",47000),
(113,"Meena","QA","Delhi",62000),
(114,"Nikhil","IT","Hyderabad",69000),
(115,"Pooja","Marketing","Chennai",56000),
(116,"Rahul","Analytics","Bangalore",76000),
(117,"Sneha","Finance","Mumbai",83000),
(118,"Teja","Support","Delhi",49000),
(119,"Varun","QA","Hyderabad",61000),
(120,"Yash","IT","Pune",71000)
]

employee_columns = [
    "emp_id",
    "emp_name",
    "department",
    "city",
    "salary"
]

employees_df = spark.createDataFrame(employee_data, employee_columns)


# Sample DataFrame 2
project_data = [
(101,"Customer Portal","IT","Anil"),
(102,"Payroll System","HR","Ramesh"),
(103,"Inventory App","IT","Anil"),
(104,"Budget Tracker","Finance","Priya"),
(105,"Campaign Hub","Marketing","Kiran"),
(106,"Data Warehouse","IT","Anil"),
(108,"Automation Testing","QA","Suresh"),
(109,"Sales Dashboard","Analytics","Megha"),
(110,"Recruitment Portal","HR","Ramesh"),
(111,"Financial Audit","Finance","Priya"),
(112,"Help Desk","Support","Ajay"),
(114,"Cloud Migration","IT","Anil"),
(115,"Digital Ads","Marketing","Kiran"),
(116,"Customer Insights","Analytics","Megha"),
(117,"Tax Filing","Finance","Priya"),
(119,"QA Automation","QA","Suresh"),
(121,"CRM Upgrade","IT","Anil"),
(122,"Security Audit","Support","Ajay"),
(123,"AI Recommendation","Analytics","Megha"),
(120,"Mobile App","IT","Anil")
]

project_columns = [
    "emp_id",
    "project_name",
    "department",
    "manager"
]

projects_df = spark.createDataFrame(project_data, project_columns)


# Inner Join
employees_df.join(projects_df, on="emp_id", how="inner").show()      # Output 1

# Left Join
employees_df.join(projects_df, on="emp_id", how="left").show() # Output 2

# right Join
employees_df.join(projects_df, on="emp_id", how="right").show() # Output 3

# Full Outer Join
employees_df.join(projects_df, on="emp_id", how="outer").show() # Output 4

# cross Join
employees_df.crossJoin(projects_df).show() # Output 5

# Left Semi Join
employees_df.join(projects_df, on="emp_id", how="left_semi").show() # Output 6

# Left Anti Join
employees_df.join(projects_df, on="emp_id", how="left_anti").show() # Output 7

# Join on Multiple Columns
employees_df.join(projects_df, on=["emp_id", "department"], how="inner").show() # Output 8

# Inner Join Using DataFrame Column Notation
employees_df.join(projects_df, employees_df.emp_id == projects_df.emp_id, "inner").show()  # Output 9

# Join Using Custom Condition
employees_df.join(
    projects_df,
    (employees_df["emp_id"] == projects_df["emp_id"]) &
    (employees_df["department"] == projects_df["department"]),
    "inner"
).show() # Output 10

#Join Using Multiple Conditions
employees_df.join(
    projects_df,
    (employees_df["emp_id"] == projects_df["emp_id"]) &
    (employees_df["department"] == projects_df["department"]),
    "inner"
).show()      # Output 11

# Join and Select All Columns from Employees with Manager Name
employees_df.join(
    projects_df,
    on="emp_id",
    how="inner"
).select(
    employees_df["*"],
    projects_df["manager"].alias("project_manager")
).show()      # Output 12

#  Employees Without Projects
employees_df.join(
    projects_df,
    on="emp_id",
    how="left_anti"
).select(
    "emp_id",
    "emp_name",
    "department"
).show()      # Output 13

# Employees with Projects
employees_df.join(
    projects_df,
    on="emp_id",
    how="left_semi"
).select(
    "emp_id",
    "emp_name",
    "department"
).show()      # Output 14

# Employee Project Details Sorted by Salary
employees_df.join(
    projects_df,
    on="emp_id",
    how="inner"
).orderBy(
    employees_df["salary"].desc()
).show()      # Output 15