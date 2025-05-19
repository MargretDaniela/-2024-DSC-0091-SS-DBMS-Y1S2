create database zoo;
use zoo;
create table animal (
animal_id int, 
animal_name varchar(255),
species varchar(255), 
habitat_id int
);
insert into animal (animal_id, animal_name, species, habitat_id)
values (1, 'Leo', 'Lion', 1),
(2, 'Stripes', 'Tiger', 2),
(3, 'Polly', 'Parrot', 3),
(4, 'Slithers', 'Snake', 4);
select * from animal;

create table habitat(
habitat_id int,
habitat_name varchar(255),
environment varchar(255)
);
insert into habitat (habitat_id, habitat_name, environment)
values ( 1, 'Savannah', 'Grassland'),
( 2, 'Tiger Tail', 'Forest'),
( 3, 'Bird Paradise', 'Tropical'),
( 4, 'Reptile House', 'Temperate');
select * from habitat;

create table feeding_schedule(
schedule_id int, 
animal_id int,
food varchar(255),
feeding_time varchar(255)
);
insert into feeding_schedule(schedule_id,animal_id ,food, feeding_time)
values ( 1, 1, 'Meat', '14:00'),
( 2, 2, 'Chicken', '12:00'),
( 3, 3, 'Seeds', '08:00'),
( 4, 3, 'Fruits', '15:00'),
( 5, 4, 'Mice', '20:00');
select * from feeding_schedule;

-- Part(a)
select animal.animal_name,
habitat.habitat_name
from animal 
join habitat on animal.habitat_id = habitat.habitat_id;

 -- Part(b)
select 
-- feeding_schedule.food,
total_feedings.animal_id
from animal a
join (select animal_id,  count(*) as total_feeds
from animal
group by animal_id ) as total_feedings
on animal.animal_id = feeding_schedule.animal_id  
and feeding_schedule.food = total_feedings.total_feeds;

-- Part (c)
select animal.animal_name,
feeding_schedule.feeding_time,
feeding_schedule.Total_times_feeds
from animal
join feeding_schedule (select  aniaml_id count(*)feeding_schedule.feeding_time) as Total_times_feeds
on animal.animal_id = feeding_schedule.animal_id
-- OR
select animal.animal_name,
feeding_schedule.feeding_time,
feeding_schedule.Total_times_feeds
from animal 
join (select animal_id, count(*) feeding_time as times_of_feeding) 
from animal
group by animal_id ) as feeding_times
on animal.animal_id = feeding_times.animal_id  
and animal.feeding_time = feeding_times.times_of_feeding;

