-- Phase 5: Initial Data Population

INSERT INTO departments VALUES (10, 'Human Resources');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'Information Technology');

INSERT INTO employees VALUES (101, 'Aline', 'Tumukunde', 'aline@unilak.ac.rw', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 30);
INSERT INTO employees VALUES (102, 'Eric', 'Maniraguha', 'eric@unilak.ac.rw', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 20);

INSERT INTO tax_brackets VALUES (1, 0, 100000, 0.00);
INSERT INTO tax_brackets VALUES (2, 100001, 300000, 0.10);
INSERT INTO tax_brackets VALUES (3, 300001, 1000000, 0.20);
INSERT INTO tax_brackets VALUES (4, 1000001, NULL, 0.30);

INSERT INTO salaries VALUES (1, 101, 450000, SYSDATE);
INSERT INTO salaries VALUES (2, 102, 1200000, SYSDATE);

INSERT INTO public_holidays VALUES (1, TO_DATE('2026-08-15', 'YYYY-MM-DD'), 'Assumption Day');
INSERT INTO public_holidays VALUES (2, TO_DATE('2026-12-25', 'YYYY-MM-DD'), 'Christmas Day');

COMMIT;