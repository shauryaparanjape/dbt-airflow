select
payment_method, count(distinct o.id) as order_count
from {{ref('orders')}} as o
inner join {{ref('payments')}} as p
on o.id = p.order_id
group by 1