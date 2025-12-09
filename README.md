Hospital EMR DBMS Project

Topic: Hospital Appointments & Electronic Medical Records (EMR)

Database: MySQL / PostgreSQL

Team: 
| Name       | Roll No. |
|-------------|-----------|
| Amar        | 7         |
| Jaswanth    | 22        |
| Sricharan   | 20        |
| Nithisha    | 25        |


Project Overview

This database system manages the core operations of City General Hospital. It handles patient registration, provider scheduling, medical encounters, diagnoses, prescriptions, and billing. The goal is to ensure data integrity, prevent appointment conflicts, and provide actionable insights through reporting.

Folder Structure & File Manifest

1. Planning & Modeling

01_requirements.md: Project narrative, business rules, and user definitions.

02_er_diagram: (Image to be created by you) The Entity-Relationship diagram.

02_er_notes.md: Detailed explanation of entities and relationships.

03_schema_draft.md: Documentation of tables, columns, and keys.

04_normalization.md: Step-by-step normalization process (1NF -> 3NF).

05_data_dictionary.md: Detailed metadata describing every column and data type.

2. SQL Scripts (Execution Order)

03_create_tables.sql: The SQL DDL script to create the database structure.

05_seed_data.sql: Script to insert dummy data for testing.

06_crud_and_queries.sql: 12+ required SQL queries (Joins, Subqueries, Aggregates).

07_indexes.sql: Performance tuning scripts (Index creation).

08_transactions.sql: Transaction control scripts (Commit/Rollback).

09_constraints.sql: Additional integrity constraints (CHECK, UNIQUE).

09_roles_privileges.sql: User creation and permission granting script.

10_reports.sql: Scripts to generate CSV-ready reports.

run_all.sql: Master script to execute all the above in the correct order.

3. Documentation & Reports

07_explain_report.md: Analysis of query performance before/after indexing.

08_concurrency_demo.md: Log of concurrency testing (Double-booking scenario).

09_security_tests.md: Results of security and constraint testing.

10_backup_restore.md: Guide to backing up and recovering the DB.

How to Run

Setup: Ensure MySQL is installed and running.

Build: Open your SQL client (Workbench/pgAdmin) and run the master script:

SOURCE run_all.sql;


Verify: Check that the hospital_db is created and tables are populated.

Test: Execute specific queries from 06_crud_and_queries.sql or 10_reports.sql to view data.
