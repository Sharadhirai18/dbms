-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Sharadhi Rai
-- USN: 1RVU24BCA0080
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       
       create database social;
       use social;

-- Write your code below this line along with the output 

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
CREATE TABLE Customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city          VARCHAR(50)
);
-- insert 5 records
INSERT INTO Customers VALUES
(1,'Arjun','Mangalore'),
(2,'Meera','Mysore'),
(3,'Kiran','Bangalore'),
(4,'Riya','Delhi'),
(5,'Vikram','Mumbai');
-- TABLE:02 Orders Table
CREATE TABLE Orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    product_name VARCHAR(50),
    order_date   DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
    -- insert 5 records
INSERT INTO Orders VALUES
(101,1,'Laptop','2025-09-01'),
(102,1,'Mouse','2025-09-05'),
(103,3,'Keyboard','2025-09-07'),
(104,5,'Tablet','2025-09-10'),  
(105,2,'Headphones','2025-09-15');
-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore." */
   SELECT c.customer_name, o.product_name, o.order_date
   From customers c
   INNER JOIN Orders o ON c.customer_id = o.customer_id
   WHERE c.city = 'Bangalore';
   
  /* List all customers with the products they ordered.*/
SELECT c.customer_name, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

  /* Show customer names and their order dates.*/
  SELECT c.customer_name,o.order_date
  FROM Customers c
  INNER JOIN Orders o ON c.customer_id = o.customer_id;
  
  /* Display order IDs with the corresponding customer names.*/
  SELECT o.order_id,c.customer_name
  FROM Orders o
  INNER JOIN Customers c ON c.customer_id = o.customer_id;
  
   /*Find the number of orders placed by each customer.*/
   SELECT c.customer_name
   FROM Customers c 
   INNER JOIN Orders o ON c.customer_id = o.customer_id
   group by c.customer_name;
   
   /*Show city names along with the products ordered by customers.
*/
SELECT c.city , o.product_name
FROM Customers c 
INNER JOIN  Orders o ON c.customer_id = o.customer_id;


/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.*/
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

   /*List all customers and the products they ordered.*/
SELECT c.customer_id, c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
   
    /*Show customer IDs, names, and their order IDs.*/

    
    /*Find the total number of orders (if any) placed by each customer.*/

    /*Retrieve customers who have not placed any orders.*/

	/*Display customer names with their order dates.*/
    SELECT c.customer_name, o.order_date
    FROM Customers c 
    LEFT JOIN Orders o ON c.customer_id = o.customer_id;
/*-- Write your code below this line along with the output 
*/
 
/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.*/
      SELECT o.order_id,c.customer_name,o.product_name
      FROM Orders o
      RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
      /*Show all orders with the customer names.*/
      SELECT c.customer_name,o.product_name
      FROM Orders o
      RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
      
      /*Display product names with the customers who ordered them.*/
        SELECT c.customer_name,o.product_name
      FROM Orders o
      RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
	  /*List order IDs with customer cities.*/
        SELECT o.order_id, c.city
      FROM Orders o
      RIGHT JOIN Customers c ON o.customer_id = c.customer_id;
     /* Find the number of orders per customer (include those without orders).*/
     
	 /* Retrieve customers who do not have any matching orders.*/
     SELECT o.order_id, o.product_name
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
    /* Write your code below this line along with the output 
 */

/* 4: Full Outer Join – 
      /*  List all customers and products, whether they placed an order or not. */
      SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
      /*  Show customer IDs with order IDs (include unmatched ones). */
      SELECT c.customer_id, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
		/*Display customer names with order dates. */
        SELECT c.customer_name AS unmatched_customer, o.order_id AS unmatched_order
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
UNION
SELECT c.customer_name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;
		/*Find all unmatched records (customers without orders and orders without customers). */
       /* Show customer cities with products. */
    /* Write your code below this line along with the output 
  */   
  /* 5: Natural Join – 
          Find all orders placed by customers. */
SELECT * 
FROM Customers
NATURAL JOIN Orders;
         /* List all customers with the products they ordered using NATURAL JOIN. */
         SELECT customer_name, order_date
FROM Customers
NATURAL JOIN Orders;
          /*Show customer names along with their order dates using NATURAL JOIN. */
            SELECT customer_name, order_date
FROM Customers
NATURAL JOIN Orders;
         /* Find all customer cities and the products ordered by those customers using NATURAL JOIN. */
SELECT city, product_name
FROM Customers
NATURAL JOIN Orders;
     /*Write your code below this line along with the output 
  /*
  -- END OF THE EXPERIMENT