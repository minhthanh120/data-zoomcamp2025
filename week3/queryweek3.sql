--setting thing up
CREATE OR REPLACE EXTERNAL TABLE `zoomcamp.yellow_taxi_external`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://bucket-data-zoomcamp-450204/*.parquet']
);

CREATE OR REPLACE TABLE `zoomcamp.yellow_taxi_table` AS
SELECT * FROM `zoomcamp.yellow_taxi_external`;

CREATE MATERIALIZED VIEW `zoomcamp.yellow_taxi_mv` AS
SELECT * FROM `zoomcamp.yellow_taxi_table`;
-- Q1
SELECT COUNT(*) FROM `zoomcamp.yellow_taxi_table`;
--SELECT * FROM `zoomcamp.yellow_taxi_table`
--LIMIT 10;

--Q2
SELECT COUNT( DISTINCT PULocationID) FROM `zoomcamp.yellow_taxi_mv`;
SELECT COUNT( DISTINCT PULocationID) FROM `zoomcamp.yellow_taxi_external`;

--q3
SELECT PULocationID FROM `zoomcamp.yellow_taxi_table`;
SELECT PULocationID,DOLocationID FROM `zoomcamp.yellow_taxi_table`;

--q4
SELECT COUNT(fare_amount) FROM `zoomcamp.yellow_taxi_mv`
WHERE fare_amount = 0;

--q5
CREATE OR REPLACE TABLE `zoomcamp.yellow_taxi_optimized`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `zoomcamp.yellow_taxi_table`;

--q6
SELECT COUNT(DISTINCT VendorID) FROM `zoomcamp.yellow_taxi_optimized`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' and '2024-03-15';
SELECT COUNT(DISTINCT VendorID) FROM `zoomcamp.yellow_taxi_table`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' and '2024-03-15';
