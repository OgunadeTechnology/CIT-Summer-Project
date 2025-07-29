/* 
Assignment: Foundational Database Programming Work book
Started: 6/12/2025
Completed 6/12/2025
Completed by Obaloluwa Oguande
*/

/*
Goals: Reinforce foundational skills in SQL through relatable, real-world scenarios.

Context: We need a way to manage a small family’s weekly household tasks.
*/
/*
Section 1: 
Write the SQL to create the database
*/
create database housetasks
go

use HouseTasks;
go

/*
Section 2:
Create a table to store information about household chores.
Explanation: Define a table with columns such as TaskID, TaskName, AssignedTo, and DueDate.
*/
create table Chores(
	TaskID int primary key,
	TaskName nvarchar(100) not null,
	AssignedTo nvarchar(25),
	DueDate date
);
go

/*
Section 3:
Insert chores like "Dishes," "Laundry," and "Vacuuming." You can assign chores to 'Mom', 'Dad', 'John'.
You can use the following Due dates: 2025-03-14, 2025-03-15, 2025-03-16
*/
insert into HouseTasks.dbo.Chores(Taskid, taskname, assignedto, duedate)
values
(1, 'Dishes', 'Mom', '2025-06-13'),
(2, 'Water Plants', 'Billy', '2025-06-16'),
(3, 'Laundry', 'Dad', '2025-06-14'),
(4, 'Clean Kitchen Counter', 'Sally', '2025-06-13'),
(5, 'Vacuum Living Room', 'Mom', '2025-06-15'),
(6, 'Mow Lawn', 'Billy', '2025-06-17'),
(7, 'Fold Clothes', 'Dad', '2025-06-16'),
(8, 'Clean Bathroom', 'Sally', '2025-06-14'),
(9, 'Take Out Trash', 'Mom', '2025-06-18');
go

/*
Section 4:
Retrieve tasks assigned to a specific family member.
*/
Select * from HouseTasks.dbo.chores
where assignedto ='Mom';
go

/*
Section 5:
Retrieve tasks due before 2025-06-15.
*/
select * from HouseTasks.dbo.chores
where duedate < '2025-06-15';
go

/*
Section 6:
Find tasks assigned to 'Dad' or due on '2025-06-16.'
*/
select * from HouseTasks.dbo.chores
where assignedto = 'Dad' or duedate = '2025-06-16';
go

/*
Section 7:
Exercise 1 - List all tasks assigned to 'Mom' and due after 2025-06-14.
*/
select * from HouseTasks.dbo.chores
where assignedto = 'Mom' and duedate > '2025-06-14';
go

/*
Section 7:
Exercise 2 - Count the number of tasks due before 2025-06-14.
*/
select count(duedate) from HouseTasks.dbo.chores
where duedate < '2025-06-14';
go

/*
Section 7: 
Exercise 3 - Find all the tasks that are past their due date (current date is '2025-06-16')
*/
select * from HouseTasks.dbo.chores
where duedate < '2025-06-16';
go

/*
Section 7: 
Exercise 4 - Retrieve tasks assigned to 'Billy'
*/
select * from HouseTasks.dbo.chores
where assignedto = 'Billy';
go

/*
Section 7: 
Exercise 5 - Find all the tasks that are either assigned to 'Dad' or are due before '2025-06-15.'
*/
select * from HouseTasks.dbo.chores
where assignedto = 'Dad' or duedate < '2025-06-15';
go


/*Section 8: 
Challenge Exercise - Design a new table and write queries to manage either a carpool schedule or grocery inventory.
*/
create database GroceryInventory;
go

use groceryInventory;
go

create table Groceries(
	g_ID int primary key,
	g_name nvarchar(50) not null,
	Quantity tinyint default 1 not null ,
	Price numeric(5,2) not null,
	Calories int
);
go

insert into groceries (g_ID, g_name, Quantity, Price, Calories) values
(1, 'Bananas', 6, 1.20, 105),
(2, 'Whole Milk', 1, 3.49, 150),
(3, 'Bread', 2, 2.79, 70),
(4, 'Dozen Eggs', 1, 2.99, 70),
(5, 'Chicken Wings', 1, 5.50, 165),
(6, 'Broccoli', 2, 1.89, 55),
(7, 'White Rice', 1, 1.50, 215),
(8, 'Olive Oil', 1, 6.99, 119),
(9, 'Greek Yogurt', 4, 0.99, 100),
(10, 'Apples', 5, 3.25, 95);
go

select * from GroceryInventory.dbo.groceries;
go

select *from GroceryInventory.dbo.groceries
where g_name = 'Apples';
go

Select * from GroceryInventory.dbo.groceries
where calories >= 150;
go

select * from GroceryInventory.dbo.groceries
where quantity < 3 and price > 2.50;
go

select g_name, quantity*price as [Total Price] from GroceryInventory.dbo.groceries;
go

select g_name, quantity*calories as [Total Calories], quantity*price as [Total Price] from GroceryInventory.dbo.groceries
where quantity*price < 4.75 or quantity*calories > 200;
go


