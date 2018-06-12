update bike.trip_hist
set stoptime = '01/09/2016 00:32'
where stoptime='09-Jan-16';

select * from  bike.trip_hist
where stoptime= '01/09/2016 00:32';

create table bike.trip_hist1 as select * from bike.trip_hist;

select min(stoptime) from bike.trip_hist1 ;

select * from bike.trip_hist1;
where stoptime between '01-Apr-15' and '30-Apr-15';

 STR_TO_DATE(yourdatefield, '%m/%d/%Y')
SELECT  STR_TO_DATE(CAST(starttime as char(255)),'%m/%d/%Y') AS starttime FROM bike.trip_hist;

drop view bike.trip_hist;
create view bike.trip_hist
as
select ﻿trip_id,bikeid,tripduration,from_station,to_station,from_station_id,to_station_id,usertype,gender,
birthyear,
IFNULL(ELT(FIELD(gender,'Male', 'Female'),'1','2'),'0') AS Num_gen,
(YEAR(CURDATE()) - birthyear) age,
STR_TO_DATE(CAST(starttime as char(255)),'%m/%d/%Y') AS starttime,
STR_TO_DATE(CAST(stoptime as char(255)),'%m/%d/%Y') AS stoptime,
round((round((tripduration/60),2)*0.13),2) miles,
round((tripduration/60),2) time_in_minutes,
substr(starttime,1,2) stmonth,substr(starttime,4,2) stday,
substr(starttime,7,4) styear,substr(starttime,12,2) sthour,
substr(starttime,15,2) 2stmin,
substr(stoptime,1,2) endmonth,substr(stoptime,4,2) endtday,
substr(stoptime,7,4) endyear,substr(stoptime,12,2) endhour,
substr(stoptime,15,2) endmin
from bike.trip_hist1;
