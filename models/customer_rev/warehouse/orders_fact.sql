/*
This segment joins the orders and order item staging models and calculates
revenue and order counts acrross multiple dimensions. While this project requires 
aggregates only at the customer level, it is also necessary to create aggregates
at other levels to accomodate potential future enhancements
*/


select
    orders.orderid,
    orders.orderdate,
    orders.customerid,
    orders.employeeid,
    orders.storeid,
    orders.statuscd,
    orders.status_description,
    count(distinct orders.orderid) as order_count,
    sum(orderitems.totalprice) as revenue,
    orders.updated_at
from {{ ref('orders_stg') }} as orders
join {{ ref('orderitems_stg') }} as orderitems 
    on orders.orderid = orderitems.orderid
group by 1, 2, 3, 4, 5, 6, 7, 10