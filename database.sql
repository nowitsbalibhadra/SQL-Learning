create database org;
use org;
create table worker (
worker_Id INT NOT NULL PRIMARY KEY auto_increment,
fname VARCHAR(255) ,
lname VARCHAR(255),
salary DOUBLE ,
joining DATETIME , 
department VARCHAR(255)
);
INSERT INTO worker(worker_Id, fname, lname, salary, joining, department) values 
(001, 'Monica', 'Arora', 100000,'14-02-20 09.00.00','HR'),
(002, 'Niharika', 'Verma', 80000,'14-06-11 09.00.00','Admin'),
(003, 'Vishal', 'Singhal', 300000,'14-02-20 09.00.00','HR'),
(004, 'Amitabh', 'Singh', 500000,'14-02-20 09.00.00','Admin'),
(005, 'Vivek', 'Bhati', 500000,'14-06-11 09.00.00','Admin'),
(006, 'Vipul', 'Diwan', 200000,'14-06-11 09.00.00','Account'),
(007, 'Satish', 'Kumar', 75000,'14-01-20 09.00.00','Account'),
(008, 'Geetika', 'Chauhan', 90000,'14-04-11 09.00.00','Admin');