
{{ config(
    materialized="table",
    schema="intermediate"
) }}

SELECT * FROM {{ ref('rental') }}
