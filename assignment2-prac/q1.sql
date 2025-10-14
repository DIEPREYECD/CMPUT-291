-- Find customers who purchased a product in Electronics category and the product was shipped to Edmonton. Return id, name and email of the customers.

SELECT DISTINCT c.cid, c.name, c.email
FROM customers c, orderSessions os, orderlines ol, products p, orders o
WHERE c.cid = os.cid AND os.ono = ol.ono AND ol.pid = p.pid AND o.shipping_address LIKE '%Edmonton%'
AND p.category = 'Electronics';