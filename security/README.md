# 🔐 Security and Access Control

This directory manages database security policies, including roles, privileges, and row-level security (RLS) for multitenancy.

## Files

- `roles_and_privileges.sql`: Creates users and groups with table-level privileges.
- `revoke_all.sql`: Removes all privileges from public and groups for reset.
- `rls/`: Contains all logic and bindings related to Row-Level Security (RLS).
