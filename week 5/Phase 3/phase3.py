# PHASE 3 Hands-on Ingestion Tasks :


# 1. Read a CSV file from /samples/

# Initialize Spark session
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

#reading csv file 
df = spark.read \
  .format("csv") \
  .option("Header","true") \
  .option("inferSchema","true") \
  .load("/samples/customers.csv")

df.show(25)
display(df)





# 2. Inspect schema using show() and printSchema()

# Initialize Spark session
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

#reading csv file 
df = spark.read \
  .format("csv") \
  .option("Header","true") \
  .option("inferSchema","true") \
  .load("/samples/customers.csv")

#Inspecting schema using show() and printSchema()
df.show()
df.printSchema()





# 3. Identify missing values
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, when
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

df.select([
    sum(when(col(c).isNull(), 1).otherwise(0)).alias(c)
    for c in df.columns
]).show()





# 4. Clean data using dropna() or fillna()

from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Load the customers.csv dataset
df = spark.read.format('csv').option('header', 'true').load('/samples/customers.csv')

# Cleaning data using dropna()
clean_df = df.dropna()
clean_df.show()

# Cleaning data using fillna()
filled_df = df.fillna({
    "customer_id": "N/A",
    "first_name": "Unknown",
    "last_name": "Unknown",
    "email": "N/A",
    "phone_number": "N/A",
    "address": "N/A",
    "city": "N/A",
    "state": "N/A",
    "zip_code": "N/A"
})

filled_df.show()





# 5. Filter invalid records

from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

#reading csv file 
df = spark.read \
  .format("csv") \
  .option("Header","true") \
  .option("inferSchema","true") \
  .load("/samples/customers.csv")

#removing invalid data
valid_df = filled_df.filter(
    (col("customer_id") > 0)
)

valid_df.show()





# 6. Read JSON and Parquet sample files

# Initialize Spark session
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Reading jon file
df = spark.read \
  .format("json") \
  .option("multiLine",True) \
  .load("/samples/products.json") \

df.show(25)

# Reading parquet file
df = spark.read \
  .format("parquet") \
  .load("/samples/titanic.parquet") \

df.show(25)



## ## ## ## ## ## ## ## ## ## ## ## ##

# Initialize Spark session
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, count, desc
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Create customers DataFrame
customers_data = [
    (101, "Alice", "Hyderabad"),
    (102, "Bob", "Bengaluru"),
    (103, "Charlie", "Chennai"),
    (104, "David", "Hyderabad"),
    (105, "Eva", "Mumbai"),
    (106, "Frank", "Pune"),
    (107, "Grace", "Chennai"),
    (108, "Henry", "Delhi"),
    (109, "Ivy", "Bengaluru"),
    (110, "Jack", "Kolkata"),
    (111, "Kate", "Mumbai"),
    (112, "Liam", "Hyderabad"),
    (113, "Noah", None),
    (114, "Olivia", "Chennai"),
    (115, "Peter", "Delhi")
]

customers_columns = [
    "customer_id",
    "customer_name",
    "city"
]

# Create sales DataFrame
sales_data = [
    (1001, 101, "2025-01-01", 250),
    (1002, 101, "2025-01-01", 450),
    (1003, 102, "2025-01-01", 300),
    (1004, 102, "2025-01-02", 700),
    (1005, 102, "2025-01-03", 150),
    (1006, 103, "2025-01-01", 900),
    (1007, 104, "2025-01-02", 400),
    (1008, 104, "2025-01-02", 600),
    (1009, 104, "2025-01-03", 350),
    (1010, 105, "2025-01-03", 500),
    (1011, 106, "2025-01-03", None),
    (1012, 107, "2025-01-04", 800),
    (1013, 107, "2025-01-04", 200),
    (1014, 108, "2025-01-05", 650),
    (1015, 108, "2025-01-05", -150),
    (1016, 109, "2025-01-05", 1000),
    (1017, 110, "2025-01-06", 300),
    (1018, 110, "2025-01-06", 450),
    (1019, 112, "2025-01-07", 700),
    (1020, 112, "2025-01-07", 500),
    (1021, 112, "2025-01-07", 300),
    (1022, 113, "2025-01-08", 900),
    (1023, 114, "2025-01-08", 650),
    (1024, 115, "2025-01-08", 400)
]

sales_columns = [
    "order_id",
    "customer_id",
    "sale_date",
    "order_amount"
]

sales_df = spark.createDataFrame(sales_data, sales_columns)
customers_df = spark.createDataFrame(customers_data, customers_columns)

display(customers_df)
display(sales_df)
customers_df.show()
sales_df.show()





# 1. Read sales data -> clean nulls -> calculate daily sales

#reading sales data
df = spark.read \
  .format("csv") \
  .option("Header","true") \
  .option("inferSchema","true") \
  .load("sales.csv")

#clean nulls
cleaned_sales = sales_df.dropna(subset=["order_amount"]).filter(col("order_amount") > 0)
display(cleaned_sales)

#calculate daily sales
daily_sales = cleaned_sales.groupBy("sale_date") \
.agg(sum("order_amount").alias("daily_sales")) \
.orderBy("sale_date")

display(daily_sales)




# 2. Read customer data -> clean invalid rows -> city-wise revenue

#reading sales data
df = spark.read \
  .format("csv") \
  .option("Header","true") \
  .option("inferSchema","true") \
  .load("customers.csv")

#clean invalid rows 
clean_customers = customers_df.dropna(subset=["city"])

#city-wise revenue
joined_df = clean_customers.join(cleaned_sales, "customer_id")

city_revenue = joined_df.groupBy("city") \
.agg(sum("order_amount").alias("total_revenue")) \
.orderBy(desc("total_revenue"))

display(city_revenue)




# 3. Find repeat customers (>2 orders)

repeat_customers = cleaned_sales.groupBy("customer_id") \
.agg(count("order_id").alias("order_count")) \
.filter(col("order_count") > 2)

repeat_customers.join(customers_df, "customer_id") \
.select("customer_name", "order_count") 

display(repeat_customers)





# 4. Find highest spending customer in each city

#importing the requried functions
from pyspark.sql.functions import *
from pyspark.sql.window import Window

customer_spend = joined_df.groupBy("customer_id","customer_name","city").agg(sum("order_amount").alias("total_spend"))

window_spec = Window.partitionBy("city").orderBy(desc("total_spend"))

highest_spenders = customer_spend.withColumn("city_wide_rank",rank().over(window_spec)).filter(col("city_wide_rank") == 1)

highest_spenders.select(
    "city",
    "customer_name",
    "total_spend"
).show()

display(highest_spenders)




# 5. Build final reporting table with customer, city, total spend, order count

report = customers_df.join(cleaned_sales,"customer_id","left")
.groupBy("customer_id","customer_name","city")
.agg(coalesce(sum("order_amount"), lit(0)).alias("total_spend"),count("order_id").alias("order_count"))
.orderBy(desc("total_spend"))

display(report)