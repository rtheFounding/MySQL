--1. What is the product name(s) of the most expensive products?
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (SELECT MAX(UnitPrice)
				   FROM products)


--2.What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"?
select orderid, ShipName, ShipAddress, ShipVia
from orders where ShipVia = (select shipperid
from shippers WHERE CompanyName = "Federal Shipping")

--3.What are the order ids of the orders that ordered "Sasquatch Ale"
SELECT OrderID
fROM `order details`
WHERE ProductID = 
(SELECT ProductID
From products
WHERE ProductName = "Sasquatch Ale")

--4. What is the name of the employee that sold order 10266
select orderid, (select CONCAT(FirstName, " ", LastName) from employees where employees.EmployeeID = orders.EmployeeID) 
AS NAME FROM orders
WHERE orderid = 10266

--5. What is the name of the customer that bought order 10266
select orderid, 
(SELECT CONCAT(CompanyName, ", ", ContactName) FROM customers where customers.CustomerID = orders.CustomerID) 
AS NAME FROM orders
WHERE orderid = 10266
