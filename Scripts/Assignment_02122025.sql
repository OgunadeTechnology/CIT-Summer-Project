/*
Assignment "end_section_02192025'
Completed 6/12/2025
Completed by Obaloluwa Oguande
*/

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

--End