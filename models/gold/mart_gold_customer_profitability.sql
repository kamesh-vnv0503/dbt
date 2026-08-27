{{
    config(
        materialized='table'
    )
}}

select
    customer_id,
    customer_name,
    segment,
    count(distinct order_id) as total_orders,
    sum(order_selling_price) as lifetime_revenue,
    sum(gross_profit) as lifetime_profit,
    avg(order_selling_price) as average_order_value
from {{ ref('fct_gold_orders') }}
group by 1, 2, 3