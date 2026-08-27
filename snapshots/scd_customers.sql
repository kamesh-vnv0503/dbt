{% snapshot scd_customers %}

{{
    config(
      target_schema='silver',
      unique_key='customer_id',
      strategy='check',
      check_cols=['segment', 'country', 'state'],
    )
}}

select 
    customer_id,
    customer_name,
    segment,
    country,
    state
from {{ ref('stg_silver_customers') }}

{% endsnapshot %}
