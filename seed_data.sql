-- FILE: seed_data.sql
SET search_path TO afma;

-- ========================
-- Math Subject Classifications
-- ========================
INSERT INTO afma.mathSubjectClassifications(subject_class)
VALUES 
  ('12A'), ('11B'), ('12C'), ('13D'), ('14E');

-- ========================
-- Authors
-- ========================
INSERT INTO afma.authors(first_name, last_name, email, phone, grade)
VALUES 
  ('Ada', 'Lovelace', 'ada@math.org', '1234567890', '1'),
  ('Alan', 'Turing', 'alan@math.org', '2345678901', '2'),
  ('Emmy', 'Noether', 'emmy@math.org', '3456789012', '3'),
  ('Kurt', 'Gödel', 'kurt@math.org', '4567890123', '2');

-- ========================
-- Affiliations
-- ========================
INSERT INTO afma.affiliations(institution, postal_code, country, author_id)
VALUES 
  ('University of Oxford', 'OX1 2JD', 'UK', 5),
  ('Princeton University', '08544', 'USA', 2),
  ('University of Göttingen', '37073', 'Germany', 3),
  ('Institute for Advanced Study', '08540', 'USA', 4);

-- ========================
-- Articles
-- ========================
INSERT INTO afma.articles(title, abstract, content, unit_price, inventory, publish_date, last_update, subject_class, volume, author_id)
VALUES 
  ('Analytical Engines', 'Exploration of mechanical computation', 'Detailed technical content', 24.99, 50, '2023-01-10', '2023-01-12', '11A', 1, 1),
  ('Computable Numbers', 'Landmark in computability theory', 'Full mathematical proof included', 29.99, 75, '2023-02-15', '2023-02-18', '11B', 2, 2),
  ('Noetherian Rings', 'Invariant theory and its foundations', 'Algebraic structures examined', 19.99, 60, '2023-03-20', '2023-03-21', '13D', 3, 3),
  ('Incompleteness Theorems', 'Limits of formal systems', 'Logical foundations covered', 34.99, 40, '2023-04-25', '2023-04-30', '12C', 4, 4);

-- ========================
-- Article-Subject Classification Links
-- ========================
INSERT INTO afma.articles_mathSubjectClassifications(article_id, msc_subject_class)
VALUES 
  (1, '12A'),
  (2, '11B'),
  (3, '13D'),
  (4, '12C'),
  (4, '14E');

-- ========================
-- Article-Author Links (co-authorship)
-- ========================
INSERT INTO afma.articles_authors(article_id, author_id)
VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (4, 2), -- Gödel and Turing co-authored article 4
  (3, 1); -- Ada contributed to Emmy's article

-- ========================
-- Customers
-- ========================
INSERT INTO afma.customers(first_name, last_name, email, phone, birth_date, membership_choice)
VALUES 
  ('Grace', 'Hopper', 'grace@cs.org', '7890123456', '1906-12-09', 'G'),
  ('Donald', 'Knuth', 'donald@cs.org', '8901234567', '1938-01-10', 'S'),
  ('Barbara', 'Liskov', 'barbara@cs.org', '9012345678', '1939-11-07', 'B');

-- ========================
-- Addresses
-- ========================
INSERT INTO afma.address(customer_id, street, postal_code, city, country)
VALUES 
  (4, '42 Code Street', '10001', 'New York', 'USA'),
  (2, '1 Algorithm Rd.', '94305', 'Palo Alto', 'USA'),
  (3, '3 OOP Avenue', '02139', 'Cambridge', 'USA');

-- ========================
-- Orders
-- ========================
INSERT INTO afma.orders(placed_at, customer_id, status)
VALUES 
  ('2024-12-01', 1, '1'),
  ('2024-12-02', 2, '2'),
  ('2024-12-03', 3, '3');

-- ========================
-- Order Items
-- ========================
INSERT INTO afma.orderItems(order_id, article_id, quantity, unit_price)
VALUES 
  (1, 1, 2, 24.99),
  (1, 2, 1, 29.99),
  (2, 3, 3, 19.99),
  (3, 4, 1, 34.99);
