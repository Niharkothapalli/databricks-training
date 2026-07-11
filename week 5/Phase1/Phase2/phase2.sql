-- Create Customers table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'Alice','Hyderabad'),
(102,'Bob','Bengaluru'),
(103,'Charlie','Chennai'),
(104,'David','Hyderabad'),
(105,'Eva','Mumbai'),
(106,'Frank','Pune'),
(107,'Grace','Chennai'),
(108,'Henry','Delhi'),
(109,'Ivy','Bengaluru'),
(110,'Jack','Kolkata'),
(111,'Kate','Mumbai'),
(112,'Liam','Hyderabad');


-- Create orders table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001,101,250),
(1002,101,450),
(1003,102,300),
(1004,102,700),
(1005,102,150),
(1006,103,900),
(1007,104,400),
(1008,104,600),
(1009,104,350),
(1010,105,500),
(1011,107,800),
(1012,107,200),
(1013,108,650),
(1014,108,150),
(1015,109,1000),
(1016,110,300),
(1017,110,450),
(1018,112,700),
(1019,112,500),
(1020,112,300);



--1. Total order amount for each customer

SELECT c.customer_id,c.customer_name,
COALESCE(SUM(o.order_amount),0) AS total_spend
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;



--2. Top 3 customers by total spend

SELECT c.customer_name,SUM(o.order_amount) AS total_spend
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spend DESC
LIMIT 3;



--3. Customers with no orders

SELECT c.customer_id,c.customer_name,c.city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;



--4. City-wise total revenue

SELECT c.city,
COALESCE(SUM(o.order_amount),0) AS city_revenue
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city;



--5. Average order amount per customer

SELECT c.customer_name,
AVG(o.order_amount) AS average_order
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;



--6. Customers with more than one order

SELECT c.customer_name,COUNT(o.order_id) AS number_of_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;



--7. Sort customers by total spend descending

SELECT c.customer_name,COALESCE(SUM(o.order_amount),0) AS total_spend
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spend DESC;