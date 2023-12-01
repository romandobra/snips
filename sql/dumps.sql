-- select all not empty tables into csv file
SELECT table_name, table_rows INTO OUTFILE '/var/lib/mysql-files/tables-with-recods.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' FROM INFORMATION_SCHEMA.TABLES WHERE table_rows>0;

