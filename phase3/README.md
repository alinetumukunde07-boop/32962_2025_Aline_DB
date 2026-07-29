# Phase 3: Logical Database Design

## 1. Entities and Key Attributes
- **DEPARTMENTS:** `department_id` (PK), `department_name`
- **EMPLOYEES:** `employee_id` (PK), `first_name`, `last_name`, `email`, `hire_date`, `department_id` (FK)
- **TAX_BRACKETS:** `bracket_id` (PK), `min_salary`, `max_salary`, `tax_rate`
- **SALARIES:** `salary_id` (PK), `employee_id` (FK), `basic_salary`, `effective_date`
- **PAYSLIPS:** `payslip_id` (PK), `employee_id` (FK), `pay_period_month`, `pay_period_year`, `gross_salary`, `tax_amount`, `net_salary`, `payment_date`
- **PUBLIC_HOLIDAYS:** `holiday_id` (PK), `holiday_date`, `holiday_name`
- **AUDIT_LOGS:** `log_id` (PK), `table_name`, `operation_type`, `performed_by`, `performed_at`, `details`

## 2. Normalization Summary
- **First Normal Form (1NF):** All attributes contain atomic values; no multi-valued or repeating groups exist.
- **Second Normal Form (2NF):** Every non-key attribute is fully functionally dependent on the primary key.
- **Third Normal Form (3NF):** Transitive dependencies have been removed. Attributes dependent on other non-key attributes (e.g., department names, tax rates) are stored in dedicated reference tables (`DEPARTMENTS`, `TAX_BRACKETS`).

---
*Note: Refer to `ERD_Diagram.png` for the complete entity-relationship model.*
