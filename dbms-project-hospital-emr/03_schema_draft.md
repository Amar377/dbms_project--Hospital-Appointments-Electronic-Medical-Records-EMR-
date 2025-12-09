# 03 Relational Schema

## Tables
| Table | PK | FK | Notes |
| :--- | :--- | :--- | :--- |
| **Specialties** | specialty_id | - | Lookup table for depts |
| **Patients** | patient_id | insurance_id | Main user table |
| **Providers** | provider_id | specialty_id | Doctors/Nurses |
| **Appointments** | appointment_id | patient_id, provider_id | Core scheduling table |
| **Encounters** | encounter_id | appointment_id | Clinical details (1:1 with Appt) |
| **Prescriptions** | prescription_id | encounter_id, medication_id | Links encounter to drugs |
