create database practicetopQuestions2;
use practicetopQuestions2;
CREATE TABLE `EmployeeDetail` (
`id` int(11) NOT NULL,
`name` varchar(265) NOT NULL,
`email` varchar(265) NOT NULL,
`department` varchar(265) NOT NULL,
`salary` int(11) NOT NULL,
`DOB` date NOT NULL,
`gender` varchar(265) NOT NULL,
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
select * from employeedetail;
INSERT INTO `employeedetail` (`Id`, `name`, `email`, `department`, `salary`, `DOB`,`gender`) VALUES
('1', 'Karan Mehta', 'Karan@gmail.com','HR', '300000', '1998-05-10','M'),
('2', 'Rohit Sharma', 'Rohit@gmail.com','Admin', '75000', '1997-01-25','M'),
('3', 'Ankush Rajput', 'Ankush@gmail.com','Accounts', '60000', '1998-02-09','M'),
('4', 'Priyanshi Sharma', 'Priyanshi@gmail.com','HR', '500000', '1998-06-15','F'),
('5', 'Sanket Gupta', 'Sanket@gmail.com','Developer', '100000', '1997-05-07','M'),
('6', 'Shruti Kapoor', 'Shruti@gmailcom','Admin', '80000', '1995-11-26','F'),
('7', 'Rohit Sharma', 'Rohit@gmail.com','Admin', '75000', '1997-01-25','M'),
('8', 'Sanket Gupta','Sanket@gmail.com', 'Developer', '100000', '1997-05-07','M'),
('9', 'Geet Gour','Geet@gmail.com', 'Tester', '17000', '1998-07-03','F');
/* write a query to delete the duplicate record from table*/
/* here we are using concept of self join, it uses concept og inner join */
SET SQL_SAFE_UPDATES = 0;
delete e1
from employeedetail as e1 inner join employeedetail as e2 
on e1.email=e2.email
and e1.id<e2.id;
select * from employeedetail;
/* query to retieve the first four characters of employee name from the table*/
/* using subtring function extarct a substring from the text(start at position 1, extract 4 characters)
the first letter starts from position 1 not 0 */
select substring(name,1,4) from employeedetail;
/* find number of employees whose DOB is between 01/01/1995 to 30/06/1998 and are grouped according to gender*/
select count(*), gender from employeedetail where dob
between '1995/01/01' and '1998/06/30' group by gender;
/* use str_to_date function, use this*/
select count(*), gender from employeedetail where dob
between 
str_to_date('01/01/1995','%d/%m/%Y') /*Y, must be capital*/
and 
str_to_date('30/06/1998','%d/%m/%Y') 
group by gender;
/* write a query to fetch all the records from the table ordered by department in ascending order and salary in the desc order*/
select * from employeedetail order by department asc , salary desc;

/* fetch the detail of all the employees excluding the employees who are 'HR' and 'Admin' */
select * from employeedetail where department not in ('HR', 'Admin');
/* fetch 50% records from the employeedetail table */
/* when id is in proper sequence and no record is deleted*/
select * from employeedetail where id <= (select floor(count(id)/2) from employeedetail);
/* when record is deleted */
set @count = (select count(id)/2 from employeedetail);
prepare STMT from 'select * from employeedetail limit?';
EXECUTE STMT using @count;
SET @count = (SELECT COUNT(id)/2 FROM employeedetail);
SET @query = 'SELECT * FROM employeedetail LIMIT ?';
PREPARE stmt FROM @query;
EXECUTE stmt USING @count; /* I do not know why I am getting this wrong*/
/* write a query to display the total salary of each employee after adding 10% increment in the salary*/
 select id, name, salary+(salary/10) as TotalSalary from employeedetail;
/* Write a query to retrieve two minimum and maximum salaries; */
#for minimum salary 
select * from employeedetail order by salary;
select distinct salary from employeedetail as e1
where 2>=(select count( distinct salary) from employeedetail as e2 where e1.salary>=e2.salary)
order by e1.salary;
# how many value in e2 is lesser than or equal to value of particular row in e1
# maximum salary 
select distinct salary from employeedetail as e1
where 2>=(select count( distinct salary ) from employeedetail as e2 where e1.salary<=e2.salary)
order by e1.salary;
#count how many value in e2 is greater than for particular row value of e1
/* write a query to fetch the employee name and replace the space with '-' */
select replace(name,'','-') from employeedetail;
select *, REPLACE(gender,'M','male') as detailone from employeedetail;


