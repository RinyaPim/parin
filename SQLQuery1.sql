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
AND orderID = 10275

-- ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งซื้อที่เกี่ยวข้อง เรียงตามลำดับพนักงาน
select e.EmployeeID, FirstName, orderID
from Employees as e join orders as o on e.EmployeeID = o.EmployeeID
order by EmployeeID
-- ต้องการรหัสสินค้า เมือง และประเทศของบริษัทผู้จำหน่าย
select ProductID , Productname , City , Country
from Products p join Suppliers s on p.SupplierID = s.SupplierID
-- ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
select CompanyName, count(*)
from orders as o join Shippers as s on o.ShipVia = s.ShipperID 
GROUP by CompanyName
-- ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
select p.ProductID,p.ProductName, sum(Quantity) as จำนวนที่ขายได้ทั้งหมด
from products p join [Order Details] od on p.ProductID = od.ProductID
GRoup by p.ProductID,p.ProductName

select O.OrderID เลขใบสั่งซื้อ , C.CompanyName ลูกค้า, E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
from Orders O,Customers C,Employees E
where O.CustomerID=C.CustomerID
AND O.EmployeeID=E.EmployeeID

select O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า, E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
from Orders O
	join Customers C on O.CustomerID=C.CustomerID
	join Employees E on O.EmployeeID=E.EmployeeID

-- ต้องการชื่อสินค้าที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับรหัสสินค้า
select distinct p.ProductID,p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
order by ProductID
--ต้องการชื่อบริษัทลูกค้าชื่อ Around  the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
select distinct s.Country
from customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
				 join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
--ลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด
select p.ProductID, p.ProductName, sum(Quantity) as [sum of Quantity]
from Customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on od.OrderID = o.OrderID
				 join products p on p.ProductID = od.ProductID
where c.CompanyName = 'Around the Horn'
Group by p.ProductID, p.ProductName
order by 1
--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
SELECT o.OrderID, e.FirstName, 
		sum((od.Quantity * od.UnitPrice * (1-od.Discount))) as TotalCash
from orders o join Employees e on o.EmployeeID = e.EmployeeID
			  join [Order Details] od on o.OrderID = od.OrderID
group by o.OrderID, e.FirstName
order by OrderID