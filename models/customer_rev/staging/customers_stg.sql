

/*
Note that these basic table level transformations are handled within the staging model:
1.)Filtering rows
2.)Renaming Columns
3.)Combining fields

*/

WITH source_customers AS (
 SELECT 
    CUSTOMERID,
	FIRSTNAME,
	LASTNAME,
	EMAIL,
	ADDRESS,
	CITY,
	STATE,
	ZIPCODE,
	UPDATED_AT,
    CONCAT(FIRSTNAME, ' ', LASTNAME) AS CUSTOMERNAME
FROM {{ source("landing","customers")}}
)

SELECT 
    *,
    current_timestamp () AS dbt_ingestion_timestamp
FROM source_customers
