USE Hospital_Data;

SELECT 
	*
FROM 
	HCAHPS_data;

    
-- formatting date

UPDATE 
	HCAHPS_data
SET 
	start_date = STR_TO_DATE(start_date, '%m/%d/%Y');
    
UPDATE 
	HCAHPS_data
SET 
	end_date = STR_TO_DATE(end_date, '%m/%d/%Y');
    
-- format facility id woth 6 digit

UPDATE 
	HCAHPS_data
SET 
	facility_id = LPAD(facility_id, 6, '0');
    
-- remove duplicate rows with same facility id 








    
