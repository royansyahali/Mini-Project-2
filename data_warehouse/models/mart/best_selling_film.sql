{{ config(
    materialized="table",
    schema="mart"
) }}


SELECT 
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM 
    {{ ref('dim_rental') }} r
JOIN 
    {{ ref('dim_inventory') }} i ON r.inventory_id = i.inventory_id
JOIN 
    {{ ref('dim_film') }} f ON i.film_id = f.film_id
GROUP BY 
    f.title
ORDER BY 
    rental_count DESC