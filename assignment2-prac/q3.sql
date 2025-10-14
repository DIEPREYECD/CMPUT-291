-- Find the id of customers who have added products to cart at least three different times within the past 30 days 
-- but have not made any purchases within the same period (i.e., none of their sessions is linked to an order).

SELECT DISTINCT c.cid
FROM customers c
JOIN add2cart ac ON c.cid = ac.cid
JOIN add2cart ac2 ON c.cid = ac2.cid AND ac.ts <> ac2.ts
JOIN add2cart ac3 ON c.cid = ac3.cid AND ac.ts <> ac3.ts AND ac2.ts <> ac3.ts
LEFT JOIN payment p ON c.cid = p.cid AND p.ts >= date('now', '-30 days')
WHERE p.cid IS NULL
AND ac.ts >= date('now', '-30 days')
AND ac2.ts >= date('now', '-30 days')
AND ac3.ts >= date('now', '-30 days');