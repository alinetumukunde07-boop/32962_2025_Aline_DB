-- Phase 4: Database User & Privilege Setup
-- Execute as SYS or SYSTEM user

CREATE USER "32962_2025_Aline_DB" IDENTIFIED BY "AlinePayroll2026#";

-- Grant required privileges
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE PROCEDURE, CREATE TRIGGER TO "32962_2025_Aline_DB";
ALTER USER "32962_2025_Aline_DB" QUOTA UNLIMITED ON USERS;

-- Connect to new schema
CONNECT "32962_2025_Aline_DB"/"AlinePayroll2026#";