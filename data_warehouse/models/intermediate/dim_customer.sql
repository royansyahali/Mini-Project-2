
{{ config(
    materialized="table",
    schema="intermediate"
) }}

SELECT * FROM {{ ref('customer') }}
