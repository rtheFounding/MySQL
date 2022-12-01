--1. How many suppliers are there? Use a Query!
SELECT COUNT(*)
FROM suppliers;

--2. What is the sum of all the employee's salaries?
SELECT sum(Salary)
FROM employees

--3. What is the price of the cheapest item that Northwind sells?
SELECT ProductName, min(UnitPrice) AS Cheapest_Item
FROM products
GROUP BY ProductName
ORDER By min(UnitPrice)
LIMIT 1

--4. What is the average price of items that Northwind sells?
SELECT AVG(UnitPrice) AS Average_Price
FROM products

--5. What is the price of the most expensive item that Northwind sells?
SELECT ProductName, MAX(UnitPrice) AS Expensive_Item
FROM products
GROUP BY ProductName
ORDER BY MAX(UnitPrice) DESC
LIMIT 1

--6. What is the supplier ID of each supplier and the number of items they supply? 
SELECT SupplierID, Count(*) AS Items_Supplied
FROM products
GROUP BY SupplierID

--7 What is the categoryID of each category and the average price of each item in the category?
SELECT CategoryID, AVG(UnitPrice)
FROM products
GROUP BY CategoryI

--8. For suppliers that provide at least 5 items to Northwind, what is the supplierID of each supplier and the number of items they supply
SELECT SupplierID, Count(*) AS Items_Supplied
FROM products
GROUP BY SupplierID
HAVING Items_Supplied >= 5

--9. List the productID, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value.
-- If two or more have the saem value, order by product name.
SELECT ProductID, ProductName, UnitPrice*UnitsInStock AS Inventory_Value
FROM Products
ORDER BY Inventory_Value DESC, ProductName

--Random Question List all movies and their combined sales in millions of dollars .
SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

--List all movies and their ratings in percent
SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;


