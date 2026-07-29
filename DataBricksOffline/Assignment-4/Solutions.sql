CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

INSERT INTO Departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Sales'),
(105,'Marketing');

CREATE TABLE Employees
(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
Gender VARCHAR(10),
DepartmentID INT,
Salary INT,
Experience INT,
ManagerID INT,
JoiningDate DATE,
City VARCHAR(50)
);

INSERT INTO Employees VALUES
(1,'Rahul','Male',101,70000,5,NULL,'2019-01-10','Hyderabad'),
(2,'Sneha','Female',101,85000,8,1,'2017-06-15','Bangalore'),
(3,'John','Male',102,45000,2,2,'2022-03-11','Chennai'),
(4,'Priya','Female',102,50000,3,2,'2021-05-19','Hyderabad'),
(5,'Amit','Male',103,90000,10,1,'2015-09-20','Delhi'),
(6,'Neha','Female',103,90000,9,5,'2016-11-01','Delhi'),
(7,'Kiran','Male',104,60000,4,5,'2020-02-15','Mumbai'),
(8,'David','Male',104,62000,4,7,'2020-08-18','Mumbai'),
(9,'Anjali','Female',105,55000,3,2,'2021-01-25','Pune'),
(10,'Arjun','Male',101,85000,8,1,'2017-07-10','Bangalore'),
(11,'Divya','Female',103,70000,6,5,'2018-12-20','Hyderabad'),
(12,'Vikram','Male',104,62000,5,7,'2019-10-05','Mumbai'),
(13,'Meena','Female',105,55000,2,9,'2023-01-01','Pune'),
(14,'Rakesh','Male',101,95000,12,NULL,'2013-04-01','Hyderabad'),
(15,'Suresh','Male',102,45000,1,4,'2024-01-15','Chennai');


-- SECTION 1 - ROW_NUMBER()

SELECT *,
	ROW_NUMBER() OVER(ORDER BY Salary DESC)
FROM Employees;

SELECT *,
	ROW_NUMBER() OVER(
    PARTITION BY e.DepartmentID
	ORDER BY e.Salary DESC)
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID;

SELECT EmployeeName,DepartmentName,Salary
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    ROW_NUMBER() OVER(
	PARTITION BY d.DepartmentName
    ORDER BY e.Salary DESC) AS rn
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked
WHERE rn = 1;

SELECT EmployeeName,DepartmentName,Salary
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    ROW_NUMBER() OVER(
	PARTITION BY d.DepartmentName
    ORDER BY e.Salary DESC) AS rn
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked
WHERE rn = 2;

SELECT EmployeeName,DepartmentName,JoiningDate
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.JoiningDate,
    ROW_NUMBER() OVER(
    PARTITION BY d.DepartmentName
    ORDER BY e.JoiningDate DESC ) AS latest_joined
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID
)AS lat
WHERE latest_joined = 1;

SELECT DepartmentName,EmployeeName,JoiningDate
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.JoiningDate,
    ROW_NUMBER() OVER(
    PARTITION BY d.DepartmentName
    ORDER BY JoiningDate) AS first_joined
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID) AS A
WHERE first_joined = 1;

SELECT EmployeeName,DepartmentName,Salary
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
	DENSE_RANK() OVER(
    PARTITION BY d.DepartmentName
    ORDER BY e.Salary DESC) AS top_3
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID) AS ANS
WHERE top_3 <= 3;

SELECT EmployeeName,JoiningDate,
	ROW_NUMBER() OVER(
    ORDER BY JoiningDate) AS Joining_order
FROM Employees;




-- SECTION 2 - RANK()

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    RANK() OVER(
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked;

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    RANK() OVER(
	PARTITION BY d.DepartmentName
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked;

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    RANK() OVER(
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked
WHERE Rank_sal = 1;

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    RANK() OVER(
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked
WHERE Rank_sal <= 5;

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    RANK() OVER(
	PARTITION BY d.DepartmentName
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked
WHERE Rank_sal <= 3;

-- "RANK() creates a gap when two or more rows have the same value. It assigns the same rank to those rows,
-- and the next rank number is skipped. For example, if two employees are ranked 2nd because they have the same salary,
-- the next employee gets rank 4 instead of rank 3.




-- SECTION 3 - DENSE_RANK()

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    DENSE_RANK() OVER(
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked;

SELECT EmployeeName,DepartmentName,Salary,Rank_sal
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    DENSE_RANK() OVER(
    ORDER BY e.Salary DESC) AS Rank_sal
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
)AS ranked
WHERE Rank_sal = 2;

SELECT EmployeeName,DepartmentName,Salary,sal_deptWise
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    DENSE_RANK() OVER(
    PARTITION BY d.DepartmentName
    ORDER BY e.Salary DESC) AS sal_deptWise
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID) AS A
WHERE sal_deptWise <= 3;

SELECT EmployeeName,DepartmentName,Salary,
	DENSE_RANK() OVER(
    ORDER BY e.Salary DESC) AS denseRank,
    RANK() OVER(
    ORDER BY e.Salary DESC) AS normalRank
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID;

SELECT EmployeeName,DepartmentName,Salary
FROM(
	SELECT e.EmployeeName,d.DepartmentName,e.Salary,
    DENSE_RANK() OVER (
    PARTITION BY d.DepartmentName
    ORDER BY e.Salary) AS sal,
    COUNT(*) OVER (
               PARTITION BY d.DepartmentName, e.Salary
           ) AS cnt
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID) AS ans
WHERE cnt>1;

-- SECTION 4 - LEAD()

SELECT EmployeeName,Salary,
	LEAD(Salary) OVER(
    ORDER BY Salary) AS next_salary,
    LAG(Salary) OVER(
    ORDER BY Salary) AS previous_salary
FROM Employees;

SELECT EmployeeName,Salary,next_salary,Salary - next_salary AS diff
FROM(	
	SELECT EmployeeName,Salary,
    LEAD(Salary) OVER(
    ORDER BY Salary DESC) AS next_salary
FROM Employees) AS a;

SELECT EmployeeName,Salary,next_sal
FROM(SELECT EmployeeName,Salary,
	LEAD(Salary) OVER(
    ORDER BY Salary) AS next_sal
FROM Employees) AS a
WHERE Salary<next_sal;

SELECT EmployeeName,JoiningDate,
	LEAD(JoiningDate) OVER(
    ORDER BY JoiningDate) AS DATE_ORDER
FROM Employees;

SELECT EmployeeName,
	LEAD(EmployeeName) OVER() AS next_emp
FROM Employees;



-- SECTION 5 - LAG()

SELECT EmployeeName,Salary,
	LAG(Salary) OVER() AS prev_sal
FROM Employees;

SELECT EmployeeName,Salary,prevSal,Salary - prevSal AS inc
FROM(SELECT EmployeeName,Salary,
	LAG(Salary) OVER(
    ORDER BY Salary) AS prevSal
FROM Employees) AS a;

SELECT EmployeeName,Salary
FROM(SELECT EmployeeName,Salary,
	LAG(Salary) OVER(
    ORDER BY Salary) AS prevSal
FROM Employees) AS a
WHERE Salary>prevSal;

SELECT EmployeeName,JoiningDate,
	LAG(JoiningDate) OVER(
    ORDER BY JoiningDate) AS prev_jDate
FROM Employees;

SELECT EmployeeName,
	LAG(EmployeeName) OVER() AS prev_emp
FROM Employees;



-- SECTION 6 - SUBQUERIES
SELECT EmployeeName,Salary AS GreaterThanAvg
FROM Employees
WHERE Salary>(
	SELECT AVG(Salary)
    FROM Employees);
    
SELECT EmployeeName,Salary AS lessThanAvg
FROM Employees
WHERE Salary<(
	SELECT AVG(Salary)
    FROM Employees);

SELECT EmployeeName,Salary AS HighestPaid
FROM Employees 
WHERE Salary = (
	SELECT MAX(Salary)
    FROM Employees);
    
SELECT EmployeeName,Salary AS HighestPaid
FROM Employees 
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employees));

SELECT d.DepartmentName,COUNT(e.EmployeeID) AS cnt
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING cnt>3;

SELECT DepartmentName
FROM Departments d
WHERE (
    SELECT COUNT(*)
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
) > 3;

SELECT EmployeeName
FROM Employees 
WHERE DepartmentID = (
	SELECT DepartmentID
	FROM Employees
    GROUP BY DepartmentID
    ORDER BY COUNT(EmployeeID) DESC
    LIMIT 1);
    
SELECT EmployeeName,Salary
FROM Employees
WHERE Salary=(
	SELECT Salary
    FROM Employees
    WHERE EmployeeName = "Amit")
AND EmployeeName <> "Amit";

SELECT e.EmployeeName AS EmployeeName,e.Salary AS Employee_sal,m.EmployeeName AS Manager_name,m.Salary AS Manager_sal
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID
WHERE e.Salary>m.Salary;

SELECT EmployeeName,Salary
FROM Employees e
WHERE Salary>(
	SELECT Salary
    FROM Employees
    WHERE EmployeeID = e.ManagerID);

-- SECTION 7 - CTE (Common Table Expressions)

WITH EmployeeDept AS (
SELECT e.EmployeeID,e.EmployeeName,d.DepartmentName,e.Salary
    FROM Employees e
    JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
)
SELECT *
FROM EmployeeDept;

WITH SalaryRank AS (
    SELECT EmployeeName,DepartmentID,Salary,
    DENSE_RANK() OVER(
    PARTITION BY DepartmentID
    ORDER BY Salary DESC
    ) AS rnk
    FROM Employees
)
SELECT *
FROM SalaryRank
WHERE rnk <= 3;

WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal
    FROM Employees
)
SELECT EmployeeName,Salary
FROM Employees
WHERE Salary > (
    SELECT AvgSal
    FROM AvgSalary
);

WITH DuplicateSalary AS (
    SELECT Salary,COUNT(*) AS TotalEmployees
    FROM Employees
    GROUP BY Salary
    HAVING COUNT(*) > 1
)
SELECT *
FROM DuplicateSalary;
WITH DuplicateSalary AS (
    SELECT Salary
    FROM Employees
    GROUP BY Salary
    HAVING COUNT(*) > 1
)
SELECT EmployeeName,Salary
FROM Employees
WHERE Salary IN (
    SELECT Salary
    FROM DuplicateSalary
);

WITH AvgDeptSalary AS (
    SELECT DepartmentID,AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT d.DepartmentName,a.AvgSalary
FROM AvgDeptSalary a
JOIN Departments d
ON a.DepartmentID = d.DepartmentID
WHERE AvgSalary > 70000;

WITH DeptSalary AS (
    SELECT DepartmentID,SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT d.DepartmentName,ds.TotalSalary
FROM DeptSalary ds
JOIN Departments d
ON ds.DepartmentID = d.DepartmentID;

WITH ExperiencedEmployees AS (
    SELECT EmployeeID,EmployeeName,Experience,Salary
    FROM Employees
    WHERE Experience > 5
)
SELECT *
FROM ExperiencedEmployees;

WITH DuplicateEmployees AS (
    SELECT *,
    ROW_NUMBER() OVER(
    PARTITION BY EmployeeName,DepartmentID,Salary
    ORDER BY EmployeeID
    ) AS rn
    FROM Employees
)
SELECT *
FROM DuplicateEmployees
WHERE rn > 1;

WITH DuplicateEmployees AS (
    SELECT *,
    ROW_NUMBER() OVER(
    PARTITION BY EmployeeName,DepartmentID,Salary
    ORDER BY EmployeeID
    ) AS rn
    FROM Employees
)
DELETE FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM DuplicateEmployees
    WHERE rn > 1
);
