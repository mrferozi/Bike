rollback;
UPDATE bike.cycle_2year
SET DAY='7'
WHERE Day='Saturday';

select * from bike.cycle_2year where day =2;