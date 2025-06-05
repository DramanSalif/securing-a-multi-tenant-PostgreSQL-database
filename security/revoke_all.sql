-- FILE: revoke_all.sql
-- PURPOSE: Revoke all public privileges from AFMA schema

REVOKE ALL ON SCHEMA afma FROM PUBLIC;
REVOKE ALL ON ALL TABLES IN SCHEMA afma FROM PUBLIC;

-- Optionally revoke from roles if required
REVOKE ALL ON ALL TABLES IN SCHEMA afma FROM afma_readers;
REVOKE ALL ON ALL TABLES IN SCHEMA afma FROM afma_editors;
