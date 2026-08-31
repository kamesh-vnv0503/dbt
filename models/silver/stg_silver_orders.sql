with raw_data as (
    select *,
        row_number() over (
            partition by orderid 
            order by _inserted_at desc
        ) as row_num
    from {{ ref('brz_orders') }}
)

select
    orderid as order_id,
    {{ text_to_date('orderdate') }} as order_date,
    {{ text_to_date('shipdate') }} as ship_date,
    shipmode as ship_mode,
    customerid as customer_id,
    productid as product_id,
    ordercostprice as order_cost_price,
    ordersellingprice as order_selling_price,
    (ordersellingprice - ordercostprice) as gross_profit,
    _inserted_at
from raw_data
where row_num = 1