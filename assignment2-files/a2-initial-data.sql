PRAGMA foreign_keys = on;
-- 1. Customers
INSERT INTO customers VALUES (1, 'Alice Smith', 'alice@example.com');
INSERT INTO customers VALUES (2, 'Bob Johnson', 'bob@example.com');
INSERT INTO customers VALUES (3, 'Charlie Brown', 'charlie@example.com');
INSERT INTO customers VALUES (4, 'Test User', 'test@example.com');

-- 2. Products
INSERT INTO products VALUES (101, 'Laptop', 'Electronics', 1200.00, 10, 'High performance laptop');
INSERT INTO products VALUES (102, 'Headphones', 'Electronics', 150.00, 50, 'Noise-cancelling headphones');
INSERT INTO products VALUES (103, 'Coffee Maker', 'Home Appliances', 80.00, 20, '12-cup programmable coffee maker');
INSERT INTO products VALUES (104, 'Smartphone', 'electronics', 800.00, 25, 'Latest model smartphone');
INSERT INTO products VALUES (105, 'Wireless Mouse', 'ELECTRONICS', 45.00, 100, 'Ergonomic wireless mouse');
INSERT INTO products VALUES (106, 'Keyboard', 'Electronics', 75.00, 80, 'Mechanical gaming keyboard');
INSERT INTO products VALUES (107, 'Monitor', 'Electronics', 300.00, 15, '24-inch LED monitor');
INSERT INTO products VALUES (108, 'Desk Chair', 'Furniture', 200.00, 30, 'Ergonomic office chair');
INSERT INTO products VALUES (109, 'Tablet', 'Electronics', 400.00, 20, '10-inch tablet with stylus');
INSERT INTO products VALUES (110, 'Desk Lamp', 'Home Appliances', 35.00, 60, 'LED desk lamp');

-- 3. Credit Cards
INSERT INTO creditCards VALUES (5001, 'Alice Smith', '2027-06-30');
INSERT INTO creditCards VALUES (5002, 'Bob Johnson', '2026-11-30');

-- 4. Orders
INSERT INTO orders VALUES (9001, '2025-09-01', '123 Main St, Edmonton');
INSERT INTO orders VALUES (9002, '2025-09-05', '456 Pine Ave, Calgary');
INSERT INTO orders VALUES (9003, '2025-09-10', '789 Oak Blvd, Vancouver');
INSERT INTO orders VALUES (9004, '2025-09-15', '321 Elm Rd, Toronto');
INSERT INTO orders VALUES (9005, '2025-09-20', '654 Maple Ave, Ottawa');

-- 5. Sessions
INSERT INTO sessions VALUES (1, 1, '2025-09-01 09:00:00', '2025-09-01 10:15:00');  -- Alice
INSERT INTO sessions VALUES (2, 1, '2025-09-05 14:00:00', '2025-09-05 15:30:00');  -- Bob
INSERT INTO sessions VALUES (3, 1, '2025-09-05 14:00:00', '2025-09-05 14:40:00');  -- Charlie session 1
INSERT INTO sessions VALUES (3, 2, '2025-09-10 10:00:00', '2025-09-10 10:30:00');  -- Charlie session 2
INSERT INTO sessions VALUES (3, 3, '2025-09-15 16:00:00', '2025-09-15 16:45:00');  -- Charlie session 3
INSERT INTO sessions VALUES (3, 4, '2025-09-20 11:30:00', '2025-09-20 12:00:00');  -- Charlie session 4

-- 6. Orderlines
INSERT INTO orderlines VALUES (9001, 1, 101, 1, 1200.00, 0.00); -- Alice buys Laptop
INSERT INTO orderlines VALUES (9001, 2, 102, 2, 150.00, 0.10); -- Alice buys 2 Headphones, 10% off
INSERT INTO orderlines VALUES (9002, 1, 103, 1, 80.00, 0.00);  -- Bob buys Coffee Maker

-- Order 9003: 4 lines, 3 Electronics products (75% Electronics) 
INSERT INTO orderlines VALUES (9003, 1, 104, 1, 800.00, 0.05); -- Smartphone (electronics)
INSERT INTO orderlines VALUES (9003, 2, 105, 1, 45.00, 0.00);  -- Wireless Mouse (ELECTRONICS)
INSERT INTO orderlines VALUES (9003, 3, 106, 1, 75.00, 0.00);  -- Keyboard (Electronics)
INSERT INTO orderlines VALUES (9003, 4, 108, 1, 200.00, 0.00); -- Desk Chair (Furniture)

-- Order 9004: 5 lines, 3 Electronics products (60% Electronics)
INSERT INTO orderlines VALUES (9004, 1, 101, 1, 1200.00, 0.00); -- Laptop (Electronics)
INSERT INTO orderlines VALUES (9004, 2, 107, 1, 300.00, 0.10);  -- Monitor (Electronics)
INSERT INTO orderlines VALUES (9004, 3, 109, 1, 400.00, 0.00);  -- Tablet (Electronics)
INSERT INTO orderlines VALUES (9004, 4, 103, 1, 80.00, 0.00);   -- Coffee Maker (Home Appliances)
INSERT INTO orderlines VALUES (9004, 5, 110, 1, 35.00, 0.00);   -- Desk Lamp (Home Appliances)

-- Order 9005: 4 lines, 2 Electronics products (50% Electronics - exactly at threshold)
INSERT INTO orderlines VALUES (9005, 1, 102, 1, 150.00, 0.00);  -- Headphones (Electronics)
INSERT INTO orderlines VALUES (9005, 2, 104, 1, 800.00, 0.15);  -- Smartphone (electronics)
INSERT INTO orderlines VALUES (9005, 3, 103, 1, 80.00, 0.00);   -- Coffee Maker (Home Appliances)
INSERT INTO orderlines VALUES (9005, 4, 108, 1, 200.00, 0.05);  -- Desk Chair (Furniture)

-- 7. OrderSessions
INSERT INTO orderSessions VALUES (9001, 1, 1); -- Alice’s order linked to her session
INSERT INTO orderSessions VALUES (9002, 2, 1); -- Bob’s order linked to his session

-- 8. Activities
INSERT INTO activities VALUES (1, 1, '2025-09-01 09:10:00'); -- Alice activity
INSERT INTO activities VALUES (1, 1, '2025-09-01 09:20:00');
INSERT INTO activities VALUES (1, 1, '2025-09-01 09:30:00');
INSERT INTO activities VALUES (2, 1, '2025-09-05 14:10:00'); -- Bob activity
INSERT INTO activities VALUES (2, 1, '2025-09-05 14:25:00');
INSERT INTO activities VALUES (2, 1, '2025-09-05 14:40:00');
INSERT INTO activities VALUES (3, 1, '2025-09-05 14:25:00'); -- Charlie activities
INSERT INTO activities VALUES (3, 2, '2025-09-10 10:15:00');
INSERT INTO activities VALUES (3, 3, '2025-09-15 16:30:00');
INSERT INTO activities VALUES (3, 4, '2025-09-20 11:45:00');

-- 9. Viewed Products
INSERT INTO viewedProduct VALUES (1, 1, '2025-09-01 09:10:00', 101);
INSERT INTO viewedProduct VALUES (1, 1, '2025-09-01 09:20:00', 102);
INSERT INTO viewedProduct VALUES (2, 1, '2025-09-05 14:10:00', 103);
INSERT INTO viewedProduct VALUES (3, 1, '2025-09-05 14:25:00', 102);

-- 10. Searches
INSERT INTO search VALUES (1, 1, '2025-09-01 09:30:00', 'best noise cancelling headphones');
INSERT INTO search VALUES (2, 1, '2025-09-05 14:25:00', 'coffee maker under 100');

-- 11. Add to Cart
INSERT INTO add2cart VALUES (1, 1, '2025-09-01 09:20:00', 102); -- Alice added headphones
INSERT INTO add2cart VALUES (2, 1, '2025-09-05 14:40:00', 103); -- Bob added coffee maker
-- Charlie's add2cart entries (3 different times within past 30 days, no purchases)
INSERT INTO add2cart VALUES (3, 2, '2025-09-10 10:15:00', 101); -- Charlie added laptop
INSERT INTO add2cart VALUES (3, 3, '2025-09-15 16:30:00', 102); -- Charlie added headphones
INSERT INTO add2cart VALUES (3, 4, '2025-09-20 11:45:00', 103); -- Charlie added coffee maker

-- 12. Checkout
INSERT INTO checkout VALUES (1, 1, '2025-09-01 09:30:00');
INSERT INTO checkout VALUES (2, 1, '2025-09-05 14:40:00');

-- 13. Payment
INSERT INTO payment VALUES (1, 1, '2025-09-01 09:30:00', 5001);
INSERT INTO payment VALUES (2, 1, '2025-09-05 14:40:00', 5002);

