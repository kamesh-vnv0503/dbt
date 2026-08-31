-- Ad-hoc analytical framework script to evaluate performance over quarters
select
    date_trunc('quarter', order_date) as sales_quarter,
    category,
    sum(order_selling_price) as total_sales,
    sum(gross_profit) as net_margin
from {{ ref('fct_gold_orders') }}
group by 1, 2
order by 1 desc, 3 desc