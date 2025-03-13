-- Create Tables first 

USE Hospital_Data;

CREATE TABLE IF NOT EXISTS hospital_beds
(
     provider_ccn INT,
     hospital_name VARCHAR(255),
     fiscal_year_begin_date VARCHAR(255),
     fiscal_year_end_date VARCHAR(255),
     number_of_beds INT
);

CREATE TABLE IF NOT EXISTS HCAHPS_data(
	facility_id VARCHAR(255),
    facility_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(2),
    zip_code VARCHAR(20),
    county_or_parish VARCHAR(50),
    telephone_number VARCHAR(20),
    hcahps_measure_id VARCHAR(255),
    hcahps_question VARCHAR(255),
    hcahps_answer_description VARCHAR(255),
    hcahps_answer_percent VARCHAR(255),
    num_completed_surveys VARCHAR(255),
    survey_response_rate_percent VARCHAR(255),
    start_date VARCHAR(255),
    end_date VARCHAR(255)
);