create database My_Sql;
-- drop database My_Sql;
use My_Sql ;
create table student(
StudentName varchar(255),
StudentID int ,
BirthDate varchar(255),
Year varchar(255),
MoblieNo int
);
insert into student (StudentName, StudentID, BirthDate, Year, MoblieNo )
values ('Jane', 235, '12/1/1987', 'YIS2', 0722245321),
('Nicholas', 26, '22/7/2002', 'YIS1', 0720458674),
('Cyrus', 1, '15/6/1989', 'Y2S1', 0704231345),
('Neema', 2, '29/11/2008', 'Y2S1', 0733876987),
('Caroline', 3, '18/10/2002', 'YIS1', 0732568448),
('Judith', 29, '17/6/2003', 'Y4S2', 0711234567),
('Grace', 127, '14/1/2004', 'YIS2', 0733765987);
select * from student;

create table Finance(
StudentID int,
Tuition_Fee int, 
Administration_Fee int, 
Exams_Fee int, 
Medical_Fee int
);
insert into Finance (StudentID, Tuition_Fee, Administration_Fee, Exams_Fee, Medical_Fee)
values ( 235, 30000, 5000, 3000, 4000),
( 26, 40000, 5000, 2000, 4000),
( 1, 34000, 5000, 3000, 4000),
( 2, 23000, 5000, 3000, 4000),
( 3, 20000, 5000, 3000, 4000),
( 29, 35000, 5000, 2000, 4000),
( 127, 28000, 5000, 3000, 4000);
select *  from Finance;
-- Part(i)
select *
from student
join Finance
on student.StudentID = Finance.StudentID;
select * from student where Year = 'Y1S1';

-- Part (ii)
select 
    student.StudentName,
    student.StudentID,
    student.Year,
    Finance.Tuition_Fee
from 
    student
join 
    Finance
on
    student.StudentID = Finance.StudentID
where 
    Finance.Tuition_Fee > 30000;
    
-- Part(iv)
insert into student ( StudentName, StudentID, Birthdate, MoblieNo, Year)
 values ( 'Dan', 0 ,'20/4/2001', 'Y1S2' ,0723456123);
 select * from student;

-- Part (V)
update student set StudentName = 'Nelson' where StudentID = 26;

-- Part (vi)
select max(Tuition_Fee) as highest_amount from Finance;

select min(Tuition_Fee) as lowest_amount from Finance;



