# Phase 2: Business Process Modeling (MIS)

## 1. System Scope
The Payroll Tax Management System automates the complete lifecycle of payroll processing, from employee record management to tax withholding, payslip distribution, and security auditing.

## 2. Key Actors & Roles
- **HR Manager:** Onboards employees, updates department assignments, and sets base salaries.
- **Payroll Officer:** Initiates monthly payroll execution, verifies calculated taxes, and approves payouts.
- **System Administrator:** Oversees database access, configures reference tables (e.g., public holidays), and monitors system audit logs.
- **Employee:** Accesses finalized payslip details.

## 3. Process Workflow Summary
1. **Employee Onboarding:** HR enters employee details and salary specifications into the database.
2. **Payroll Execution:** At the end of the month, the Payroll Officer runs the automated PL/SQL payroll process.
3. **Tax & Deduction Calculation:** The system retrieves applicable tax brackets and automatically computes gross pay, total tax withholdings, and net salary.
4. **Validation & Restrictions:** System triggers verify operational business rules (e.g., preventing modifications on public holidays/weekdays).
5. **Payslip Generation & Auditing:** Payslips are generated, and all modified records log transaction details into the `AUDIT_LOGS` table.

---
*Note: Refer to `BPMN_Diagram.png` and `Process_Explanation.pdf` in this directory for the full swimlane diagram and process documentation.*
