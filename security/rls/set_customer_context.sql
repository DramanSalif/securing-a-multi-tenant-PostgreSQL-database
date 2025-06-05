-- Trigger function to bind session identity

CREATE OR REPLACE FUNCTION afma.set_customer_context()
RETURNS void AS $$
DECLARE
  cust_id TEXT;
BEGIN
  SELECT customer_id::TEXT INTO cust_id
  FROM afma.session_bindings
  WHERE role_name = current_user;

  IF cust_id IS NOT NULL THEN
    PERFORM set_config('app.current_customer', cust_id, true);
  END IF;
END;
$$ LANGUAGE plpgsql;
