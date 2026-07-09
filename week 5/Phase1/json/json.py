# Initialize Spark session

from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("Spark Playground").getOrCreate()

# Reading jon file
df = spark.read \
  .format("json") \
  .option("multiLine",True) \
  .load("/samples/products.json") \

df.show(25)



#Writing files in json

df.write \
  .format("json") \
  .option("header","True") \
  .option("inferSchema","True") \
  .mode("overwrite")
  .save(" -File path where we need to write the file- ")
     
display(df)


#Writing files in json(shortcut)

df.write.format("json").save(" -File path where we need to write the file- ")
