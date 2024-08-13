{{ config(
    materialized="table",
    schema="mart"
) }}


SELECT 
    EXTRACT(YEAR FROM payment_date) AS year,
    EXTRACT(MONTH FROM payment_date) AS month,
    SUM(amount) AS total_revenue
FROM 
    {{ ref('fact_payment') }}
GROUP BY 
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date)
ORDER BY 
    year, 
    month