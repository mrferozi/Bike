#######---loading Data into tables
LOAD DATA LOCAL INFILE 'C:/Users/mrferozi/Desktop/GitHub/Bike/dataset/cycle/trip_clean.csv' 
INTO TABLE trip_clean1 fields terminated BY ',' enclosed BY '"' lines terminated BY '\n';

LOAD DATA LOCAL INFILE 'C:/Users/mrferozi/Desktop/GitHub/Bike/dataset/cycle/trip_weather.csv' 
INTO TABLE trip_weather fields terminated BY ',' enclosed BY '"' lines terminated BY '\n';

delete  from bike.trip_weather
where Bike_rented = 0;

SELECT * FROM bike.trip_clean1
#--------------------------------------Deleting garbage from database

delete  from bike.trip_clean
where tripduration = 0;

select count(distinct(trip_id)) from trip_clean1;
#-----------------------------------------creating tables
reate table trip_weather2
as
SELECT STR_TO_DATE(bike.trip_weather.﻿twdate, '%d/%m/%Y') twdate,Bike_rented,Temp,Humidity,Visibility_Miles,Wind_Speed_MPH,Events_num
FROM bike.trip_weather;

desc bike.trip_clean;
#-----------------------------
SELECT STR_TO_DATE(starttime,) starttime
FROM bike.trip_clean;
----------------------------------------------------------------
create view bike.trip_clean007
as
SELECT 
STR_TO_DATE(starttime, '%d/%m/%Y') starttime,
STR_TO_DATE(stoptime, '%d/%m/%Y') stoptime,
STR_TO_DATE(Date, '%d/%m/%Y') tdate,
bikeid,
tripduration,
from_station_name,
to_station_name,
from_station_id,
to_station_id,
usertype,
gender,
birthyear,
Sex_num,
from_station_id_cat,
from_station_id_num,
to_station_id_cat,
to_station_id_num,
Day,
Day_cat,
Day_num,
sthours,
stphours,
tripduration_minutes,
age,
bmonth
year
FROM bike.trip_clean;
#-------------------------------------------------------
create table trip_clean_temp
as select * from trip_clean007;


insert into trip_clean1
select * from trip_clean007;


#------------------------View for Analysis

create view trip_clean_vw
as
SELECT  
﻿trip_id,
starttime,
stoptime,
bikeid,
tripduration,
from_station_name,
to_station_name,
from_station_id,
to_station_id,
usertype,
gender,
birthyear,
Sex_num,
from_station_id_cat,
from_station_id_num,
to_station_id_cat,
to_station_id_num,
Day,
Day_cat,
Day_num,
sthours,
stphours,
tripduration_minutes,
age,
bmonth,
STR_TO_DATE(Date, '%d/%m/%Y') tcdate
FROM bike.trip_clean;
#desc trip_clean;
#-------------------------------------------------Data Consistancy
select count(age)from trip_clean where age > 70 ;
delete from trip_clean where age > 79;



desc trip_weather;

select count(*) from trip_weather
where Events_num =2;

update trip_weather
set Events_num =6
where Events_num =8;

select distinctrow(Events_num) from trip_weather order by Events_num;
desc weather_clean;
#------------------
###List of Distinct Weather event Number
create view weather_list
as
select distinctrow(Events_num),Events from weather_clean group by Events_num;

select * from weather_list;

#---------------------------------------

SELECT * FROM trip_clean_vw  group by Day
#-------------------------------------------------------
drop view bike.trip_hosp_gen;
create view bike.trip_hosp_gen
as
SELECT gender,
tripduration_minutes,age,to_station_name station_name,count(*) Numbers_of_trips FROM bike.trip_clean 
where to_station_id in 
("DPD-03","EL-01")
group by gender;

select * from bike.trip_hosp_gen;
#====================

create view bike.trip_uni_gen
as
SELECT Sex_num,gender,
tripduration_minutes,age,to_station_name station_name,count(*) Numbers_of_trips, 'University' Place_to_visit FROM bike.trip_clean
where to_station_name in 
("9th Ave N and Mercer St",
"NE 47th St and 12th Ave NE",
"E Pine St and 16th Ave",
" 15th Ave E and E Thomas St",
"NE 42nd St and University Way NE")
group by gender;

select * from bike.trip_uni_gen;
#-----

select count(*) from bike_trip_clean
where from_station_name = 'trip_weather';

#------------
drop view to_stat_mor;
create view to_stat_mor
as
SELECT count(*) No_of_trips,to_station_name,to_station_id,to_station_id_num FROM bike.trip_clean
where trip_clean.stphours between 5 and 18 group by to_station_id;

select * from to_stat_mor;
#------------------------------------
drop view to_stat_eve;
create view to_stat_eve
as
SELECT count(*) No_of_trips,to_station_name,to_station_id,to_station_id_num FROM bike.trip_clean
where trip_clean.stphours in (19,20,21,22,23,0,1,2,3,4)
 group by to_station_id;
 
 #####------------------------

select * from to_stat_eve;

#--------------------------
drop view frm_stat_mor;
create view frm_stat_mor
as
SELECT count(*) No_of_trips,from_station_name,from_station_id,from_station_id_num FROM bike.trip_clean
where trip_clean.stphours between 5 and 18 group by to_station_id;
select * from to_stat_mor;
#-----------------------------------------
drop view frm_stat_eve;
create view frm_stat_eve
as
SELECT count(*) No_of_trips,from_station_name,from_station_id,from_station_id_num FROM bike.trip_clean
where trip_clean.stphours in (19,20,21,22,23,0,1,2,3,4)
 group by to_station_id;
 
 select * from frm_stat_eve;
 #-----------------------
drop view top_stat;
create view top_stat
as
select distinctrow to_station_id,to_station_id_num 
from trip_clean 
where to_station_id_num in (0,1,25,36,37,38,41) order by to_station_id_num;
select * from view top_stat;

create view fam_end_stat
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'CBD-13' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat;

create view fam_end_stat2
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'SLU-04' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat2;

#--------------------------------------------
create view fam_end_stat3
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'SLU-07' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat3;


select * from trip_clean

where to_station_id_num =53;

update trip_cleanset to_station_name = 'E Stevens Way NE' where to_station_id_num =53;

update trip_clean set to_station_name = 'Fairview Ave E' where to_station_id_num =25;


#(3,9,17,25,26,28,29,34,36,40,42,50,53)
drop view bike.trip_gender_vw;
create view bike.trip_gender_vw
as
SELECT gender,Sex_num,
count(*) Numbers_of_trips,tripduration_minutes,to_station_name,to_station_id_num FROM bike.trip_clean
where to_station_id_num in(3,9,17,25,26,28,29,34,36,40,42,50,53)
group by to_station_name,Sex_num

select * from trip_by_gender_vw;




select count(*) No_of_trips,round(count(*)*100/118931,2) Percentage, gender from trip_clean group by Sex_num;

drop view trip_gender_vw;
create view bike.trip_gender_vw
as
select count(*) Number_of_trips,Sex_num,gender,age,tripduration_minutes,to_station_name,to_station_id_num FROM trip_clean WHERE (to_station_id_num IN (0 , 1, 25, 36, 37, 38, 41))
GROUP BY to_station_id_num ORDER BY to_station_id_num;

select * from bike.trip_gender_vw


desc to_station_cordinates


update to_station_cordinates 
set latitude = '47.65357239999999',longitude = '47.65357239999999' 
where to_station_id_num =56;
-----------------------------------------------------------------------------------------------------
insert into to_station_cordinates(coordinate,station_name,to_station_id_num,latitude,longitude)
values('(47.6152841,-122.30554849999999)','E Pine St, Seattle, WA, USA',39,'47.6152841','-122.30554849999999');

select * from to_station_cordinates where to_station_id_num =39;

select * from from_station_cordinates where from_station_id_num =4;

update from_station_cordinates set latitude = '47.6185085',longitude = '-122.30738930000001' where from_station_id_num =15;

update from_station_cordinates set longitude = '-122.32993699999997' where from_station_id_num =36;

drop view fam_start_stat1;

create view fam_start_stat1 as select count(*) No_of_trips,from_station_name,from_station_id,from_station_id_num from trip_clean where to_station_id_num =25;

select * from fam_start_stat1;
    
select count(*) No_of_trips,from_station_name,from_station_id,from_station_id_num from trip_clean where to_station_id_num =35;

select * from trip_clean1;

select * from trip_clean1 where to_station_name Like '%univer%';

select count(*) from to_station_cordinates where to_station_id_num=57;

 select count(*) No_of_trips,age,gender,Sex_num,to_station_name,to_station_id,to_station_id_num from trip_clean where to_station_id_num in (28,9,47,57,30,33,38,69,32,37) group by age;
 
 select * from pridicit_vw order by to_station_id_num;


create view pridict_vw
as 
SELECT trip_id,tripduration_minutes Duration,from_station_name,from_station_id_num,to_station_id,to_station_name,to_station_id_num,Day_num Day,bmonth Month,year Year,age,Sex_num Sex
FROM bike.trip_clean
where to_station_id_num in(6,7,9,25,30,34,35,36,37,38,39,42) order by to_station_id_num;

use bike;



select * from trip_clean where from_station_id_num in(22,31,15,1,25,14,16,37,4,9) and to_station_id in(6,7,9,25,30,34,35,36,37,38,39,42);
drop view pridict_vw;
create view pridict_vw
as
select trip_id,from_station_id_num,to_station_id_num,to_station_id,tripduration_minutes duration,Day_num Day,bmonth Month,year Year,age,Sex_num  
from trip_clean 
where to_station_id in(6,7,9,25,30,34,35,36,37,38,39,42)
order by to_station_id_num;

select  distinct(to_station_id_num) from pridict_vw;

