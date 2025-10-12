-- Which makers do have more than one model of printers?
-- π_maker ( σ_{c > 1} ( γ_{maker; COUNT(model)→c} ( σ_{type='printer'}(Product) ) ) )

SELECT pr.maker
FROM product pr
WHERE pr.type = 'printer'
GROUP BY pr.maker
HAVING COUNT(*) > 1;