-- 6. Core SQL Queries

USE hospital_db;

-- Q1. Daily provider schedule with no-show flag
SELECT p.last_name AS Doctor, a.start_time, pt.last_name AS Patient, a.status
FROM Appointments a
JOIN Providers p ON a.provider_id = p.provider_id
JOIN Patients pt ON a.patient_id = pt.patient_id
WHERE DATE(a.start_time) = '2023-10-10';

-- Q2. Average wait time per clinic (simulated by app count here)
SELECT s.name AS Specialty, COUNT(a.app_id) AS Total_Appointments
FROM Appointments a
JOIN Providers p ON a.provider_id = p.provider_id
JOIN Specialties s ON p.specialty_id = s.specialty_id
GROUP BY s.name;

-- Q3. Most common diagnoses
SELECT d.description, COUNT(*) as frequency
FROM Diagnoses d
GROUP BY d.description
ORDER BY frequency DESC;

-- Q4. Drug utilization counts
SELECT m.name, COUNT(pr.prescription_id) as times_prescribed
FROM Medications m
JOIN Prescriptions pr ON m.med_id = pr.med_id
GROUP BY m.name;

-- Q5. Patients with multiple encounters (Chronic care)
SELECT pt.first_name, pt.last_name, COUNT(e.encounter_id) as visit_count
FROM Patients pt
JOIN Appointments a ON pt.patient_id = a.patient_id
JOIN Encounters e ON a.app_id = e.app_id
GROUP BY pt.patient_id
HAVING visit_count >= 1;

-- Q6. Revenue by Payer (Insurance)
SELECT pt.insurance_provider, SUM(b.amount) as total_revenue
FROM Billing b
JOIN Encounters e ON b.encounter_id = e.encounter_id
JOIN Appointments a ON e.app_id = a.app_id
JOIN Patients pt ON a.patient_id = pt.patient_id
GROUP BY pt.insurance_provider;

-- Q7. Appointments scheduled in the future (Future View)
SELECT * FROM Appointments WHERE start_time > NOW();

-- Q8. Prescriptions without follow-up (Data Quality)
-- Checking for prescriptions linked to encounters that don't have bills
SELECT pr.prescription_id 
FROM Prescriptions pr
LEFT JOIN Billing b ON pr.encounter_id = b.encounter_id
WHERE b.bill_id IS NULL;

-- Q9. Providers with high patient load
SELECT p.last_name, COUNT(a.app_id) as load_count
FROM Providers p
JOIN Appointments a ON p.provider_id = a.provider_id
GROUP BY p.provider_id
ORDER BY load_count DESC
LIMIT 3;

-- Q10. View: Patient Summary
CREATE OR REPLACE VIEW vw_patient_summary AS
SELECT pt.patient_id, pt.last_name, MAX(a.start_time) as last_visit
FROM Patients pt
LEFT JOIN Appointments a ON pt.patient_id = a.patient_id
GROUP BY pt.patient_id;

SELECT * FROM vw_patient_summary;

-- Q11. CRUD: Update Patient Phone
UPDATE Patients SET phone = '555-0199' WHERE patient_id = 1;

-- Q12. CRUD: Delete a cancelled appointment
DELETE FROM Appointments WHERE status = 'Cancelled';
