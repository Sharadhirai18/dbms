
lab 03
B.R Sharath Shetty
•
11:19 AM
Due Today
Dear Students 
   Solve the given set of commands and submit in GCR

StudentCopy Lab 02 (1).sql
SQL
Class comments
Your work
Assigned

lab3.sql
SQL
Private comments
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Sharadhi Rai
-- USN: 1RVUN24BCA0080
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

/*'root@localhost', 'RVU-PC-031', '8.0.43', '2025-09-01 11:28:48'*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
create database books;
use books;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
CREATE TABLE Books (
    BookID INT primary key,
    Title varchar(255) ,
    Author varchar(255),
    Genre varchar(100),
    PublishedYear INT,
    ISBN VARCHAR(20),
    AvailableCopies INT default 0
);
desc Books;

/*'BookID', 'int', 'NO', 'PRI', NULL, ''
'Title', 'varchar(255)', 'YES', '', NULL, ''
'Author', 'varchar(255)', 'YES', '', NULL, ''
'Genre', 'varchar(100)', 'YES', '', NULL, ''
'PublishedYear', 'int', 'YES', '', NULL, ''
'ISBN', 'varchar(20)', 'YES', '', NULL, ''
'AvailableCopies', 'int', 'YES', '', '0', ''*/

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(15),
    MembershipDate DATE,
    IsActive BOOLEAN DEFAULT TRUE
);
desc Members;
/*'MemberID', 'int', 'NO', 'PRI', NULL, ''
'FullName', 'varchar(255)', 'NO', '', NULL, ''
'Email', 'varchar(255)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''
'MembershipDate', 'date', 'YES', '', NULL, ''
'IsActive', 'tinyint(1)', 'YES', '', '1', ''*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 






-- Paste the Output below for the given command ( DESC TableName;) 


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
INSERT INTO Books (BookID, Title, Author, Genre, PublishedYear, ISBN, AvailableCopies)
VALUES 
  (101, '1984_The Black Swan', 'George Orwell', 'Dystopian Fiction', 1949, '9780451524935', 4);






-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM books;
/*'101', '1984_The Black Swan', 'George Orwell', 'Dystopian Fiction', '1949', '9780451524935', '4'*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
INSERT INTO Members (MemberID, FullName, Email, PhoneNumber, MembershipDate, IsActive)
VALUES 
  (1001, 'David Lee', 'david.lee@email.com', '+91-9876543210', '2024-04-15', TRUE),
  (1002, 'Emma Wilson', 'emma.wilson@email.com', '+91-9123456780', '2024-05-22', TRUE);
  desc  Members;
SELECT * FROM Members;






-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*'1001', 'David Lee', 'david.lee@email.com', '+91-9876543210', '2024-04-15', '1'
'1002', 'Emma Wilson', 'emma.wilson@email.com', '+91-9123456780', '2024-05-22', '1'*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
UPDATE Books
SET AvailableCopies = AvailableCopies + 2
WHERE Title = '1984_The Black Swan';








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
UPDATE Members
SET Membershipdate = '2024-04-22'
WHERE FullName = 'Emma Wilson' AND Membershipdate = '2024-04-22';

SELECT * FROM Members
WHERE FullName = 'Emma Wilson';
/*2	Emma Wilson	emma.wilson@example.com	9123456780	2024-05-22	1	Gold */








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
delete from Members
where FullName = 'David Lee';

SELECT * FROM Members
WHERE FullName = 'David Lee';







-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

create table Borrowing (
    BorrowingID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
desc Borrowing;
/*BorrowingID	int	NO	PRI		auto_increment
MemberID	int	YES	MUL		
BookID	int	YES	MUL		
BorrowDate	date	YES			*/
Insert into Books (BookID, Title, AvailableCopies)
values (102, 'The Catcher in the Rye', 1);  
select * from Borrowing
where MemberID = 2 AND BookID = 102;








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
SELECT M.FullName
FROM Borrowing B
JOIN Members M ON B.MemberID = M.MemberID
WHERE B.BookID = 102;

DESCRIBE Members;

SELECT * FROM Borrowing;
/*MemberID	int	NO	PRI		
FullName	varchar(255)	NO			
Email	varchar(255)	YES	UNI		
PhoneNumber	varchar(15)	YES			
MembershipDate	date	YES			
IsActive	tinyint(1)	YES		1	
MembershipLevel	varchar(50)	YES			*/









-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task --