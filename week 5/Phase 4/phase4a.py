from pyspark.sql import SparkSession
from pyspark.sql.functions import when
from pyspark.ml.feature import Bucketizer
spark = SparkSession.builder.appName("Phase4A").getOrCreate()

#creating customers data set
data = [
    (101, 'Alice',   'Hyderabad', 12000),
    (102, 'Bob',     'Bengaluru', 8500),
    (103, 'Charlie', 'Chennai',   4200),
    (104, 'David',   'Mumbai',    15000),
    (105, 'Emma',    'Delhi',     6800),
    (106, 'Frank',   'Pune',      3000),
    (107, 'Grace',   'Hyderabad', 9800),
    (108, 'Henry',   'Chennai',   22000),
    (109, 'Isabella','Mumbai',    5400),
    (110, 'Jack',    'Delhi',     1800),
    (111, 'Kevin',   'Pune',      7600),
    (112, 'Lily',    'Bengaluru', 13400),
    (113, 'Mason',   'Hyderabad', 2500),
    (114, 'Nancy',   'Mumbai',    10100),
    (115, 'Oliver',  'Chennai',   4700)
]

columns = [
    "customer_id",
    "customer_name",
    "city",
    "total_spend"
]

df = spark.createDataFrame(data, columns)
display(df)




# 1. Create Gold/Silver/Bronze segmentation using conditional logic

segment_df = df.withColumn("segment"
    ,when(df.total_spend > 10000, "Gold")
    .when((df.total_spend >= 5000) & (df.total_spend <= 10000), "Silver")
    .otherwise("Bronze")
    )

segment_df.show()
display(segment_df)




# 2. Group data by segment and count customers

segment_df = df.withColumn("segment"
    ,when(df.total_spend > 10000, "Gold")
    .when((df.total_spend >= 5000) & (df.total_spend <= 10000), "Silver")
    .otherwise("Bronze")
    )
op=segment_df.groupBy("segment").count()

op.show()
display(op)




# 3. Try quantile-based segmentation

quantiles = df.approxQuantile("total_spend", [0.33, 0.66], 0)

print("33rd Percentile:", quantiles[0])
print("66th Percentile:", quantiles[1])

quantile_df = df.withColumn(
    "segment",
    when(df.total_spend <= quantiles[0], "Bronze")
    .when(df.total_spend <= quantiles[1], "Silver")
    .otherwise("Gold")
)

quantile_df.show()
display(quantile_df)




# 4. Compare results of different methods

from pyspark.ml.feature import Bucketizer

splits = [-float("inf"), 5000, 10000, float("inf")]

bucketizer = Bucketizer(
    splits=splits,
    inputCol="total_spend",
    outputCol="bucket"
)

bucket_df = bucketizer.transform(df)

bucket_df.show()
display(bucket_df)




# 5. Reflect: which method is most useful and why?

"""
According to me Conditional logic is most useful method compared to others becauseit is 
less complex and easy to understand. It simply divides the consumers into groups like
Gold, Silver and Bronze based on how much they spend. This helps the business to identify
the consumer based on their group or segment and create loyalty programs and make better 
marketing decisions. The other two methods( Quantile Segmentation and Bucketizer) are
useful for data analysis and ML, Conditional logic is the best choice for most business 
applications because it is easy to implement and explain.

"""
