
{{ config(
    materialized="table",
    schema="intermediate"
) }}

SELECT * FROM {{ ref('staff') }}
