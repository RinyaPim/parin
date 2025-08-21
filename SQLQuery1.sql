SELECT CategoryName, ProductName, UnitPrice
FROM Categories , Products
WHERE Categories.CategoryID = Products.CategoryID
ORDER BY CategoryName

SELECT CategoryName, ProductName, UnitPrice
FROM Products join Categories
on Products.CategoryID = Categories.CategoryID

SELECT CategoryName, ProductName, UnitPrice
FROM Products as p,Categories as c
where p.CategoryID = c.CategoryID 

SELECT CompanyName,OrderID
from orders, shippers
WHERE shippers.ShipperID = orders.ShipVia

SELECT CompanyName,OrderID
from orders JOIN shippers
on shippers.ShipperID = orders.ShipVia

SELECT ProductID, ProductName, CompanyName,Country 
from Products p, Suppliers s
WHERE p.SupplierID = s.SupplierID

Select CompanyName, OrderID
from Orders, Shippers
where Shippers.ShipperID = Orders.Shipvia
