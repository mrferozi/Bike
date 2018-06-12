drop view bike.bike_usage_by_gender;
create view bike.bike_usage_by_gender_vw
as
select IFNULL(ELT(FIELD(gender,1, 2),'Male','Female'),'unknown') AS Gender,
actual_time
from bike.cycle_2year
where start_station_id='BT-01' and end_station_id='CBD-13'
group by gender;

select * from bike.bike_usage_by_gender_vw;

create view bike.bike_usage_by_gender_vw2
as
select IFNULL(ELT(FIELD(gender,1, 2),'Male','Female'),'unknown') AS Gender,
actual_time
from bike.cycle_2year
where start_station_id='CBD-03' and end_station_id='WF-04'
group by gender;

select * from bike.bike_usage_by_gender_vw2;


select IFNULL(ELT(FIELD(gender,1, 2),'Male','Female'),'unknown') AS Gender,
actual_time
from bike.cycle_2year
where start_station_id='UW-07' and end_station_id='UW-01'
group by gender;
