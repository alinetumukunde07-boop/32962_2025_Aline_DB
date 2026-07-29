-- Phase 6: PL/SQL Logic Implementation

CREATE OR REPLACE PACKAGE payroll_pkg AS
    FUNCTION calculate_tax(p_gross_salary NUMBER) RETURN NUMBER;
    PROCEDURE generate_monthly_payroll(p_month NUMBER, p_year NUMBER);
END payroll_pkg;
/

CREATE OR REPLACE PACKAGE BODY payroll_pkg AS

    FUNCTION calculate_tax(p_gross_salary NUMBER) RETURN NUMBER IS
        v_tax NUMBER(10,2) := 0;
        v_rate NUMBER(5,2) := 0;
    BEGIN
        SELECT tax_rate INTO v_rate 
        FROM tax_brackets
        WHERE p_gross_salary >= min_salary 
          AND (max_salary IS NULL OR p_gross_salary <= max_salary);
          
        v_tax := p_gross_salary * v_rate;
        RETURN v_tax;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Tax calculation error');
    END calculate_tax;

    PROCEDURE generate_monthly_payroll(p_month NUMBER, p_year NUMBER) IS
        CURSOR emp_cur IS 
            SELECT e.employee_id, s.basic_salary 
            FROM employees e
            JOIN salaries s ON e.employee_id = s.employee_id;
            
        v_tax NUMBER(10,2);
        v_net NUMBER(10,2);
        v_payslip_id NUMBER := 1000;
    BEGIN
        FOR rec IN emp_cur LOOP
            v_tax := calculate_tax(rec.basic_salary);
            v_net := rec.basic_salary - v_tax;
            
            INSERT INTO payslips (payslip_id, employee_id, pay_period_month, pay_period_year, gross_salary, tax_amount, net_salary, payment_date)
            VALUES (v_payslip_id, rec.employee_id, p_month, p_year, rec.basic_salary, v_tax, v_net, SYSDATE);
            
            v_payslip_id := v_payslip_id + 1;
        END LOOP;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Payroll generated successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Payroll process failed: ' || SQLERRM);
    END generate_monthly_payroll;

END payroll_pkg;
/