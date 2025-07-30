--Assignemnt Exercise from ORDER BY, TOP & OFFSET-FETCH: The Beginner's Guide to T-SQL Sorting video
--Completed by Obaloluwa Ogunade
--6/16/2025

--Write a query to return the 5 most expensive products based on hte UnitPrice
select top (5) *
from Products
order by unitprice desc;

/*Turn the above query into a deteministic one by:
a. Writing a solution that include tires and
b. Writing another query that breaks ties
*/
--a)
select top (5) with ties*
from Products
order by unitprice desc;
--b)
select top (5) *
from Products
order by unitprice desc, UnitsInStock;

/*
You are requested to write a set (more than one) of queries that page through products 3 at a time in unit price ordering
using productID as a tie breaker.
*/
select * from Northwind.dbo.Products
order by UnitPrice desc, ProductID
offset 0 rows fetch next 5 rows only;
go
select * from Northwind.dbo.Products
order by UnitPrice desc, ProductID
offset 5 rows fetch next 5rows only;
go
select * from Northwind.dbo.Products
order by UnitPrice desc, ProductID
offset 10 rows fetch next 5 rows only;
go
select * from Northwind.dbo.Products
order by UnitPrice desc, ProductID
offset 15 rows fetch next 5 rows only;
go
select * from Northwind.dbo.Products
order by UnitPrice desc, ProductID
offset 20 rows fetch next 5 rows only;