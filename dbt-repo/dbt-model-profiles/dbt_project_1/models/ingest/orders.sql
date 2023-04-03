with orders as (
    select * from {{source('dbt_schema','raw_orders')}}
)
select * from orders