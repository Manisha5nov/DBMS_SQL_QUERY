 -- create database--
create database student;
use student;
-- create table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(30),
    course VARCHAR(30),
    dob date
);
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (student_id)
    REFERENCES Student(student_id)
);
-- insert values in table
INSERT INTO Student VALUES
(101, 'Ranjan', 20, 'Patna', 'BCA','2005-1-6'),
(102, 'Aman', 21, 'Delhi', 'BCA','2005-6-6'),
(103, 'Rahul', 22, 'Patna', 'MCA','2006-8-3'),
(104, 'Priya', 20, 'Ranchi', 'BCA','2006-8-5'),
(105, 'Neha', 23, 'Delhi', 'MCA','2004-6-4');

INSERT INTO Marks VALUES
(1, 101, 'DBMS', 85),
(2, 102, 'DBMS', 75),
(3, 103, 'DBMS', 90),
(4, 104, 'DBMS', 80),
(5, 105, 'DBMS', 95);

select * from student;
select * from marks;
update marks set subject='python' where mark_id in(2,5);
select * from student where age>20;
select * from marks where marks>80;
select * from student order by name asc;
select * from student order by name desc;
select distinct city from student;
select * from student where name like '%a';
select * from student where age between 20 and 25;
select * from student where city in ('delhi','patna');
select count(*) FROM STUDENT;
select MAX(MARKS) FROM MARKS;
select MIN(MARKS) FROM MARKS;
select SUM(MARKS) FROM MARKS;
select CITY, COUNT(*) FROM STUDENT GROUP BY CITY;
select CITY, COUNT(*) FROM STUDENT GROUP BY CITY having COUNT(*) >1;
select STUDENT.NAME , MARKS.SUBJECT FROM STUDENT inner JOIN MARKS ON STUDENT.STUDENT_ID = MARKS.STUDENT_ID;
select STUDENT.NAME , MARKS.SUBJECT FROM STUDENT LEFT JOIN MARKS ON STUDENT.STUDENT_ID=MARKS.STUDENT_ID;
select * FROM STUDENT WHERE STUDENT_ID IN (select STUDENT_ID FROM MARKS WHERE MARKS>70);
create VIEW SMARKS AS select STUDENT.NAME , MARKS.MARKS FROM STUDENT inner join MARKS ON STUDENT.STUDENT_ID = MARKS.STUDENT_ID;
select * FROM SMARKS;
alter table student rename to stu;
select * from stu;
alter table stu rename column student_id to s_id; 
alter table stu add column session varchar (12) not null;
alter table stu drop column session;
select * from stu order by name;
select name from stu order by age desc;
select * from stu order by dob;
select * from stu order by name asc , dob desc;
select * from stu where city='delhi' and name like 'n%';
select * from stu where course ='mca' and city='delhi' and name like 'n%';
select * from stu where course ='bca' and (name like 'r%' or name like 'n%');
select name , age+5 , age*2 from stu;
alter table stu modify column city varchar(50);
select * from marks where not subject='dbms';
select * from stu where name not like 'r%';
select * from marks where marks not between 60 and 90;
select * from stu where city not in ('delhi','patna');
select * from stu where city is not null ;
select * from stu where not age <22;
select * from stu where not age >22;
select * from stu limit 3;
select * from stu where age >22 limit 3;
select * from stu order by age desc limit 3;
select * from stu order by age asc limit 3;
-- aggreget
select count(name) as student_name from stu;
select sum(marks)as total_mark from marks;
select min(age)as min_mark from stu;
select max(age)as max_marks from stu;
select avg(marks)as avg_marks from marks;
select count(name) from stu where age >22;
select count(*) from stu group by city;
select age, sum(age) from stu group by age;
select sum(age*2) from stu;
select * from stu where age>(select avg(age) from stu );
select avg(age) s_id from stu group by s_id;
select * from stu where name regexp '[R]';
select * FROM STU where name not in (select name from stu where name like 'n%');
select * from stu  where age between 20 and 22 and s_id in (105,104,101);
select * from stu where age  between 20 and 22 order by s_id;
select * from stu where age  not between 20 and 22 order by s_id;
select name , concat(city,',',course,',',dob) as deteils from stu;
select stu.name , marks.marks,stu.dob from stu inner join marks on stu.s_id = marks.student_id;
select stu.name , marks.marks from stu left join marks on stu.s_id=marks.student_id order by name;
select stu.name , marks.marks from stu right join marks on stu.s_id=marks.student_id where marks>80;
create table s_copy select name, course from stu;
select * from s_copy;
select * from stu where name in (select name from marks where subject='dbms');
