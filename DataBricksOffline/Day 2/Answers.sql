CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);
INSERT INTO Departments VALUES
(1,'HR','New York'),
(2,'Finance','Chicago'),
(3,'IT','Dallas'),
(4,'Marketing','Boston'),
(5,'Sales','Seattle'),
(6,'Operations','Atlanta');
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);
INSERT INTO Employees VALUES
(101,'John',1,50000,NULL,'2020-01-15'),
(102,'Emma',2,65000,101,'2021-03-10'),
(103,'David',3,70000,101,'2019-07-22'),
(104,'Sophia',3,72000,103,'2022-05-01'),
(105,'Michael',5,55000,102,'2021-09-18'),
(106,'Olivia',NULL,48000,102,'2023-01-12'),
(107,'James',4,60000,103,'2022-10-20'),
(108,'William',7,75000,101,'2020-08-11'),
(109,'Ava',NULL,52000,NULL,'2024-02-15'),
(110,'Isabella',5,68000,105,'2021-06-05');
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

INSERT INTO Projects VALUES
(201,'Payroll System',1,150000),
(202,'Audit System',2,200000),
(203,'Website Redesign',4,100000),
(204,'ERP Upgrade',3,500000),
(205,'Sales Dashboard',5,175000),
(206,'Automation',6,250000),
(207,'AI Chatbot',8,300000);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

INSERT INTO EmployeeProjects VALUES
(101,201),
(102,202),
(103,204),
(104,204),
(105,205),
(107,203),
(110,205),
(103,207),
(108,207),
(109,202);

-- BASIC ASSIGNMENTS :
-- INNER JOIN
SELECT e.EmployeeName,d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON d.DepartmentID = e.DepartmentID;

SELECT p.ProjectName,d.DepartmentName
FROM Projects p
INNER JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName, p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

SELECT e.Salary,d.Location
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName,n.ProjectID,p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects n
ON e.EmployeeID = n.EmployeeID
INNER JOIN Projects p
ON p.ProjectID = n.ProjectID;

-- LEFT JOIN
SELECT e.EmployeeName,d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON d.DepartmentID = e.DepartmentID;

SELECT d.DepartmentName,COUNT(e.EmployeeName) AS No_of_Emps
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

SELECT p.ProjectName,d.DepartmentName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName,ep.ProjectID,p.ProjectName
FROM EmployeeProjects ep
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID
LEFT JOIN Projects p
ON p.ProjectID = ep.ProjectID;

SELECT e.EmployeeName,ep.ProjectID
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID;


-- RIGHT JOIN
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

SELECT p.ProjectName, e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;

SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

SELECT p.ProjectName, d.DepartmentName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

SELECT p.ProjectName, e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;


-- FULL JOIN
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

SELECT d.DepartmentName, p.ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

SELECT e.EmployeeName, p.ProjectName
FROM Employees e
FULL OUTER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL OUTER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

SELECT d.DepartmentName, e.EmployeeName
FROM Departments d
FULL OUTER JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

SELECT d.DepartmentName, p.ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID;



-- INTERMEDIATE ASSIGNMENTS :

-- INNER JOIN
SELECT e.EmployeeName,d.DepartmentName
FROM Departments d
INNER JOIN Employees e
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName = 'IT';

SELECT e.EmployeeName,p.ProjectName,p.Budget
FROM EmployeeProjects ep
INNER JOIN Employees e
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects P
ON p.ProjectID = ep.ProjectID
WHERE p.Budget > 200000;

SELECT e.EmployeeName,p.ProjectName,d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p 
ON p.ProjectID = ep.ProjectID;

SELECT d.DepartmentName,COUNT(EmployeeID)
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

SELECT  d.DepartmentName,AVG(Salary)
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- LEFT JOIN
SELECT e.EmployeeName,d.DepartmentName
FROM Employees e
LEFT JOIN Departments d 
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentName IS NULL;

SELECT d.DepartmentName,COUNT(e.EmployeeID) AS no_of_emps
FROM Departments d 
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING no_of_emps = 0;

SELECT p.ProjectName,d.DepartmentName
FROM Projects p
LEFT JOIN Departments d
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentName IS NULL;

SELECT d.DepartmentName,COUNT(e.EmployeeID)
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- RIGHT JOIN
SELECT d.DepartmentName,COUNT(e.EmployeeID) AS no_of_emp
FROM Employees e
RIGHT JOIN Departments d
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING no_of_emp = 0;

SELECT p.ProjectName,e.EmployeeID
FROM Employees e
RIGHT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
RIGHT JOIN Projects p
ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID IS NULL;

SELECT d.DepartmentName,p.ProjectName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

SELECT d.DepartmentName,COUNT(e.EmployeeID)
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

SELECT p.ProjectName, e.EmployeeName
FROM Employees e
RIGHT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- ADVANCED ASSIGNMENTS:
-- INNER JOIN
SELECT e.EmployeeName,d.Department,MAX(e.Salary)
FROM Employees e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

SELECT d.DepartmentName,AVG(e.Salary) AS avg_salary
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY avg_salary DESC
LIMIT 1;

SELECT e.EmployeeName,p.ProjectName,p.Budget
FROM EmployeeProjects ep
INNER JOIN Employees e
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p 
ON p.ProjectID = ep.ProjectID
WHERE p.Budget = (
    SELECT MAX(Budget)
    FROM Projects
);

SELECT e.EmployeeName,m.EmployeeName AS Manager
FROM Employees e
INNER JOIN Employees m
ON m.EmployeeID = e.ManagerID;

SELECT e.EmployeeName,COUNT(p.ProjectID) AS noof_projects
FROM Employees e
INNER JOIN EmployeeProjects p
ON e.EmployeeID = p.EmployeeID
GROUP BY e.EmployeeName
HAVING noof_projects > 1;


-- LEFT JOIN
SELECT e.EmployeeName,p.ProjectID
FROM Employees e
LEFT JOIN EmployeeProjects p
ON e.EmployeeID = p.EmployeeID
WHERE p.ProjectID IS NULL;

SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

SELECT DISTINCT d.DepartmentID, d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE e.EmployeeID IS NOT NULL
AND p.ProjectID IS NULL;

SELECT
    e.EmployeeID,
    e.EmployeeName,
    COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName;

SELECT
    d.DepartmentName,
    COUNT(p.ProjectID) AS ProjectCount
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;


-- RIGHT JOIN
SELECT p.*
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

SELECT d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

SELECT p.*
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;

SELECT e.*
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


-- LEFT ANTI JOIN
SELECT e.*
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

SELECT e.EmployeeName, ep.ProjectID
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

SELECT p.*
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- RIGHT ANTI JOIN
SELECT d.*
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

SELECT p.*
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

SELECT d.*
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

SELECT e.*
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;

SELECT p.*
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;


-- FULL ANTI JOIN
SELECT *
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
OR d.DepartmentID IS NULL;

SELECT *
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
OR e.DepartmentID IS NULL;

SELECT *
FROM Projects p
FULL JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.DepartmentID IS NULL
OR d.DepartmentID IS NULL;

SELECT *
FROM Employees e
FULL JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE e.EmployeeID IS NULL
OR ep.EmployeeID IS NULL;

SELECT *
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
OR d.DepartmentID IS NULL;


-- EXPERT LEVEL
SELECT
    d.DepartmentName,
    SUM(p.Budget) AS TotalBudget
FROM Departments d
JOIN Projects p
ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalBudget DESC
LIMIT 1;

SELECT e.*
FROM Employees e
LEFT JOIN Projects p
ON e.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

SELECT
    p.ProjectID,
    p.ProjectName,
    COUNT(ep.EmployeeID) AS EmployeeCount
FROM Projects p
JOIN EmployeeProjects ep
ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectID, p.ProjectName
HAVING COUNT(ep.EmployeeID) > 1;

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE e.DepartmentID <> p.DepartmentID;

SELECT d.DepartmentName
FROM Departments d
WHERE NOT EXISTS (
    SELECT *
    FROM Employees e
    WHERE e.DepartmentID = d.DepartmentID
    AND NOT EXISTS (
        SELECT *
        FROM EmployeeProjects ep
        WHERE ep.EmployeeID = e.EmployeeID
    )
);

SELECT
    m.EmployeeName AS Manager,
    e.EmployeeName AS Employee
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
ORDER BY m.EmployeeName;

SELECT DISTINCT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
AND e.EmployeeID IN (
    SELECT DISTINCT ManagerID
    FROM Employees
    WHERE ManagerID IS NOT NULL
)
WHERE e.EmployeeID IS NULL;

SELECT
    m.EmployeeName,
    COUNT(e.EmployeeID) AS TeamSize
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
GROUP BY m.EmployeeID, m.EmployeeName
HAVING COUNT(e.EmployeeID) > 3;

SELECT
    e.EmployeeName,
    m.EmployeeName AS ManagerName
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
WHERE e.HireDate < m.HireDate;

SELECT
    e.EmployeeName,
    d.DepartmentName,
    p.ProjectName,
    p.Budget,
    m.EmployeeName AS ManagerName,
    e.Salary,
    d.Location
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;

-- UNION
Table 1: CurrentEmployees

CREATE TABLE CurrentEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

Insert Values
INSERT INTO CurrentEmployees VALUES
(101,'John','HR',50000),
(102,'Emma','Finance',65000),
(103,'David','IT',70000),
(104,'Sophia','IT',72000),
(105,'Michael','Sales',55000),
(106,'Olivia','Marketing',48000),
(107,'James','Marketing',60000),
(108,'William','IT',75000),
(109,'Ava','Finance',52000),
(110,'Isabella','Sales',68000);

Table 2: FormerEmployees

CREATE TABLE FormerEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

Insert Values
INSERT INTO FormerEmployees VALUES
(105,'Michael','Sales',55000),
(106,'Olivia','Marketing',48000),
(111,'Lucas','HR',45000),
(112,'Mia','Finance',62000),
(113,'Ethan','IT',71000),
(114,'Charlotte','Sales',53000),
(115,'Benjamin','Operations',59000),
(116,'Amelia','HR',51000),
(117,'Henry','Finance',67000),
(118,'Harper','IT',73000);

Notice:

Employees 105 and 106 appear in both tables.
Other records are unique.

Table 3: DomesticCustomers

CREATE TABLE DomesticCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

Insert Values

INSERT INTO DomesticCustomers VALUES
(1,'ABC Ltd','New York'),
(2,'XYZ Corp','Chicago'),
(3,'Global Tech','Dallas'),
(4,'Sunrise Inc','Boston'),
(5,'Bright Solutions','Seattle'),
(6,'Alpha Systems','Miami');

Table 4: InternationalCustomers

CREATE TABLE InternationalCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

Insert Values

INSERT INTO InternationalCustomers VALUES
(4,'Sunrise Inc','Boston'),
(5,'Bright Solutions','Seattle'),
(7,'TechWorld','London'),
(8,'Future Corp','Toronto'),
(9,'Vision Ltd','Dubai'),
(10,'Skyline LLC','Sydney');

Note:
Customer IDs 4 and 5 exist in both tables.

Table 5: OnlineOrders

CREATE TABLE OnlineOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

Insert Values

INSERT INTO OnlineOrders VALUES
(1001,1,250),
(1002,2,450),
(1003,3,700),
(1004,5,900),
(1005,7,350),
(1006,8,1200);

Table 6: StoreOrders

CREATE TABLE StoreOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

Insert Values

INSERT INTO StoreOrders VALUES
(1004,5,900),
(1005,7,350),
(1007,2,600),
(1008,3,400),
(1009,9,1100),
(1010,10,850);
SELECT EmployeeName
FROM CurrentEmployees
UNION
SELECT EmployeeName
FROM FormerEmployees;

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees;

SELECT CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerName
FROM InternationalCustomers;

SELECT City
FROM DomesticCustomers
UNION
SELECT City
FROM InternationalCustomers;

SELECT Amount
FROM OnlineOrders
UNION
SELECT Amount
FROM StoreOrders;


-- UNION ALL
SELECT EmployeeName
FROM CurrentEmployees
UNION ALL
SELECT EmployeeName
FROM FormerEmployees;

SELECT Department
FROM CurrentEmployees
UNION ALL
SELECT Department
FROM FormerEmployees;

SELECT CustomerName
FROM DomesticCustomers
UNION ALL
SELECT CustomerName
FROM InternationalCustomers;

SELECT City
FROM DomesticCustomers
UNION ALL
SELECT City
FROM InternationalCustomers;

SELECT Amount
FROM OnlineOrders
UNION ALL
SELECT Amount
FROM StoreOrders;


-- EXCEPT
SELECT *
FROM CurrentEmployees
EXCEPT
SELECT *
FROM FormerEmployees;

SELECT *
FROM FormerEmployees
EXCEPT
SELECT *
FROM CurrentEmployees;

SELECT *
FROM DomesticCustomers
EXCEPT
SELECT *
FROM InternationalCustomers;

SELECT *
FROM OnlineOrders
EXCEPT
SELECT *
FROM StoreOrders;

SELECT Department
FROM CurrentEmployees
EXCEPT
SELECT Department
FROM FormerEmployees;


-- INTERSECT
SELECT *
FROM CurrentEmployees
INTERSECT
SELECT *
FROM FormerEmployees;

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;

SELECT *
FROM DomesticCustomers
INTERSECT
SELECT *
FROM InternationalCustomers;

SELECT City
FROM DomesticCustomers
INTERSECT
SELECT City
FROM InternationalCustomers;

SELECT *
FROM OnlineOrders
INTERSECT
SELECT *
FROM StoreOrders;


-- INTERMEDIATE - UNION
SELECT EmployeeID, EmployeeName
FROM CurrentEmployees
UNION
SELECT EmployeeID, EmployeeName
FROM FormerEmployees;

SELECT CustomerID, CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerID, CustomerName
FROM InternationalCustomers;

SELECT Salary
FROM CurrentEmployees
UNION
SELECT Salary
FROM FormerEmployees;

SELECT OrderID
FROM OnlineOrders
UNION
SELECT OrderID
FROM StoreOrders;

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees;


-- INTERMEDIATE - UNION ALL
SELECT COUNT(*)
FROM (
    SELECT *
    FROM CurrentEmployees
    UNION ALL
    SELECT *
    FROM FormerEmployees
) AS TotalEmployees;

SELECT *
FROM DomesticCustomers
UNION ALL
SELECT *
FROM InternationalCustomers;

SELECT Salary
FROM CurrentEmployees
UNION ALL
SELECT Salary
FROM FormerEmployees;

SELECT City
FROM DomesticCustomers
UNION ALL
SELECT City
FROM InternationalCustomers;

SELECT Amount
FROM OnlineOrders
UNION ALL
SELECT Amount
FROM StoreOrders;


-- INTERMEDIATE - EXCEPT
SELECT EmployeeID
FROM CurrentEmployees
EXCEPT
SELECT EmployeeID
FROM FormerEmployees;

SELECT EmployeeID
FROM FormerEmployees
EXCEPT
SELECT EmployeeID
FROM CurrentEmployees;

SELECT CustomerID
FROM DomesticCustomers
EXCEPT
SELECT CustomerID
FROM InternationalCustomers;

SELECT CustomerID
FROM InternationalCustomers
EXCEPT
SELECT CustomerID
FROM DomesticCustomers;

SELECT OrderID
FROM OnlineOrders
EXCEPT
SELECT OrderID
FROM StoreOrders;


-- INTERMEDIATE - INTERSECT
SELECT EmployeeID
FROM CurrentEmployees
INTERSECT
SELECT EmployeeID
FROM FormerEmployees;

SELECT CustomerID
FROM DomesticCustomers
INTERSECT
SELECT CustomerID
FROM InternationalCustomers;

SELECT OrderID
FROM OnlineOrders
INTERSECT
SELECT OrderID
FROM StoreOrders;

SELECT Salary
FROM CurrentEmployees
INTERSECT
SELECT Salary
FROM FormerEmployees;

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;

-- ADVANCED - UNION
SELECT EmployeeName AS Name
FROM CurrentEmployees
UNION
SELECT CustomerName
FROM DomesticCustomers;

SELECT EmployeeName AS Name
FROM CurrentEmployees
UNION
SELECT EmployeeName
FROM FormerEmployees
UNION
SELECT CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerName
FROM InternationalCustomers;

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees
ORDER BY Department;

SELECT City AS Value
FROM DomesticCustomers
UNION
SELECT Department
FROM CurrentEmployees;

SELECT EmployeeID AS ID
FROM CurrentEmployees
UNION
SELECT CustomerID
FROM DomesticCustomers;


-- ADVANCED - UNION ALL
SELECT *
FROM CurrentEmployees
UNION ALL
SELECT *
FROM FormerEmployees;

SELECT *
FROM OnlineOrders
UNION ALL
SELECT *
FROM StoreOrders;

SELECT *
FROM DomesticCustomers
UNION ALL
SELECT *
FROM InternationalCustomers;

SELECT
    EmployeeID,
    EmployeeName,
    'Current' AS Source
FROM CurrentEmployees
UNION ALL
SELECT
    EmployeeID,
    EmployeeName,
    'Former' AS Source
FROM FormerEmployees;

SELECT
    OrderID,
    CustomerID,
    Amount,
    'Online' AS Source
FROM OnlineOrders
UNION ALL
SELECT
    OrderID,
    CustomerID,
    Amount,
    'Store' AS Source
FROM StoreOrders;


-- ADVANCED - EXCEPT
SELECT CustomerID
FROM OnlineOrders
EXCEPT
SELECT CustomerID
FROM StoreOrders;

SELECT CustomerID
FROM StoreOrders
EXCEPT
SELECT CustomerID
FROM OnlineOrders;

SELECT EmployeeName
FROM CurrentEmployees
EXCEPT
SELECT EmployeeName
FROM FormerEmployees;

SELECT Department
FROM FormerEmployees
EXCEPT
SELECT Department
FROM CurrentEmployees;

SELECT City
FROM DomesticCustomers
EXCEPT
SELECT City
FROM InternationalCustomers;


-- ADVANCED - INTERSECT
SELECT CustomerID
FROM OnlineOrders
INTERSECT
SELECT CustomerID
FROM StoreOrders;

SELECT *
FROM CurrentEmployees
INTERSECT
SELECT *
FROM FormerEmployees;

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;

SELECT CustomerName
FROM DomesticCustomers
INTERSECT
SELECT CustomerName
FROM InternationalCustomers;

SELECT Salary
FROM CurrentEmployees
INTERSECT
SELECT Salary
FROM FormerEmployees;
