create view top_stat
as
select distinctrow to_station_id,to_station_id_num,to_station_name
from trip_clean 
where to_station_id_num in (0,1,25,36,37,38,41) order by to_station_id_num;

create view fam_end_stat2
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'SLU-04' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat2;

create view fam_end_stat6
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'EL-03' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat6;
drop view fam_end_stat;
create view fam_end_stat
as
select distinctrow to_station_id,to_station_id_num,to_station_name 
from trip_clean 
where to_station_id in ('SLU-02','SLU-15','PS-05','CDB-05','BT-01','BT-04','BT-05','CDB-04','DT-03') 
order by to_station_id_num;

select distinctrow to_station_id,to_station_id_num,to_station_name from fam_end_stat order by to_station_id_num;
create view trip_by_age
as
select count(*) No_of_trips,age,to_station_name,to_station_id,to_station_id_num from trip_clean group by age;

select * from trip_by_age where No_of_trips > 2000;

drop view fam_end_stat;

select * from fam_end_stat where to_station_id_num in (0,29,34,39,45) order by No_of_trips;

create view fam_end_stat1
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'CBD-13' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat1;
desc frm_stat_mor;

select * from frm_stat_mor where from_station_id_num in (0,1,25,36,37,38,41) order by from_station_id_num desc;

drop view trip_by_bus_vw;

create view trip_by_bus_vw as select count(*) No_of_trips,age,gender,Sex_num from trip_clean where to_station_id_num in (49,37,30,44,27,41,39,31,59) group by age;

select * from trip_by_bus_vw;

drop view trip_by_edu_vw;
create view trip_by_edu_vw as select count(*) No_of_trips,age,gender,Sex_num from trip_clean where to_station_id_num in (30,33,38,69,32,37) group by age;
select * from trip_by_edu_vw where No_of_trips > 200;

drop view test_vw;
create view test_vw
as
select count(*) trips,to_station_name,to_station_id,to_station_id_num from trip_clean group by to_station_id_num;



update trip_clean set to_station_name ='9th Ave' where to_station_id_num =36;
select * from test_vw;

drop view trip_vw;

create view trip_vw as select * from test_vw where trips >= 500;

select * from trip_vw;


drop view to_stat_mor;
create view to_stat_mor
as
SELECT count(*) No_of_trips,to_station_name,to_station_id,to_station_id_num FROM bike.trip_clean
where trip_clean.stphours between 5 and 18 group by to_station_id;

select * from to_stat_mor;

drop view to_stat_eve;
create view to_stat_eve
as
SELECT count(*) No_of_trips,to_station_name,to_station_id,to_station_id_num FROM bike.trip_clean
where trip_clean.stphours in (19,20,21,22,23,0,1,2,3,4)
 group by to_station_id;
 
drop view frm_stat_mor;
create view frm_stat_mor as SELECT count(*) No_of_trips,from_station_name,from_station_id,from_station_id_num FROM bike.trip_clean where trip_clean.stphours between 5 and 18 group by to_station_id;


drop view fam_end_stat2;
create view fam_end_stat2
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'SLU-04' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat2;

drop view fam_end_stat3;
create view fam_end_stat3
as
select count(*) No_of_trips,to_station_id,to_station_id_num,to_station_name 
from trip_clean where from_station_id = 'SLU-07' group by to_station_id_num order by to_station_id_num;

select * from fam_end_stat3;


update trip_clean set from_station_name = 'Westlake Ave N' where from_station_id_num =38;


