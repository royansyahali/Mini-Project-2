
{{ config(
    materialized="table",
    schema="raw"
) }}

SELECT * FROM {{ source('public', 'film_actor') }}
