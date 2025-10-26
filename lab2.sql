-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
create database university;
use university;

-- Write your SQL query below Codespace:

-- Task 1: Create the Tables under this system (min 5 tables)
 -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
 CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    HOD VARCHAR(100),
    ContactEmail VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Location VARCHAR(100)
);
desc departments;
/*'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(100)', 'NO', '', NULL, ''
'HOD', 'varchar(100)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(100)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''
'Location', 'varchar(100)', 'YES', '', NULL, ''*/

  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    DepartmentID INT,
    Duration VARCHAR(50),
    Fee DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
desc course;

/*'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(100)', 'NO', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(50)', 'YES', '', NULL, ''
'Fee', 'decimal(10,2)', 'YES', '', NULL, ''*/


  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    DateOfBirth DATE,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
desc students;
/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(100)', 'YES', '', NULL, ''
'LastName', 'varchar(100)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', '', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''*/


  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100),
    DepartmentID INT,
    Qualification VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
desc faculty;
/*'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(100)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(100)', 'YES', '', NULL, ''
'Email', 'varchar(100)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''*/


  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
  CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(20),
    Year INT,
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
desc enrollments;
/*'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(20)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''*/

-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output 

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
ALTER TABLE Departments
ADD EstablishedYear INT,
ADD Website VARCHAR(255);
desc departments;
/*'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(100)', 'NO', '', NULL, ''
'HOD', 'varchar(100)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(100)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''
'Location', 'varchar(100)', 'YES', '', NULL, ''
'EstablishedYear', 'int', 'YES', '', NULL, ''
'Website', 'varchar(255)', 'YES', '', NULL, ''*/
ALTER TABLE Course
ADD CourseType VARCHAR(50),
ADD MaxEnrollment INT;
desc course;

ALTER TABLE Students
ADD Gender VARCHAR(10),
ADD EnrollmentDate DATE;
desc students;

ALTER TABLE Faculty
ADD JoiningDate DATE,
ADD Salary DECIMAL(10,2);
desc faculty;

ALTER TABLE Enrollments
ADD EnrollmentDate DATE,
ADD Status VARCHAR(20);
desc enrollments;

-- 02: Modify the existing column from each table
ALTER TABLE Departments
MODIFY PhoneNumber VARCHAR(15) not null ;
desc departments;

ALTER TABLE Course
MODIFY Credits INT NULL;
desc course;

ALTER TABLE Students
MODIFY Email VARCHAR(100) UNIQUE;
desc students ;

ALTER TABLE Faculty
MODIFY Email VARCHAR(100) NOT NULL;
desc faculty;
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
