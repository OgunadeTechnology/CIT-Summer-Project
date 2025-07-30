/*
-- Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50)
);

-- Insert sample users
INSERT INTO Users (UserID, UserName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Dana'),
(5, 'Eve');

-- Create Matches Table
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    UserID INT,  -- Foreign key linking to Users table
    MatchedWith INT,  -- ID of the person they were matched with
    Status VARCHAR(20)  -- Match status: Accepted, Declined, Pending
);

-- Insert sample match data
INSERT INTO Matches (MatchID, UserID, MatchedWith, Status) VALUES
(1, 1, 2, 'Accepted'),  -- Alice matched with Bob (Success!)
(2, 2, 3, 'Accepted'),  -- Bob matched with Charlie (Success!)
(3, 3, 4, 'Declined'),  -- Charlie rejected Dana (Oh no!)
(4, 5, NULL, 'Pending'); -- Eve is still waiting for a match

*/

/*
Write a query that pairs only people who have confirmed matches in the system.
No one is included unless their match was accepted.
*/

select u.username, m.status
from users as u
join matches as m
	on m.userid = u.userid
	where [status] = 'Accepted';
--Alice and Bob have matches
/*
Write a query that includes all users, even if they never got a match or if their match was declined.
*/
select u.username, m.status
from users as u
left join matches as m
	on m.userid = u.userid
--Alice, Bob, and Charlie were matched. While Eve is still waiting.
/*
Write a query that shows every recorded matchmaking attempt, even if a user was not found in the system.
*/
select u.username, m.status
from users as u
join matches as m
	on m.userid = u.userid
/*
Write a query that displays all users and all match records—even if they have never been linked.
*/
select u.username, m.status
from users as u
full join matches as m
	on m.userid = u.userid

/*
Write a query that generates every possible pairing, whether logical or not. 
It’s like throwing everyone into a matchmaking event without rules!
*/
select u.username, m.status
from users as u
cross join matches as m

select m1.userid, m2.userid
from matches as m1
join matches as m2
	on m1.userid != m2.userid;

/*Discuss the results
Lets analyze your queries:

Which users actually found a match?
Only Alice and Bob since their match was accpeted

Who was rejected?
Charlie

Who never got a match?
Eve and Dana

How does each join change the results?
Each join changes what you see: inner join shows only accepted matches, left join includes all users even if they didn’t match, right join includes all match attempts even if the user is missing, and full join shows everyone—matched or not. This helps you understand both successful connections and who’s still lookin

How could these SQL queries be useful in a real-world dating app?
These SQL queries help a real-world dating app track who’s actively using the platform, who’s matched or still waiting, and how successful matches are over time. 
They can also be used to improve user recommendations, analyze trends, and make the app more personalized and effective.
*/

/*
 Step 5: Bonus Challenge
Find only accepted matches -- Same as the one done before
Show users who never matched anyone
Rank matches by acceptance rate 
*/

select u.username, m.status
from users as u
join matches as m
	on u.userid = m.userid
where m.status != 'Accepted' and m.status != 'Declined';

select status, count(*) as total
from matches
group by status
order by total desc;

