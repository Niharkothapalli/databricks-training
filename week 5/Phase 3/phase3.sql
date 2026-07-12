-- PHASE 3 Hands-on Ingestion Tasks (SQL):

-- Creating customers Table

CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers1 (customer_id, customer_name, city) VALUES
(101, 'Alice', 'Hyderabad'),
(102, 'Bob', 'Bengaluru'),
(103, 'Charlie', 'Chennai'),
(104, 'David', 'Hyderabad'),
(105, 'Eva', 'Mumbai'),
(106, 'Frank', 'Pune'),
(107, 'Grace', 'Chennai'),
(108, 'Henry', 'Delhi'),
(109, 'Ivy', 'Bengaluru'),
(110, 'Jack', 'Kolkata'),
(111, 'Kate', 'Mumbai'),
(112, 'Liam', 'Hyderabad'),
(113, 'Noah', NULL),
(114, 'Olivia', 'Chennai'),
(115, 'Peter', 'Delhi');

-- Creating sales Table

CREATE TABLE sales1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    order_amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id)
);

INSERT INTO sales1 (order_id, customer_id, sale_date, order_amount) VALUES
(1001,101,'2025-01-01',250),
(1002,101,'2025-01-01',450),
(1003,102,'2025-01-01',300),
(1004,102,'2025-01-02',700),
(1005,102,'2025-01-03',150),
(1006,103,'2025-01-01',900),
(1007,104,'2025-01-02',400),
(1008,104,'2025-01-02',600),
(1009,104,'2025-01-03',350),
(1010,105,'2025-01-03',500),
(1011,106,'2025-01-03',NULL),
(1012,107,'2025-01-04',800),
(1013,107,'2025-01-04',200),
(1014,108,'2025-01-05',650),
(1015,108,'2025-01-05',-150),
(1016,109,'2025-01-05',1000),
(1017,110,'2025-01-06',300),
(1018,110,'2025-01-06',450),
(1019,112,'2025-01-07',700),
(1020,112,'2025-01-07',500),
(1021,112,'2025-01-07',300),
(1022,113,'2025-01-08',900),
(1023,114,'2025-01-08',650),
(1024,115,'2025-01-08',400);




-- 1. Read sales data -> clean nulls -> calculate daily sales

SELECT sale_date,SUM(order_amount) AS daily_sales
FROM sales1
WHERE order_amount IS NOT NULL
  AND order_amount > 0
GROUP BY sale_date
ORDER BY sale_date;



-- 2. Read customer data -> clean invalid rows -> city-wise revenue

SELECT c.city,SUM(s.order_amount) AS total_revenue
FROM customers1 c
JOIN sales1 s
ON c.customer_id = s.customer_id
WHERE c.city IS NOT NULL
  AND s.order_amount IS NOT NULL
  AND s.order_amount > 0
GROUP BY c.city
ORDER BY total_revenue DESC;



-- 3. Find repeat customers (>2 orders)

SELECT c.customer_name,COUNT(s.order_id) AS order_count
FROM customers1 c
JOIN sales1 s
ON c.customer_id = s.customer_id
WHERE s.order_amount IS NOT NULL
  AND s.order_amount > 0
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(s.order_id) > 2;



-- 4. Find highest spending customer in each city

SELECT city,customer_name,total_spend
FROM
(
    SELECT
        c.city,
        c.customer_name,
        SUM(s.order_amount) AS total_spend,
        RANK() OVER (
            PARTITION BY c.city
            ORDER BY SUM(s.order_amount) DESC
        ) AS city_rank
    FROM customers1 c
    JOIN sales1 s
    ON c.customer_id = s.customer_id
    WHERE c.city IS NOT NULL
      AND s.order_amount IS NOT NULL
      AND s.order_amount > 0
    GROUP BY c.city, c.customer_name
) t
WHERE city_rank = 1;



-- 5. Build final reporting table with customer, city, total spend, order count

SELECT c.customer_id,c.customer_name,c.city,COALESCE(SUM(s.order_amount),0) AS total_spend,COUNT(s.order_id) AS order_count
FROM customers1 c
LEFT JOIN sales1 s
ON c.customer_id = s.customer_id
AND s.order_amount IS NOT NULL
AND s.order_amount > 0
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY total_spend DESC;