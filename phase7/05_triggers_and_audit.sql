-- Phase 7: Triggers & Security Enforcement

-- 1. Restrict DML on Weekdays & Public Holidays
CREATE OR REPLACE TRIGGER trg_restrict_payroll_modifications
BEFORE INSERT OR UPDATE OR DELETE ON salaries
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
    v_holiday_count NUMBER;
BEGIN
    v_day := TRIM(TO_CHAR(SYSDATE, 'DAY'));
    
    SELECT COUNT(*) INTO v_holiday_count 
    FROM public_holidays 
    WHERE TRUNC(holiday_date) = TRUNC(SYSDATE);
    
    IF v_day IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY') OR v_holiday_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20099, 'Access Denied: Modifications blocked on weekdays and public holidays.');
    END IF;
END;
/

-- 2. Audit Logging Trigger
CREATE OR REPLACE TRIGGER trg_audit_employees
AFTER INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_logs (table_name, operation_type, details)
        VALUES ('EMPLOYEES', 'INSERT', 'Added employee ID: ' || :NEW.employee_id);
    ELSIF UPDATING THEN
        INSERT INTO audit_logs (table_name, operation_type, details)
        VALUES ('EMPLOYEES', 'UPDATE', 'Updated employee ID: ' || :NEW.employee_id);
    ELSIF DELETING THEN
        INSERT INTO audit_logs (table_name, operation_type, details)
        VALUES ('EMPLOYEES', 'DELETE', 'Deleted employee ID: ' || :OLD.employee_id);
    END IF;
END;
/