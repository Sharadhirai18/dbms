-- STUDENT NAME: Sharadhi Rai
-- USN: 1RUA24BCA0080
-- SECTION: A
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       
      /* DATABASE*/
       create database student;
       use student;
       
       create table stud(
       stid int primary key,
       sname varchar(20),
       email varchar(30)
       );
       
       Alter table stud add ( Marks_1 int , Marks_2 int , Marks_3 int );
       DESC stud;

insert into stud values(107 ,'Sharadhi Rai', 'sharadhirai18@gmail.com',97 , 94 ,95 );
insert into stud values(116,'Rahul ', 'rahulraj623@gmail.com' ,97 , 33 ,79 );
insert into stud values(108,'Alen','alenwalker5363@gmail.com' ,74 , 44 ,95 );
insert into stud values(113,'vishnu', 'vishnu@gmail.com'  ,97 , 77,68 );
insert into stud values(129 ,'Yash', 'yashrocks9292@gmail.com' ,97 , 89,78 );
insert into stud values(137,'Rithvik', 'rithvikk444@gmail.com'  ,83 , 56,79 );
insert into stud values(145 ,'Dharma', 'dharma679@gmail.com' ,95 , 28 ,65 );
       Select * from stud;

alter table stud add(Average int ,Total int ,Result varchar(10));
Select * from stud;

update stud set Average = (Marks_1 + Marks_2 + Marks_3)/3 ;
Select * from stud;

update stud set Total = Marks_1 + Marks_2 + Marks_3 ;
Select * from Stud;

update stud set  Result = 'Pass'
where Marks_1 >=35 and Marks_2 >=35 and Marks_3 >=35 ;

update stud set  Result = 'Fail'
where Marks_1 < 35 or Marks_2 < 35 or Marks_3 < 35 ;

Select * from stud;