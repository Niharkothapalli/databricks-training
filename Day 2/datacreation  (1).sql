-- Create Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Project table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert data into Department table
INSERT INTO Department (department_id, name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert data into Employee table
INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
(2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
(3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
(4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
(5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
(6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
(7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');

-- Insert data into Project table
INSERT INTO Project (project_id, name, department_id) VALUES
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 1),
(4, 'Project Delta', 3),
(5, 'Project Epsilon', 4),
(6, 'Project Zeta', 4),
(7, 'Project Eta', 3);


-- Insert additional data into Department table (if needed)
-- No additional departments needed for this data set

-- Insert additional data into Employee table to test edge cases for joins and nested queries
INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department
(9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
(10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');

-- Insert additional data into Project table to test edge cases for joins
INSERT INTO Project (project_id, name, department_id) VALUES
(8, 'Project Theta', 1),
(9, 'Project Iota', NULL);  -- Project without a department



-- Day 2 Answers 35 to 60

-- 36. Select employee names along with their department names.
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id;

-- 37. Select project names along with the department names they belong to.
SELECT p.name AS project_name, d.name AS department_name
FROM Project p
JOIN Department d ON p.department_id = d.department_id;

-- 38. Select employee names and their corresponding project names.
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Project p ON e.department_id = p.department_id;

-- 39. Select all employees and their departments, including those without a department.
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;

-- 40. Select all departments and their employees, including departments without employees.
SELECT d.name AS department_name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id;

-- 41. Select employees who are not assigned to any project.
SELECT e.name
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- 42. Select employees and the number of projects their department is working on.
SELECT e.name AS employee_name, COUNT(p.project_id) AS project_count
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

-- 43. Select the departments that have no employees.
SELECT d.name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44. Select employee names who share the same department with 'John Doe'.
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
);

-- 45. Select the department name with the highest average salary.
SELECT d.name, AVG(e.salary) AS avg_salary
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
GROUP BY d.name
ORDER BY avg_salary DESC
LIMIT 1;

-- 46. Select the employee with the highest salary.
SELECT * FROM Employee
WHERE salary = (
    SELECT MAX(salary) FROM Employee
);

-- 47. Select employees whose salary is above the average salary.
SELECT * FROM Employee
WHERE salary > (
    SELECT AVG(salary) FROM Employee
);

-- 48. Select the second highest salary from the Employee table.
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary) FROM Employee
);

-- 49. Select the department with the most employees.
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

-- 50. Select employees who earn more than the average salary of their department.
SELECT e.name, e.salary
FROM Employee e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 51. Select the nth highest salary (example: 3rd highest).
SELECT DISTINCT salary
FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.salary >= e1.salary
);

-- 52. Select employees who are older than all employees in the HR department.
SELECT * FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Department
        WHERE name = 'HR'
    )
);

-- 53. Select departments where the average salary is greater than 55000.
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54. Select employees who work in a department with at least 2 projects.
SELECT * FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

-- 55. Select employees who were hired on the same date as 'Jane Smith'.
SELECT * FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

-- 56. Select the total salary of employees hired in the year 2020.
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57. Select the average salary of employees in each department,
-- ordered by the average salary in descending order.
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC;

-- 58. Select departments with more than 1 employee and
-- an average salary greater than 55000.
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;

-- 59. Select employees hired in the last 2 years,
-- ordered by their hire date.
SELECT * FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR
ORDER BY hire_date;

-- 60. Select the total number of employees and the average salary
-- for departments with more than 2 employees.
SELECT department_id,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61. Select the name and salary of employees whose salary
-- is above the average salary of their department.
SELECT e.name, e.salary
FROM Employee e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 62. Select the names of employees who are hired on the same date
-- as the oldest employee in the company.
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE age = (
        SELECT MAX(age) FROM Employee
    )
);

-- 63. Select the department names along with the total number
-- of projects they are working on, ordered by the number of projects.
SELECT d.name AS department_name,
       COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY total_projects DESC;

-- 64. Select the employee name with the highest salary in each department.
SELECT e.name, e.department_id, e.salary
FROM Employee e
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 65. Select the names and salaries of employees who are older
-- than the average age of employees in their department.
SELECT e.name, e.salary
FROM Employee e
WHERE e.age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);
