with payments as (
    select * from {{source('dbt_schema','raw_payments')}}
)
select * from payments