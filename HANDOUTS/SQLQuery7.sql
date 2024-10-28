-- Creating a database
CREATE DATABASE Cohort_7;

-- Making use of the database created
USE Cohort_7

-- Creating a table called 'Employees'
CREATE TABLE Employees(
		EmployeeID INT PRIMARY KEY,
		FirstName  VARCHAR(100),
		LastName  VARCHAR(100),
		Department VARCHAR(100),
		Salary DECIMAL(10, 2)
)

-- see the internals of the table
SP_help Employees

-- check all the entries on the table
SELECT * FROM Employees

-- Inserting data into the Employees table
INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
VALUES (1, 'John', 'Doe', 'HR', 55000.00),
       (2, 'Jane', 'Smith', 'Marketing', 60000.00),
	   (3, 'Bob', 'Johnson', 'IT', 65000.00);

-- Selecting a portion of the table
SELECT FirstName, LastName From Employees;

-- Using the WHERE statement/ clause
SELECT * FROM Employees
 WHERE Department = 'HR'

-- Using the WHERE statement with a condition
SELECT * FROM Employees
  WHERE Salary > 60000

-- Update statement
UPDATE Employees
SET Salary = 58000.00
WHERE EmployeeID = 1;

-- ALTER a column name
--EXEC sp_rename 'Employees.DEAPAERTMENT', 'DEPARTMENT', 'COLUMN';

-- Delete function
DELETE FROM Employees
WHERE EmployeeID = 3;

SELECT * FROM Employees

-- Aggreagation
-- Calculate the average salary of employees in the IT department
SELECT concat('$ ', round(AVG(price), 2)) AS AveragePrice
      FROM house_pricing_dataset
	  WHERE yr_renovated = 2005;

SELECT MAX(price) AS Maximum_price
        FROM house_pricing_dataset

SELECT AVG(price) AS AveragePrice
      FROM house_pricing_dataset
	  WHERE yr_renovated = 2005;

SELECT MIN(price) AS Minimum_price
        FROM house_pricing_dataset
		WHERE price > 0

SELECT COUNT(price) AS price_count
        FROM house_pricing_dataset

SELECT COUNT(DISTINCT(city)) AS Unique_cities
        FROM house_pricing_dataset

-- Subqueries:
-- Subquery inside the WHERE clause
SELECT price, yr_renovated, city
   FROM house_pricing_dataset WHERE price > (SELECT AVG(price)
                                             FROM house_pricing_dataset)

--
--SELECT price,
--      city,        
        
--      (SELECT Territ
--        FROM Sales.Customer         
--        WHERE CustomerID = 29974) AS TerritoryID 
--FROM Sales.SalesOrderHeader 
--WHERE CustomerID = 29974;


--JOINS

INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
VALUES (4, 'Dorcas', 'Francis', 'Finance', 75000.00);

-- Creating a Department table
CREATE TABLE Departments(
		DepartmentID INT PRIMARY KEY,
		DepartmentName VARCHAR(50)
);

-- Inserting data into the 'Department' table
INSERT INTO Departments	(DepartmentID, DepartmentName)
VALUES(1, 'HR'),
	  (2, 'Marketing'),
	  (3, 'IT');

SELECT * FROM Employees
SELECT * FROM Departments

-- INNER JOIN
SELECT * FROM Employees
INNER JOIN Departments
ON Employees.Department = Departments.DepartmentName

-- LEFT JOIN
SELECT * FROM Employees
LEFT JOIN Departments
ON Employees.Department = Departments.DepartmentName

-- RIGHT JOIN
SELECT * FROM Employees
RIGHT JOIN Departments
ON Employees.Department = Departments.DepartmentName

-- FULL OUTER JOIN
SELECT * FROM Employees
FULL OUTER JOIN Departments
ON Employees.Department = Departments.DepartmentName

--INSERT INTO Departments	(DepartmentID, DepartmentName)
--VALUES(4, 'Media');

SELECT Employees.Salary * Departments.DepartmentID AS Net_salary FROM Employees
LEFT JOIN Departments
ON Employees.Department = Departments.DepartmentName

-- Constraints
---PRIMARY KEY
CREATE TABLE Employees_1(
		EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		LastName VARCHAR(50)
);

INSERT INTO Employees_1(EmployeeID, FirstName, LastName)
VALUES (1, 'John', 'Doe'),
       (2, NULL, 'Smith'),
	   (3, 'Bob', 'Johnson');

SELECT * FROM Employees_1

-- Foreign Key
CREATE TABLE Customers(
   CustomerID INT PRIMARY KEY,
   CutomerName VARCHAR(50)
   );

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers(CustomerID, CutomerName)
VALUES (101, 'Joe'),
       (102, 'Smith'),
	   (103, 'Jane');


INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES (1, 101, '10-21-2024'),
       (2, 102, '10-22-2024'),
	   (3, 103, '10-23-2024');


INSERT INTO Customers(CustomerID, CutomerName)
VALUES (NULL, 'Steve')

INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES (4, NULL, '10-24-2024');

SELECT * FROM Orders

-- Unique Constraint
CREATE TABLE Products(
    ProductID INT UNIQUE,
	ProductName VARCHAR(100)
);

-- Check Constraint
CREATE TABLE Students(
       StudentID INT PRIMARY KEY,
	   Age INT
	   CHECK (Age >= 18)
);

INSERT INTO Students(StudentID, Age)
VALUES (01, 17);
INSERT INTO Products(ProductID, ProductName)
VALUES (011, 'Sneakers'),
        (012, 'Shirts');

-- DEFAULT Constraint
CREATE TABLE Orders_1(
		OrderID INT PRIMARY KEY,
		OrderDate DATE DEFAULT GETDATE()
);

INSERT INTO Orders_1(OrderID)
VALUES (100);

Select * from Students

INSERT INTO Students(StudentID, Age)
VALUES (02);