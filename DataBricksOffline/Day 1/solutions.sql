CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

INSERT INTO Employees VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);

-- SELECT :
SELECT *
FROM Employees;

SELECT emp_name,salary
FROM Employees;

SELECT emp_name,department
FROM Employees;

SELECT *
FROM Employees
WHERE department='IT';

SELECT emp_name,experience
FROM Employees;



-- WHERE :
SELECT emp_name,salary
FROM Employees
WHERE salary>70000;

SELECT emp_name,city
FROM Employees
WHERE city = 'Hyderabad';

SELECT emp_name,experience
FROM Employees
WHERE experience<4;

SELECT emp_name,department
FROM Employees
WHERE department='Finance';

SELECT emp_name,salary
FROM Employees
WHERE salary = 52000;



-- GROUP BY :
SELECT department,SUM(salary) AS total_salary_per_department
FROM Employees
GROUP BY department;

SELECT department,AVG(salary) AS avg_salary_per_department
FROM Employees
GROUP BY department;

SELECT city,COUNT(*) AS total_emp_in_the_city
FROM Employees
GROUP BY city;

SELECT department,MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;

SELECT department,MIN(experience) AS least_experienced
FROM Employees
GROUP BY department;
SELECT emp_name,department,experience
FROM Employees e
WHERE experience = (
	SELECT MIN(experience)
    FROM Employees 
    WHERE department = e.department
);


SELECT emp_name,department,salary
FROM Employees e
WHERE salary = (
	SELECT MAX(salary)
    FROM Employees 
    WHERE department = e.department
);



-- HAVING :
SELECT COUNT(*) AS total_emp,department
FROM Employees 
GROUP BY department 
HAVING total_emp>3;

SELECT department,AVG(salary)AS avg_salary
FROM Employees 
GROUP BY department
HAVING avg_salary>60000;

SELECT city,COUNT(*) AS no_of_emp
FROM Employees 
GROUP BY city 
HAVING no_of_emp>2;

SELECT department,SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING total_salary>200000;

SELECT department,MAX(salary) AS max_sal
FROM Employees
GROUP BY department
HAVING max_sal>90000;



-- TOP :
SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

SELECT emp_name,experience,department
FROM Employees
ORDER BY experience DESC
LIMIT 3;

SELECT emp_name,department,salary
FROM Employees
WHERE department = 'Finance'
ORDER BY salary DESC 
LIMIT 2;

SELECT emp_name,city,salary
FROM Employees
WHERE city = 'Hyderabad'
ORDER BY salary DESC
LIMIT 4;

SELECT emp_name,salary 
FROM Employees 
ORDER BY salary DESC
LIMIT 1;



-- DISTINCT :
SELECT DISTINCT department
FROM Employees;

SELECT DISTINCT city
FROM Employees;

SELECT DISTINCT salary 
FROM Employees;

SELECT DISTINCT department,city 
FROM Employees;

SELECT DISTINCT experience
FROM Employees;



-- COMPARISON OPERATORS
SELECT emp_name, salary 
FROM Employees 
WHERE salary >= 80000;

SELECT emp_name,experience
FROM Employees
WHERE experience <=3;

SELECT emp_name, salary 
FROM Employees 
WHERE salary <>45000;

SELECT emp_name, salary 
FROM Employees 
WHERE salary <50000;

SELECT emp_name,experience 
FROM Employees 
WHERE experience>5;



-- LOGICAL OPERATORS :
SELECT *
FROM Employees
WHERE department = 'IT' AND salary>70000;

SELECT emp_name,city
FROM Employees
WHERE city = 'Hyderabad' OR city = 'Bangalore';

SELECT emp_name,department,experience
FROM Employees 
WHERE department = 'HR' AND experience < 3;

SELECT emp_name,salary,experience
FROM Employees
WHERE salary>60000 OR experience >6;

SELECT emp_name,department
FROM Employees
WHERE department <> 'Sales';



-- IN AND NOT IN :
SELECT emp_name,city
FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');

SELECT emp_name,department
FROM Employees
WHERE department IN ('IT','Finance');

SELECT emp_name,city
FROM Employees
WHERE city NOT IN ('Chennai','Pune');

SELECT emp_name,salary
FROM Employees
WHERE salary IN (45000, 75000, 91000);

SELECT emp_name,department
FROM Employees
WHERE department NOT IN ('HR', 'Sales');



-- BETWEEN
SELECT emp_name,salary
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

SELECT emp_name,experience
FROM Employees
WHERE experience BETWEEN 3 AND 6;

SELECT emp_name,emp_id
FROM Employees 
WHERE emp_id BETWEEN 105 AND 112;

SELECT emp_name,salary
FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;

SELECT emp_name,experience
FROM Employees
WHERE experience BETWEEN 2 AND 4;



-- LIKE OPERATOR
SELECT emp_name
FROM Employees
WHERE emp_name LIKE 'R%';

SELECT emp_name
FROM Employees
WHERE emp_name LIKE '%a';

SELECT emp_name 
FROM Employees
WHERE emp_name LIKE '%v%';

SELECT emp_name,city 
FROM Employees
WHERE city LIKE 'B%';

SELECT emp_name,department
FROM Employees 
WHERE department LIKE '%s';