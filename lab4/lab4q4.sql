-- Find laptop models that are priced higher than all PCs.
-- π_{model} ( σ_{price > max(π_{price}(PC))}(Laptop) )

SELECT lp.model
FROM laptop lp
WHERE lp.price > (
    SELECT MAX(pc.price)
    FROM pc
);