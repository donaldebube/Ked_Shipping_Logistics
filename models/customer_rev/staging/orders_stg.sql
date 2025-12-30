WITH source_orders AS (
    select
        orderid,
        orderdate,
        customerid,
        employeeid,
        storeid,
        status as statuscd,
        updated_at,
        case
            when status = '01'
            then 'IN PROGRESS'
            when status = '02'
            then 'COMPLETED'
            when status = '03'
            then 'CANCELLED'
            else null
        end as status_description,
        case when storeid = 1000 then 'ONLINE' else 'IN-STORE' end as order_channel,
    from {{ source("landing", "orders") }}
)

SELECT 
    *,
    current_timestamp () AS dbt_ingestion_timestamp
FROM source_orders

