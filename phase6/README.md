# Phase 6: PL/SQL Programming

## Overview
Implements server-side PL/SQL modules to handle business processing, tax calculations, and automated payroll operations.

## Files & Components
- `04_plsql_packages.sql`:
  - **Function (`calculate_tax`):** Takes gross salary as input, queries active `TAX_BRACKETS`, and returns the exact calculated tax deduction.
  - **Procedure (`generate_monthly_payroll`):** Iterates over all active employees using an explicit cursor, computes deductions, inserts finalized records into `PAYSLIPS`, and manages transactions using explicit `COMMIT` and `ROLLBACK` handling.
  - **Package (`payroll_pkg`):** Groups tax functions and payroll procedures into a unified package specification and body.