--Phase 4A – Bucketing & Segmentation in PySpark


CREATE TABLE customers2 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    total_spend DECIMAL(10,2)
);

INSERT INTO customers2 VALUES
(101, 'Alice', 'Hyderabad', 12000),
(102, 'Bob', 'Bengaluru', 8500),
(103, 'Charlie', 'Chennai', 4200),
(104, 'David', 'Mumbai', 15000),
(105, 'Emma', 'Delhi', 6800),
(106, 'Frank', 'Pune', 3000),
(107, 'Grace', 'Hyderabad', 9800),
(108, 'Henry', 'Chennai', 22000),
(109, 'Isabella', 'Mumbai', 5400),
(110, 'Jack', 'Delhi', 1800),
(111, 'Kevin', 'Pune', 7600),
(112, 'Lily', 'Bengaluru', 13400),
(113, 'Mason', 'Hyderabad', 2500),
(114, 'Nancy', 'Mumbai', 10100),
(115, 'Oliver', 'Chennai', 4700);




-- 1. Create Gold/Silver/Bronze segmentation using conditional logic

SELECT customer_id,customer_name,city,total_spend,
CASE
	WHEN total_spend > 10000 THEN 'Gold'
	WHEN total_spend BETWEEN 5000 AND 10000 THEN 'Silver'
	ELSE 'Bronze'
END AS segment
FROM customers2;




-- 2. Group data by segment and count customers

SELECT
CASE
	WHEN total_spend > 10000 THEN 'Gold'
	WHEN total_spend BETWEEN 5000 AND 10000 THEN 'Silver'
	ELSE 'Bronze'
END AS segment,COUNT(*) AS customer_count
FROM customers2
GROUP BY segment;