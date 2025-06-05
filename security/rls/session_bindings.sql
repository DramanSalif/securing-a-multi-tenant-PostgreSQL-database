-- Role-to-customer binding table

CREATE TABLE IF NOT EXISTS afma.session_bindings (
  role_name TEXT PRIMARY KEY,
  customer_id INTEGER REFERENCES afma.customers(id)
);

-- Insert bindings for each user
INSERT INTO afma.session_bindings (role_name, customer_id) VALUES
  ('customer_2', 2),
  ('customer_3', 3);
