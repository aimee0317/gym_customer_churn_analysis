DROP TABLE IF EXISTS public.customer_data;

CREATE TABLE public.customer_data (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    gender INT,
    near_location INT,
    partner INT,
    promo_friends INT,
    phone INT,
    contract_period FLOAT,
    group_visits INT,
    age FLOAT,
    avg_additional_charges_total FLOAT,
    month_to_end_contract FLOAT,
    lifetime FLOAT,
    avg_class_frequency_total FLOAT,
    avg_class_frequency_current_month FLOAT,
    churn INT
);