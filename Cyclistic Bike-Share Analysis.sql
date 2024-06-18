--Creating a table to append all the imported Tables
drop Table  if exists CycleData
 create Table CycleData
 (ride_id nvarchar(255),
 rideable_type nvarchar(255),
 started_at datetime,
 ended_at datetime,
 start_station_name  nvarchar(255),
 start_station_id nvarchar(255),
 end_station_name nvarchar(255),
 end_station_id nvarchar(255),
 start_lat float,
 start_lng float,
 end_lat float,
 end_lng float,
 member_casual nvarchar(255))


 --Correcting the format to make it general across all the tables for easier appending of tables
 alter table April2024
 alter column start_station_id nvarchar(255)

 alter table April2024
 alter column end_station_id nvarchar(255)

 alter table Feb2024
 alter column end_station_id nvarchar(255)

 alter table May2024
 alter column start_station_id nvarchar(255)


--Inserting and appending the Tables into CycleData Table.
--Creating the new Table is as to have the original version of the other tables for insurance
 insert into CycleData
 select * from May2024
 union select * from April2024
 union  select * from March2024
 union  select * from Feb2024
 union  select * from Jan2024
 union select * from Dec2023
 union  select * from Nov2023
 union select * from Oct2023
 union  select * from Sept2023
 union  select * from August2023
 union select * from July2023
 union  select * from June2023


 --Creating an index so it is easier to pull in trips around the member_casual column
 create index member_casual_key on CycleData(member_casual)


--Starting the exploratory analysis. Checking out the table for inconsistencies and errors possibly overlooked
 select *
 from CycleData

--Checking for the time consistency, if possible the started at and ended at date were switched for each other
select *
from Cyclisist..CycleData
where started_at > ended_at
order by started_at desc


update a--to update the correction with self joining
set a.started_at = b.ended_at,
	a.ended_at = b.started_at
from Cyclisist..CycleData a
join Cyclisist..CycleData b
on a.ride_id = b.ride_id 
where a.ended_at < a.started_at


--Checking for duplicates
select ride_id, count(*)
from Cyclisist..CycleData
group by ride_id,rideable_type, start_lat, started_at
having count(*) > 1
order by ride_id 

--To check for white spaces among the data
--checking for all the columns
select ride_id
from Cyclisist..CycleData
where end_station_id like '% ' or 
 end_station_id like   ' %'


--Trim the columns that needed trimming
update CycleData
set end_station_id = trim(end_station_id)


--Create a new column to calculate the trip duration
alter table CycleData
add TripDurationMin float

select *, DATEDIFF(SECOND, started_at, ended_at)/60
from CycleData

update CycleData
set TripDurationMin = DATEDIFF(SECOND, started_at, ended_at)/60


--Creating a new column to show the week days each trip started
select DATENAME(WEEKDAY, started_at) AS WeekdayName, DATENAME(MONTH, started_at) AS Month, DAY(Started_at) as DayOfMonth
from CycleData

alter table CycleData
add WeekDay nvarchar(255),
      Month nvarchar(255),
	  DayOfMonth nvarchar(255)

update CycleData
set  DayOfMonth = DAY(Started_at),
	WeekDay = DATENAME(WEEKDAY, started_at),
	Month = DATENAME(MONTH, started_at)
	


--Some exploration on the dataset
--Min and Max Duration, by member-casual
select member_casual ,min(TripDurationMin) MinimumTime, max(TripDurationMin) MaximumTime
from CycleData
group by member_casual

--Ranking of the durations and the member-casual detail
select member_casual,TripDurationMin, dense_rank() over (order by TripDurationMin) 
from CycleData
order by TripDurationMin desc

--Total duration by members and casuals count and average
select  member_casual, rideable_type, count(*) Trips, sum(TripDurationMin) TotalDuration, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by member_casual, rideable_type

--Duration metrics depending on the stations used with more than 300 rides
select start_station_name, end_station_name, member_casual, count(*) Trips, sum(TripDurationMin) TotalDuration, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by member_casual, start_station_name, end_station_name
having count(*) > 2000
order by  Trips desc, TotalDuration desc, AverageDuration desc

--Drilling down to more specifics, lets check out the weekday, Day of Month and Month Analysis
select Weekday, count(*) TripsPerWeekday, sum(TripDurationMin) TotalDuration, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by Weekday
order by TripsPerWeekday desc

select member_casual, Month, count(*) TripsPerMonth, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by member_casual, Month
order by TripsPerMonth desc
 
select DayOfMonth, count(*) TripsPerDayOfMonth, sum(TripDurationMin) TotalDuration, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by DayOfMonth
order by TripsPerDayOfMonth desc


--Lets check the metrics with regards to the rideable type
select Weekday, rideable_type, count(*) TripsPerWeekday, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by Weekday, rideable_type
order by TripsPerWeekday desc, rideable_type desc

select Month,rideable_type, count(*) TripsPerMonth,  sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by Month, rideable_type
order by TripsPerMonth desc
 
select DayOfMonth, count(*) TripsPerDayOfMonth, sum(TripDurationMin) TotalDuration, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by DayOfMonth
order by TripsPerDayOfMonth desc


select Rideable_type, member_casual, count(*) TripsPerWeekday, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by Rideable_type, member_casual
order by TripsPerWeekday desc, member_casual desc


--MAP FOR STATIONS ie Long and LAt
Select member_casual, start_lat, start_lng, count(*)
from CycleData
group by member_casual, start_lat, start_lng
having count(*) > 1


select member_casual, sum(TripDurationMin)/count(*) AverageDuration
from CycleData
group by member_casual