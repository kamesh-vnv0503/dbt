select
    customer_id,
    customer_name,
    segment,
    country,
    state,
    dbt_start_ts as valid_from,
    coalesce(dbt_end_ts, '9999-12-31'::timestamp) as valid_to,
    case when dbt_end_ts is null then true else false end as is_current_record
from {{ ref('scd_customers') }}