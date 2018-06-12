UPDATE bike.cycle_trip2y
SET bike.cycle_trip2y.Day= 'Saturday'
WHERE  bike.cycle_trip2y.Day=7;
commit;


UPDATE bike.cycle_trip2y
SET bike.cycle_trip2y.day= 'Friday'
WHERE  bike.cycle_trip2y.day=6;


select * from bike.cycle_trip2y where Day='Saturday';