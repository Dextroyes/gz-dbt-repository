{{ config(materialized='view') }}

SELECT
    DATE_TRUNC(date_date,MONTH)AS daymonth,
    ROUND(SUM(ads_margin),1) as ads_margin,
    ROUND(SUM(average_basket),1) as average_basket,
    ROUND(SUM(operational_margin),1) as operational_margin,
    ROUND(SUM(ads_cost),1) as ads_cost,
    ROUND(SUM(ads_impression),1) as ads_impression,
    ROUND(SUM(ads_click),1) as ads_click,
    ROUND(SUM(quantity),1) as quantity,
    ROUND(SUM(revenue),1) as revenue,
    ROUND(SUM(purchase_cost),1) as purchase_cost,
    ROUND(SUM(margin),1) as margin,
    ROUND(SUM(shipping_fee),1) as shipping_fee,
    ROUND(SUM(logcost),1) as logcost,
    ROUND(SUM(ship_cost),1) as ship_cost


FROM {{ ref('finance_campaigns_day') }} AS a
GROUP BY daymonth
ORDER BY daymonth DESC

