- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME:
-- USN:
-- SECTION:

SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database bcalab1;
use bcalab1;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace
Create table students
(StudentID varchar(10) primary key,
firstname varchar(15),
lastname varchar(10),
email varchar(12)unique,
dob date
);

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(10)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''*/


-- Alter the table and 2 new columns
alter table students add(gender varchar(2),age int);

desc students;

/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(10)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'gender', 'varchar(2)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''*/

-- Modify a column data type
alter table students modify lastname varchar(15);
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(10)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'gender', 'varchar(2)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''-- */

desc students;
-- Rename a column
alter table students RENAME COLUMN lastname to surname;
desc students ;
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'surname', 'varchar(10)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'gender', 'varchar(2)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''*/

-- Drop a column
alter table students DROP COLUMN surname;
desc students ;
/*StudentID varchar(10) NO PRI
firstname varchar(15) YES
email varchar(12) YES UNI
dob date YES
gender varchar(2) YES
age int YES*/
-- Rename the table
alter table students RENAME to studentDetails ;
desc students ;
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(15)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''*/

-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table courses
( corsesID varchar(10) primary key,
coursename varchar(10),
credits INT
);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :

-- Alter the table and 2 new columns
alter table courses add(department varchar(100), instructorname varchar(15)) ;
desc courses ;

/*'corsesID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'coursename', 'varchar(10)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'department', 'varchar(100)', 'YES', '', NULL, ''
'instructorname', 'varchar(15)', 'YES', '', NULL, ''*/

-- Modify a column data type
alter table courses modify credits decimal(2,1) ;
desc courses ;

/*'corsesID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'coursename', 'varchar(10)', 'YES', '', NULL, ''
'credits', 'decimal(2,1)', 'YES', '', NULL, ''
'department', 'varchar(100)', 'YES', '', NULL, ''
'instructorname', 'varchar(15)', 'YES', '', NULL, ''*/

-- Rename a column
alter table courses RENAME COLUMN coursename to subjects ;
desc courses ;
/*'corsesID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'subjects', 'varchar(10)', 'YES', '', NULL, ''
'credits', 'decimal(2,1)', 'YES', '', NULL, ''
'department', 'varchar(100)', 'YES', '', NULL, ''
'instructorname', 'varchar(15)', 'YES', '', NULL, ''*/

-- Drop a column
alter table courses DROP COLUMN subjects ;
desc courses ;
/*'corsesID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'credits', 'decimal(2,1)', 'YES', '', NULL, ''
'department', 'varchar(100)', 'YES', '', NULL, ''
'instructorname', 'varchar(15)', 'YES', '', NULL, ''*/

-- Rename the table
RENAME TABLE courses to university ;

desc university ;
/*'corsesID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'credits', 'decimal(2,1)', 'YES', '', NULL, ''
'department', 'varchar(100)', 'YES', '', NULL, ''
'instructorname', 'varchar(15)', 'YES', '', NULL, ''*/


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table enrollments
( enrollmentID varchar(10) primary key,
studentID varchar(10),
courseID varchar(10),
enrollmentdate date
);



DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*'enrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'studentID', 'varchar(10)', 'YES', '', NULL, ''
'courseID', 'varchar(10)', 'YES', '', NULL, ''
'enrollmentdate', 'date', 'YES', '', NULL, ''*/


-- Alter the table and 2 new columns
alter table enrollments add(grade varchar(2), semester varchar(20));
desc enrollments;

/*'enrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'studentID', 'varchar(10)', 'YES', '', NULL, ''
'courseID', 'varchar(10)', 'YES', '', NULL, ''
'enrollmentdate', 'date', 'YES', '', NULL, ''
'grade', 'varchar(2)', 'YES', '', NULL, ''
'semester', 'varchar(20)', 'YES', '', NULL, ''*/

-- Modify a column data type
alter table enrollments modify studentID INT ;
desc enrollments ;

/*'enrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'studentID', 'int', 'YES', '', NULL, ''
'courseID', 'varchar(10)', 'YES', '', NULL, ''
'enrollmentdate', 'date', 'YES', '', NULL, ''
'grade', 'varchar(2)', 'YES', '', NULL, ''
'semester', 'varchar(20)', 'YES', '', NULL, ''*/

-- Rename a column
alter table enrollments RENAME COLUMN courseID to studentname ;
desc enrollments ;

/*'enrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'studentID', 'int', 'YES', '', NULL, ''
'studentname', 'varchar(10)', 'YES', '', NULL, ''
'enrollmentdate', 'date', 'YES', '', NULL, ''
'grade', 'varchar(2)', 'YES', '', NULL, ''
'semester', 'varchar(20)', 'YES', '', NULL, ''*/


-- Drop a column
alter table enrollments DROP COLUMN studentname ;
desc enrollments ;

/*enrollmentID	varchar(10)	NO	PRI		
studentID	int	YES			
enrollmentdate	date	YES			
grade	varchar(2)	YES			
semester	varchar(20)	YES	*/		
-- Rename the table
RENAME TABLE enrollments to course ;
desc course ;

-- Task 4: Alter the Students Table
alter table students ;
desc students ; 

/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(15)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''*/

-- Add a column 'PhoneNumber' to store student contact numbers.
alter table students add(phoneno varchar(15));
desc students ; 
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(15)', 'YES', '', NULL, ''
'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'phoneno', 'varchar(15)', 'YES', '', NULL, ''*/


-- Write your SQL query below Codespace:

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table university modify credits decimal(4,2);
desc university;
/*'corsesID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'credits', 'decimal(4,2)', 'YES', '', NULL, ''
'department', 'varchar(100)', 'YES', '', NULL, ''
'instructorname', 'varchar(15)', 'YES', '', NULL, ''*/


-- Task 6: Drop Tables


SHOW TABLES; -- Before dropping the table
SHOW TABLES;
/*enrollment
studentdetails
students
university*/


-- Drop the 'Courses' and 'Enrollments' tables from the database.
DROP TABLE if exists university ;
DROP TABLE if exists  students ;

-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course
/*'course'
'enrollment'
'studentdetails'*/


-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
