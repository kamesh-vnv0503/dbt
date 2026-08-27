with raw_data as (
    select *,
        row_number() over (
            partition by customerid 
            order by _inserted_at desc
        ) as row_num
    from {{ ref('brz_customer') }}
)

select
    customerid as customer_id,
    customername as customer_name,
    segment,
    country,
    state,
    _inserted_at
from raw_data
where row_num = 1
