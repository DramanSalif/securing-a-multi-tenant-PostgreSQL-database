-- Enable RLS on key tables

ALTER TABLE afma.customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE afma.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE afma.orderItems ENABLE ROW LEVEL SECURITY;

-- Customers can only view their own row
CREATE POLICY self_access ON afma.customers
  FOR SELECT USING (id::text = current_setting('app.current_customer')::text);
