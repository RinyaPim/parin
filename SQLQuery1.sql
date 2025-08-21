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

-- ��ͧ������ʾ�ѡ�ҹ ���;�ѡ�ҹ �������觫��ͷ������Ǣ�ͧ ���§����ӴѺ��ѡ�ҹ
select e.EmployeeID, FirstName, orderID
from Employees as e join orders as o on e.EmployeeID = o.EmployeeID
order by EmployeeID
-- ��ͧ��������Թ��� ���ͧ ��л���Ȣͧ����ѷ����˹���
select ProductID , Productname , City , Country
from Products p join Suppliers s on p.SupplierID = s.SupplierID
-- ��ͧ��ê��ͺ���ѷ���� ��Шӹǹ���觫��ͷ������Ǣ�ͧ
select CompanyName, count(*)
from orders as o join Shippers as s on o.ShipVia = s.ShipperID 
GROUP by CompanyName
-- ��ͧ��������Թ��� �����Թ��� ��Шӹǹ�������������
select p.ProductID,p.ProductName, sum(Quantity) as �ӹǹ������������
from products p join [Order Details] od on p.ProductID = od.ProductID
GRoup by p.ProductID,p.ProductName

select O.OrderID �Ţ���觫��� , C.CompanyName �١���, E.FirstName ��ѡ�ҹ, O.ShipAddress ��价��
from Orders O,Customers C,Employees E
where O.CustomerID=C.CustomerID
AND O.EmployeeID=E.EmployeeID

select O.OrderID �Ţ���觫���, C.CompanyName �١���, E.FirstName ��ѡ�ҹ, O.ShipAddress ��价��
from Orders O
	join Customers C on O.CustomerID=C.CustomerID
	join Employees E on O.EmployeeID=E.EmployeeID

-- ��ͧ��ê����Թ��ҷ�� nancy ����� ������ ���§����ӴѺ�����Թ���
select distinct p.ProductID,p.ProductName
from Employees e join orders o on e.EmployeeID = o.EmployeeID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
order by ProductID
--��ͧ��ê��ͺ���ѷ�١��Ҫ��� Around  the Horn �����Թ��ҷ���Ҩҡ��������ú�ҧ
select distinct s.Country
from customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
				 join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
--�١��Ҫ��� Around the Horn �����Թ������ú�ҧ �ӹǹ����
select p.ProductID, p.ProductName, sum(Quantity) as [sum of Quantity]
from Customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on od.OrderID = o.OrderID
				 join products p on p.ProductID = od.ProductID
where c.CompanyName = 'Around the Horn'
Group by p.ProductID, p.ProductName
order by 1
--��ͧ��������Ţ���觫��� ���;�ѡ�ҹ ����ʹ�������觫��͹��
SELECT o.OrderID, e.FirstName, 
		sum((od.Quantity * od.UnitPrice * (1-od.Discount))) as TotalCash
from orders o join Employees e on o.EmployeeID = e.EmployeeID
			  join [Order Details] od on o.OrderID = od.OrderID
group by o.OrderID, e.FirstName
order by OrderID