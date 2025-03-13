USE Hospital_Data;

CREATE TABLE Hospital_Data AS
SELECT 
	*
FROM HCAHPS_data AS hcahps
LEFT JOIN 
	hospital_beds_staging
ON 
	hcahps.facility_id = hospital_beds_staging.provider_ccn
	and hospital_beds_staging.row_num = 1;
    

