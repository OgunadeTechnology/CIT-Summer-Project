/*
Title:        Password Checker
Objective:    Determine if user supplied a strong 
              password by checking the length
Author:       Obaloluwa ogunade
Date:         02/01/2025
*/

declare @password varchar(50) = 'thing';

if (len(@password) >=8)
	Begin
		print 'Strong Password';
		print 'Password check passed';
	End
else
	begin
		print 'Weak Password';
		print 'Susceptible to hackers!';
	end
;