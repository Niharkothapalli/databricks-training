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



# Options in a CSV file

df = spark.read \
.format('csv') \
.load('/samples/customers.csv') \
.option('inferSchema',True) \
.option('header',True) \
.option('delimiter',|) \
.option('multiline',True) \
.option("quote","'") \
.option('escape','#')



# Read modes in a CSV file

df = spark.read \
.format('csv') \
.load('/samples/customers.csv') \
.option('inferSchema',True) \
.mode("PERMISSIVE") \
.mode("DROPMALFORMED") \
.mode("FAILFAST") 



#Write modes in a CSV file

df.write \
.format("csv") \
.option("header","True") \
.option("inferSchema","True") \
.mode("overwrite") \
.mode("append") \
.mode("ignore") \
.mode("error") \
.save("/samples/customers.csv")
     
display(df)
