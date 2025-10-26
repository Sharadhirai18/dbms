-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Sharadhi rai
-- USN: 1RUA24BCA0080
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
create database DBLab008;
use DBLab008;
-- Write your SQL query below Codespace:

-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:
create table employee (
empid INT PRIMARY KEY,
empname VARCHAR(50),
age INT,
salary DECIMAL(10,2),
designation VARCHAR(30),
address VARCHAR(100),
 date_of_join DATE
 );
 desc employee ;

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- insert 10 records to the table 
-- Write your SQL query below Codespace:
INSERT INTO employee VALUES (101,'anil',25,450000.00,'Software Engineer', 'Bangalore,India', '2021-06-15');
INSERT INTO employee VALUES (102, 'Priya ', 32, 62000.00, 'Senior Analyst', 'Mumbai, India', '2020-03-20');
INSERT INTO employee VALUES (103, 'Rahul ', 26, 48000.00, 'Data Analyst', 'Delhi, India', '2022-01-10');
INSERT INTO employee VALUES (104, 'Sneha ', 30, 70000.00, 'Project Manager', 'Hyderabad, India', '2019-11-05');
INSERT INTO employee VALUES (106, 'Neha ', 28, 53000.00, 'QA Engineer', 'Pune, India', '2021-09-30');
INSERT INTO employee VALUES (108, 'Divya', 27, 51000.00, 'UI/UX Designer', 'Cochin, India', '2022-04-18');
INSERT INTO employee VALUES (110, 'Meera', 29, 58000.00, 'HR Manager', 'Bangalore, India', '2021-02-14');

select *from employee ;




-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
/*'101', 'anil', '25', '450000.00', 'Software Engineer', 'Bangalore, India', '2021-06-15'
'103', 'Rahul ', '26', '48000.00', 'Data Analyst', 'Delhi, India', '2022-01-10'
'104', 'Sneha ', '30', '70000.00', 'Project Manager', 'Hyderabad, India', '2019-11-05'
'106', 'Neha ', '28', '53000.00', 'QA Engineer', 'Pune, India', '2021-09-30'
'108', 'Divya', '27', '51000.00', 'UI/UX Designer', 'Cochin, India', '2022-04-18'
'110', 'Meera', '29', '58000.00', 'HR Manager', 'Bangalore, India', '2021-02-14'*/

-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure

-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
DELIMITER //

CREATE PROCEDURE InsertEmployeeWithAgeCheck (
  IN p_empid INT,
  IN p_empname VARCHAR(50),
  IN p_age INT,
  IN p_salary DECIMAL(10,2),
  IN p_designation VARCHAR(30),
  IN p_address VARCHAR(100),
  IN p_date_of_join DATE
)
BEGIN
  IF p_age BETWEEN 18 AND 60 THEN
    INSERT INTO employee (empid, empname, age, salary, designation, address, date_of_join)
    VALUES (p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
  ELSE
    SELECT 'Invalid age, employee not added.' AS Message;
  END IF;
END //

DELIMITER ;
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
      DELIMITER //

CREATE PROCEDURE InsertEmployeeWithAgeCheck (
  IN p_empid INT,
  IN p_empname VARCHAR(50),
  IN p_age INT,
  IN p_salary DECIMAL(10,2),
  IN p_designation VARCHAR(30),
  IN p_address VARCHAR(100),
  IN p_date_of_join DATE
)
BEGIN
  IF p_age BETWEEN 18 AND 60 THEN
    INSERT INTO employee (empid, empname, age, salary, designation, address, date_of_join)
    VALUES (p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
  ELSE
    SELECT 'Invalid age, employee not added.' AS Message;
  END IF;
END //

DELIMITER ;
-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
          DELIMITER //

CREATE PROCEDURE InsertEmployeeWithDefaultSalary (
  IN p_empid INT,
  IN p_empname VARCHAR(50),
  IN p_age INT,
  IN p_salary DECIMAL(10,2),
  IN p_designation VARCHAR(30),
  IN p_address VARCHAR(100),
  IN p_date_of_join DATE
)
BEGIN
  DECLARE v_salary DECIMAL(10,2);

  IF p_salary IS NULL THEN
    SET v_salary = 20000.00;
  ELSE
    SET v_salary = p_salary;
  END IF;

  INSERT INTO employee (empid, empname, age, salary, designation, address, date_of_join)
  VALUES (p_empid, p_empname, p_age, v_salary, p_designation, p_address, p_date_of_join);
END //

DELIMITER ;
-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER //

CREATE PROCEDURE InsertThreeEmployees ()
BEGIN
  INSERT INTO employee VALUES (111, 'Ravi Kumar', 27, 45000.00, 'Support Engineer', 'Jaipur, India', '2023-05-10');
  INSERT INTO employee VALUES (112, 'Anjali Das', 34, 67000.00, 'Marketing Manager', 'Guwahati, India', '2022-09-01');
  INSERT INTO employee VALUES (113, 'Suresh Reddy', 40, 72000.00, 'Finance Analyst', 'Vizag, India', '2021-12-20');
END //

DELIMITER ;
-- B.  Update Procedure
/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.*/
DELIMITER //

CREATE PROCEDURE UpdateEmployeeSalary (
  IN p_empid INT,
  IN p_new_salary DECIMAL(10,2)
)
BEGIN
  UPDATE employee
  SET salary = p_new_salary
  WHERE empid = p_empid;
END //

DELIMITER ;
/*Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.*/
DELIMITER //

CREATE PROCEDURE IncrementManagerSalary()
BEGIN
  UPDATE employee
  SET salary = salary * 1.10
  WHERE designation = 'Manager';
END //

DELIMITER ;
/*Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.*/
DELIMITER //

CREATE PROCEDURE UpdateEmployeeDesignation (
  IN p_empid INT,
  IN p_new_designation VARCHAR(30)
)
BEGIN
  UPDATE employee
  SET designation = p_new_designation
  WHERE empid = p_empid;
END //

DELIMITER ;
/*Update Address:
Write a procedure to update the address of an employee when empid is given as input.*/
DELIMITER //

CREATE PROCEDURE UpdateEmployeeAddress (
  IN p_empid INT,
  IN p_new_address VARCHAR(100)
)
BEGIN
  UPDATE employee
  SET address = p_new_address
  WHERE empid = p_empid;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE UpdateSalaryIfEligible (
  IN p_empid INT,
  IN p_new_salary DECIMAL(10,2)
)
BEGIN
  DECLARE v_age INT;

  -- Get the employee's age
  SELECT age INTO v_age
  FROM employee
  WHERE empid = p_empid;

  -- Check eligibility and update
  IF v_age > 40 THEN
    UPDATE employee
    SET salary = p_new_salary
    WHERE empid = p_empid;
  ELSE
    SELECT 'Not eligible for salary update.' AS Message;
  END IF;
END //

DELIMITER ;
-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.*/
DELIMITER //

CREATE PROCEDURE DeleteEmployee (
  IN p_empid INT
)
BEGIN
  DELETE FROM employee
  WHERE empid = p_empid;
END //

DELIMITER ;
/*Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').*/
DELIMITER //

CREATE PROCEDURE DeleteByDesignation (
  IN p_designation VARCHAR(30)
)
BEGIN
  DELETE FROM employee
  WHERE designation = p_designation;
END //

DELIMITER ;
/*Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.*/
DELIMITER //

CREATE PROCEDURE DeleteBySalaryRange()
BEGIN
  DELETE FROM employee
  WHERE salary < 15000.00;
END //

DELIMITER ;
/*Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.*/
DELIMITER //

CREATE PROCEDURE DeleteByJoiningYear()
BEGIN
  DELETE FROM employee
  WHERE YEAR(date_of_join) < 2015;
END //

DELIMITER ;
-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
                                      