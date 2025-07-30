-- Create Guests Table
CREATE TABLE Guests (
    GuestID INT PRIMARY KEY,
    GuestName VARCHAR(50)
);

-- Insert sample guest data
INSERT INTO Guests (GuestID, GuestName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Dana'),
(5, 'Eve');

-- Create Invitations Table
CREATE TABLE Invitations (
    InviteID INT PRIMARY KEY,
    GuestID INT,  -- Foreign key that links to Guests table
    RSVP VARCHAR(10)  -- Values: 'Accepted', 'Declined', NULL
);
-- Insert sample invitation data
INSERT INTO Invitations (InviteID, GuestID, RSVP) VALUES
(1, 1, 'Accepted'),  -- Alice is coming
(2, 2, 'Accepted'),  -- Bob is coming
(3, 3, 'Declined'),  -- Charlie said no
(4, NULL, 'Accepted'),  -- Invitation was sent but nobody was specified
(5, 5, NULL);  -- Eve never responded


/*
Write a query to determine only guests who received an invitation and responded are included. 
*/ 
select g.guestname, i.rsvp
from guests as g
join invitations as i
	on g.guestID = i.guestID
where i.rsvp = 'Accepted';
--Alice and Bob
go
/*
Write a query to include all guests, even those who didn’t RSVP. Perfect if you still want to see who's ignoring your invite!
*/
select g.guestname, i.rsvp
from guests as g
join invitations as i
	on g.guestID = i.guestID
-- Eve also ignored the invite and didn't RSVP

/*
Write a query to include everyone who received an invitation, even if they aren’t in the guest list.
*/
select g.guestname, i.rsvp
from guests as g
right join invitations as i
	on g.guestID = i.guestID
-- There was one person with no name/NULL value, but they RSVP'd

/*
Show ALL guests and ALL invitations—even if there’s no perfect match.
*/
select g.guestname, i.rsvp
from guests as g
	full join invitations as i
	on g.guestID = i.guestID;

/*
Write a query that shows every guest gets every invitation—whether they were supposed to or not!
*/
select g.guestname, i.rsvp
from guests as g
	cross join invitations as i;

/*
Every guest matched with every other guest as a possible plus-one.
*/
SELECT A.GuestName AS Host, B.GuestName AS PlusOne
FROM Guests A
JOIN Guests B ON A.GuestID <> B.GuestID;

--Step 4: Discuss the Results
/*
Who made it to the party:
Adam, Bob, and one unknown

Who got left out:
Dana

Did anyone get invited but never show up:
Charlie

What happens when an invitation was sent with no guest assigned:
The person still accpeted but the invitation id was null

How could this help in a real-world database (e.g., customer orders, job applications):
Lets say you sent out an email regarding a sale, and in there you put a link saying 'Click here if you plan to come".
You could see how many of your customers clicked the link and plan to come to the sale later in the month. This could help plan and just see overall how affective the sales are.
You could also possibly even have another table to see how many people come as well as which customers came.
*/

/*
Step 5: Bonus Challenge
We will now modify the queries to filter results. Example challenges:
1. Find only guests who accepted  --This one is the exact same as a previous one nothing changes
2. Show invitations missing a guest 
3. Rank guests by RSVP status
*/

select g.guestname, i.rsvp
from guests as g
right join invitations as i
	on g.guestID = i.guestID
where i.rsvp = 'Accepted';  

select inviteID
from invitations
where guestID is NULL;

select g.guestID, g.guestName, i.RSVP
from guests as g
left join invitations as i
	on g.guestid = i.guestid
order by i.rsvp;