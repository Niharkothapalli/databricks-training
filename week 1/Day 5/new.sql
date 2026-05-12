
-- SELECT

-- 1. Display all employee details
SELECT * FROM employees;

-- 2. Display only employee names and salaries
SELECT emp_name, salary FROM employees;

-- 3. Display employee names and departments
SELECT emp_name, department FROM employees;

-- 4. Display all employees from the IT department
SELECT * FROM employees
WHERE department = 'IT';

-- 5. Display employee names and experience
SELECT emp_name, experience FROM employees;





-- WHERE

-- 1. Find employees with salary greater than 70000
SELECT * FROM employees
WHERE salary > 70000;

-- 2. Find employees working in Hyderabad
SELECT * FROM employees
WHERE city = 'Hyderabad';

-- 3. Find employees with experience less than 4 years
SELECT * FROM employees
WHERE experience < 4;

-- 4. Find employees from Finance department
SELECT * FROM employees
WHERE department = 'Finance';

-- 5. Find employees whose salary is equal to 52000
SELECT * FROM employees
WHERE salary = 52000;




-- GROUP BY

-- 1. Find total salary department-wise
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 2. Find average salary in each department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 3. Count employees in each city
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;

-- 4. Find maximum salary in each department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

-- 5. Find minimum experience department-wise
SELECT department, MIN(experience) AS min_experience
FROM employees
GROUP BY department;




-- HAVING

-- 1. Find departments having more than 3 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- 2. Find departments where average salary is greater than 60000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 3. Find cities having more than 2 employees
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

-- 4. Find departments where total salary is greater than 200000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;

-- 5. Find departments where maximum salary is above 90000
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 90000;