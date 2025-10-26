Name : SHARADHI RAI
USN : 1RUA24BCA0080

create database office;
use office; 
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(50),
    address VARCHAR(100),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(1, 'HR', 'Bengaluru'),
(2, 'IT', 'Hyderabad'),
(3, 'Sales', 'Mumbai'),
(4, 'Finance', 'Delhi');

INSERT INTO Employee VALUES
(101, 'Ananya Rao', 28, 55000, 'HR Executive', 'Bengaluru', '2020-05-10', 1),
(102, 'Rohan Singh', 30, 70000, 'Developer', 'Hyderabad', '2019-03-15', 2),
(103, 'Priya Mehta', 26, 48000, 'Developer', 'Hyderabad', '2021-08-20', 2),
(104, 'Vikram Patel', 35, 82000, 'Manager', 'Mumbai', '2018-02-05', 3),
(105, 'Neha Sharma', 29, 62000, 'Accountant', 'Delhi', '2022-01-12', 4);


UPDATE Employee
SET salary = salary + 5000
WHERE designation = 'Developer';


SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS average_salary,
       MAX(e.salary) AS highest_salary,
       MIN(e.salary) AS lowest_salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT UPPER(emp_name) AS Name_Uppercase,
       UPPER(designation) AS Designation_Uppercase,
       CONCAT(emp_name, ' works as ', designation) AS Description
FROM Employee;


SELECT emp_name,
       YEAR(doj) AS Joining_Year,
       TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS Years_Worked
FROM Employee;


SELECT emp_name, salary
FROM Employee
WHERE salary BETWEEN 40000 AND 80000
AND dept_id <> (SELECT dept_id FROM Department WHERE dept_name = 'Sales');


SELECT e.emp_name, e.designation, d.dept_name, d.location
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d ON e.dept_id = d.dept_id;

SELECT d.dept_name, e.emp_name
FROM Employee e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;

DELIMITER //
CREATE PROCEDURE InsertEmployee(
    IN p_id INT, IN p_name VARCHAR(50), IN p_age INT, IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(50), IN p_address VARCHAR(100), IN p_doj DATE, IN p_dept INT
)
BEGIN
    INSERT INTO Employee VALUES(p_id, p_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept);
END //
DELIMITER ;

CALL InsertEmployee(106, 'Karan Verma', 27, 60000, 'Developer', 'Pune', '2023-04-01', 2);


DELIMITER //
CREATE PROCEDURE UpdateSalary(IN p_emp_id INT, IN p_new_salary DECIMAL(10,2))
BEGIN
    UPDATE Employee SET salary = p_new_salary WHERE emp_id = p_emp_id;
END //
DELIMITER ;

CALL UpdateSalary(103, 75000);


DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN p_emp_id INT)
BEGIN
    DELETE FROM Employee WHERE emp_id = p_emp_id;
END //
DELIMITER ;

CALL DeleteEmployee(105);


DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN p_emp_id INT)
BEGIN
    DELETE FROM Employee WHERE emp_id = p_emp_id;
END //
DELIMITER ;

CALL DeleteEmployee(105);

SELECT e.emp_name, d.dept_name,
       TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS Years_Worked,
       (e.salary + 5000) AS Salary_After_Increment
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 2;
