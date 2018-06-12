mysqlimport --ignore-lines=1 --fields-terminated-by=, --verbose --local -u mrferozi -p bike C:/Users/mrferozi/Desktop/Bikes/dataset/trip_history.csv;

mysql -u mrferozi -p khadija313 --local-infile scrapping -e "LOAD DATA LOCAL INFILE 'trip_history.csv'
INTO TABLE trip_history  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'";  

mysql --protocol=tcp --host=localhost --user=root --port=3306 --default-character-set=utf8 --comments --database=bike  < "C:\\Users\\mrferozi\\Desktop\\Bikes\\dataset\\cycle\\trip_history.csv"