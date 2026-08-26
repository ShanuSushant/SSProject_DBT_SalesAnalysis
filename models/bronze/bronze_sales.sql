{{ config(materialized='view') }} -- Block level configuration

SELECT
    *
FROM
    {{ source('source','fact_sales') }}