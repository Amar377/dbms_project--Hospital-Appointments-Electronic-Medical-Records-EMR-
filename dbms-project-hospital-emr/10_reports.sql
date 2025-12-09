USE hospital_db;

-- REPORT 1: Monthly Revenue Summary
-- Purpose: Shows management how much money was billed and collected per month.
SELECT 
    DATE_FORMAT(generated_at, '%Y-%m') AS 'Month',
    payment_status AS 'Status',
    COUNT(bill_id) AS 'Total_Transactions',
    SUM(amount) AS 'Total_Revenue'
FROM Billing
GROUP BY DATE_FORMAT(generated_at, '%Y-%m'), payment_status
ORDER BY 'Month' DESC;


-- REPORT 2: Doctor Efficiency & Workload Report
-- Purpose: Shows how many patients each doctor saw and the average duration of visits.
SELECT 
    p.last_name AS 'Doctor_Name',
    s.name AS 'Specialty',
    COUNT(a.app_id) AS 'Total_Appointments',
    SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS 'Completed_Visits',
    SUM(CASE WHEN a.status = 'Cancelled' THEN 1 ELSE 0 END) AS 'Cancellations'
FROM Providers p
JOIN Specialties s ON p.specialty_id = s.specialty_id
LEFT JOIN Appointments a ON p.provider_id = a.provider_id
GROUP BY p.provider_id, p.last_name, s.name

ORDER BY Total_Appointments DESC;
