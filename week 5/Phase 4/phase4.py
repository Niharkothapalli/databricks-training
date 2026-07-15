# Phase 4 – Mini Project: Business Pipeline & Analytics :


from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.appName("MiniProject").getOrCreate()

customers_data = [
    (101, 'Rahul', 'Hyderabad'),
    (102, 'Anjali', 'Chennai'),
    (103, 'Kiran', 'Bangalore'),
    (104, 'Priya', 'Hyderabad'),
    (105, 'Amit', 'Mumbai'),
    (106, 'Sneha', 'Pune'),
    (107, 'Arjun', 'Delhi'),
    (108, 'Neha', 'Bangalore'),
    (109, 'Rohit', 'Hyderabad'),
    (110, 'Divya', 'Chennai')
]

customer_columns = [
    "customer_id",
    "customer_name",
    "city"
]

customers_df = spark.createDataFrame(customers_data, customer_columns)

orders_data = [
    (1001,101,'2026-07-01',2500),
    (1002,102,'2026-07-01',4500),
    (1003,103,'2026-07-01',3500),
    (1004,101,'2026-07-02',3000),
    (1005,105,'2026-07-02',6000),
    (1006,103,'2026-07-02',4000),
    (1007,106,'2026-07-02',2000),
    (1008,107,'2026-07-03',7000),
    (1009,108,'2026-07-03',800),
    (1010,109,'2026-07-03',2500),
    (1011,110,'2026-07-03',5000),
    (1012,101,'2026-07-04',6000),
    (1013,102,'2026-07-04',7000),
    (1014,103,'2026-07-04',4500),
    (1015,105,'2026-07-05',2000),
    (1016,107,'2026-07-05',2500),
    (1017,108,'2026-07-05',900),
    (1018,109,'2026-07-05',4500),
    (1019,110,'2026-07-05',6000),
    (1020,106,'2026-07-06',1800)
]

order_columns = [
    "order_id",
    "customer_id",
    "date",
    "amount"
]

orders_df = spark.createDataFrame(orders_data, order_columns)


# Task 1: Daily Sales → Output: date, total_sales

daily_sales = orders_df.groupBy("date") \
    .agg(sum("amount").alias("total_sales"))

daily_sales.show()


# Task 2: City-wise Revenue → Output: city, total_revenue

city_revenue = orders_df.join(customers_df, "customer_id") \
    .groupBy("city") \
    .agg(sum("amount").alias("total_revenue"))

city_revenue.show()


# Task 3: Top 5 Customers → Output: customer_name, total_spend

top5 = orders_df.join(customers_df, "customer_id") \
    .groupBy("customer_name") \
    .agg(sum("amount").alias("total_spend")) \
    .orderBy(desc("total_spend")) \
    .limit(5)

top5.show()


# Task 4: Repeat Customers (>1 order) → Output: customer_id, order_count

repeat_customers = orders_df.groupBy("customer_id") \
    .count() \
    .withColumnRenamed("count","order_count") \
    .filter(col("order_count") > 1)

repeat_customers.show()


# Task 5: Customer Segmentation → Create business logic: total_spend > 10000 → Gold 5000–10000 →

customer_spend = orders_df.join(customers_df,"customer_id") \
    .groupBy("customer_name") \
    .agg(sum("amount").alias("total_spend"))

segment_df = customer_spend.withColumn(
    "segment",
    when(col("total_spend") > 10000,"Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000),"Silver")
    .otherwise("Bronze")
)

segment_df.show()


# Task 6: Final Reporting Table → Combine all relevant insights into a final table. Output should include: customer_name, city, total_spend, order_count, segment

spend_df = orders_df.groupBy("customer_id") \
    .agg(sum("amount").alias("total_spend"))

count_df = orders_df.groupBy("customer_id") \
    .count() \
    .withColumnRenamed("count","order_count")

final_df = customers_df \
    .join(spend_df,"customer_id") \
    .join(count_df,"customer_id") \
    .withColumn(
        "segment",
        when(col("total_spend") > 10000,"Gold")
        .when((col("total_spend") >=5000) & (col("total_spend") <=10000),"Silver")
        .otherwise("Bronze")
    ) \
    .select(
        "customer_name",
        "city",
        "total_spend",
        "order_count",
        "segment"
    )

final_df.show()

# Task 7: Save Output → final_df.write.mode('overwrite').csv('/samples/output/report')

final_df.write \
    .mode("overwrite") \
    .option("header", True) \
    .csv("samples/output/report")

display(final_df)
