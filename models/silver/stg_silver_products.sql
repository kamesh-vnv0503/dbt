with raw_data as (
    select *,
        row_number() over (
            partition by productid 
            order by _inserted_at desc
        ) as row_num
    from {{ ref('brz_product') }}
)

select
    productid as product_id,
    productname as product_name,
    category,
    subcategory,
    _inserted_at
from raw_data
where row_num = 1
