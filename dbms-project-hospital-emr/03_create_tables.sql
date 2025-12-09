-- DDL Script for Hospital EMR
-- Database: hospital_db

DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;

-- 1. Patients
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('M', 'F', 'Other') NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    insurance_provider VARCHAR(100),
    insurance_policy_no VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Specialties
CREATE TABLE Specialties (
    specialty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- 3. Providers (Doctors)
CREATE TABLE Providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty_id INT,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id)
);

-- 4. Medications (Formulary)
CREATE TABLE Medications (
    med_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);

-- 5. Appointments
CREATE TABLE Appointments (
    app_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    reason VARCHAR(255),
    status ENUM('Scheduled', 'Completed', 'Cancelled', 'No-Show') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES Providers(provider_id)
);

-- 6. Encounters (Medical Notes)
CREATE TABLE Encounters (
    encounter_id INT AUTO_INCREMENT PRIMARY KEY,
    app_id INT NOT NULL,
    notes TEXT,
    encounter_date DATE,
    FOREIGN KEY (app_id) REFERENCES Appointments(app_id)
);

-- 7. Diagnoses
CREATE TABLE Diagnoses (
    diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
    encounter_id INT NOT NULL,
    code VARCHAR(10),
    description VARCHAR(255),
    FOREIGN KEY (encounter_id) REFERENCES Encounters(encounter_id)
);

-- 8. Prescriptions
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    encounter_id INT NOT NULL,
    med_id INT NOT NULL,
    dosage VARCHAR(100),
    frequency VARCHAR(100),
    FOREIGN KEY (encounter_id) REFERENCES Encounters(encounter_id),
    FOREIGN KEY (med_id) REFERENCES Medications(med_id)
);

-- 9. Billing
CREATE TABLE Billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    encounter_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_status ENUM('Pending', 'Paid', 'Insurance_Claimed') DEFAULT 'Pending',
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (encounter_id) REFERENCES Encounters(encounter_id)
);
