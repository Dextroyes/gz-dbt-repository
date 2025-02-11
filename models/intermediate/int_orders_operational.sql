SELECT 
    a.orders_id,
    a.date_date,
    ROUND(a.margin + b.shipping_fee - b.logcost - b.ship_cost,2) as operational_margin,
    a.quantity,
    a.revenue
FROM {{ ref('int_sales_margin') }} as a
INNER JOIN {{ ref('stg_raw__ship') }} as b
 ON a.orders_id = b.orders_id
ORDER BY orders_id DESC