# 01 Requirements & Case Brief

## Narrative
The Hospital Appointments & Electronic Medical Records (EMR) System is a centralized database designed to manage the clinical and administrative workflow of a mid-sized hospital. The system serves three primary user groups: **Patients**, who wish to book appointments and view their history; **Clinicians (Providers)**, who need to view schedules, document patient encounters, and prescribe medications; and **Schedulers**, who manage the logistical flow of the clinic.

The primary goals are to reduce patient no-show rates through better tracking, ensure data integrity for medical records, and provide real-time analytics on clinic performance. Key operations include atomic transactions for booking and billing, searching for patient history, and managing concurrent scheduling conflicts to prevent double-booking.

## Business Rules
1.  **Unique Identity:** Each patient and provider must have a unique identifier.
2.  **Specialization:** Every provider must belong to exactly one medical specialty.
3.  **Appointment Windows:** Appointments must have a valid start and end time; end time must be after start time.
4.  **No Double Booking:** A provider cannot have two appointments overlapping in time.
5.  **Historical Integrity:** Appointments cannot be created for past dates (except for data migration).
6.  **Encounter Prerequisite:** A clinical encounter record cannot be created unless an appointment exists and is marked 'Completed'.
7.  **Prescription validity:** Prescriptions must be linked to a specific encounter and a valid medication from the drug catalog.
8.  **Billing Generation:** A bill is automatically generated when an encounter is finalized.
9.  **Insurance Requirement:** Patients must have valid insurance details on file for non-cash billing.
10. **PHI Privacy:** Sensitive fields like patient address and notes must be stored securely (simulated via encryption or access control).
11. **No-Show Logic:** An appointment is only a "No-Show" if the current time is past the appointment end time and status is not 'Completed'.
12. **Rescheduling:** Only schedulers or the assigned provider can alter appointment times.
13. **Diagnosis Codes:** All diagnoses must reference standard ICD-10 codes stored in the reference table.
14. **Cascading Deletes:** Deleting a patient should not delete their medical history (Encounters/Bills) to preserve audit trails (Soft Delete preferred).
15. **Concurrency:** If two users try to book the same slot simultaneously, the system must prioritize the first request based on timestamp.s
