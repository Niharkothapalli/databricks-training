# Initialize Spark session
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Load the customers.csv dataset
df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 


#Selecting a specific colum
op = df.select("total_amount", "customer_id", "sale_date")


# Display the DataFrame using the display() function.
display(op)



# USING COL() FUNCTIONS

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

op = df.select(col("total_amount"), col("customer_id"), col("sale_date"))
# Display the DataFrame using the display() function.
display(op)


# lit() FUNCTION :

# Initialize Spark session
from pyspark.sql import SparkSession

# importinf lit functions
from pyspark.sql.functions import lit

spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# Load the customers.csv dataset
df = spark.read \
.format('csv') \
.option('header', 'true') \
.option('inferSchema', 'true') \
.load('/samples/sales.csv') 

#adding new column that is common for all using - lit()
op = df.withColumn("Billing",lit("done"))
# Display the DataFrame using the display() function.
display(op)



#Add a calculated column :

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

#Adding a calculated column
op = df.withColumn("total_amount_with_handelingfees",col("total_amount")+15)

# Display the DataFrame using the display() function.
display(op)



# ALIAS(Temporary - during selection) :

op = df.select(col("quantity").alias("NumberOfIteamsSold"),col("*"))


# RENAME(Permanent - new DataFrame) :
op = df.withColumnRenamed("quantity","NumberOfIteamsSold")

#DROPING A ROW FROM THE TABEL:
op = df.drop("sale_id")
