/*NAME : SHARADHI RAI
USN : 1RUA24BCA0080 */

CREATE DATABASE UNIVERSITY;
USE UNIVERSITY;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Class VARCHAR(10),
    Marks INT,
    City VARCHAR(50)
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Subject VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enroll (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Student (StudentID, FirstName, LastName, DOB, Class, Marks, City) VALUES
(1, 'Arjun', 'Rao', '2005-01-15', '10A', 88, 'Bengaluru'),
(2, 'Priya', 'Sharma', '2004-07-22', '10B', 92, 'Mysuru'),
(3, 'Rahul', 'Verma', '2005-01-30', '10A', 76, 'Mangaluru'),
(4, 'Sneha', 'Patil', '2004-12-05', '10C', 65, 'Hubli'),
(5, 'Kiran', 'Naik', '2005-03-11', '10B', 54, 'Shivamogga');


INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, HireDate, Salary) VALUES
(101, 'Meena', 'Kumari', 'Maths', '2015-06-12', 45000),
(102, 'Suresh', 'Iyer', 'Science', '2018-09-01', 52000),
(103, 'Anita', 'Reddy', 'English', '2012-01-20', 60000),
(104, 'Ravi', 'Shah', 'Social', '2020-03-15', 48000);


INSERT INTO Course (CourseID, CourseName, Credits) VALUES
(201, 'Maths', 4),
(202, 'Science', 3),
(203, 'English', 2),
(204, 'History', 3),
(205, 'Computer', 5);

INSERT INTO Enroll (EnrollID, StudentID, CourseID, Grade) VALUES
(301, 1, 201, 'A'),
(302, 1, 202, 'B'),
(303, 2, 201, 'A'),
(304, 3, 203, 'B'),
(305, 4, 204, 'C'),
(306, 5, 205, 'A');



SELECT * FROM Student; 


SELECT CourseName, RIGHT(CourseName, 3) AS Last3Chars
FROM Course;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Teacher;

SELECT FirstName, LastName, 
       LENGTH(FirstName) + LENGTH(LastName) AS NameLength
FROM Student;

SELECT REPLACE(CourseName, 'Maths', 'Mathematics') AS UpdatedCourseName
FROM Course;

SELECT ABS(MAX(Marks) - MIN(Marks)) AS MarksDifference
FROM Student;

SELECT FirstName, LastName, ROUND(Salary, -3) AS RoundedSalary
FROM Teacher;

SELECT CourseName, SQRT(Credits) AS CreditRoot
FROM Course;

SELECT StudentID, Marks,
       CEIL(Marks) AS CeilingValue,
       FLOOR(Marks) AS FloorValue
FROM Student;

SELECT MOD(SUM(Marks), 5) AS ModulusValue
FROM Student;

SELECT NOW() AS CurrentDateTime;

SELECT FirstName, LastName,
       YEAR(HireDate) AS HireYear,
       MONTH(HireDate) AS HireMonth
FROM Teacher;

SELECT * 
FROM Student
WHERE MONTH(DOB) = 1;

SELECT FirstName, LastName,
       DATEDIFF(CURDATE(), HireDate) AS DaysWorked
FROM Teacher;

SELECT COUNT(*) AS TotalStudents
FROM Student;

SELECT AVG(Salary) AS AverageSalary
FROM Teacher;

SELECT MAX(Marks) AS HighestMarks,
       MIN(Marks) AS LowestMarks
FROM Student;








