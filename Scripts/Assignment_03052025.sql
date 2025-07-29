/* 
Assignment: comparison_operator_challenge_03052025
Completed 6/12/2025
Completed by Obaloluwa Oguande
*/
use practice;
go

--Weekly Meal Challenge
/*
Create a table called WeeklyMeals in your Practice Database.
WeeklyMeals should have the following columns:
1. Day: unicode character of length 20 nullable,
2. Breakfast: unicode character of length 50 nullable,
3. Lunch: unicode character of length 50 nullable,
4. Dinner: unicode character of length 50 nullable,

Add the following data into WeeklyMeals
['Monday', 'Oatmeal', 'Salad', NULL]
['Tuesday', NULL, 'Pasta', 'Stew']

Question:
1. What day is missing Dinner?
2. What is for lunch on Tuesday?
*/
create table WeeklyMeals(
	[Day] nvarchar(20),
	Breakfast nvarchar(50),
	Lunch nvarchar(50),
	Dinner nvarchar(50)
);
go
insert into WeeklyMeals([Day], Breakfast, Lunch, Dinner)
VALUES
('Monday', 'Oatmeal', 'Salad', NULL),
('Tuesday', NULL, 'Pasta', 'Stew')

/*
Q1 - Monday is missing dinner
Q2 - Pasta is for lunch on Tuesday
*/

--Family Expenses Challenge
/*
Create a table called FamilyExpenses in your Practice Database.
FamilyExpenses should have the following columns:
1. ID: integer (this should be the primary key)
2. Category: unicode character of length 50 nullable,
3. Amount: decimal with precision of 10 and scale of 2 nullable,
4. Notes: unicode character of length 100 nullable,

Add the following data into FamilyExpenses
[1, 'Groceries', 150.25, NULL]
[2, 'Utilities', 200.00, 'Paid in full']
[3, 'Childcare', NULL, 'Pending invoice']
[4, 'Entertainment', 50.00, NULL]

Question:
1. Retrieve all expenses over $100
2. Find expenses less than or equal to $50
3. Query rows with missing amounts
4. Query rows where notes are not provided
*/
create table FamilyExpenses(
	ID int primary key,
	Category nvarchar(50),
	Amount numeric(10,2),
	Notes nvarchar(100)
);

insert into FamilyExpenses(ID, Category, Amount, Notes)
VALUES
(1, 'Groceries', 150.25, NULL),
(2, 'Utilities', 200.00, 'Paid in full'),
(3, 'Childcare', NULL, 'Pending invoice'),
(4, 'Entertainment', 50.00, NULL);


--Q1
select * from Practice.dbo.FamilyExpenses
Where Amount > 100.00;

--Q2
select * from Practice.dbo.familyexpenses
where amount <= 50.00;

--Q3
select * from Practice.dbo.familyexpenses
where amount is NUll;

--Q4
select * from Practice.dbo.familyexpenses
where notes is NULL;
