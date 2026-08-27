select
    customer_id,
    customer_name,
    segment,
    country,
    state,
    dbt_valid_from,
    coalesce(dbt_valid_to, '9999-12-31'::timestamp) as dbt_valid_to,
    case when dbt_valid_to is null then true else false end as is_current_record
from {{ ref('scd_customers') }}