#READING FILES IN PYSPARK

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

# Reading jon file
df = spark.read \
  .format("json") \
  .option("multiLine",True) \
  .load("/samples/products.json") \

df.show(25)

# Reading orc file
df = spark.read \
  .format("orc") \
  .load("/samples/organizations.orc") \

df.show(25)

# Reading parquet file
df = spark.read \
  .format("parquet") \
  .load("/samples/titanic.parquet") \

df.show(25)


#reading a file(sortcut)
df = spark.read.csv("/samples/customers.csv",header=True,inferSchema=True)

df.show(25)



#WRITING FILES IN PYSPARK

# Initialize Spark session
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

#writing a file(sortcut)

df.write \
  .format("csv") \
  .option("header","True") \
  .option("inferSchema","True") \
  .mode("overwrite")
  .save("/samples/customers.csv")
     
display(df)