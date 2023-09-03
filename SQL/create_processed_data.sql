-- Create final data to save in S3
-- Create a new table customer_data_processed with the age_range column and without the partner and group_visits column
DROP TABLE IF EXISTS customer_data_processed;
CREATE TABLE customer_data_processed AS
SELECT
    customer_id,
    gender,
    near_location,
    promo_friends,
    phone,
    contract_period,
    age,
    avg_additional_charges_total,
    month_to_end_contract,
    lifetime,
    avg_class_frequency_total,
    avg_class_frequency_current_month,
    churn,
    CASE
        WHEN age >= 18 AND age <= 25 THEN '18-25'
        WHEN age >= 26 AND age <= 30 THEN '26-30'
        WHEN age >= 31 AND age <= 35 THEN '31-35'
        WHEN age >= 36 AND age <= 40 THEN '36-40'
        ELSE '40+'
    END AS age_range
FROM customer_data;

SELECT * FROM customer_data_processed
ORDER BY customer_id;