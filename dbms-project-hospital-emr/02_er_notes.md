# 02 ER Model Notes

## Entities
* **Patients:** Strong entity. Stores demographics. Has total participation in Appointments (eventually).
* **Providers:** Strong entity. Stores clinician details.
* **Appointments:** Associative entity linking Patients and Providers. It is the core transaction.
* **Encounters:** Weak entity (existence dependent on Appointment). Represents the clinical visit.
* **Prescriptions:** Weak entity (dependent on Encounter).
* **Medications:** Reference entity (Lookup table).

## Relationships
* **Patient-Appointment (1:M):** A patient can have many appointments; an appointment belongs to one patient.
* **Provider-Appointment (1:M):** A provider sees many patients.
* **Appointment-Encounter (1:1):** One appointment results in exactly one clinical encounter record.

* **Encounter-Prescription (1:M):** One encounter can result in multiple drugs being prescribed.
