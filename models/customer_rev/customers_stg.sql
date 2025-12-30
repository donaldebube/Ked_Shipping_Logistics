{{ config(materialized = 'table') }}

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


-- SELECT 
--     CUSTOMERID AS `CustomerID`,
-- 	FIRSTNAME AS `Firstname`,
-- 	LASTNAME AS `Lastname`,
-- 	EMAIL AS `Email`,
-- 	PHONE AS `Phone No`,
-- 	ADDRESS AS `Address`,
-- 	CITY AS `City`,
-- 	STATE AS `State`,
-- 	ZIPCODE AS `Zipcode`,
-- 	UPDATED_AT AS `Updated_at`,
--     CONCAT(FIRSTNAME, ' ', LASTNAME) AS `Customer Name`
-- FROM {{ source("landing","customers")}}