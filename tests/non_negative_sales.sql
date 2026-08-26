SELECT
    * 
FROM
    {{ ref('bronze_sales') }}
WHERE
    gross_amount < 0 AND net_amount < 0

-- This test basically excluded or fails whenever there are gross amount or net amount less then 0