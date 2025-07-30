/*
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100)
);

-- Insert sample customers
INSERT INTO Customers (CustomerID, CustomerName, Email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com');

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,  -- Foreign key linking to Customers table
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

-- Insert sample orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2025-03-15', 50.00),
(102, 2, '2025-03-16', 75.00),
(103, 3, '2025-03-17', 100.00);
*/

--Write a simple JOIN query showing Customers that have made Orders without using shortcuts.

select customers.customerName, customers.email, orders.orderID
from customers
join orders
	on customers.customerID = orders.customerID;
--problem: It's inefficent to keep writing the entire name of the table and just waste time each time the table name has to be typed out

--Same thing but with aliases
select c.customername, c.email, o.orderid
from customers c
join orders o
  on c.customerid = o.customerid;

--Sort orders by date
select c.customername, c.email, o.orderid, o.orderdate, o.totalamount
from customers c
join orders o
  on c.customerid = o.customerid
order by o.orderdate;

--Write a query that shows the total Orders per CustomerName, even for customers that have not yet placed an Order.
select c.customername, c.email, count(o.orderid) as [Number of Orders], sum(o.totalamount) as [Total Order Cost]
from customers c
left join orders o
  on c.customerid = o.customerid
group by c.customername, c.email;

--Write a query that shows the Customer Name of Customers that have not placed an order.
select c.customername, c.email, count(o.orderid) as [Number of Orders], sum(o.totalamount) as [Total Order Cost]
from customers c
left join orders o
  on c.customerid = o.customerid
group by c.customername, c.email
having count(o.orderid) = 0;

/*
Step 6: Discuss the Results

How did aliasing speed up query writing?
It made it a lot faster and easier to write. I didn't have to type the full name of the query multiple times.

Was aliasing helpful for readability?
It wasn't as wordy and I could understand what I had done quickly

Where would aliasing be essential in larger databases?
Evrerywhere when writing joins or queries concerning like 3+ tables. 
Because of the large amount of tables it would be easier to remember an alias than every table name.

*/
