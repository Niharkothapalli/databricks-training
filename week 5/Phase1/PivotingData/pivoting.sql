CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    region VARCHAR(20),
    sales_amount DECIMAL(10,2)
);

INSERT INTO sales VALUES
(101,'Laptop','Electronics','North',50000),
(102,'Laptop','Electronics','South',48000),
(103,'Laptop','Electronics','East',51000),
(104,'Laptop','Electronics','West',49500),
(105,'Mobile','Electronics','North',25000),
(106,'Mobile','Electronics','South',24000),
(107,'Mobile','Electronics','East',26000),
(108,'Mobile','Electronics','West',25500),
(109,'Chair','Furniture','North',6000),
(110,'Chair','Furniture','South',6200),
(111,'Chair','Furniture','East',6100),
(112,'Chair','Furniture','West',5900),
(113,'Table','Furniture','North',12000),
(114,'Table','Furniture','South',12500),
(115,'Table','Furniture','East',12300),
(116,'Table','Furniture','West',12100),
(117,'Printer','Office','North',15000),
(118,'Printer','Office','South',15200),
(119,'Printer','Office','East',14900),
(120,'Printer','Office','West',15100);

-- Pivot by Region

SELECT
    category,
    SUM(CASE WHEN region = 'North' THEN sales_amount ELSE 0 END) AS North,
    SUM(CASE WHEN region = 'South' THEN sales_amount ELSE 0 END) AS South,
    SUM(CASE WHEN region = 'East' THEN sales_amount ELSE 0 END) AS East,
    SUM(CASE WHEN region = 'West' THEN sales_amount ELSE 0 END) AS West
FROM sales
GROUP BY category; -- Output 1

-- Pivot by Specifying Values (East, West)

SELECT
    category,
    SUM(CASE WHEN region = 'East' THEN sales_amount ELSE 0 END) AS East,
    SUM(CASE WHEN region = 'West' THEN sales_amount ELSE 0 END) AS West
FROM sales
GROUP BY category; -- Output 2

-- Multiple Aggregations 

SELECT
    category,
    SUM(CASE WHEN region = 'East' THEN sales_amount ELSE 0 END) AS East_Total_Amount,
    AVG(CASE WHEN region = 'East' THEN sales_amount END) AS East_Average_Amount,
    SUM(CASE WHEN region = 'West' THEN sales_amount ELSE 0 END) AS West_Total_Amount,
    AVG(CASE WHEN region = 'West' THEN sales_amount END) AS West_Average_Amount
FROM sales
GROUP BY category; -- Output 3