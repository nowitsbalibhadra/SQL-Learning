Create database rev1;
use rev1;
create table student (
id INT PRIMARY KEY,
name VARCHAR(255)
);
insert into student values(1,"bali");
select * from student;
drop database if exists rev1;