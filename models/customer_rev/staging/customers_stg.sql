/*
Note that these basic table level transformations are handled within the staging model:
1.)Filtering rows
2.)Renaming Columns
3.)Combining fields

*/
with
    source_customers as (
        select
            customerid,
            firstname,
            lastname,
            email,
            address,
            city,
            state,
            zipcode,
            updated_at,
            concat(firstname, ' ', lastname) as customername
        from {{ source("landing", "customers") }}
    )

select *, current_timestamp() as dbt_ingestion_timestamp
from source_customers
