-- Abandoned products are those that have been added to a shopping cart but were 
-- never purchased. Find the product id of each abandoned product, 
-- along with the id and name of the customer who abandoned it.

SELECT DISTINCT p.pid, c.cid, c.name
FROM customers c
JOIN add2cart ac ON c.cid = ac.cid
JOIN products p ON ac.pid = p.pid
WHERE NOT EXISTS (
    SELECT 1
    FROM orderlines ol, orderSessions os
    WHERE ol.pid = ac.pid AND os.ono = ol.ono AND os.cid = c.cid AND os.sessionNo = ac.sessionNo
);
