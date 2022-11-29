--1. What is the name of the table that holds the items Northwind sells?
--Name of table is products

--2. Write a query to list the product id, product name and unit price of every product
select ProductID, ProductName, UnitPrice
FROM Products

--3. Write a query to list the product id, proudct name and unit price of every product. Except this time, order then in ascending order by price.
select ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice ASC

--4. What are the products that we carry where the unit price is $7.50 or less?
select ProductName
FROM Products
WHERE UnitPrice <= 7.50

--5. What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price.
select ProductName
FROM Products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC

--6. What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price. If two or more have the same price list those in ascending order by product name
select ProductName, UnitPrice
FROM Products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC, ProductName asc

--7. What are the products that we carry where we have no units on hand, but 1 or more units of them on backorder? Order them by product name.
select ProductName
FROM Products
WHERE UnitsInStock = 0 AND UnitsOnOrder >= 1
ORDER BY ProductName

--8. What is the name of the table that holds the types (categories) of the items Northwind sells?
table categories 

--9. Write a query that lists all of the columns and all of the rows of the categories table? What is the category id of seafood?
select *
FROM categories

and the ID of seafood is 8

--10. Examine the Products table. How does it identify the type (category) of each item sold? Write a query to list all of the seafood items we carry.
select ProductName, CategoryID
FROM Products
WHERE CategoryID = 8

--11. What are the first and last names of all of the Northwind employees?
select FirstName, LastName
FROM Employees

--12. What employees have "manager" in their titles?
select FirstName, LastName, Title
FROM employees
WHERE Title LIKE "%manager%"

--13. List the distinct job titles in employees.
select DISTINCT title
FROM employees

--14. What employees have a salary that is betweeen $2000 and $2500
select FirstName, LastName
FROM employees
WHERE salary BETWEEN 2000 AND 2500

--15. List all of the information about all of Northwind's suppliers
select *
FROM suppliers

--16. Examine the products table. How do you know what supplier supplies each product? Write a query to list all of the items that "Tokyo Traders" supplies to Northwind 
--supplierID is used to know what supplier supplies each product

select ProductName
FROM products
WHERE supplierID = 4