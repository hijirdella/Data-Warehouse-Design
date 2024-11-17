--Step 1: Create the data_mart Schema
CREATE SCHEMA IF NOT EXISTS data_mart;

--Step 2: Create Data Mart Tables in data_mart Schema
--1. Performance by Department
--This table aggregates employee performance scores grouped by department.
CREATE TABLE data_mart.dm_performance_by_department AS
SELECT 
    d.department_id,
    d.department_name,
    COUNT(fp.performance_id) AS total_performance_records,
    AVG(fp.performance_score) AS avg_performance_score,
    MAX(fp.performance_score) AS max_performance_score,
    MIN(fp.performance_score) AS min_performance_score
FROM 
    public.dim_department d
JOIN 
    public.dim_employee e ON d.department_id = e.department_id
JOIN 
    public.fact_employee_performance fp ON e.employee_id = fp.employee_id
GROUP BY 
    d.department_id, d.department_name;
	
	
	
--2. Performance by Education Level
--This table aggregates employee performance scores grouped by education level.
CREATE TABLE data_mart.dm_performance_by_education AS
SELECT 
    edu.education_id,
    edu.education_level,
    COUNT(fp.performance_id) AS total_performance_records,
    AVG(fp.performance_score) AS avg_performance_score,
    MAX(fp.performance_score) AS max_performance_score,
    MIN(fp.performance_score) AS min_performance_score
FROM 
    public.dim_education edu
JOIN 
    public.dim_employee e ON edu.education_id = e.education_id
JOIN 
    public.fact_employee_performance fp ON e.employee_id = fp.employee_id
GROUP BY 
    edu.education_id, edu.education_level;

--3. Performance by Gender
--This table provides performance statistics grouped by gender.
CREATE TABLE data_mart.dm_performance_by_gender AS
SELECT 
    e.gender,
    COUNT(fp.performance_id) AS total_performance_records,
    AVG(fp.performance_score) AS avg_performance_score,
    MAX(fp.performance_score) AS max_performance_score,
    MIN(fp.performance_score) AS min_performance_score
FROM 
    public.dim_employee e
JOIN 
    public.fact_employee_performance fp ON e.employee_id = fp.employee_id
GROUP BY 
    e.gender;
	
--4. Performance Trends Over Time
--This table tracks performance scores over time based on the performance_date.
CREATE TABLE data_mart.dm_performance_trends AS
SELECT 
    DATE_TRUNC('month', fp.performance_date) AS performance_month,
    COUNT(fp.performance_id) AS total_performance_records,
    AVG(fp.performance_score) AS avg_performance_score,
    MAX(fp.performance_score) AS max_performance_score,
    MIN(fp.performance_score) AS min_performance_score
FROM 
    public.fact_employee_performance fp
GROUP BY 
    DATE_TRUNC('month', fp.performance_date)
ORDER BY 
    performance_month;
	

--Step 3: Verify Data Marts
--To confirm that the data_mart schema tables have been created successfully:
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'data_mart';

--Step 4: Query the Data Marts
--Example queries to retrieve data:

--Performance by Department
SELECT *
FROM data_mart.dm_performance_by_department
ORDER BY avg_performance_score DESC;


--Performance by Education Level
SELECT *
FROM data_mart.dm_performance_by_education
ORDER BY avg_performance_score DESC;


--Performance by Gender
SELECT * FROM data_mart.dm_performance_by_gender;

--Performance Trends Over Time
SELECT * 
FROM data_mart.dm_performance_trends
ORDER BY performance_month;











