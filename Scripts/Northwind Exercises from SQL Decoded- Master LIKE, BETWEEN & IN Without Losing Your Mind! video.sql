--Northwind Exercises from "SQL Decoded: Master LIKE, BETWEEN & IN Without Losing Your Mind!" video
/*
Exercises:

1. Retrieve all products with UnitPrice between 10 and 20.

2. Find all orders placed between January 1, 1997, and December 31, 1997.

3. Get all employees whose BirthDate falls between 1950 and 1960.

4. Fetch all products in the categories with IDs 1, 3, or 5.

5. Display all orders shipped to the cities "Berlin," "London," and "Paris."

6. List all products with UnitsInStock between 50 and 100.

7. Find orders shipped between March 1, 1998, and March 31, 1998.

8. Retrieve all employees working in the territories with IDs 01581, 01730, or 01890.

9. Get all customers located in countries "Germany," "France," or "Italy."

10. Find all suppliers with SupplierID between 5 and 10.

11. Retrieve products with UnitPrice between 5 and 15, and with UnitsInStock greater than 20.

12. List orders placed by customers located in the USA, Canada, or Mexico, and placed between 1996
and 1997.

13. Fetch all products in categories with IDs 2, 4, or 6 and with UnitsInStock less than 50.

14. Display all orders where the freight cost (Freight) is between 50 and 200 and the ship city is in
"London" or "Berlin."

15. Retrieve orders shipped between 1998-01-01 and 1998-06-30 with a freight cost greater than 100.

16. List all products where SupplierID is between 3 and 7, and CategoryID is in (1, 3, 5).

17. Find all orders placed by employees with EmployeeID between 2 and 5 and shipped to "USA" or "UK."
*/
--Q1
select * from Northwind.dbo.products
where UnitPrice between 10 and 20;

--Q2
select * from northwind.dbo.orders
where OrderDate between '1997-01-01' and '1997-12-31';

--Q3
select * from northwind.dbo.Employees
where birthdate between '1950-01-01' and '1960-12-31';

--Q4
select * from northwind.dbo.products
where CategoryID in (1, 3, 5);

--Q5
select * from northwind.dbo.Orders
where ShipCity in ('Berlin', 'London', 'Paris');

--Q6
select * from northwind.dbo.Products
where UnitsInStock between 50 and 100;

--Q7
select * from northwind.dbo.Orders
where shippeddate between '1992-03-01' and '1998-03-31';

--Q8
select * from northwind.dbo.Employees
where EmployeeID in (05181, 017330, 1890);

--Q9
select * from northwind.dbo.Customers
where Country in ('Germany', 'France', 'Italy');

---Q10
select * from northwind.dbo.Suppliers
where SupplierID between 5 and 10;

--Q11
select * from Northwind.dbo.Products
where UnitPrice between 5 and 15
and UnitsInStock > 20;

--Q12
select * from northwind.dbo.orders
where ShipCountry in ('USA', 'Canada', 'Mexico')
and OrderDate between '1996-01-01' and '1997-12-31';

--Q13
select * from northwind.dbo.products
where CategoryID in (2,4,6)
and UnitsInStock < 50;

--Q14
select * from northwind.dbo.orders
where Freight between 50 and 200
and ShipCity in ('London', 'Berlin');

--Q15
select * from northwind.dbo.Orders
where ShippedDate between '1998-01-01' and '1998-06-30'
and Freight > 100;

--Q16
select * from northwind.dbo.Products
where SupplierID between 3 and 7
and CategoryID in (1,3,5)

--Q17
select * from northwind.dbo.Orders
where EmployeeID between 2 and 5
and ShipCountry in ('USA', 'UK');
