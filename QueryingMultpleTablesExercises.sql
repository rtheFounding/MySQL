--Inner Join, a row in one table s joined with a row in another table based on a column match
-- Join is also the same as Inner Join

--In SQL, the Left OUTER JOIN is the same as the LEFT JOIN where we can combine two tables on a certain condition. By definition, SQL Left Outer Join 
--keyword executes to fetch all the rows from the left table (suppose Table A) along with some common rows if matched from the right table (Suppose Table B) form the two tables. 
--If there is no common row that matches between left and right tables then the result is NULL, the Left Outer Join returns only the left tables data.


--The SQL RIGHT OUTER JOIN is a type of outer join to which prefer all the rows of a right table or second table to combine the two tables. 
--It adds all the rows from the second table to the resulted table. If there is no matching value in the two tables, it returns the null value.
--the query result finds all the rows from the second table and includes the matching rows from the left table.
-- One thing you should notice that if there is no match in both the tables it returns a null value.

--1. List the product id, product name, unit price and category name of all products. Order by category name and within that, product name.
select ProductId, ProductName, UnitPrice, CategoryName
FROM products
JOIN categories
ON products.CategoryID = categories.CategoryID
ORDER BY CategoryName, ProductName

--2. List the product id, product name, unit price and supplier name of all products that cost more than 75. Order by product name
SELECT ProductId, ProductName, UnitPrice, CompanyName
FROM products
JOIN suppliers
ON products.SupplierID = suppliers.SupplierID
WHERE UnitPrice > 75
ORDER BY ProductName

--3. List the product id, product name, unit price and supplier name of all products that cost more than $75. Order by product name.
SELECT ProductId As ID, ProductName AS Name, CategoryName AS Category, CompanyName AS Supplier
FROM products
JOIN suppliers on products.SupplierID = suppliers.SupplierID
join categories on products.CategoryID = categories.CategoryID
ORDER BY ProductName

--4. What is the product name(s) and categories of the most expensive products?
SELECT ProductName AS Name, CategoryName AS Category, UnitPrice AS Price
FROM products
JOIN categories on products.CategoryID = categories.CategoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice) from products)

--5. List the order id, ship name, ship address, and shipping company name of every order that shipped to Germany
SELECT OrderID, ShipName, ShipAddress, CompanyName, ShipCountry
from orders
JOIN suppliers on shipvia = suppliers.SupplierID
WHERE ShipCountry = "Germany"

--6. List the order id, order date, ship name, ship address of all orders that ordered "Sasquatch Ale"
SELECT orders.OrderID, OrderDate, ShipName, ShipAddress
from orders
join `order details` on `order details`.OrderID = orders.OrderID
WHERE ProductID = 34

-- or
select orders.OrderID, OrderDate, ShipName, ShipAddress, ProductName
from orders
join `order details` AS details ON details.OrderID = orders.OrderID
join products on details.ProductID = products.ProductID
where ProductName = "Sasquatch Ale"
