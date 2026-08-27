{{ config(materialized='table') }}

with orders as (
    select * from {{ ref('stg_silver_orders') }}
),

customers_scd2 as (
    select * from {{ ref('dim_silver_customers_historical') }}
),

products as (
    select * from {{ ref('stg_silver_products') }}
),

geo_mapping as (
    select * from {{ ref('country_mapping') }}
)

select
    o.order_id,
    o.order_date,
    o.ship_date,
    o.ship_mode,
    o.order_cost_price,
    o.order_selling_price,
    o.gross_profit,
    p.product_id,
    p.product_name,
    p.category,
    p.subcategory,
    c.customer_id,
    c.customer_name,
    c.segment,
    c.state as historical_state,
    g.region as geographic_region
from orders o
left join products p 
    on o.product_id = p.product_id
left join customers_scd2 c 
    on o.customer_id = c.customer_id
    and o.order_date >= c.dbt_valid_from 
    and o.order_date < c.dbt_valid_to
left join country_mapping g 
    on c.country = g.country_code
