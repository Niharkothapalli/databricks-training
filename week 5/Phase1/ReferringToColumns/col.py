# Initialize Spark session
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Load the customers.csv dataset
df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

#Rerfering a specific colum and using filter
op = df.filter("quantity>2")

# Show the first few rows of the DataFrame
op.show()

# Display the DataFrame using the display() function.
display(op)




#Types of refering to colums

# 1.STRING:

df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

op = df.filter("quantity>2")
op.show()


# 2.DOT NOTATION :

df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

op = df.filter(df.quantity>2)
op.show()


# 3.USING COLUM FUNCTION : (*MOST USED*)

# Initialize Spark session
from pyspark.sql import SparkSession

# importinf col functions
from pyspark.sql.functions import col

spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Load the customers.csv dataset
df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

op = df.filter(col("quantity")>2)
op.show()


# 4.BRACKETS :

df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

op = df.filter(df["quantity"]>2)
op.show()


