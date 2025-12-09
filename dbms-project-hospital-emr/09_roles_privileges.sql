-- 9. Security Roles

-- Create Roles/Users (Syntax varies slightly by DB, using MySQL format)

-- 1. Admin (Full Access)
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'SecurePass1!';
GRANT ALL PRIVILEGES ON hospital_db.* TO 'admin_user'@'localhost';

-- 2. Provider (View schedules, Edit encounters)
CREATE USER 'doctor_user'@'localhost' IDENTIFIED BY 'DocPass1!';
GRANT SELECT, INSERT, UPDATE ON hospital_db.Encounters TO 'doctor_user'@'localhost';
GRANT SELECT ON hospital_db.Appointments TO 'doctor_user'@'localhost';
GRANT SELECT ON hospital_db.Patients TO 'doctor_user'@'localhost';

-- 3. Auditor (Read Only)
CREATE USER 'auditor_user'@'localhost' IDENTIFIED BY 'AuditPass1!';
GRANT SELECT ON hospital_db.* TO 'auditor_user'@'localhost';

FLUSH PRIVILEGES;
