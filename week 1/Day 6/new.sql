
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



-- TOP

-- 1. Display top 5 highest paid employees
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 2. Display top 3 employees with highest experience
SELECT * FROM employees
ORDER BY experience DESC
LIMIT 3;

-- 3. Display top 2 salaries from Finance department
SELECT * FROM employees
WHERE department = 'Finance'
ORDER BY salary DESC
LIMIT 2;

-- 4. Display top 4 employees from Hyderabad
SELECT * FROM employees
WHERE city = 'Hyderabad'
LIMIT 4;

-- 5. Display top 1 highest salary employee
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;




-- DISTINCT

-- 1. Display distinct department names
SELECT DISTINCT department FROM employees;

-- 2. Display distinct city names
SELECT DISTINCT city FROM employees;

-- 3. Display distinct salary values
SELECT DISTINCT salary FROM employees;

-- 4. Display distinct combinations of department and city
SELECT DISTINCT department, city FROM employees;

-- 5. Display distinct experience values
SELECT DISTINCT experience FROM employees;



-- COMPARISON OPERATORS

-- 1. Find employees with salary >= 80000
SELECT * FROM employees
WHERE salary >= 80000;

-- 2. Find employees with experience <= 3
SELECT * FROM employees
WHERE experience <= 3;

-- 3. Find employees whose salary <> 45000
SELECT * FROM employees
WHERE salary <> 45000;

-- 4. Find employees with salary < 50000
SELECT * FROM employees
WHERE salary < 50000;

-- 5. Find employees with experience > 5
SELECT * FROM employees
WHERE experience > 5;




-- LOGICAL OPERATORS

-- 1. Find employees from IT department AND salary greater than 70000
SELECT * FROM employees
WHERE department = 'IT' AND salary > 70000;

-- 2. Find employees from Hyderabad OR Bangalore
SELECT * FROM employees
WHERE city = 'Hyderabad' OR city = 'Bangalore';

-- 3. Find employees from HR department AND experience less than 3
SELECT * FROM employees
WHERE department = 'HR' AND experience < 3;

-- 4. Find employees with salary greater than 60000 OR experience greater than 6
SELECT * FROM employees
WHERE salary > 60000 OR experience > 6;

-- 5. Find employees NOT from Sales department
SELECT * FROM employees
WHERE department <> 'Sales';




-- IN AND NOT IN

-- 1. Find employees working in ('Hyderabad', 'Mumbai')
SELECT * FROM employees
WHERE city IN ('Hyderabad', 'Mumbai');

-- 2. Find employees whose department IN ('IT', 'Finance')
SELECT * FROM employees
WHERE department IN ('IT', 'Finance');

-- 3. Find employees whose city NOT IN ('Chennai', 'Pune')
SELECT * FROM employees
WHERE city NOT IN ('Chennai', 'Pune');

-- 4. Find employees whose salary IN (45000, 75000, 91000)
SELECT * FROM employees
WHERE salary IN (45000, 75000, 91000);

-- 5. Find employees whose department NOT IN ('HR', 'Sales')
SELECT * FROM employees
WHERE department NOT IN ('HR', 'Sales');




-- BETWEEN

-- 1. Find employees with salary BETWEEN 50000 AND 80000
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 80000;

-- 2. Find employees with experience BETWEEN 3 AND 6
SELECT * FROM employees
WHERE experience BETWEEN 3 AND 6;

-- 3. Find employees whose emp_id BETWEEN 105 AND 112
SELECT * FROM employees
WHERE emp_id BETWEEN 105 AND 112;

-- 4. Find employees with salary NOT BETWEEN 40000 AND 60000
SELECT * FROM employees
WHERE salary NOT BETWEEN 40000 AND 60000;

-- 5. Find employees with experience BETWEEN 2 AND 4
SELECT * FROM employees
WHERE experience BETWEEN 2 AND 4;




-- LIKE OPERATOR

-- 1. Find employees whose names start with 'R'
SELECT * FROM employees
WHERE emp_name LIKE 'R%';

-- 2. Find employees whose names end with 'a'
SELECT * FROM employees
WHERE emp_name LIKE '%a';

-- 3. Find employees whose names contain 'v'
SELECT * FROM employees
WHERE emp_name LIKE '%v%';

-- 4. Find employees whose city starts with 'B'
SELECT * FROM employees
WHERE city LIKE 'B%';

-- 5. Find employees whose department ends with 's'
SELECT * FROM employees
WHERE department LIKE '%s';