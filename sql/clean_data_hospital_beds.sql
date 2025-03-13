-- clean data
-- fix date format 
-- fix provider ccn number to 6 digit format

USE Hospital_Data;

/*
	 CASE
		WHEN LENGTH(provider_ccn)<6 THEN LPAD(provider_ccn, 6, '0')
        ELSE provider_ccn
	END AS formatted_provider_ccn,
*/

SELECT 
   provider_ccn,
   hospital_name,
   fiscal_year_begin_date,
   fiscal_year_end_date
FROM 
	hospital_beds;
    
UPDATE 
	hospital_beds
SET
	fiscal_year_begin_date = DATE_FORMAT(STR_TO_DATE(fiscal_year_begin_date, '%m/%d/%Y'), '%Y-%m-%d');

    
UPDATE 
	hospital_beds
SET
	fiscal_year_end_date = DATE_FORMAT(STR_TO_DATE(fiscal_year_end_date, '%m/%d/%Y'),'%Y-%m-%d');


ALTER TABLE hospital_beds
MODIFY provider_ccn VARCHAR(10);
    
UPDATE 
	hospital_beds
SET 
	provider_ccn = LPAD(CAST(provider_ccn AS CHAR), 6, '0')
WHERE 
	LENGTH(CAST(provider_ccn AS CHAR)) < 6;

-- Remove duplicate data
SELECT
	hospital_name,
	COUNT(hospital_name)
FROM 
	hospital_beds
GROUP BY hospital_name;

with hospital_bed_prep as 
(
SELECT
	*,
    ROW_NUMBER() OVER (PARTITION BY provider_ccn, ) AS row_num
FROM 
	hospital_beds
)