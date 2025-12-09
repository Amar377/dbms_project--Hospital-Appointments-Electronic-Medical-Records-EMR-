# Hospital EMR DBMS Project

## Topic
**Hospital Appointments & Electronic Medical Records (EMR)**  

**Database:** MySQL / PostgreSQL  

---

## Team

| Name       | Roll No. |
|-----------|----------|
| Amar      | 7        |
| Jaswanth  | 22       |
| Sricharan | 20       |
| Nithisha  | 25       |

---

## Project Overview

This database system manages the core operations of **City General Hospital**.  
It handles:

- Patient registration  
- Provider (doctor) scheduling  
- Medical encounters (consultations/visits)  
- Diagnoses and treatment records  
- Prescriptions and medications  
- Billing and payments  

### Goals

- Ensure **data integrity** across all hospital operations  
- Prevent **appointment conflicts** and double-booking of doctors  
- Provide **actionable insights** through reports and analytics  
- Support **secure access** with roles and privileges  
- Enable **easy backup and recovery** of hospital data  

---

## Folder Structure & File Manifest

Recommended project structure:

```text
hospital-emr-dbms/
├── 1_planning_modeling/
│   ├── 01_requirements.md
│   ├── 02_er_diagram/          # ER diagram image file(s)
│   ├── 02_er_notes.md
│   ├── 03_schema_draft.md
│   ├── 04_normalization.md
│   └── 05_data_dictionary.md
│
├── 2_sql_scripts/
│   ├── 03_create_tables.sql
│   ├── 05_seed_data.sql
│   ├── 06_crud_and_queries.sql
│   ├── 07_indexes.sql
│   ├── 08_transactions.sql
│   ├── 09_constraints.sql
│   ├── 09_roles_privileges.sql
│   ├── 10_reports.sql
│   └── run_all.sql
│
└── 3_docs_reports/
    ├── 07_explain_report.md
    ├── 08_concurrency_demo.md
    ├── 09_security_tests.md
    └── 10_backup_restore.md
