Drop database if exists abc;

CREATE DATABASE abc;
use abc;

CREATE TABLE ReportData (
    report_id CHAR(5) unique,
    firestation_id VARCHAR(5) UNIQUE REFERENCES Status_firestation_sejong (firestation_id),
    report_time TIME NOT NULL,
    moved_team INT NOT NULL,
    PRIMARY KEY (report_id)
);

CREATE TABLE CaseData (
    case_id CHAR(5) UNIQUE,
    report_id CHAR(5) UNIQUE REFERENCES ReportData (report_id),
    occur_date DATE NOT NULL REFERENCES Weather (occur_date),
    case_type CHAR(1) NOT NULL,
    arrive_time TIME NOT NULL,
    region_id CHAR(5) NOT NULL,
    death_num INT ,
    injured_num INT ,
    PRIMARY KEY (case_id, case_type)
);

CREATE TABLE Fire_Case (
    case_id CHAR(5) UNIQUE,
    damage_area int NOT NULL,
	damage_cost int NOT NULL,
    fire_type int NOT NULL
);
--     CONSTRAINT CaseData_Fire_Case FOREIGN KEY (case_id, case_type)
--         REFERENCES CaseData (case_id, case_type)

CREATE TABLE Emergency_Case (
    case_id CHAR(5) UNIQUE,
    site_arrive_t TIME NOT NULL,
    hospital_arrive_t TIME NOT NULL,
    emergency_type int NOT NULL
);
--     CONSTRAINT CaseData_Fire_Case FOREIGN KEY (case_id, case_type)
--         REFERENCES CaseData (case_id, case_type)

CREATE TABLE Aid_Case (
    case_id CHAR(5) UNIQUE,
    aid_type int NOT NULL
);
--     CONSTRAINT CaseData_Fire_Case FOREIGN KEY (case_id, case_type)
--         REFERENCES CaseData (case_id, case_type)

CREATE TABLE Weather (
    weather_date DATE,
    w_type CHAR(1) NOT NULL,
    humidity INT NOT NULL,
    temp INT NOT NULL,
    wind_sp INT NOT NULL,
    rainfall INT NOT NULL,
    PRIMARY KEY (weather_date)
);


CREATE TABLE status_firestation_sejong (
    firestation_id VARCHAR(5) UNIQUE,
    classification VARCHAR(7) NOT NULL,
    facility_name VARCHAR(10) NOT NULL UNIQUE,
    address VARCHAR(30) NOT NULL UNIQUE,
    latitude INT NOT NULL UNIQUE,
    longitude INT NOT NULL UNIQUE,
    contact_address VARCHAR(12),
    team_num INT NOT NULL,
    PRIMARY KEY (firestation_id)
);

CREATE TABLE Population_data_sejong (
    region_id CHAR(5) UNIQUE,
    region_name VARCHAR(4) NOT NULL UNIQUE,
    household_number INT NOT NULL,
    local_resident_male INT,
    local_resident_female INT,
    foreign_resident_male INT,
    foreign_resident_female INT,
    PRIMARY KEY (region_id)
);

CREATE TABLE jurisdiction (	
    firestation_id VARCHAR(5) REFERENCES status_firestation_sejong (firestation_id),
    region_id VARCHAR(5) REFERENCES Population_data_sejong (region_id)
)