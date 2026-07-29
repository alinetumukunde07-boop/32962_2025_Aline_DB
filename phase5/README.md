# Phase 5: Table Implementation & Data Population

## Overview
Includes all Data Definition Language (DDL) and Data Manipulation Language (DML) scripts required to construct tables, enforce integrity constraints, and insert initial benchmark data.

## Included Files
- `02_create_tables.sql`: DDL script containing `CREATE TABLE` statements with explicit constraints:
  - **Primary Keys (PK):** Unique identifier for each entity.
  - **Foreign Keys (FK):** Foreign key constraints (`ON DELETE CASCADE` / `SET NULL`).
  - **Check Constraints:** Validates ranges (e.g., `tax_rate BETWEEN 0 AND 1`, `basic_salary > 0`).
  - **Unique Constraints:** Ensures non-duplicate values for emails and department names.
- `03_insert_data.sql`: DML script populating valid sample data into all tables (`DEPARTMENTS`, `EMPLOYEES`, `TAX_BRACKETS`, `SALARIES`, `PUBLIC_HOLIDAYS`).