WITH return_data AS
(
    SELECT
        sales_id,
        store_sk,
        product_sk,
        returned_qty
    FROM
        {{ ref("bronze_returns") }}
),
stores AS
(
    SELECT
        store_sk,
        store_name
    FROM
        {{ ref("bronze_store") }}
),
products AS
(
    SELECT
        product_sk,
        category
    FROM
        {{ ref("bronze_product") }}
),
joined_query AS
(
    SELECT
        return_data.sales_id,
        return_data.returned_qty,
        stores.store_sk,
        stores.store_name,
        products.category,
        products.product_sk
    FROM
        return_data
    JOIN
        stores ON return_data.store_sk = stores.store_sk
    JOIN
        products ON return_data.product_sk = products.product_sk
)
SELECT
    store_name,
    category,
    sum(returned_qty) as total_return_quantity
FROM
    joined_query
GROUP BY
    store_name,category
ORDER BY
    total_return_quantity DESC
