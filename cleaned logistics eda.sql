-- create DATABASE supply_chain_db;
use supply_chain_db;
-- Total Revenue, Average Waiting Time, Delay Rate
SELECT 
SUM(User_Transaction_Amount) AS total_revenue,
AVG(Waiting_Time) AS avg_waiting_time,
ROUND((SUM(Logistics_Delay) / COUNT(*)) * 100,2) AS delay_percentage
FROM cleaned_logistics_data;

-- Top Performing Assets (Truck Performance)
SELECT 
Asset_ID,
SUM(User_Transaction_Amount) AS total_revenue
FROM cleaned_logistics_data
GROUP BY Asset_ID
ORDER BY total_revenue DESC;

-- Traffic Impact on Waiting Time
SELECT 
Traffic_Status,
AVG(Waiting_Time) AS avg_waiting_time
FROM cleaned_logistics_data
GROUP BY Traffic_Status
ORDER BY avg_waiting_time DESC;

-- Delay Analysis by Reason
SELECT 
Logistics_Delay_Reason,
COUNT(*) AS delay_count
FROM cleaned_logistics_data
WHERE Logistics_Delay = 1
GROUP BY Logistics_Delay_Reason
ORDER BY delay_count DESC;

-- Monthly Demand Forecast Trend
SELECT 
MONTH(Timestamp) AS month,
AVG(Demand_Forecast) AS avg_demand
FROM cleaned_logistics_data
GROUP BY MONTH(Timestamp)
ORDER BY MONTH(Timestamp);

-- Asset Utilization Efficiency
SELECT 
Asset_ID,
AVG(Asset_Utilization) AS avg_utilization
FROM cleaned_logistics_data
GROUP BY Asset_ID
ORDER BY avg_utilization DESC;

-- Shipment Status Distribution
SELECT 
Shipment_Status,
COUNT(*) AS total_shipments
FROM cleaned_logistics_data
GROUP BY Shipment_Status;

-- High Waiting Time Shipments
SELECT 
Asset_ID,
Traffic_Status,
Waiting_Time,
Logistics_Delay
FROM cleaned_logistics_data
WHERE Waiting_Time > 40
ORDER BY Waiting_Time DESC;
