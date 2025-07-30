/*
Week 1 Assessment Questions
Obaloluwa Ogunade
*/

/*
Q1: What is a computer?
An electronic device that can be programmed to do instructions

Q2: 
Look around you, based on your definition above, write 10 things around you that
qualifies as a computer.Computer, Desktop, First TV, Secound TV, My phone, My brother's phone, My father's phone, My electronic clock, My father's computer, and My Raspberry pi

Q3: What is a computer program?
The instructions the computer uses to do something, also known as construction

Q4: Computer Programming vs Software Development. Compare and Contrast both terms
Software Devleopment is the making of an IT product. The relationship between the two is that computer programming is 30-80% of software development. 
Software development includes more stuff

Q5: What is a byte? How many bits are in a byte?
A byte is the smallest addressable data tiem on many computer'ss central processing unit. 8 bits = 1 byte

Q6: List 4 programming languages you know
SQL, Java, and Java Script

Q7: SQL is short for what?
SQL is short for Structured Query Language

Q8: List the types of data you know
Structured, Semi-structured, and unstructured

Q9: What is DBMS?
Database Mangement System. Essentially what manegers/coordinates the database. It allows the ablity to add, change, delete, and retrieve stuff from the data base.

Q10: What RDBMS
Relational Database Mangement System. The same as above but with relationsal data (structured data)

Q11: What RDBMS(s) do u know? 
PostgreSQL, Oracle, SQL Server, and MySQL

Q12: SQL Server|SSMS. Which one is the client application and which is the server software
SQL Server is the sever software, and the client application is SSMS.

Q13: What data types would u assign to the following? 
a. US state codes (NC, VA, WA, NY etc)
b. US state names (North Carolina, Virginia, Washington, New York etc)
c. People’s age (1 – 100)
d. Employee salaries
e. True or False
f. Scientific data (I'm gonna assume non-nummerical)
a1. char(2)
b1. varchar(20)
c1. tinyint
d1. numeric(10,2);
e1. bit
f1. nvarchar(8000)
*/

/*Q14: Write a program to calculate and displays the tips a customer should add to their bill at a restaurant. Tips are 15% of the bill. 
Create a variable for the bill amount, calculate 15% of the data in your variable. Display your tip result.
*/
declare @bill numeric(5,2) = 82.34;
declare @tip numeric(5,2) = @bill*0.15;
print @tip;

/*
1. Declare a variable @myVariable of type INT and assign it a 
value of 10. Then print its value using the PRINT statement.

2. Declare two INT variables @first and @second. Assign them the
values 5 and 10 respectively. Then declare another variable 
@result to store the sum of @first and @second. Print the result.

3. Declare two VARCHAR variables @firstname and @lastname. Assign
them your first and last name. Then declare a variable @fullname that
concatenates these values with a space in between. Print the full name.

4. Declare a variable @age and assign it a value. Use and IF statement
to print "You are an adult" if the value is 18 or above, and
"You are a minor" otherwise.

5. Declare two variables @quantity and @price and assign them values.
Then declare a variable @totalcost to store the product of @quantity and
@price. Print the total cost.

6. Declare a variable @currentdate of type DATETIME and assign it the 
current date and time using the GETDATE() function. Print the value of 
variable.

7. Declare a variable @counter and initialize it to 1. Use a WHILE loop
to print numbers from 1 to 10.

8. Write a program that test to see if a number is either even or odd.
If the number is even PRINT "The number is even" otherwise PRINT
"The number is odd"
HINT: if you divide an even number by two, the remainder is always 0

9. Declare a variable @score of TINYINT datatype. If the value in @score is:
a. >= 90 PRINT 'Grade: A'
b. >= 80 PRINT 'Grade: B'
c. >= 70 PRINT 'Grade: C'
d. >= 60 PRINT 'Grade: D'
e. anything else PRINT 'Grade: F'

10. Declare two variables, @month of TINYINT datatype and @season of VARCHAR(10).
If @month falls in 12, 1, 2 set @season to 'Winter'
If @month falls in 3, 4, 5 set @season to 'Spring'
If @month falls in 6, 7, 8 set @season to 'Summer'
everything else set @season to 'Fall'
Finally print what's in @season.
HINT: you will need the "IN" operator to compare the months.
*/
--#1
declare @myVariable INT = 10;
print @myVariable;
go

--#2
declare @first INT = 5;
declare @secound INT = 10;
declare @result INT = @first + @secound;
print @result;
go

--#3
declare @firstname varchar(15) = 'Obaloluwa';
declare @lastname varchar (15) = 'Ogunade';
declare @fullname varchar (30) = @firstname + ' ' + @lastname;
print @fullname;
go

--#4
declare @age tinyint = 23;
If (@age >17)
	begin
		print 'You are an adult';
	end
else
	begin
		print 'You are a minor';
	end
go

--#5
declare @quantity int = 7;
declare @price numeric(5,2) = 12.23;
declare @totalcost numeric(7,3) = @quantity * @price;
print @totalcost;
go

--#6
declare @currentdate datetime = GETDATE();
print @currentdate;
go

--#7
declare @counter INT = 1;
while(@counter < 11)
	begin
		print(@counter);
		SET @counter = @counter + 1;
	end
go

--#8
declare @num int = 5;
if (@num%2 = 0)
	begin
		print 'The number is even!';
	end
else
	begin
		print 'The number is odd!';
	end
go

--#9
declare @score tinyint = 89;
if (@score >= 90)
	begin
		print 'Grade: A';
	end
else if (@score >= 80)
	begin
		print 'Grade: B';
	end
else if (@score >= 70)
	begin
		print 'Grade: C';
	end
else if(@score >= 60)
	begin
		print 'Grade: D';
	end
else
	print 'Grade: F';
go

--#10
declare @month tinyint = 4;
declare @season varchar(10);
if (@month IN (12, 1, 2))
	begin
		set @season = 'Winter';
	end
else if (@month in (3, 4, 5))
	begin
		set @season = 'Spring';
	end
else if (@month in (6,7,8))
	begin
		set @season = 'Summer';
	end
else
	begin
		set @season = 'Fall'
	end
go

/*
Create two tables, Order and OrderDetail In your practice db.
Order should have columns:
OrderID, CustomerID, OrderDate, and OrderTotal.
OrderDetail should have OrderDetailID, OrderID, ProductID, Quantity and
UnitPrice. Set up the appropriate Primary Keys and a Foreign Key relationship
between the two tables
Create a new table called Customer with the following columns:
CustomerID, CustomerName, Address, City, State, Zip. Add a foreign key
relationship between the Order and your new customer table. Don't forget
to add a primary key to your new customer table.
*/
/*
create table Customer(
	customerID int primary key,
	customerName varchar(30) not null,
	address varchar(30),
	city varchar(20),
	state char(2),
	zip char(5)
);*/
go
/*
create table [Order](
	orderID varchar(5) primary key,
	customerID int not null foreign key references customer(customerID),
	orderdate date not null,
	ordertotal numeric(6,2)
);
go
create table OrderDetail(
	orderdetailid int primary key,
	orderid varchar(5) foreign key references [order](orderid) not null,
	productid int not null,
	quantity int not null,
	unitprice numeric(6,2) not null
);
*/
/*
go
insert into customer 
Values 
(1, 'Chris Tucker', '354 Mary Way', 'Annapolis', 'MD', 23345),
(2, 'Wendell Pierce', '6 Brick St.', 'Richmond', 'VA', 240876),
(3, 'Bailey Song', '67 Capitol Blvd', 'Glen Allen', 'VA', 23059),
(4, 'Mary McCord', '12 Santos Dr.', 'Rivers', 'MD', 23445),
(5, 'John Little', '69 Peace St.', 'Wahiho', 'HI', 78521),
(6, 'Tade Oyebade', '3025 University Dr.', 'Durham', 'NC', 27703),
(7, 'Melvin Mebane', '16 Sunset Blvd', 'Reno', 'NV', 58726),
(8, 'Anthony Bright', '45 Pebblestone Dr.', 'Raleigh', 'NC', 27205),
(9, 'Troy Nemoy', '45 Sidney Ln', 'Silver Spring', 'MD', 23645),
(10, 'Angela Basset', '32 Littleton St.', 'Hollywood', 'CA', 90210);

insert into [order] values 
(1000, 4, '01/04/2025', 500),
(1001, 1, '02/10/2025', 1000),
(1002, 4, '01/06/2025', 410.50),
(1003, 9, '02/12/2025', 650.99),
(1004, 2, '01/20/2025', 500);

insert into orderdetail values 
(1500, 1000, 60, 10, 25),
(1501, 1000, 61, 5, 10),
(1502, 1000, 20, 10, 20),
(1503, 1004, 40, 10, 50),
(1504, 1002, 50, 10, 41.05),
(1505, 1001, 60, 40, 25),
(1506, 1003, 60, 10, 65.10);
*/