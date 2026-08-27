{{
    config(
        materialized='table'
    )
}}

select * from raw.GLOBALMART.product