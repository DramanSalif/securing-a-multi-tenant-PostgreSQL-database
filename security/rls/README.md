# 🛡️ Row-Level Security (RLS)

This folder implements RLS policies to enforce customer-level access control.

## Setup Sequence

1. Enable RLS on target tables (`rls_enable.sql`)
2. Bind sessions to customers via `session_bindings.sql`
3. Use `set_customer_context.sql` to set context per role or session
4. Define RLS policies (`rls_orders_orderItems.sql`)

## Session Identity Enforcement

Applications should either:
- Call `SELECT afma.set_customer_context();` at login, or
- Set `SET LOCAL app.current_customer = '<id>';` per session
