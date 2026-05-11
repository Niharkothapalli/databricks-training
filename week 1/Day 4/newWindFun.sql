
-- SQL Window Functions and CTE Assignment
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    manager_id INT NULL,
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert Employees
INSERT INTO employees VALUES
(1, 'Alice Johnson', 'Sales', NULL, 70000, '2020-01-15'),
(2, 'Bob Smith', 'Sales', 1, 65000, '2021-03-20'),
(3, 'Charlie Brown', 'IT', NULL, 90000, '2019-07-01'),
(4, 'Diana Prince', 'IT', 3, 95000, '2018-11-11'),
(5, 'Ethan Hunt', 'HR', NULL, 60000, '2022-02-10'),
(6, 'Fiona Green', 'HR', 5, 58000, '2023-05-12'),
(7, 'George Miller', 'Finance', NULL, 85000, '2017-09-18'),
(8, 'Hannah Lee', 'Finance', 7, 82000, '2021-08-30');

-- Insert Customers
INSERT INTO customers VALUES
(1, 'Acme Corp', 'New York'),
(2, 'Tech Solutions', 'Chicago'),
(3, 'Global Retail', 'Dallas'),
(4, 'Blue Sky Ltd', 'Seattle'),
(5, 'NextGen Systems', 'Boston');

-- Insert Orders
INSERT INTO orders VALUES
(101, 1, 1, '2024-01-10', 500),
(102, 2, 2, '2024-01-11', 700),
(103, 1, 1, '2024-01-15', 1200),
(104, 3, 3, '2024-01-18', 300),
(105, 4, 4, '2024-01-20', 900),
(106, 5, 2, '2024-01-25', 1500),
(107, 2, 1, '2024-02-01', 650),
(108, 1, 3, '2024-02-05', 1100),
(109, 3, 4, '2024-02-10', 400),
(110, 4, 2, '2024-02-15', 950),
(111, 5, 1, '2024-02-20', 2000),
(112, 1, 4, '2024-02-25', 750);

-- Notes:
-- Multiple departments for PARTITION BY exercises.
-- Salary variations for ranking exercises.
-- Multiple customer orders for LAG/LEAD analysis.
-- Manager hierarchy included for recursive CTE practice.





-- Answers for the given Queries


-- 21. Create a CTE to calculate total sales per employee.

WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT * FROM employee_sales;


-- 22. Find employees whose sales exceed company average using CTE.

WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
average_sales AS (
    SELECT AVG(total_sales) AS avg_sales
    FROM employee_sales
)
SELECT es.*
FROM employee_sales es, average_sales a
WHERE es.total_sales > a.avg_sales;


-- 23. Multiple CTEs for customer spending and ranking.

WITH customer_spending AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
customer_rank AS (
    SELECT customer_id,
           total_spent,
           RANK() OVER(ORDER BY total_spent DESC) AS ranking
    FROM customer_spending
)
SELECT * FROM customer_rank;


-- 24. Recursive CTE to generate numbers from 1 to 10.

WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;


-- 25. Recursive CTE for employee hierarchy.

WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id,
           employee_name
    FROM employees
    WHERE employee_id = 1

    UNION ALL

    SELECT e.employee_id,
           e.employee_name
    FROM employees e
    INNER JOIN employee_hierarchy eh
    ON e.employee_id = eh.employee_id + 1
)
SELECT * FROM employee_hierarchy;


-- 26. CTE that filters orders above average order amount.

WITH avg_order AS (
    SELECT AVG(total_amount) AS avg_amount
    FROM orders
)
SELECT *
FROM orders
WHERE total_amount > (
    SELECT avg_amount FROM avg_order
);


-- 27. CTE and window function together to rank customers by spending.

WITH customer_total AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
       total_spending,
       RANK() OVER(ORDER BY total_spending DESC) AS customer_rank
FROM customer_total;


-- 28. Find second-highest salary in each department.

SELECT *
FROM (
    SELECT employee_name,
           department,
           salary,
           DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 2;


-- 29. Difference between employee salary and department maximum salary.

SELECT employee_name,
       department,
       salary,
       MAX(salary) OVER(PARTITION BY department) - salary AS salary_difference
FROM employees;


-- 30. Find top-performing employee in each department based on total sales.

WITH employee_sales AS (
    SELECT e.employee_id,
           e.employee_name,
           e.department,
           SUM(o.total_amount) AS total_sales
    FROM employees e
    LEFT JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id, e.employee_name, e.department
),
ranked_sales AS (
    SELECT *,
           RANK() OVER(PARTITION BY department ORDER BY total_sales DESC) AS rnk
    FROM employee_sales
)
SELECT *
FROM ranked_sales
WHERE rnk = 1;


-- Bonus Challenge:

WITH monthly_sales AS (
    SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT month,
       total_sales,
       SUM(total_sales) OVER(ORDER BY month) AS running_total,
       LAG(total_sales) OVER(ORDER BY month) AS previous_month_sales,
       ROUND(
           (
               (total_sales - LAG(total_sales) OVER(ORDER BY month))
               / LAG(total_sales) OVER(ORDER BY month)
           ) * 100, 2
       ) AS growth_percentage
FROM monthly_sales;