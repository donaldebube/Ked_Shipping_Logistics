{{ config(
    schema='L1_LANDING',
    materialized='view'
) }}

SELECT 
	ORDERID,
	ORDERITEMID,
	PRODUCTID,
	QUANTITY,
	UNITPRICE,
    QUANTITY * UNITPRICE AS TOTALPRICE,
	UPDATED_AT 
FROM {{ source('landing', 'orderitems')}}