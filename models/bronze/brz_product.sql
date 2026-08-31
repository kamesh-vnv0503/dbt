{{
    config(
        materialized='table'
    )
}}

select
    category,
    productid,
    productname,
    subcategory,
    current_timestamp() as _inserted_at
from {{ source('raw', 'raw_product') }}
