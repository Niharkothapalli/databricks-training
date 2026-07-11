from pyspark.sql import SparkSession

spark = SparkSession.builder\
        .appName("Phase 1")\
        .getOrCreate()

# dataframe

df = spark.read.csv("/samples/products.csv", header="true", inferSchema="true")

# Grouping Data

# Example: Grouping by a single column
grouped_df = df.groupBy("category")

# Example: Grouping by multiple columns
grouped_df = df.groupBy("category", "product_name")

#Aggregation basics
from pyspark.sql import functions as F

# Performing a single aggregation
df.groupBy("category").sum("price").show() #Output 1

# Using F for aggregation and renaming the aggregate column
df.groupBy("category").agg(F.sum("price").alias("Total price of category")).show() # Output 2

#Performing multiple aggregations count(), sum(), avg(), min(), max(), countDistinct() 
df.groupBy("category").agg(
    F.sum("price").alias("Total price"),
    F.avg("price").alias("Avg price"),
    F.count("*").alias("category count"),
    F.min("price").alias("Min price"),
    F.max("price").alias("Max price"),
    F.countDistinct("price").alias("Distinct count")
).show() # Output 3