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
INSERT INTO worker (worker_Id, fname, lname, salary, joining, department) VALUES 
(1, 'Monica', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

select * from worker;

create table bonus(
worker_ref_Id INT,
bonus_amount INT,
bonus_date DATETIME,
FOREIGN KEY (worker_ref_Id)
  references worker(worker_Id) 
   on delete cascade
);
insert into bonus(worker_ref_Id, bonus_amount, bonus_date) values
(1, 5000, '2023-06-01 09:00:00'),
(2, 3000, '2023-06-05 14:30:00'),
(3, 8000, '2023-06-07 11:15:00'),
(4, 6000, '2023-06-10 16:45:00'),
(5, 4000, '2023-06-12 10:00:00');
select * from bonus;
create table title(
worker_ref_Id INT,
worker_title VARCHAR(255),
affected_from datetime,
foreign key (worker_ref_Id) 
references worker(worker_Id)
on delete cascade
);
INSERT INTO title (worker_ref_Id, worker_title, affected_from) VALUES
(1, 'Manager', '2023-06-01 09:00:00'),
(2, 'Supervisor', '2023-06-05 14:30:00'),
(3, 'Assistant Manager', '2023-06-07 11:15:00'),
(4, 'Director', '2023-06-10 16:45:00'),
(5, 'Coordinator', '2023-06-12 10:00:00');

