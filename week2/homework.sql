--question 3
SELECT COUNT(*) FROM yellow_tripdata
WHERE EXTRACT('Year' FROM tpep_pickup_datetime) = 2020

--question 4
SELECT COUNT(*) FROM green_tripdata
WHERE EXTRACT('Year' FROM lpep_pickup_datetime) = 2020

--question 5
SELECT COUNT(*) FROM yellow_tripdata
WHERE filename = 'yellow_tripdata_2021-03.csv'