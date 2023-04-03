with customers as (
    select * from {{source('dbt_schema','raw_customers')}}
)
select * from customers