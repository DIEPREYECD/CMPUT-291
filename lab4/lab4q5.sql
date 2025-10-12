-- List the type and the model of products with a speed more than 200MHz.
-- π_{type,model} ( (σ_{type='pc'}(Product) ⋈ σ_{speed>200}(PC)) ∪ (σ_{type='laptop'}(Product) ⋈ σ_{speed>200}(Laptop)) )

SELECT pr.type, pr.model
FROM product pr
WHERE (pr.model IN (
    SELECT pc.model
    FROM pc
    WHERE pc.speed > 200
) AND pr.type = 'pc') OR (pr.model IN (
    SELECT lp.model
    FROM laptop lp
    WHERE lp.speed > 200
) AND pr.type = 'laptop');