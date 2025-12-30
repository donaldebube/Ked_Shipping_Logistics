-- {{ config(materialized = 'table') }}

/*
Note that these basic table level transformations are handled within the staging model:
1.)Filtering rows
2.)Renaming Columns
3.)Combining fields

*/

{{ config(
    schema='L1_LANDING',
    materialized='view'
) }}

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