Select productID as [Product Id],
       productname as [Product Name],
	   unitprice as [Product Name],
	   UnitsInStock as [Unit Price],
	   Unitprice * UnitsInStock as [Total Amount in Stock],
	   (UnitsInStock + UnitsOnOrder)* UnitPrice as [Total Amount],
	   (Unitprice * UnitsInStock) - ((UnitsInStock + UnitsOnOrder)* UnitPrice) as [Difference]

from Northwind.dbo.products;

Select firstname+ ' ' + lastname from Northwind.dbo.Employees;