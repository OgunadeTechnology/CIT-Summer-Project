
-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT  -- Self-referencing column
);

-- Insert sample employees
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Alice', 3),  -- Alice was referred by Charlie
(2, 'Bob', 3),    -- Bob was referred by Charlie
(3, 'Charlie', 4),-- Charlie was referred by Dana
(4, 'Dana', NULL),-- Dana is the big boss (no manager)
(5, 'Eve', 4);    -- Eve was referred by Dana


/*
Write a query to pair each employee with their manager using aliases (E for Employee, M for Manager).
*/
select e.employeename AS Employee, m.employeename AS Manager
from employees as e
join employees as m 
	on e.managerID = m.employeeID

/*
 Find Employees Without a Manager (Top-level bosses)
*/
select employeename 
from employees
where managerID is NULL;

--Find Employees Managed by a Specific Person with ManagerID = 3
select employeename 
from employees
where managerid = 3;

select m.employeename as Manager, count(e.employeename) as Num
from employees as e
join employees m 
	on e.managerid = m.employeeid 
group by m.employeename;

/*
Step 5: Discussion & Real-World Applications
Why does Dana have no manager?
Because she is the highest rank and "top dog". This is also because her managerid is null as well.

Who manages the most people?
No one, they each manage the same amount of people

How could this be used in a company hierarchy or social network?
This could help tell who is looking after the most amount of people, if someone is managing a lot more than other, it would be good to have someone to help relieve their stress.

Where else might self joins be helpful? 
Self joins are helpful in situations like a mentorship program, where employees are linked to other employees as their mentors. 
It allows relationships between people in the same table to be clearly shown.
*/

/*
Find managers with more than 1 employee 
Rank managers by number of direct reports --I'm confused there are no reports?
Find employees at the bottom of the hierarchy 
*/
select m.employeename as Manager, count(e.employeename) as Num
from employees as e
join employees m 
	on e.managerid = m.employeeid 
group by m.employeename
having count(e.employeename) > 1

SELECT e.employeeid, e.employeeName
FROM 
    employees as e
left join employees as e1 
		on e1.managerID = e.EmployeeID
WHERE 
    e1.employeeID IS NULL;

