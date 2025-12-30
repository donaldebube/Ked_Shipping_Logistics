/*
This segment joins the orders and order item staging models and calculates
revenue and order counts acrross multiple dimensions. While this project requires 
aggregates only at the customer level, it is also necessary to create aggregates
at other levels to accomodate potential future enhancements
*/

SELECT 
    orders.ORDERID,
    orders.ORDERDATE,
	orders.CUSTOMERID,
	orders.EMPLOYEEID,
    orders.STOREID,
    orders.statu
    orders.STATUS_DESCRIPTION,
    COUNT(DISTINCT orders.ORDERID) AS ORDER_COUNT,
    SUM(orderitems.TOTALPRICE) AS REVENUE,
	orders.UPDATED_AT,

FROM {{ ref('orders_stg') }} AS orders
INNER JOIN {{ ref('orderitems_stg')}} AS orderitems
    ON orders.ORDERID = orderitems.ORDERID
GROUP BY 1,2,3,4,5,6
