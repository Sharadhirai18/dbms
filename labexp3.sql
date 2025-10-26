-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Sharadhi Rai 
-- USN: 1RVU24BCA0080
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
create database company;
use company;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table Employee(
    EmpID INT primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Salary decimal(10, 2),
    BirthDate DATE,
    HireDate DATE
);
desc Employee;
/*EmpID	int	NO	PRI		
FirstName	varchar(50)	YES			
LastName	varchar(50)	YES			
Salary	decimal(10,2)	YES			
BirthDate	date	YES			
HireDate	date	YES			*/

-- 2. Insert 10 records to employee;
Insert into Employee (EmpID, FirstName, LastName, Salary, BirthDate, HireDate)
Values						
(1, 'Alice', 'Johnson', 55000.00, '1985-03-12', '2010-06-01'),
(2, 'Bob', 'Smith', 62000.00, '1980-07-22', '2008-09-15'),
(3, 'Charlie', 'Lee', 48000.00, '1990-11-05', '2015-01-20'),
(4, 'Diana', 'Brown', 75000.00, '1978-02-28', '2005-03-10'),
(5, 'Ethan', 'Davis', 51000.00, '1988-06-17', '2012-07-01'),
(6, 'Fiona', 'Garcia', 67000.00, '1983-09-30', '2009-11-25'),
(7, 'George', 'Martinez', 59000.00, '1992-01-14', '2016-04-18'),
(8, 'Hannah', 'Wilson', 53000.00, '1986-05-09', '2011-08-12'),
(9, 'Ian', 'Taylor', 61000.00, '1981-12-03', '2007-02-05'),
(10, 'Julia', 'Anderson', 70000.00, '1979-10-21', '2006-05-30');
Select * from Employee;
/*1	Alice	Johnson	55000.00	1985-03-12	2010-06-01
2	Bob	Smith	62000.00	1980-07-22	2008-09-15
3	Charlie	Lee	48000.00	1990-11-05	2015-01-20
4	Diana	Brown	75000.00	1978-02-28	2005-03-10
5	Ethan	Davis	51000.00	1988-06-17	2012-07-01
6	Fiona	Garcia	67000.00	1983-09-30	2009-11-25
7	George	Martinez	59000.00	1992-01-14	2016-04-18
8	Hannah	Wilson	53000.00	1986-05-09	2011-08-12
9	Ian	Taylor	61000.00	1981-12-03	2007-02-05
10	Julia	Anderson	70000.00	1979-10-21	2006-05-30 */
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key) 
 create table Orders (
    OrderID INT primary key,
    OrderDate DATE,
    TotalAmount decimal(10, 2),
    EmpID INT,
    foreign key (EmpID) REFERENCES Employee(EmpID)
);
desc Orders;
/*OrderID	int	NO	PRI		
OrderDate	date	YES			
TotalAmount	decimal(10,2)	YES			
EmpID	int	YES	MUL		*/

-- 4. Insert 10 records to Orders
Insert into Orders (OrderID, OrderDate, TotalAmount, EmpID)
Values	
(101, '2025-01-10', 1200.50, 1),
(102, '2025-01-15', 850.00, 2),
(103, '2025-02-01', 430.75, 3),
(104, '2025-02-10', 980.00, 4),
(105, '2025-03-05', 1500.00, 5),
(106, '2025-03-12', 760.25, 6),
(107, '2025-04-01', 1340.00, 7),
(108, '2025-04-18', 620.90, 8),
(109, '2025-05-03', 890.00, 9),
(110, '2025-05-20', 1100.00, 10);
Select * From Orders;
/*101	2025-01-10	1200.50	1
102	2025-01-15	850.00	2
103	2025-02-01	430.75	3
104	2025-02-10	980.00	4
105	2025-03-05	1500.00	5
106	2025-03-12	760.25	6
107	2025-04-01	1340.00	7
108	2025-04-18	620.90	8
109	2025-05-03	890.00	9
110	2025-05-20	1100.00	10 */
					




-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.




-- Output: 



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
Select ROUND(Salary) AS RoundedSalary
From Employee;
-- Output:
	/*RoundedSalary
	55000
	62000
	48000
	75000
	51000
	67000
	59000
	53000
	61000
	70000*/

 

/* b. Absolute Values: Show absolute values of salaries */
Select abs(Salary) AS AbsoluteSalary
From Employee;
-- Output:
	/*AbsoluteSalary
	55000.00
	62000.00
	48000.00
	75000.00
	51000.00
	67000.00
	59000.00
	53000.00
	61000.00
	70000.00*/


/* c. Ceiling Values: Get ceiling values of order amounts */
Select TotalAmount,CEILING(TotalAmount) AS CeilingAmount
From Orders;
-- Output: 
/*TotalAmount	CeilingAmount
	1200.50	1201
	850.00	850
	430.75	431
	980.00	980
	1500.00	1500
	760.25	761
	1340.00	1340
	620.90	621
	890.00	890
	1100.00	1100*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
Select Count(*) AS TotalEmployees
From Employee;

-- Output: 
	/*TotalEmployees
	10*/
	


/* b. Sum of Salaries: Calculate total salary expense */
Select Sum(Salary) AS TotalSalaryExpense
From Employee;

-- Output: 
	/*&TotalSalaryExpense
	601000.00*/


/* c. Average Order Amount: Find average order value */
Select Avg(TotalAmount) AS AverageOrdervalue
From Orders; 

-- Output: 
/*	AverageOrdervalue
	967.240000*/


/* d. Max/Min Salary: Find highest and lowest salaries */
Select Max(Salary) AS HighestSalary,
 Min(Salary) AS LowestSalary
From Employee;
-- Output: 
/*	HighestSalary	LowestSalary
	75000.00	48000.00*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
Select EmpID,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(FirstName) AS FirstName_Lower,
    UPPER(LastName) AS LastName_Upper,
    LOWER(LastName) AS LastName_Lower
From Employee;

-- Output: 
	/*EmpID	FirstName_Upper	FirstName_Lower	LastName_Upper	LastName_Lower
	1	ALICE	alice	JOHNSON	johnson
	2	BOB	bob	SMITH	smith
	3	CHARLIE	charlie	LEE	lee
	4	DIANA	diana	BROWN	brown
	5	ETHAN	ethan	DAVIS	davis
	6	FIONA	fiona	GARCIA	garcia
	7	GEORGE	george	MARTINEZ	martinez
	8	HANNAH	hannah	WILSON	wilson
	9	IAN	ian	TAYLOR	taylor
	10	JULIA	julia	ANDERSON	anderson*/

/* b. Concatenate Names: Create full names */
Select CONCAT(FirstName,LastName) AS FullName
From Employee;

-- Output: 
	/*FullName
	AliceJohnson
	BobSmith
	CharlieLee
	DianaBrown
	EthanDavis
	FionaGarcia
	GeorgeMartinez
	HannahWilson
	IanTaylor
	JuliaAnderson*/

/* c. Extract Substring: Get first 3 characters of first names */
Select substr(FirstName, 1, 3)
From Employee;

-- Output: 
/*Ali
Bob
Cha
Dia
Eth
Fio
Geo
Han
Ian
Jul*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert DATE to TEXT type */
Select Cast(OrderDATE AS Char) AS ConvertedDate
From Orders;


-- Output: 
	/*	ConvertedDate
	2025-01-10
	2025-01-15
	2025-02-01
	2025-02-10
	2025-03-05
	2025-03-12
	2025-04-01
	2025-04-18
	2025-05-03
	2025-05-20*/

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
Select Now() AS CurrentTimestamp;
-- Output:
	/*CurrentTimestamp
	2025-09-08 06:44:39*/

/* b. Extract Year: Get year from order dates */
Select extract(YEAR FROM OrderDate) AS OrderYear
From Orders;
 /*OrderYear
	2025
	2025
	2025
	2025
	2025
	2025
	2025
	2025
	2025
	2025*/

 
-- Output: 

/* c. Add Months: Add 3 months to order dates */
Select date_add(OrderDate, INTERVAL 3 MONTH) AS FinalDate 
From Orders;
	/*FinalDate
	2025-04-10
	2025-04-15
	2025-05-01
	2025-05-10
	2025-06-05
	2025-06-12
	2025-07-01
	2025-07-18
	2025-08-03
	2025-08-20*/

-- Output: 

/* d. Days Since Order: Calculate days between order date and now */
Select OrderID, datediff(OrderDate, Now()) AS DAYSINCEORDER
From Orders;
	/*OrderID	DAYSINCEORDER
	101	-241
	102	-236
	103	-219
	104	-210
	105	-187
	106	-180
	107	-160
	108	-143
	109	-128
	110	-111*/
-- Output: 

-- END of the Task -- 