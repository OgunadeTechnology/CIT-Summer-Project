select OrderID,
       CustomerID,
	   OrderDate
from Northwind.dbo.Orders
where ShippedDate <= '1998-05-04';
go
select titleofcourtesy+ ' ' + lastname + ', ' + firstname as [Full Name],
       BirthDate as [Date of Birth],
	   HireDate as [Date Hired],
	   Address,
	   City,
	   Region,
	   PostalCode as [Postal Code],
	   Country
from Northwind.dbo.Employees
where EmployeeID >= 5
go
select * 
from Northwind.dbo.Orders
where ShipRegion is null;
go