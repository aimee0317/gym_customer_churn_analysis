-- Examine the top 10 rows of the data 
SELECT * 
FROM customer_data
limit 10;


-- How many lines of data do we have? 
SELECT COUNT(*) AS total_records 
FROM customer_data;

-- Summary Statistics for the Numeric Features
SELECT
    AVG(age) AS avg_age,
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(avg_additional_charges_total) AS avg_additional_charges,
    MIN(avg_additional_charges_total) AS min_additional_charges,
    MAX(avg_additional_charges_total) AS max_additional_charges,
    AVG(contract_period) AS avg_contract_period,
    MIN(contract_period) AS min_contract_period,
    MAX(contract_period) AS max_contract_period,
    AVG(lifetime) AS avg_lifetime,
    MIN(lifetime) AS min_lifetime,
    MAX(lifetime) AS max_lifetime,
    AVG(month_to_end_contract) AS avg_month_to_end_contract,
    MIN(month_to_end_contract) AS month_to_end_contract,
    MAX(month_to_end_contract) AS month_to_end_contract
FROM customer_data;

-- Top 10 customers with the highest additional charges
SELECT
    customer_id,
    avg_additional_charges_total
FROM customer_data
ORDER BY avg_additional_charges_total DESC
LIMIT 10;

-- Retention Analysis by Age Range
SELECT
    age_range,
    SUM(active_count) AS active_count,
    SUM(total_count) AS total_count,
    CONCAT(ROUND(CAST(SUM(active_count) AS DECIMAL) / NULLIF(SUM(total_count), 0) * 100, 2), '%') AS retention_rate
FROM (
    SELECT
        CASE
            WHEN age >= 18 AND age <= 25 THEN '18-25'
            WHEN age >= 26 AND age <= 30 THEN '26-30'
            WHEN age >= 31 AND age <= 35 THEN '31-35'
            WHEN age >= 36 AND age <= 40 THEN '36-40'
            ELSE '40+'
        END AS age_range,
        COUNT(*) AS active_count,
        0 AS total_count
    FROM customer_data
    WHERE churn = 0
    GROUP BY age_range

    UNION ALL

    SELECT
        CASE
            WHEN age >= 18 AND age <= 25 THEN '18-25'
            WHEN age >= 26 AND age <= 30 THEN '26-30'
            WHEN age >= 31 AND age <= 35 THEN '31-35'
            WHEN age >= 36 AND age <= 40 THEN '36-40'
            ELSE '40+'
        END AS age_range,
        0 AS active_count,
        COUNT(*) AS total_count
    FROM customer_data
    GROUP BY age_range
) AS age_counts
GROUP BY age_range
ORDER BY age_range;