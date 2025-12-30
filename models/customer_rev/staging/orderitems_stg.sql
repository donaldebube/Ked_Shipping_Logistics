with
    source_orderitems as (
        select
            orderid,
            orderitemid,
            productid,
            quantity,
            unitprice,
            quantity * unitprice as totalprice,
            updated_at
        from {{ source("landing", "orderitems") }}
    )

select *, current_timestamp() as dbt_ingestion_timestamp
from source_orderitems
