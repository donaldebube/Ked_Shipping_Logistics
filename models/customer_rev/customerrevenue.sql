/*
The customer revenue model brings everything together by joining the orders fact with customer
stage and computing the final customer level aggregates
*/
select
    orders.customerid,
    cust.customername,
    sum(orders.order_count) as cust_order_count,
    sum(orders.revenue) as cust_revenue
from {{ ref('orders_fact') }} orders
inner join {{ ref('customers_stg') }} cust on orders.customerid = cust.customerid
group by orders.customerid, cust.customername
