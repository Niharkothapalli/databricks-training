drop table if exists employees;
drop table if exists orders;

create table employees (
    emp_id int,
    emp_name varchar(50),
    department varchar(50),
    salary int,
    join_date date
);

insert into employees values
(1, 'Amit', 'Chennai', 2000, '2023-01-01'),
(2, 'Ravi', 'Hyderabad', 1500, '2023-01-02'),
(3, 'Sneha', 'Chennai', 3000, '2023-01-03'),
(4, 'Kiran', 'Bangalore', 2500, '2023-01-04'),
(5, 'Priya', 'Chennai', 2000, '2023-01-05'),
(6, 'Arjun', 'Hyderabad', 1800, '2023-01-06'),
(7, 'Neha', 'Bangalore', 2200, '2023-01-07'),
(8, 'Vikas', 'Chennai', 3000, '2023-01-08'),
(9, 'Anjali', 'Hyderabad', 1700, '2023-01-09'),
(10, 'Rahul', 'Bangalore', 2600, '2023-01-10'),
(11, 'Suresh', 'Chennai', 2800, '2023-01-11'),
(12, 'Pooja', 'Hyderabad', 1600, '2023-01-12'),
(13, 'Manoj', 'Bangalore', 2400, '2023-01-13'),
(14, 'Divya', 'Chennai', 2100, '2023-01-14'),
(15, 'Karthik', 'Hyderabad', 1900, '2023-01-15'),
(16, 'Meena', 'Bangalore', 2300, '2023-01-16'),
(17, 'Raj', 'Chennai', 2700, '2023-01-17'),
(18, 'Simran', 'Hyderabad', 2000, '2023-01-18'),
(19, 'Deepak', 'Bangalore', 2500, '2023-01-19'),
(20, 'Nisha', 'Chennai', 2600, '2023-01-20');

-- using orders table (employees table used as orders based on context)
-- order_id = emp_id, city = department, order_amount = salary, order_date = join_date


-- ROW_NUMBER() questions

-- assign unique row number to all employees based on salary highest first
select emp_name, department, salary,
row_number() over (order by salary desc) as row_num
from employees;

-- assign row numbers within each department based on salary descending
select emp_name, department, salary,
row_number() over (partition by department order by salary desc) as row_num
from employees;

-- assign row numbers based on joining date latest first
select emp_name, join_date,
row_number() over (order by join_date desc) as row_num
from employees;

-- assign row numbers within each department based on earliest joining date
select emp_name, department, join_date,
row_number() over (partition by department order by join_date asc) as row_num
from employees;

-- assign row numbers to orders based on order date
select emp_id as order_id, emp_name as customer, join_date as order_date,
row_number() over (order by join_date) as row_num
from employees;

-- assign row numbers to orders within each city based on order amount highest first
select emp_name as customer, department as city, salary as order_amount,
row_number() over (partition by department order by salary desc) as row_num
from employees;

-- assign row numbers to employees based on salary lowest first
select emp_name, salary,
row_number() over (order by salary asc) as row_num
from employees;

-- assign row numbers within department based on name alphabetically
select emp_name, department,
row_number() over (partition by department order by emp_name asc) as row_num
from employees;


-- RANK() questions

-- rank all employees based on salary highest first
select emp_name, salary,
rank() over (order by salary desc) as salary_rank
from employees;

-- rank employees within each department based on salary
select emp_name, department, salary,
rank() over (partition by department order by salary desc) as salary_rank
from employees;

-- rank employees based on joining date latest gets rank 1
select emp_name, join_date,
rank() over (order by join_date desc) as date_rank
from employees;

-- rank orders based on order amount highest first
select emp_name as customer, salary as order_amount,
rank() over (order by salary desc) as amount_rank
from employees;

-- rank orders within each city based on order amount
select emp_name as customer, department as city, salary as order_amount,
rank() over (partition by department order by salary desc) as amount_rank
from employees;

-- rank employees within department based on salary lowest first
select emp_name, department, salary,
rank() over (partition by department order by salary asc) as salary_rank
from employees;

-- rank employees based on name alphabetically
select emp_name,
rank() over (order by emp_name asc) as name_rank
from employees;

-- rank orders within each city based on order date
select emp_name as customer, department as city, join_date as order_date,
rank() over (partition by department order by join_date asc) as date_rank
from employees;


-- DENSE_RANK() questions

-- assign dense rank to employees based on salary highest first
select emp_name, salary,
dense_rank() over (order by salary desc) as dense_rnk
from employees;

-- assign dense rank within each department based on salary
select emp_name, department, salary,
dense_rank() over (partition by department order by salary desc) as dense_rnk
from employees;

-- assign dense rank to employees based on joining date
select emp_name, join_date,
dense_rank() over (order by join_date asc) as dense_rnk
from employees;

-- assign dense rank to orders based on order amount
select emp_name as customer, salary as order_amount,
dense_rank() over (order by salary desc) as dense_rnk
from employees;

-- assign dense rank within each city based on order amount
select emp_name as customer, department as city, salary as order_amount,
dense_rank() over (partition by department order by salary desc) as dense_rnk
from employees;

-- assign dense rank to employees based on salary lowest first
select emp_name, salary,
dense_rank() over (order by salary asc) as dense_rnk
from employees;

-- assign dense rank within department based on joining date
select emp_name, department, join_date,
dense_rank() over (partition by department order by join_date asc) as dense_rnk
from employees;

-- assign dense rank to orders based on order date
select emp_name as customer, join_date as order_date,
dense_rank() over (order by join_date asc) as dense_rnk
from employees;
