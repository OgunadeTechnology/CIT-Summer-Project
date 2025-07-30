--create database ZooDB;

use ZooDB;
go

/*
create table Animals(
	animalid int identity(1,1) primary key,
	name nvarchar(30),
	species nvarchar(50) not null,
	age tinyint,
	habitat nvarchar(50) not null,
	diet nvarchar(15) not null,
	ArrivalDate date not null,
	weight float not null,
	isendangered bit
);


insert into animals(name, species, age, habitat, diet, ArrivalDate, weight, isendangered)
values
('Leo', 'Lion', 5, 'Savannah Exhibit', 'Carnivore', '2020-05-12', 190.50, 1),
('Molly', 'Elephant', 12, 'Elephant Plaza', 'Herbivore', '2018-03-21', 5400.75, 0),
('Stripes', 'Zebra', 4, 'Savannah Exhibit', 'Herbivore', '2021-07-10', 350.30, 0),
('Coco', 'Gorilla', 8, 'Primate House', 'Herbivore', '2019-11-05', 160.90, 1),
('Bella', 'Giraffe', 6, 'Savannah Exhibit', 'Herbivore', '2020-09-15', 800.00, 0),
('Rocky', 'Rhinoceros', 10, 'Rhinoceros Pen', 'Herbivore', '2017-04-30', 2300.45, 1),
('Daisy', 'Penguin', 3, 'Arctic Zone', 'Carnivore', '2022-01-20', 12.65, 0),
('Buddy', 'Kangaroo', 7, 'Australian Outback', 'Herbivore', '2019-08-08', 85.20, 0),
('Simba', 'Lion', 4, 'Savannah Exhibit', 'Carnivore', '2021-12-01', 180.00, 1),
('Lola', 'Panda', 6, 'Asian Forest', 'Herbivore', '2018-06-14', 100.50, 1);
*/

--Query 1: List All Animals in the “Savannah Exhibit”
select * from ZooDB.dbo.animals
where habitat = 'Savannah Exhibit';
go

--Query 2: Show All Endangered Animals Sorted by Weight (Descending)
select * from ZooDB.dbo.animals
where isendangered = 1
order by weight desc;
go

--Query 3: Find Animals That Arrived After January 1, 2020
select * from zoodb.dbo.animals
where ArrivalDate> '2020-01-01';
go

--Query 4: Calculate the Average Weight of Animals in the Zoo
select Concat('The weight of all the animals in the zoo is :',avg(weight)) as [Average Weight]
from animals;
go
--More Queries

--Displaying total number of endangered animals
select Concat('Total number of endangered species is: ', count(isendangered))
from zoodb.dbo.animals
where isendangered = 1;
go

--List the top 3 heaviest and top 3 lightest animals
select top (3) * from zoodb.dbo.animals
order by weight desc;
go

--Show the number of each species
select species, count(species)
from zoodb.dbo.animals
group by species;
go

/*create table Employees(
	employeeid int identity(1,1) primary key,
	name nvarchar(50) not null,
	workarea ntext, --same as animal habitat
	animalid int foreign key references animals(animalid) --the animal it's assigned to
);*/
/*
insert into employees (name, workarea, animalid)
values
('Alice Turner', 'Savannah Exhibit', 1),
('Brian Chen', 'Elephant Plaza', 2),
('Carla Gomez', 'Savannah Exhibit', 3),
('David Kim', 'Primate House', 4),
('Elena Singh', 'Savannah Exhibit', 5),
('Frank Dorsey', 'Rhinoceros Pen', 6),
('Grace Liu', 'Arctic Zone', 7),
('Hector Alvarez', 'Australian Outback', 8),
('Isabelle Novak', 'Savannah Exhibit', 9),
('Jackie Perez', 'Asian Forest', 10),
('Kevin Thompson', 'Savannah Exhibit', 1),
('Linda Baker', 'Elephant Plaza', 2),
('Marcus Lee', 'Savannah Exhibit', 5),
('Nina Patel', 'Primate House', 4),
('Omar Davis', 'Arctic Zone', 7);
*/

--Show the number of employees for a species
select a1.species as Species, count(e1.employeeid) as [Number of Employees]
from employees as e1
join animals as a1
	on a1.animalid = e1.animalid
	group by a1.species;
go

--Show the number of employees in each habitat
select a1.habitat as Habitat, count(distinct e1.employeeid) as [Employee Number]
from employees as e1
join animals as a1
	on a1.habitat = e1.workarea
	group by a1.habitat;