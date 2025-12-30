WITH source_orderitems AS (
SELECT 
        ORDERID,
        ORDERITEMID,
        PRODUCTID,
        QUANTITY,
        UNITPRICE,
        QUANTITY * UNITPRICE AS TOTALPRICE,
        UPDATED_AT 
    FROM {{ source('landing', 'orderitems')}}
)

SELECT 
    *,
    current_timestamp () AS dbt_ingestion_timestamp
FROM source_orderitems
