use adventureworks;
-- Part 1: Current Date and Time

select getdate();
select cast(getdate() as date);
select cast(getdate() as time);

--Part 2: Extracting Date Parts

select datepart(year, modifieddate)
from adventureworks.sales.Customer;
go

select SalesOrderID, datename(weekday, modifieddate)
from adventureworks.Sales.SalesOrderDetail
go

select SalesOrderID, datename(month, modifieddate), datepart(month, modifieddate)
from adventureworks.Sales.SalesOrderDetail
go

select SalesOrderID, datepart(week, modifieddate)
from adventureworks.Sales.SalesOrderDetail
go

--Part 3: Measuring Time with DATEDIFF
select SalesOrderID, datediff(day, orderdate, shipdate) as [Days to Ship]
from Sales.SalesOrderHeader
where shipdate is not null;
go

select SalesOrderID, datediff(month, orderdate, shipdate) as [Months Between]
from Sales.SalesOrderHeader
where shipdate is not null;
go

select SalesOrderID, datediff(year, orderdate, getdate()) as [Years since Order]
from Sales.SalesOrderHeader;
go

--Part 4
select SalesOrderID, orderdate, dateadd(day, 10, orderdate) as [OrderDate plus 10 Days]
from Sales.SalesOrderHeader;
go

select customerid, modifieddate, dateadd(month, 1, modifieddate) as [Mod Date +1 Month]
from sales.customer;
go

select customerid, modifieddate, dateadd(year, 15, modifieddate) as [Mod Date +15 Years]
from sales.customer;
go

-- Part 5: End-of-Month and Ranges
select SalesOrderID, orderdate, eomonth(orderdate) as [End of Order Month]
from Sales.SalesOrderHeader;
go

select eomonth(getdate()) as [End of current Month];
go

select SalesOrderID, orderdate, eomonth(orderdate, 1) as [End of Next Month]
from Sales.SalesOrderHeader;
go

-- Part 6: Practical Scenarios
select *
from Sales.SalesOrderHeader
where orderdate >= dateadd(day, -90, getdate());
go

select *
from sales.customer
where year(modifieddate) = year(getdate());
go

select *
from Sales.SalesOrderHeader
where shipdate > DueDate;
go

select *
from Sales.SalesOrderHeader
where orderdate >= dateadd(day, 1, eomonth(getdate(), -2))
  and orderdate <= eomonth(getdate(),-1);
go


--AdventureWorksLT T-SQL Date & Time Practice 2
use adventureworkslt;
--Part 1: Quick Date Facts
select getdate();
select datename(dw, getdate());
select datepart(dy, getdate());

--Part 2
select salesorderid, orderdate, datepart(quarter, orderdate) as [Order Quarter]
from saleslt.salesorderheader;
go

select salesorderid, orderdate
from saleslt.salesorderheader
where datename(month, orderdate) = 'December';
go

select salesorderid, orderdate, datename(weekday, orderdate) as [Day of Week]
from saleslt.salesorderheader
where datename(weekday, orderdate) in ('Saturday', 'Sunday');
go

--Part 3
select salesorderid, orderdate, dateadd(week, 3, orderdate) as [Order date plus 3 weeks]
from saleslt.salesorderheader;
go

select salesorderid, duedate, dateadd(day, -10, duedate) as [Due Date -10 Days]
from saleslt.salesorderheader;
go

select dateadd(minute, 90, cast(getdate() as time)) as [Current time plus 90 min];
go

--Part 4
select salesorderid, orderdate, shipdate,
       datediff(hour, orderdate, shipdate) as [Hours Between order and ship]
from saleslt.salesorderheader
where shipdate is not null;
go

select customerid, firstname, lastname, modifieddate
from saleslt.customer
where datediff(day, modifieddate, getdate()) > 1000;
go

select getdate() as today,
       eomonth(getdate()) as end_of_month,
       datediff(day, cast(getdate() as date), eomonth(getdate())) as [Days untill month ends];
go

-- Part 5
select salesorderid, orderdate
from saleslt.salesorderheader
where day(orderdate) = day(eomonth(orderdate));
go

select salesorderid, orderdate
from saleslt.salesorderheader
where day(orderdate) <= 7;
go

select eomonth(dateadd(month, 3, getdate())) as [Last Day 3 Months from Now];
go

--Part 6
select orderdate, datename(weekday, orderdate) as [Weekday Name], datename(month, orderdate) as [Month Name]
from saleslt.salesorderheader;
go

select customerid, modifieddate
from saleslt.customer
where datename(weekday, modifieddate) in ('saturday', 'sunday');
go

select salesorderid, orderdate
from saleslt.salesorderheader
where cast(orderdate as date) = dateadd(year, -1, cast(getdate() as date));
go

select customerid, modifieddate
from saleslt.customer
where year(modifieddate) = year(getdate())
  and month(modifieddate) = month(getdate());
go

select datename(weekday, orderdate) as [Weekday Name], count(*) as [Order Count]
from saleslt.salesorderheader
group by datename(weekday, orderdate);
go





