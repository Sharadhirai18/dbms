/*Name:Sharadhi Rai
USN:1RUA24BCA0080
Section:A*/

/*  Hospital Management System */
Create database HospitalDB;
Use HospitalDB;
Create table Doctors (
    doctor_id INT Primary key,
    doctor_name varchar(100) ,
    specialization Varchar(100),
    phone Varchar(15),
    email Varchar(100)
);
desc Doctors;
/*doctor_id	int	NO	PRI		
doctor_name	varchar(100)	YES			
specialization	varchar(100)	YES			
phone	varchar(15)	YES			
email	varchar(100)	YES			*/
Create table Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(255)
);
desc Patients;
/*patient_id	int	NO	PRI		
patient_name	varchar(100)	YES			
age	int	YES			
gender	varchar(10)	YES			
phone	varchar(15)	YES			
address	varchar(255)	YES			*/
Create table Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
desc Appointments;
/*appointment_id	int	NO	PRI		
patient_id	int	YES	MUL		
doctor_id	int	YES	MUL		
appointment_date	date	YES			
diagnosis	varchar(255)	YES			*/
INSERT INTO Doctors (doctor_name, specialization, phone, email)
VALUES
('Dr. Arjun Mehta', 'Cardiologist', '9876543210', 'arjun@hospital.com'),
('Dr. Priya Sharma', 'Dermatologist', '9123456789', 'priya@hospital.com'),
('Dr. Rakesh Verma', 'Orthopedic', '9988776655', 'rakesh@hospital.com');
INSERT INTO Patients (patient_name, age, gender, phone, address)
VALUES
('Ravi Kumar', 45, 'Male', '9998887776', 'Bangalore'),
('Sneha Patel', 29, 'Female', '8887776665', 'Chennai'),
('Vikram Rao', 52, 'Male', '7776665554', 'Mumbai'),
('Asha Devi', 35, 'Female', '6665554443', 'Delhi');
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, diagnosis)
VALUES
(1, 1, '2025-10-20', 'High Blood Pressure'),
(2, 2, '2025-10-21', 'Skin Allergy'),
(3, 3, '2025-10-22', 'Joint Pain'),
(4, 1, '2025-10-23', 'Chest Pain'),
(1, 1, '2025-10-25', 'Follow-up Checkup');
SELECT 
    A.appointment_id,
    P.patient_name,
    D.doctor_name,
    D.specialization,
    A.appointment_date,
    A.diagnosis
FROM 
    Appointments A
JOIN 
    Patients P ON A.patient_id = P.patient_id
JOIN 
    Doctors D ON A.doctor_id = D.doctor_id
ORDER BY 
    A.appointment_date;
SELECT 
    D.doctor_name,
    COUNT(A.patient_id) AS total_patients
FROM 
    Doctors D
LEFT JOIN 
    Appointments A ON D.doctor_id = A.doctor_id
GROUP BY 
    D.doctor_name
ORDER BY 
    total_patients DESC;
DELIMITER $$
CREATE PROCEDURE InsertAppointment(
    IN p_patient_id INT,
    IN p_doctor_id INT,
    IN p_date DATE,
    IN p_diagnosis VARCHAR(255)
)
BEGIN
    INSERT INTO Appointments (patient_id, doctor_id, appointment_date, diagnosis)
    VALUES (p_patient_id, p_doctor_id, p_date, p_diagnosis);
END $$
DELIMITER ;
SELECT * FROM Appointments;
SELECT 
    D.specialization, 
    COUNT(DISTINCT A.patient_id) AS unique_patients
FROM 
    Doctors D
JOIN 
    Appointments A ON D.doctor_id = A.doctor_id
GROUP BY 
    D.specialization;
/*Library Management System*/
Create database LibraryDB;
use LibraryDB;
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) ,
    author VARCHAR(100),
    genre VARCHAR(50),
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1
);
CREATE TABLE Members (
    member_id INT PRIMARY KEY ,
    member_name VARCHAR(100) ,
    phone VARCHAR(15),
    email VARCHAR(100),
    join_date DATE
);
CREATE TABLE Book_Issues (
    issue_id INT PRIMARY KEY ,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
INSERT INTO Books (title, author, genre, total_copies, available_copies)
VALUES
('The Alchemist', 'Paulo Coelho', 'Fiction', 5, 5),
('A Brief History of Time', 'Stephen Hawking', 'Science', 3, 3),
('Python Programming', 'Guido van Rossum', 'Technology', 4, 4),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 2, 2);
INSERT INTO Members (member_name, phone, email, join_date)
VALUES
('Ravi Kumar', '9998887776', 'ravi@example.com', '2023-05-10'),
('Sneha Patel', '8887776665', 'sneha@example.com', '2023-07-20'),
('Vikram Rao', '7776665554', 'vikram@example.com', '2024-01-15');
INSERT INTO Book_Issues (book_id, member_id, issue_date, return_date)
VALUES
(1, 1, '2025-10-01', '2025-10-10'),
(2, 2, '2025-10-03', NULL),
(3, 1, '2025-10-05', '2025-10-12'),
(1, 3, '2025-10-10', NULL);
SELECT 
    BI.issue_id,
    B.title AS book_title,
    M.member_name,
    BI.issue_date,
    BI.return_date
FROM 
    Book_Issues BI
JOIN 
    Books B ON BI.book_id = B.book_id
JOIN 
    Members M ON BI.member_id = M.member_id
ORDER BY 
    BI.issue_date;
SELECT 
    M.member_name,
    COUNT(BI.book_id) AS total_books_issued
FROM 
    Members M
LEFT JOIN 
    Book_Issues BI ON M.member_id = BI.member_id
GROUP BY 
    M.member_name
ORDER BY 
    total_books_issued DESC;
SELECT 
    B.title, M.member_name, BI.issue_date
FROM 
    Book_Issues BI
JOIN 
    Books B ON BI.book_id = B.book_id
JOIN 
    Members M ON BI.member_id = M.member_id
WHERE 
    MONTH(BI.issue_date) = 10 AND YEAR(BI.issue_date) = 2025;
DELIMITER $$
CREATE PROCEDURE UpdateBookAvailabilityOnIssue(
    IN p_book_id INT
)
BEGIN
    UPDATE Books
    SET available_copies = available_copies - 1
    WHERE book_id = p_book_id AND available_copies > 0;
END $$
DELIMITER ;
SELECT book_id, title, available_copies FROM Books;
SELECT 
    B.title,
    B.available_copies,
    M.member_name,
    BI.issue_date,
    BI.return_date
FROM 
    Book_Issues BI
JOIN 
    Books B ON BI.book_id = B.book_id
JOIN 
    Members M ON BI.member_id = M.member_id;
/* Employee Payroll System */
Create database PayrollDB;
use PayrollDB;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY ,
    emp_id INT,
    basic_salary DECIMAL(10,2),
    hra DECIMAL(10,2),
    da DECIMAL(10,2),
    deductions DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
INSERT INTO Departments (dept_name, location)
VALUES
('HR', 'Bangalore'),
('IT', 'Chennai'),
('Finance', 'Mumbai'),
('Sales', 'Delhi');
INSERT INTO Employees (emp_name, gender, hire_date, dept_id)
VALUES
('Ravi Kumar', 'Male', '2020-04-15', 1),
('Sneha Patel', 'Female', '2021-06-10', 2),
('Vikram Rao', 'Male', '2019-09-22', 3),
('Asha Devi', 'Female', '2022-01-12', 2),
('Kiran Das', 'Male', '2020-07-30', 4);
INSERT INTO Salaries (emp_id, basic_salary, hra, da, deductions, net_salary)
VALUES
(1, 40000, 8000, 6000, 2000, 52000),
(2, 50000, 10000, 8000, 3000, 65000),
(3, 45000, 9000, 7000, 2500, 58500),
(4, 48000, 9600, 7200, 2000, 64800),
(5, 35000, 7000, 5000, 1500, 45500);
SELECT 
    E.emp_id,
    E.emp_name,
    D.dept_name,
    D.location,
    E.hire_date
FROM 
    Employees E
JOIN 
    Departments D ON E.dept_id = D.dept_id
ORDER BY 
    D.dept_name;
SELECT 
    D.dept_name,
    SUM(S.net_salary) AS total_salary_expense
FROM 
    Departments D
JOIN 
    Employees E ON D.dept_id = E.dept_id
JOIN 
    Salaries S ON E.emp_id = S.emp_id
GROUP BY 
    D.dept_name
ORDER BY 
    total_salary_expense DESC;
SELECT 
    D.dept_name,
    AVG(S.net_salary) AS avg_salary
FROM 
    Departments D
JOIN 
    Employees E ON D.dept_id = E.dept_id
JOIN 
    Salaries S ON E.emp_id = S.emp_id
GROUP BY 
    D.dept_name;
SELECT 
    D.dept_name,
    COUNT(E.emp_id) AS total_employees
FROM 
    Departments D
LEFT JOIN 
    Employees E ON D.dept_id = E.dept_id
GROUP BY 
    D.dept_name;
SELECT 
    D.dept_name,
    E.emp_name,
    MAX(S.net_salary) AS highest_salary
FROM 
    Departments D
JOIN 
    Employees E ON D.dept_id = E.dept_id
JOIN 
    Salaries S ON E.emp_id = S.emp_id
GROUP BY 
    D.dept_name;
/*E-Commerce System*/
Create database EcommerceDB;
use EcommerceDB;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT DEFAULT 0
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY ,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers (customer_name, email, phone, city)
VALUES
('Ravi Kumar', 'ravi@example.com', '9998887776', 'Bangalore'),
('Sneha Patel', 'sneha@example.com', '8887776665', 'Chennai'),
('Vikram Rao', 'vikram@example.com', '7776665554', 'Mumbai'),
('Asha Devi', 'asha@example.com', '6665554443', 'Delhi');
INSERT INTO Products (product_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 60000.00, 10),
('Smartphone', 'Electronics', 30000.00, 15),
('Washing Machine', 'Appliances', 25000.00, 8),
('Headphones', 'Accessories', 3000.00, 25),
('Microwave Oven', 'Appliances', 12000.00, 6);
INSERT INTO Orders (customer_id, product_id, quantity, order_date)
VALUES
(1, 1, 1, '2025-10-01'),
(2, 2, 2, '2025-10-02'),
(3, 1, 1, '2025-10-03'),
(4, 4, 3, '2025-10-05'),
(2, 3, 1, '2025-10-06'),
(1, 2, 1, '2025-10-08');
SELECT 
    O.order_id,
    C.customer_name,
    P.product_name,
    O.quantity,
    P.price,
    (O.quantity * P.price) AS total_amount,
    O.order_date
FROM 
    Orders O
JOIN 
    Customers C ON O.customer_id = C.customer_id
JOIN 
    Products P ON O.product_id = P.product_id
ORDER BY 
    O.order_date;
DELIMITER $$
CREATE PROCEDURE UpdateProductStock(
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    UPDATE Products
    SET stock = stock - p_quantity
    WHERE product_id = p_product_id AND stock >= p_quantity;
END $$
DELIMITER ;
SELECT 
    O.order_id,
    C.customer_name,
    P.product_name,
    O.quantity,
    P.price,
    (O.quantity * P.price) AS order_total
FROM 
    Orders O
JOIN 
    Customers C ON O.customer_id = C.customer_id
JOIN 
    Products P ON O.product_id = P.product_id
ORDER BY 
    order_total DESC;
/*School Management System*/
Create database SchoolDB;
use SchoolDB;
CREATE TABLE Classes (
    class_id INT PRIMARY KEY ,
    class_name VARCHAR(50) ,
    teacher_name VARCHAR(100)
);
CREATE TABLE Students (
    student_id INT PRIMARY KEY ,
    student_name VARCHAR(100) ,
    gender VARCHAR(10),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY ,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Classes (class_name, teacher_name)
VALUES
('Class 10A', 'Mrs. Renu Sharma'),
('Class 10B', 'Mr. Amit Verma'),
('Class 9A', 'Ms. Priya Nair');
INSERT INTO Students (student_name, gender, class_id)
VALUES
('Ravi Kumar', 'Male', 1),
('Sneha Patel', 'Female', 1),
('Vikram Rao', 'Male', 2),
('Asha Devi', 'Female', 2),
('Kiran Das', 'Male', 3);
INSERT INTO Marks (student_id, subject, marks)
VALUES
(1, 'Math', 85),
(1, 'Science', 78),
(2, 'Math', 92),
(2, 'Science', 88),
(3, 'Math', 74),
(3, 'Science', 69),
(4, 'Math', 80),
(4, 'Science', 82),
(5, 'Math', 70),
(5, 'Science', 65);
SELECT 
    C.class_name,
    S.student_name,
    M.subject,
    M.marks
FROM 
    Marks M
JOIN 
    Students S ON M.student_id = S.student_id
JOIN 
    Classes C ON S.class_id = C.class_id
ORDER BY 
    C.class_name, S.student_name;
SELECT 
    C.class_name,
    AVG(M.marks) AS average_marks
FROM 
    Marks M
JOIN 
    Students S ON M.student_id = S.student_id
JOIN 
    Classes C ON S.class_id = C.class_id
GROUP BY 
    C.class_name
ORDER BY 
    average_marks DESC;
DELIMITER $$
CREATE PROCEDURE InsertStudent(
    IN p_student_name VARCHAR(100),
    IN p_gender VARCHAR(10),
    IN p_class_id INT
)
BEGIN
    INSERT INTO Students (student_name, gender, class_id)
    VALUES (p_student_name, p_gender, p_class_id);
END $$
DELIMITER ;
SELECT 
    S.student_name, 
    S.gender, 
    C.class_name, 
    C.teacher_name
FROM 
    Students S
JOIN 
    Classes C ON S.class_id = C.class_id;
/* Banking System*/
Create database BankDB;
Use BankDB;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(12,2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(10),   
    amount DECIMAL(12,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
INSERT INTO Customers (customer_name, phone, email, address)
VALUES
('Ravi Kumar', '9998887776', 'ravi@example.com', 'Bangalore'),
('Sneha Patel', '8887776665', 'sneha@example.com', 'Chennai'),
('Vikram Rao', '7776665554', 'vikram@example.com', 'Delhi');
INSERT INTO Accounts (customer_id, account_type, balance)
VALUES
(1, 'Savings', 50000.00),
(2, 'Current', 80000.00),
(3, 'Savings', 60000.00);
INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date)
VALUES
(1, 'Deposit', 10000.00, '2025-10-01'),
(1, 'Withdraw', 5000.00, '2025-10-05'),
(2, 'Deposit', 20000.00, '2025-10-07'),
(3, 'Withdraw', 10000.00, '2025-10-10'),
(2, 'Withdraw', 8000.00, '2025-10-12');
SELECT 
    C.customer_name,
    A.account_id,
    A.account_type,
    A.balance
FROM 
    Customers C
JOIN 
    Accounts A ON C.customer_id = A.customer_id
ORDER BY 
    C.customer_name;
SELECT 
    A.account_id,
    SUM(T.amount) AS total_deposits
FROM 
    Accounts A
JOIN 
    Transactions T ON A.account_id = T.account_id
WHERE 
    T.transaction_type = 'Deposit'
GROUP BY 
    A.account_id;
SELECT 
    A.account_id,
    SUM(T.amount) AS total_withdrawals
FROM 
    Accounts A
JOIN 
    Transactions T ON A.account_id = T.account_id
WHERE 
    T.transaction_type = 'Withdraw'
GROUP BY 
    A.account_id;
SELECT 
    MAX(amount) AS max_transaction,
    MIN(amount) AS min_transaction
FROM 
    Transactions;
SELECT 
    T.transaction_id,
    C.customer_name,
    A.account_type,
    T.transaction_type,
    T.amount,
    T.transaction_date
FROM 
    Transactions T
JOIN 
    Accounts A ON T.account_id = A.account_id
JOIN 
    Customers C ON A.customer_id = C.customer_id
WHERE 
    MONTH(T.transaction_date) = 10 AND YEAR(T.transaction_date) = 2025;
DELIMITER $$
CREATE PROCEDURE InsertTransaction(
    IN p_account_id INT,
    IN p_type VARCHAR(10),
    IN p_amount DECIMAL(12,2),
    IN p_date DATE
)
BEGIN
    
    INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date)
    VALUES (p_account_id, p_type, p_amount, p_date);


    IF p_type = 'Deposit' THEN
        UPDATE Accounts
        SET balance = balance + p_amount
        WHERE account_id = p_account_id;
    ELSEIF p_type = 'Withdraw' THEN
        UPDATE Accounts
        SET balance = balance - p_amount
        WHERE account_id = p_account_id AND balance >= p_amount;
    END IF;
END $$
DELIMITER ;
SELECT 
    T.transaction_id,
    C.customer_name,
    A.account_type,
    T.transaction_type,
    T.amount,
    T.transaction_date
FROM 
    Transactions T
JOIN 
    Accounts A ON T.account_id = A.account_id
JOIN 
    Customers C ON A.customer_id = C.customer_id
ORDER BY 
    T.transaction_date;
/*Flight Reservation System*/
Create database FlightReservationDB;
Use FlightReservationDB;
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    origin VARCHAR(50),
    destination VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    total_seats INT,
    available_seats INT
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_no VARCHAR(10),
    fare DECIMAL(10,2),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);
INSERT INTO Passengers (passenger_name, gender, phone, email)
VALUES
('Ravi Sharma', 'Male', '9876543210', 'ravi@example.com'),
('Sneha Iyer', 'Female', '9898989898', 'sneha@example.com'),
('Vikram Patel', 'Male', '9123456789', 'vikram@example.com');
INSERT INTO Flights (flight_number, origin, destination, departure_time, arrival_time, total_seats, available_seats)
VALUES
('AI101', 'Delhi', 'Mumbai', '2025-11-01 09:00:00', '2025-11-01 11:00:00', 180, 175),
('AI202', 'Bangalore', 'Chennai', '2025-11-02 07:30:00', '2025-11-02 08:45:00', 150, 147),
('AI303', 'Hyderabad', 'Kolkata', '2025-11-03 13:00:00', '2025-11-03 16:00:00', 200, 198);
INSERT INTO Bookings (passenger_id, flight_id, booking_date, seat_no, fare)
VALUES
(1, 1, '2025-10-20', '12A', 4500.00),
(2, 2, '2025-10-21', '7B', 3200.00),
(3, 1, '2025-10-22', '14C', 4500.00),
(1, 3, '2025-10-23', '3D', 6000.00);
SELECT 
    P.passenger_name,
    F.flight_number,
    F.origin,
    F.destination,
    F.departure_time,
    B.seat_no,
    B.fare
FROM 
    Passengers P
JOIN 
    Bookings B ON P.passenger_id = B.passenger_id
JOIN 
    Flights F ON B.flight_id = F.flight_id
ORDER BY 
    P.passenger_name;
SELECT 
    F.flight_number,
    COUNT(B.booking_id) AS total_passengers
FROM 
    Flights F
LEFT JOIN 
    Bookings B ON F.flight_id = B.flight_id
GROUP BY 
    F.flight_number;
SELECT 
    F.flight_number,
    SUM(B.fare) AS total_fare_collected
FROM 
    Flights F
JOIN 
    Bookings B ON F.flight_id = B.flight_id
GROUP BY 
    F.flight_number;
SELECT 
    B.booking_id,
    P.passenger_name,
    F.flight_number,
    B.booking_date,
    B.fare
FROM 
    Bookings B
JOIN 
    Passengers P ON B.passenger_id = P.passenger_id
JOIN 
    Flights F ON B.flight_id = F.flight_id
WHERE 
    MONTH(B.booking_date) = 10 AND YEAR(B.booking_date) = 2025;
DELIMITER $$
CREATE PROCEDURE InsertBooking(
    IN p_passenger_id INT,
    IN p_flight_id INT,
    IN p_booking_date DATE,
    IN p_seat_no VARCHAR(10),
    IN p_fare DECIMAL(10,2)
)
BEGIN
    DECLARE available INT;

    
    SELECT available_seats INTO available FROM Flights WHERE flight_id = p_flight_id;

    IF available > 0 THEN
     
        INSERT INTO Bookings (passenger_id, flight_id, booking_date, seat_no, fare)
        VALUES (p_passenger_id, p_flight_id, p_booking_date, p_seat_no, p_fare);


        UPDATE Flights 
        SET available_seats = available_seats - 1
        WHERE flight_id = p_flight_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No seats available for this flight';
    END IF;
END $$
DELIMITER ;
SELECT 
    B.booking_id,
    P.passenger_name,
    F.flight_number,
    F.origin,
    F.destination,
    B.seat_no,
    B.fare,
    B.booking_date
FROM 
    Bookings B
JOIN 
    Passengers P ON B.passenger_id = P.passenger_id
JOIN 
    Flights F ON B.flight_id = F.flight_id
ORDER BY 
    B.booking_date;
SELECT 
    flight_number,
    origin,
    destination,
    total_seats,
    available_seats
FROM 
    Flights
ORDER BY 
    flight_number;
/*Hotel Management System*/
Create database HotelDB;
Use HotelDB;
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type VARCHAR(50),       
    price_per_night DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Available'  
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
INSERT INTO Guests (guest_name, phone, email, address)
VALUES
('Ravi Kumar', '9876543210', 'ravi@example.com', 'Bangalore'),
('Sneha Patel', '9898989898', 'sneha@example.com', 'Chennai'),
('Vikram Rao', '9123456789', 'vikram@example.com', 'Delhi');
INSERT INTO Rooms (room_number, room_type, price_per_night, status)
VALUES
('101', 'Deluxe', 3500.00, 'Available'),
('102', 'Standard', 2500.00, 'Available'),
('201', 'Suite', 5000.00, 'Available');
INSERT INTO Bookings (guest_id, room_id, check_in, check_out, total_amount)
VALUES
(1, 1, '2025-10-20', '2025-10-23', 10500.00),
(2, 2, '2025-10-21', '2025-10-24', 7500.00),
(3, 3, '2025-10-22', '2025-10-25', 15000.00);
SELECT 
    G.guest_name,
    R.room_number,
    R.room_type,
    B.check_in,
    B.check_out,
    B.total_amount
FROM 
    Guests G
JOIN 
    Bookings B ON G.guest_id = B.guest_id
JOIN 
    Rooms R ON B.room_id = R.room_id
ORDER BY 
    G.guest_name;
SELECT 
    R.room_type,
    SUM(B.total_amount) AS total_revenue
FROM 
    Rooms R
JOIN 
    Bookings B ON R.room_id = B.room_id
GROUP BY 
    R.room_type;
SELECT 
    B.booking_id,
    G.guest_name,
    R.room_type,
    DATEDIFF(B.check_out, B.check_in) AS nights_stayed,
    B.total_amount
FROM 
    Bookings B
JOIN 
    Guests G ON B.guest_id = G.guest_id
JOIN 
    Rooms R ON B.room_id = R.room_id;
DELIMITER $$
CREATE PROCEDURE UpdateBooking(
    IN p_booking_id INT,
    IN p_check_in DATE,
    IN p_check_out DATE
)
BEGIN
    DECLARE room_id_val INT;
    DECLARE price DECIMAL(10,2);
    DECLARE days INT;
    DECLARE new_total DECIMAL(10,2);

   
    SELECT room_id INTO room_id_val FROM Bookings WHERE booking_id = p_booking_id;
    SELECT price_per_night INTO price FROM Rooms WHERE room_id = room_id_val;

    
    SET days = DATEDIFF(p_check_out, p_check_in);
    SET new_total = days * price;

    
    UPDATE Bookings
    SET check_in = p_check_in,
        check_out = p_check_out,
        total_amount = new_total
    WHERE booking_id = p_booking_id;
END $$
DELIMITER ;

SELECT 
    B.booking_id,
    G.guest_name,
    R.room_number,
    R.room_type,
    B.check_in,
    B.check_out,
    B.total_amount
FROM 
    Bookings B
JOIN 
    Guests G ON B.guest_id = G.guest_id
JOIN 
    Rooms R ON B.room_id = R.room_id
ORDER BY 
    B.check_in;

Create database InventoryDB;
Use InventoryDB;
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);
CREATE TABLE SupplyOrders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Suppliers (supplier_name, contact_number, email, address)
VALUES
('Global Traders', '9876543210', 'global@example.com', 'Mumbai'),
('Fresh Supply Co.', '9898989898', 'fresh@example.com', 'Delhi'),
('Elite Wholesalers', '9123456789', 'elite@example.com', 'Bangalore');
INSERT INTO Products (product_name, category, unit_price)
VALUES
('Laptop', 'Electronics', 55000.00),
('Printer', 'Electronics', 12000.00),
('Office Chair', 'Furniture', 8000.00);
INSERT INTO SupplyOrders (supplier_id, product_id, order_date, quantity, total_amount)
VALUES
(1, 1, '2025-10-15', 10, 550000.00),
(2, 2, '2025-10-18', 15, 180000.00),
(3, 3, '2025-10-20', 20, 160000.00),
(1, 3, '2025-10-22', 5, 40000.00);
SELECT 
    S.supplier_name,
    P.product_name,
    P.category,
    SO.quantity,
    SO.total_amount,
    SO.order_date
FROM 
    Suppliers S
JOIN 
    SupplyOrders SO ON S.supplier_id = SO.supplier_id
JOIN 
    Products P ON SO.product_id = P.product_id
ORDER BY 
    S.supplier_name;
SELECT 
    S.supplier_name,
    SUM(SO.quantity) AS total_quantity_supplied
FROM 
    Suppliers S
JOIN 
    SupplyOrders SO ON S.supplier_id = SO.supplier_id
GROUP BY 
    S.supplier_name;
SELECT 
    SO.order_id,
    S.supplier_name,
    P.product_name,
    SO.order_date,
    SO.total_amount
FROM 
    SupplyOrders SO
JOIN 
    Suppliers S ON SO.supplier_id = S.supplier_id
JOIN 
    Products P ON SO.product_id = P.product_id
WHERE 
    MONTH(SO.order_date) = 10 AND YEAR(SO.order_date) = 2025;
DELIMITER $$
CREATE PROCEDURE InsertSupplyOrder(
    IN p_supplier_id INT,
    IN p_product_id INT,
    IN p_order_date DATE,
    IN p_quantity INT
)
BEGIN
    DECLARE price DECIMAL(10,2);
    DECLARE total DECIMAL(10,2);

   
    SELECT unit_price INTO price FROM Products WHERE product_id = p_product_id;

    SET total = p_quantity * price;

   
    INSERT INTO SupplyOrders (supplier_id, product_id, order_date, quantity, total_amount)
    VALUES (p_supplier_id, p_product_id, p_order_date, p_quantity, total);
END $$
DELIMITER ;
SELECT 
    SO.order_id,
    S.supplier_name,
    P.product_name,
    SO.quantity,
    SO.total_amount,
    SO.order_date
FROM 
    SupplyOrders SO
JOIN 
    Suppliers S ON SO.supplier_id = S.supplier_id
JOIN 
    Products P ON SO.product_id = P.product_id
ORDER BY 
    SO.order_date;

Create database CinemaDB;
 Use CinemaDB;
 CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    duration_minutes INT
);
CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    show_time DATETIME,
    total_seats INT,
    available_seats INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    show_id INT,
    booking_date DATE,
    tickets_booked INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);
INSERT INTO Customers (customer_name, email, phone)
VALUES
('Ravi Kumar', 'ravi@example.com', '9876543210'),
('Sneha Patel', 'sneha@example.com', '9898989898'),
('Vikram Rao', 'vikram@example.com', '9123456789');
INSERT INTO Movies (movie_name, genre, duration_minutes)
VALUES
('Avengers: Endgame', 'Action', 181),
('Interstellar', 'Sci-Fi', 169),
('The Lion King', 'Animation', 118);
INSERT INTO Shows (movie_id, show_time, total_seats, available_seats)
VALUES
(1, '2025-11-01 10:00:00', 100, 95),
(1, '2025-11-01 14:00:00', 100, 100),
(2, '2025-11-01 12:00:00', 80, 78),
(3, '2025-11-01 15:00:00', 120, 115);
INSERT INTO Bookings (customer_id, show_id, booking_date, tickets_booked, total_amount)
VALUES
(1, 1, '2025-10-20', 2, 1000.00),
(2, 3, '2025-10-21', 1, 500.00),
(3, 4, '2025-10-22', 3, 1500.00),
(1, 2, '2025-10-23', 1, 500.00);
SELECT 
    C.customer_name,
    M.movie_name,
    S.show_time,
    B.tickets_booked,
    B.total_amount
FROM 
    Bookings B
JOIN 
    Customers C ON B.customer_id = C.customer_id
JOIN 
    Shows S ON B.show_id = S.show_id
JOIN 
    Movies M ON S.movie_id = M.movie_id
ORDER BY 
    B.booking_date;
SELECT 
    M.movie_name,
    SUM(B.tickets_booked) AS total_tickets
FROM 
    Movies M
JOIN 
    Shows S ON M.movie_id = S.movie_id
JOIN 
    Bookings B ON S.show_id = B.show_id
GROUP BY 
    M.movie_name;
SELECT 
    B.booking_id,
    C.customer_name,
    M.movie_name,
    S.show_time,
    B.tickets_booked
FROM
    Bookings B
        JOIN
    Customers C ON B.customer_id = C.customer_id
        JOIN
    Shows S ON B.show_id = S.show_id
        JOIN
    Movies M ON S.movie_id = M.movie_id
WHERE
    MONTH(B.booking_date) = 10
        AND YEAR(B.booking_date) = 2025;

=DELIMITER $$
CREATE PROCEDURE InsertBooking(
    IN p_customer_id INT,
    IN p_show_id INT,
    IN p_booking_date DATE,
    IN p_tickets INT,
    IN p_ticket_price DECIMAL(10,2)
)
BEGIN
    DECLARE seats_available INT;
    SELECT available_seats INTO seats_available FROM Shows WHERE show_id = p_show_id;

    IF seats_available >= p_tickets THEN
        -- Insert booking
        INSERT INTO Bookings (customer_id, show_id, booking_date, tickets_booked, total_amount)
        VALUES (p_customer_id, p_show_id, p_booking_date, p_tickets, p_tickets * p_ticket_price);

        -- Update available seats
        UPDATE Shows
        SET available_seats = available_seats - p_tickets
        WHERE show_id = p_show_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough seats available';
    END IF;
END $$
DELIMITER ;
SELECT 
    B.booking_id,
    C.customer_name,
    M.movie_name,
    S.show_time,
    B.tickets_booked,
    B.total_amount
FROM 
    Bookings B
JOIN 
    Customers C ON B.customer_id = C.customer_id
JOIN 
    Shows S ON B.show_id = S.show_id
JOIN 
    Movies M ON S.movie_id = M.movie_id
ORDER BY 
    B.booking_date;
SELECT 
    S.show_id,
    M.movie_name,
    S.show_time,
    S.total_seats,
    S.available_seats
FROM 
    Shows S
JOIN 
    Movies M ON S.movie_id = M.movie_id
ORDER BY 
    S.show_time;
