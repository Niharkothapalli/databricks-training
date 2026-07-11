# Initialize Spark session
from pyspark.sql import SparkSession
from pyspark.sql.functions import col
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Load the customers.csv dataset
df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

# Using filter function to filter the customers who bought 2+ goods
op = df.filter(col("quantity")>2)

# Display the DataFrame using the display() function.
display(op)
#display(df)

# OPERATORS
# 1.AND(&)
op = df.filter((df.quantity>2)&(df.total_amount>20))

# 2.OR(|)
op = df.filter((df.quantity>2)|(df.total_amount>20))

# 3.NOT(~)
op = df.filter(~(df.quantity==1))

# OPERATORS USING SQL EXPRESSION
op = df.filter("quantity>2 AND total_amount>20")



#STARTS WITH FUNCTION
op = df.filter(df.first_name.startswith('A'))

#ENDS WITH FUNCTION
op = df.filter(df.first_name.endswith('z'))

#NAME MATCHING
op = df.filter(df.first_name.like('N%'))



# FINDING NULL VALUES
op = df.filter(df.quantity.isNull())

# FINDING NON NULL VALUES
op = df.filter(df.quantity.isNotNull())


