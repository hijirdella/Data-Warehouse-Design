--Step 1: Create the data_mart Schema
CREATE SCHEMA IF NOT EXISTS data_mart;

--Step 2: Create Data Mart Tables in data_mart Schema

--1. Store Performance Data Mart
--Menghitung total penjualan, pendapatan rata-rata, dan jumlah produk terjual berdasarkan toko.
CREATE TABLE data_mart.dm_store_performance AS
SELECT 
    ds.store_id,
    ds.store_name,
    ds.city,
    ds.state,
    ds.country,
    COUNT(fs.sale_id) AS total_sales_transactions,
    SUM(fs.quantity) AS total_quantity_sold,
    SUM(fs.quantity * fs.price) AS total_revenue,
    AVG(fs.price) AS avg_price_per_unit
FROM 
    public.dim_store ds
JOIN 
    public.fact_sales fs ON ds.store_id = fs.store_id
GROUP BY 
    ds.store_id, ds.store_name, ds.city, ds.state, ds.country;


--2. Product Sales Data Mart
--Menyediakan statistik penjualan untuk setiap produk.
CREATE TABLE data_mart.dm_product_sales AS
SELECT 
    dp.product_id,
    dp.product_name,
    dp.category,
    COUNT(fs.sale_id) AS total_sales_transactions,
    SUM(fs.quantity) AS total_quantity_sold,
    SUM(fs.quantity * fs.price) AS total_revenue,
    AVG(fs.price) AS avg_price_per_unit
FROM 
    public.dim_product dp
JOIN 
    public.fact_sales fs ON dp.product_id = fs.product_id
GROUP BY 
    dp.product_id, dp.product_name, dp.category;
	
--3. Sales Performance by Salesperson
--Menghitung statistik kinerja tenaga penjualan berdasarkan nama tenaga penjualan.
CREATE TABLE data_mart.dm_salesperson_performance AS
SELECT 
    ds.sales_name_id,
    ds.sales_name,
    COUNT(fs.sale_id) AS total_sales_transactions,
    SUM(fs.quantity) AS total_quantity_sold,
    SUM(fs.quantity * fs.price) AS total_revenue,
    AVG(fs.price) AS avg_price_per_unit
FROM 
    public.dim_sales_name ds
JOIN 
    public.fact_sales fs ON ds.sales_name_id = fs.sales_name_id
GROUP BY 
    ds.sales_name_id, ds.sales_name;

--4. Sales Trends Over Time
--Menyediakan analisis tren penjualan berdasarkan waktu (day of week).
CREATE TABLE data_mart.dm_sales_trends_by_day_of_week AS
SELECT 
    dt.day_of_week AS sales_day_of_week,
    COUNT(fs.sale_id) AS total_sales_transactions,
    SUM(fs.quantity) AS total_quantity_sold,
    SUM(fs.quantity * fs.price) AS total_revenue,
    AVG(fs.price) AS avg_price_per_unit
FROM 
    public.fact_sales fs
JOIN 
    public.dim_time dt ON fs.time_id = dt.time_id
GROUP BY 
    dt.day_of_week
ORDER BY 
    CASE 
        WHEN dt.day_of_week = 'Sunday' THEN 1
        WHEN dt.day_of_week = 'Monday' THEN 2
        WHEN dt.day_of_week = 'Tuesday' THEN 3
        WHEN dt.day_of_week = 'Wednesday' THEN 4
        WHEN dt.day_of_week = 'Thursday' THEN 5
        WHEN dt.day_of_week = 'Friday' THEN 6
        WHEN dt.day_of_week = 'Saturday' THEN 7
    END;

	
--Step 3: Verify Data Marts
--Gunakan query berikut untuk memverifikasi bahwa tabel-tabel di dalam skema data_mart berhasil dibuat:
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'data_mart';


--Step 4: Query the Data Marts
--Contoh query untuk mengambil data dari data mart yang telah dibuat:
--a. Top Stores by Revenue
SELECT *
FROM data_mart.dm_store_performance
ORDER BY total_revenue DESC;

--b. Best-Selling Products
SELECT * 
FROM data_mart.dm_product_sales
ORDER BY total_quantity_sold DESC;

--c. Best Sales Person
SELECT *
FROM data_mart.dm_salesperson_performance
ORDER BY total_revenue DESC;

--d. Sales Trends Over Time
SELECT *
FROM data_mart.dm_sales_trends_by_day_of_week
ORDER BY total_revenue DESC;

