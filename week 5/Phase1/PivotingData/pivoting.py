from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("PySpark Join Example") \
    .getOrCreate()

sales_data = [
    (101, "Laptop", "Electronics", "North", 50000),
    (102, "Laptop", "Electronics", "South", 48000),
    (103, "Laptop", "Electronics", "East", 51000),
    (104, "Laptop", "Electronics", "West", 49500),
    (105, "Mobile", "Electronics", "North", 25000),
    (106, "Mobile", "Electronics", "South", 24000),
    (107, "Mobile", "Electronics", "East", 26000),
    (108, "Mobile", "Electronics", "West", 25500),
    (109, "Chair", "Furniture", "North", 6000),
    (110, "Chair", "Furniture", "South", 6200),
    (111, "Chair", "Furniture", "East", 6100),
    (112, "Chair", "Furniture", "West", 5900),
    (113, "Table", "Furniture", "North", 12000),
    (114, "Table", "Furniture", "South", 12500),
    (115, "Table", "Furniture", "East", 12300),
    (116, "Table", "Furniture", "West", 12100),
    (117, "Printer", "Office", "North", 15000),
    (118, "Printer", "Office", "South", 15200),
    (119, "Printer", "Office", "East", 14900),
    (120, "Printer", "Office", "West", 15100)
]

columns = [
    "sale_id",
    "product",
    "category",
    "region",
    "sales_amount"
]

df = spark.createDataFrame(sales_data, columns)

# pivoting data

df.groupBy("category")\
  .pivot("region")\
  .sum("sales_amount").show() # Output 1

# By Specifying Values List

df.groupBy("category")\
  .pivot("region",["East","West"])\
  .sum("sales_amount").show() # Output 2

# preformin multiple aggregations
from pyspark.sql.functions import *
df.groupBy("category")\
  .pivot("region",["East","West"])\
  .agg(
    sum("sales_amount").alias("total_amount"),
    avg("sales_amount").alias("average_amount"),
  ).show() # Output 3