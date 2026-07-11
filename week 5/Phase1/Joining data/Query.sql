CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(101,'Aarav','IT','Hyderabad',65000),
(102,'Bhavya','HR','Bangalore',52000),
(103,'Charan','IT','Chennai',70000),
(104,'Divya','Finance','Mumbai',75000),
(105,'Esha','Marketing','Pune',58000),
(106,'Farhan','IT','Delhi',68000),
(107,'Gopal','Support','Hyderabad',45000),
(108,'Harsha','QA','Chennai',60000),
(109,'Ishita','Analytics','Bangalore',72000),
(110,'John','HR','Mumbai',55000),
(111,'Keerthi','Finance','Hyderabad',80000),
(112,'Lokesh','Support','Pune',47000),
(113,'Meena','QA','Delhi',62000),
(114,'Nikhil','IT','Hyderabad',69000),
(115,'Pooja','Marketing','Chennai',56000),
(116,'Rahul','Analytics','Bangalore',76000),
(117,'Sneha','Finance','Mumbai',83000),
(118,'Teja','Support','Delhi',49000),
(119,'Varun','QA','Hyderabad',61000),
(120,'Yash','IT','Pune',71000);

CREATE TABLE projects (
    emp_id INT,
    project_name VARCHAR(100),
    department VARCHAR(50),
    manager VARCHAR(50)
);

INSERT INTO projects VALUES
(101,'Customer Portal','IT','Anil'),
(102,'Payroll System','HR','Ramesh'),
(103,'Inventory App','IT','Anil'),
(104,'Budget Tracker','Finance','Priya'),
(105,'Campaign Hub','Marketing','Kiran'),
(106,'Data Warehouse','IT','Anil'),
(108,'Automation Testing','QA','Suresh'),
(109,'Sales Dashboard','Analytics','Megha'),
(110,'Recruitment Portal','HR','Ramesh'),
(111,'Financial Audit','Finance','Priya'),
(112,'Help Desk','Support','Ajay'),
(114,'Cloud Migration','IT','Anil'),
(115,'Digital Ads','Marketing','Kiran'),
(116,'Customer Insights','Analytics','Megha'),
(117,'Tax Filing','Finance','Priya'),
(119,'QA Automation','QA','Suresh'),
(121,'CRM Upgrade','IT','Anil'),
(122,'Security Audit','Support','Ajay'),
(123,'AI Recommendation','Analytics','Megha'),
(120,'Mobile App','IT','Anil');

-- Inner Join
SELECT *
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id; -- Output 1

-- Left Join
SELECT *
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id; -- Output 2

-- Right Join
SELECT *
FROM employees e
RIGHT JOIN projects p
ON e.emp_id = p.emp_id; -- Output 3

-- Full Outer Join
SELECT *
FROM employees e
FULL OUTER JOIN projects p
ON e.emp_id = p.emp_id; -- Output 4

-- Cross Join
SELECT *
FROM employees
CROSS JOIN projects; -- Output 5

-- Left Semi Join (Equivalent)
SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM projects p
    WHERE e.emp_id = p.emp_id
); -- Output 6

-- Left Anti Join (Equivalent)
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM projects p
    WHERE e.emp_id = p.emp_id
); -- Output 7

-- Join on Multiple Columns
SELECT *
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
AND e.department = p.department; -- Output 8

-- Inner Join Using DataFrame Column Notation
SELECT *
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id; -- Output 9

-- Join Using Custom Condition
SELECT *
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
AND e.department = p.department; -- Output 10

-- Join Using Multiple Conditions
SELECT *
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
AND e.department = p.department; -- Output 11

-- Join and Select All Columns from Employees with Manager Name
SELECT
    e.*,
    p.manager AS project_manager
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id; -- Output 12

-- Employees Without Projects
SELECT
    e.emp_id,
    e.emp_name,
    e.department
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM projects p
    WHERE e.emp_id = p.emp_id
); -- Output 13

-- Employees With Projects
SELECT
    e.emp_id,
    e.emp_name,
    e.department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM projects p
    WHERE e.emp_id = p.emp_id
); -- Output 14

-- Employee Project Details Sorted by Salary
SELECT *
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id
ORDER BY e.salary DESC; -- Output 15
