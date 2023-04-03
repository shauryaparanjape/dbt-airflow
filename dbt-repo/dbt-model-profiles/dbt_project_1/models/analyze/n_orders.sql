select
status, count(distinct id) as count_orders
from {{ref('orders')}}
group by status