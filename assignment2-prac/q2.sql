-- Find window shoppers. These are customers who viewed or added products to cart, but never made payments. Return the id and name of those shoppers.
SELECT DISTINCT c.cid, c.name
FROM customers c
JOIN viewedProduct vp ON c.cid = vp.cid
LEFT JOIN payment p ON c.cid = p.cid
WHERE p.cid IS NULL

UNION

SELECT DISTINCT c.cid, c.name
FROM customers c
JOIN add2cart ac ON c.cid = ac.cid
LEFT JOIN payment p ON c.cid = p.cid
WHERE p.cid IS NULL;