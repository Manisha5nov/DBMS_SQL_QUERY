create database com;
use com;
create  table employee(
emp_id      int ,
name        varchar (25),
dep         varchar (25),
salary       int ,
man_id       int,
joining_date date );

create table customer (
cus_id    int,
cus_name  varchar(20));

create table orders(
order_id int,
cus_id   int,
pro_id   int);

create table product(
pro_id int,
pro_name varchar(20));
-- --insert data in employee table --
insert into employee values(101,"manisha","sales",50000,102,'2025-05,05');
insert into employee values(102,"anisha","sales",30000,101,'2025-05,08');
insert into employee values(103,"khushi","manager",40000,103,'2025-08,05');
insert into employee values(104,"neha","account",20000,104,'2025-05,07');
insert into employee values(106,"nikki","manager",40000,105,'2025-04,05');

-- --insert data in customer table --

insert into customer values(01,"sima"),(02,"rounak"),(03,"sita"),(04,"gita"),(05,"ram");

-- --insert data in orders table --

insert into orders values(010,01,001),(020,02,002),(030,03,003),(040,04,004),(050,05,005);

-- --insert data in product table --

insert into product values (001,"keyboard"),(002,"mouse"),(003,"ram"),(004,"dvd");

-- 1. Find the Second Highest Salary
select max(salary) as second_highst_salary 
from employee
where salary < (select max(salary) from employee);

-- second method
SELECT salary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 2;

-- 2. Find the Thired Highest Salary

select salary
from(select salary,
dense_rank() over (order by salary desc ) as rnkk
from employee
) t
where rnkk =3;

-- 3. Duplicate Employee Names-- 
select name , count(*) as total  from employee
group by name having count(*) >1;

-- 4. Delete Duplicate Records
DELETE FROM Employee
WHERE emp_id NOT IN (
    SELECT emp_id
    FROM (
        SELECT MIN(emp_id) AS emp_id
        FROM Employee
        GROUP BY name
    ) AS temp
);
SET SQL_SAFE_UPDATES = 0;

-- 5. Find Employees with the Highest Salary in Each Department
SELECT dep,
       name,
       salary
FROM (
    SELECT *,
           DENSE_RANK() OVER
           (PARTITION BY dep ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 1;

-- 6. Display Even Numbered Rows
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY emp_id) AS rn
    FROM Employee
) t
WHERE rn % 2 = 0;

-- 7. Display Odd Numbered Rows
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY emp_id) AS rn
    FROM Employee
) t
WHERE rn % 2 = 1;

-- 8. Find Employees Who Joined in the Last 30 Days
SELECT *
FROM Employee
WHERE joining_date >= CURDATE() - INTERVAL 30 DAY;

-- 9. Count Employees Department-wise
SELECT dep,
       COUNT(*) AS total_employees
FROM Employee
GROUP BY dep;
