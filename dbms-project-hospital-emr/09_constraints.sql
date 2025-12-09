-- 9. Security & Integrity Constraints
-- Usage: Run this script to apply strict logic rules to the database.

USE hospital_db;

-- 1. Ensure Billing Amounts are never negative
-- Business Rule: You cannot bill a patient a negative dollar amount.
ALTER TABLE Billing
ADD CONSTRAINT chk_positive_amount CHECK (amount >= 0);

-- 2. Ensure Appointment Validity
-- Business Rule: An appointment cannot end before it starts.
ALTER TABLE Appointments
ADD CONSTRAINT chk_valid_timeslot CHECK (end_time > start_time);

-- 3. Ensure Valid Gender Inputs (If not using ENUM, or to enforce specific strings)
-- Note: Our table uses ENUM, but this is how you would enforce it if it were VARCHAR.
 ALTER TABLE Patients
ADD CONSTRAINT chk_gender CHECK (gender IN ('M', 'F', 'Other'));

-- 4. Unique Phone Numbers for Patients
-- Business Rule: Two patients cannot register with the exact same phone number (prevents duplicate accounts).
ALTER TABLE Patients
ADD CONSTRAINT uq_patient_phone UNIQUE (phone);

-- 5. Foreign Key Constraint Naming (Best Practice demonstration)
-- Adding a constraint that ensures a provider must exist before being assigned to an appointment.
-- (This logic exists in table creation, but this ensures the specific naming convention).
ALTER TABLE Appointments
DROP FOREIGN KEY appointments_ibfk_2; 
ALTER TABLE Appointments
ADD CONSTRAINT fk_appointment_provider
FOREIGN KEY (provider_id) REFERENCES Providers(provider_id);
