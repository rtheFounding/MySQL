--1. Add a new supplier
INSERT INTO suppliers(SupplierID, CompanyName, ContactName, ContactTitle)
VALUES(32, "Randy Corp", "Randy Rivera", "Entry Level Software Engineer")

--2. Add a new product provided by that supplier
INSERT INTO products(ProductID, ProductName, SupplierID)
VALUES(79, "Bob's Burgers", 32)

--3.List all products and their suppliers
SELECT ProductName, CompanyName
from products
join suppliers on products.SupplierID = suppliers.SupplierID
ORDER BY ProductName

--4.Raise the price of your new product by 15%
UPDATE products
SET UnitPrice = (UnitPrice * 1.15)
WHERE ProductName = "Bob's Burgers"

--5. List the products and prices of all products from that supplier
select productName, UnitPrice, SupplierID
from products where SupplierID = 32

--6. Delete the new Product
DELETE FROM products
WHERE ProductID = 79

--7. Delete the new supplier
DELETE FROM suppliers
WHERE SupplierID = 32

--8. List all prpducts
SELECT * FROM products

--9. List all suppliers
SELECT * FROM suppliers