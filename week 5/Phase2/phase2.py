# Initialize Spark session
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, count, desc
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Create Customers DataFrame
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
    (112, "Liam", "Hyderabad")
]

customers_columns = ["customer_id", "customer_name", "city"]

customers_df = spark.createDataFrame(customers_data, customers_columns)

# Create Orders DataFrame
orders_data = [
    (1001, 101, 250),
    (1002, 101, 450),
    (1003, 102, 300),
    (1004, 102, 700),
    (1005, 102, 150),
    (1006, 103, 900),
    (1007, 104, 400),
    (1008, 104, 600),
    (1009, 104, 350),
    (1010, 105, 500),
    (1011, 107, 800),
    (1012, 107, 200),
    (1013, 108, 650),
    (1014, 108, 150),
    (1015, 109, 1000),
    (1016, 110, 300),
    (1017, 110, 450),
    (1018, 112, 700),
    (1019, 112, 500),
    (1020, 112, 300)
]

orders_columns = ["order_id", "customer_id", "order_amount"]

orders_df = spark.createDataFrame(orders_data, orders_columns)



# 1. Total order amount for each customer
ans1=customers_df.join(orders_df,on="customer_id",how="outer") \
.groupby("customer_id","customer_name") \
.agg(sum("order_amount").alias("Total_order_amount")) \
.fillna(0)


# 2. Top 3 customers by total spend
ans2=customers_df.join(orders_df,on="customer_id",how="outer") \
.groupby("customer_id","customer_name") \
.agg(sum("order_amount").alias("Total_order_amount")) \
.orderBy(desc("Total_order_amount")).limit(3)


# 3. Customers with no orders
ans3=customers_df.join(orders_df,on="customer_id",how="outer") \
.filter(col("order_id").isNull()) \
.select("customer_id","customer_name","city","order_amount")


# 4. City-wise total revenue
ans4=customers_df.join(orders_df,on="customer_id",how="outer") \
.groupBy("city") \
.agg(sum("order_amount"))


# 5. Average order amount per customer
ans5=customers_df.join(orders_df,on="customer_id",how="outer") \
.groupby("customer_id","customer_name") \
.agg(avg("order_amount").alias("Average_order_amount"))


# 6. Customers with more than one order
ans6=customers_df.join(orders_df,on="customer_id",how="outer") \
.groupby("customer_id","customer_name") \
.agg(count("order_id").alias("no_of_orders")) \
.filter(col("no_of_orders")>1)


# 7. Sort customers by total spend descending
ans7=customers_df.join(orders_df,on="customer_id",how="outer") \
.groupby("customer_id","customer_name") \
.agg(sum("order_amount").alias("total_spent_descending")) \
.fillna(0) \
.orderBy(desc("total_spent_descending"))




customers_df.show()
orders_df.show()
display(customers_df)
display(orders_df)
display(ans1)
display(ans2)
display(ans3)
display(ans4)
display(ans5)
display(ans6)
display(ans7)
