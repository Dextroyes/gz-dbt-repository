-- Join the int_campaigns_day model with finance_daysmodel from the previous unit.
-- We want to compute the ads_margin column requested by the finance team.
--💡 ads_margin = operational_margin - ads_cost

{{ config(materialized='view') }}

SELECT
    a.date_date,
    b.operational_margin - a.ads_cost as ads_margin,
    b.average_basket,
    b.operational_margin,
    a.ads_cost,
    a.ads_impression,
    a.ads_click,
    b.quantity,
    b.revenue,
    b.purchase_cost,
    b.margin,
    b.shipping_fee,
    b.logcost,
    b.ship_cost

FROM {{ref('int_campaigns_day')}} as a
INNER JOIN {{ref('finance_days')}} as b
ON a.date_date = b.date_date
ORDER BY a.date_date DESC
