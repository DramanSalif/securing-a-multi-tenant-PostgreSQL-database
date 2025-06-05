-- FILE: roles_and_privileges.sql
-- PURPOSE: Create roles and assign privileges to database groups and users

-- Groups
CREATE ROLE afma_readers;
CREATE ROLE afma_editors;
CREATE ROLE afma_admins;

-- Users
CREATE USER customer_2 WITH PASSWORD 'securePass2';
CREATE USER customer_3 WITH PASSWORD 'securePass3';

-- Assign users to groups
GRANT afma_readers TO customer_2;
GRANT afma_readers TO customer_3;

-- Grant access to schemas and tables
GRANT USAGE ON SCHEMA afma TO afma_readers, afma_editors;
GRANT SELECT ON ALL TABLES IN SCHEMA afma TO afma_readers;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA afma TO afma_editors;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA afma TO afma_admins;
