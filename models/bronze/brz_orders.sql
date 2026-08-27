{{
    config(
        materialized='table'
    )
}}

select
    orderid,
    orderdate,
    shipdate,
    shipmode,
    customerid,
    productid,
    ordercostprice,
    ordersellingprice,
    current_timestamp() as _inserted_at
from {{ source('raw', 'raw_orders') }}