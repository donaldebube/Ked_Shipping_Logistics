SELECT 
    ORDERID,
	ORDERDATE,
	CUSTOMERID,
	EMPLOYEEID,
	STOREID,
	STATUS,
	UPDATED_AT,
    CASE 
        WHEN STATUS = '01' THEN 'IN PROGRESS'
        WHEN STATUS = '02' THEN 'COMPLETED'
        WHEN STATUS = '03' THEN 'CANCELLED'
        ELSE null
    END AS STATUS_DESCRIPTION,
    CASE 
        WHEN STOREID = 1000 THEN 'ONLINE'
        ELSE 'IN-STORE'
    END AS ORDER_CHANNEL,
    current_timestamp AS dbt_updated_at
FROM {{ source("landing", "orders")}}