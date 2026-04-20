CREATE DATABASE college_db;
USE college_db;
create table students (
id int auto_increment primary key,
name varchar(100),
age int,
course varchar(50),
marks int);
insert into students (name, age, course, marks) values
('Ravi', 20, 'bsc', 75),
('Anjali', 21, 'BCom', 82),
('Rahul', 19, 'BCA', 86),
('Sneha', 22, 'BE', 90),
('Kiran', 20, 'BSc', 77);
select * from students;
update students
set marks=56,
	course='BE'
where id=3;
select * from students
where id =3;
commit;
update students 
set marks=98,
name='dhyan',
age=25,
course='MBBS'
where id=5;
update students
set marks= marks + 5;
set sql_safe_updates=0;
create database company_db;
use company_db;
