WITH sq AS
--Query 1
(
 SELECT
    a.date_date as date_date,
    a.orders_id as orders_id,
    a.revenue as revenue,
    a.quantity as quantity,
    b.purchase_price*a.quantity as purchase_cost
FROM {{ ref('stg_raw__sales') }} as a
INNER JOIN {{ ref('stg_raw__product') }} as b
 ON a.products_id = b.products_id
 
)
--Query 2
SELECT
    orders_id,
    date_date,
    revenue,
    quantity,
    ROUND(purchase_cost,2) as purchase_cost,
    ROUND(revenue-purchase_cost,2) as margin,
 FROM sq
