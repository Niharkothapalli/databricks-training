
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


-- 1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.

SELECT employee_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;


-- 2. Use RANK() to rank employees by salary.

SELECT employee_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;


-- 3. Use DENSE_RANK() to rank employees by salary.

SELECT employee_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
FROM employees;


-- 4. Find the top 3 highest-paid employees using a window function.

SELECT *
FROM (
    SELECT employee_name,
           salary,
           ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;


-- 5. Rank employees within each department using PARTITION BY.

SELECT employee_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;


-- 6. Display the highest salary in each department using a window function.

SELECT employee_name,
       department,
       salary,
       MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employees;


-- 7. Calculate the running total of order amounts ordered by order_date.

SELECT order_id,
       order_date,
       total_amount,
       SUM(total_amount) OVER(ORDER BY order_date) AS running_total
FROM orders;


-- 8. Calculate the cumulative sales amount for each employee.

SELECT employee_id,
       order_date,
       total_amount,
       SUM(total_amount) OVER(PARTITION BY employee_id ORDER BY order_date) AS cumulative_sales
FROM orders;


-- 9. Use LAG() to show the previous order amount for each customer.

SELECT customer_id,
       order_date,
       total_amount,
       LAG(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order
FROM orders;


-- 10. Use LEAD() to show the next order amount for each customer.

SELECT customer_id,
       order_date,
       total_amount,
       LEAD(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) AS next_order
FROM orders;


-- 11. Find the difference between current and previous order amount.

SELECT customer_id,
       order_date,
       total_amount,
       total_amount -
       LAG(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) AS difference
FROM orders;


-- 12. Calculate moving average of last 3 orders.

SELECT order_id,
       order_date,
       total_amount,
       AVG(total_amount) OVER(
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_average
FROM orders;


-- 13. Use NTILE(4) to divide employees into salary quartiles.

SELECT employee_name,
       salary,
       NTILE(4) OVER(ORDER BY salary DESC) AS quartile
FROM employees;


-- 14. Find the first order placed by each customer.

SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) t
WHERE rn = 1;


-- 15. Find the latest order placed by each customer.

SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
) t
WHERE rn = 1;


-- 16. Display employee salaries along with department average salary.

SELECT employee_name,
       department,
       salary,
       AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary
FROM employees;


-- 17. Find employees earning above department average salary.

SELECT *
FROM (
    SELECT employee_name,
           department,
           salary,
           AVG(salary) OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;


-- 18. Calculate department payroll.

SELECT employee_name,
       department,
       salary,
       SUM(salary) OVER(PARTITION BY department) AS department_payroll
FROM employees;


-- 19. Find percentage contribution of each employee salary within department.

SELECT employee_name,
       department,
       salary,
       ROUND(
           salary * 100.0 /
           SUM(salary) OVER(PARTITION BY department), 2
       ) AS salary_percentage
FROM employees;


-- 20. Show total number of employees alongside each row.

SELECT employee_name,
       department,
       COUNT(*) OVER() AS total_employees
FROM employees;