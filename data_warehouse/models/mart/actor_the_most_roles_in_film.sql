{{ config(
    materialized="table",
    schema="mart"
) }}


SELECT 
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS role_count
FROM 
    {{ ref('dim_actor') }} a
JOIN 
     {{ ref('dim_film_actor') }} fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    role_count DESC