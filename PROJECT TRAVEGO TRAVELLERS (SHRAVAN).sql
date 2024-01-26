create database Travego;
use Travego;
create table passenger
(
passenger_id int primary key,
passenger_name varchar(20),
category varchar(20),
gender varchar(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20));
create table price
(
id int primary key,
bus_type varchar(20),
distance int,
price int);
insert into passenger
value(1,'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
(2, 'Anmol', 'Non-Ac', 'M', 'Mumbai', 'Hyderabad',  700, 'Sitting'),
(3,'Pallavi', 'AC','F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
(4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5,'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
insert into price
value(1,'Sleeper',350,770),
(2, 'Sleeper',500, 1100),
(3, 'Sleeper',600, 1320),
(4, 'Sleeper', 700, 1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200,  2640),
(7,'Sleeper',1500, 2700),
(8, 'Sitting',500, 620),
(9, 'Sitting', 600, 744),
(10,'Sitting',700, 868),
(11,'Sitting',1000, 1240),
(12,'Sitting', 1200, 1488),
(13,'Sitting',1500, 1860);
#(Q1)How many female passengers traveled a minimum distance of 600KMs?
SELECT COUNT(*) AS FemalePassengerCount
FROM passenger
WHERE gender = 'F' AND distance >= 600;
#(Q2) Write a query to display the passenger details whose trave distance is greater than 500 and who are traveling in a sleeper bus?
SELECT *FROM passenger
WHERE distance > 500 AND bus_type = 'sleeper';
#(Q3) Select passenger names whose names start with the character'S'
SELECT passenger_name FROM passenger
WHERE LEFT(passenger_name, 1) = 'S';
#(Q4) Calculate the price charged for each passenger,displaying the Passenger name, BoardingCity, Destination City,Bustype, and Price in the output.
select 
	P.passenger_name,
    P.boarding_city,
    P.destination_city,
    P.bus_type,
    PR.price 
from passenger P join price PR
on P.bus_type = PR.bus_type and P.distance = PR.distance;
    
#(Q5) What are the passengername(s) and the ticket price for those who traveled1000KMs Sitting in a bus?
 select
    P.passenger_name,
    PR.price AS Ticket_Price
from passenger P join price PR
on P.bus_type = PR.bus_type and P.distance = PR.distance
where P.distance = 1000 and P.bus_type = 'Sitting';

 #(Q6) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji
 select * from price 
where distance = (select distance from passenger where passenger_name = 'pallavi');

#(Q7)  Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.
update passenger
set Category = 'Non-AC'
where bus_type = 'Sleeper';
select * from passenger;

#(Q8) Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
delete from passenger
where passenger_name = 'Piyush';
select * from passenger;

#(Q9) Truncate the table passenger and comment on the number of rows in the table (explain if required).
truncate table passenger;
select * from passenger;

#(Q10) Delete the table passenger from the database.
drop table passenger;
