/*
-- Create Participants Table
CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(50)
);
-- Insert sample participants
INSERT INTO Participants (ParticipantID, ParticipantName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Dana'),
(5, 'Eve');
-- Create Tables Table
CREATE TABLE Tables (
    TableID INT PRIMARY KEY,
    TableNumber INT
);

-- Insert sample tables
INSERT INTO Tables (TableID, TableNumber) VALUES
(1, 101),
(2, 102),
(3, 103);
*/

--Write a query that pairs every participant with every table, creating all possible seat assignments
select p.participantname as participant, t.tablenumber as tablenumber
from participants as p
cross join tables as t;

--Write a Query that randomly Assign Participants to Tables 
select p.participantname as participant, t.tablenumber as tablenumber
from participants as p
cross join tables as t
order by newid();

--Limit Seating to a Fixed Number of Guests Per Table.Specifically TableNumber 101 or 102.
select p.participantname as participant, t.tablenumber as tablenumber
from participants as p
cross join tables as t
where t.tablenumber in (101, 102);

--Make It a Double Date – Pair Two Participants per Table
select p1.participantname as person1, p2.participantname as person2, t.tablenumber as tablenumber
from participants as p1
join participants as p2 
    on p1.participantid < p2.participantid
cross join tables as t;

/*
Why does CROSS JOIN create so many rows?
Because it gets every single combination of rows. The rows x columns is the total amount rows

How could this be used in event planning, e-commerce, or scheduling?
In terms of sceduling, it can help pair employees with shifts, classrooms with teachers, or even students in project groups.

When would a CROSS JOIN be too overwhelming?
If you have lets say 100x100 that's going to be 10,000 rows, that's just too many to analyze in that kind of scenrio
*/

/*
Rank pairings by alphabetical order
Filter results to only include specific tables or guests (example  only alice and bob)
*/
select p.participantName, t.tablenumber
FROM participants p
cross join tables t
order by p.participantname, t.tablenumber;

select p.participantname, t.tablenumber
from Participants p
cross join Tables t
where p.participantname IN ('Alice', 'Bob');

