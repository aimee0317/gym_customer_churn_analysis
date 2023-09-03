UNLOAD ('SELECT * FROM customer_data_processed ORDER BY customer_id')
TO 's3://churnanalysis/processed_data'
IAM_ROLE 'MY-AWS-IAM-ROLE'
PARALLEL OFF
CSV
HEADER
DELIMITER ','
ALLOWOVERWRITE;