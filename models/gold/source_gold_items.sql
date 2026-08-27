with dedup_items as
(
SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY updateDate DESC) as dedup
FROM 
    {{ source('source','items') }}
)
SELECT
    id, name, category, updateDate
FROM
    dedup_items
WHERE dedup = 1
