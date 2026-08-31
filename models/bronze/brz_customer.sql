{{
    config(
        materialized='table'
    )
}}

select
    customerid,
    customername,
    segment,
    country,
    state,
    current_timestamp() as _inserted_at
from {{ source('raw', 'raw_customer') }}
