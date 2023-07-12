create database practiceTopQuestions;
use org;
CREATE TABLE Employees (
    EmpId INT,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees (EmpId, EmpFname, EmpLname, Department, Salary)
VALUES 
    (1, 'John', 'Smith', 'Sales', 50000.00),
    (2, 'Lisa', 'Johnson', 'Marketing', 60000.00),
    (3, 'Michael', 'Brown', 'Finance', 70000.00),
    (4, 'Sarah', 'Davis', 'HR', 55000.00),
    (5, 'Robert', 'Wilson', 'IT', 65000.00);
    
INSERT INTO Employees (EmpId, EmpFname, EmpLname, Department, Salary)
VALUES (2, 'Don', 'mith', 'Sales', 30000.00);
INSERT INTO Employees (EmpId, EmpFname, EmpLname, Department, Salary)
VALUES (6, 'Don', 'mith', 'Finance', 30000.00);
/*third highest salary*/
select * from Employees order by salary desc limit 2,1;
/*third highest salary* without using top or limit clause The subquery (SELECT COUNT(DISTINCT salary) FROM Employees e2 WHERE e1.salary > e2.salary) 
is evaluated for each row in the outer query. So, for every row in the "Employees" table (e1), it calculates the number o*/
select salary from Employees e1 where 3-1=
(select count(distinct salary) from Employees e2  where e2.salary>e1.salary);
/* find number of duplicate value */
select *, count(EmpId) from employees group by EmpId
Having count(EmpId)>1;
/* query to calculate even and odd records from a table by using mod function*/
/* even */
select * from employees where mod(EmpId,2)=0;
/* odd */
select * from employees where mod(EmpId,2)=1; 
/* Write a query to display first and last record from EmployeeInfo table*/
/* first record */
select *,min(EmpId) from employees;
select * from Employees where EmpId =( select  min(empId) from employees);
/* last record */
select * from employees where empid=( select max(empid) from employees);
/* copy all rows of a table using SQL query */
create table employeeDetail as select * from employees;
select * from employeeDetail;
create table EmpSalary as select empId, salary from employees;
select * from EmpSalary;
/* if you just want to copy schema of the table then use this */
create table scheme as select * from employees where 1=2;
select * from scheme;
/*Wrie a query to retrieve the list of employees working in same deaprtment;
select *, count(distinct department) from employees group by department having count( department)>1;
select distinct e.empid, e.EmpFname,e.department from Employees as e, employees as e1 where e.department=e1.department and e.empid!=e1.empid;
/*Write a query to retrieve the last 3 records from the table */
select * from (select * from employees order by empid desc limit 3) employees order by empid asc;
select * from employees;
/* fetch details of employees whose name ends with alphabet 'a' and contains 5 alphabets by using operator like and wildcard underscore "_"*/
select * from employees where empLname like '_____n';
select * from employees where empLname like 'M%'; /* starts with m*/