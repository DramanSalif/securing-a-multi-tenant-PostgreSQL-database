-- RLS policies for orders and orderItems scoped to customer identity

CREATE POLICY customer_order_access ON afma.orders
  FOR ALL
  USING (customer_id::text = current_setting('app.current_customer')::text);

CREATE POLICY customer_order_item_access ON afma.orderItems
  FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM afma.orders o
      WHERE o.id = afma.orderItems.order_id
        AND o.customer_id::text = current_setting('app.current_customer')::text
    )
  );
