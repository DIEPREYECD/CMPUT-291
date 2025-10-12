-- Which makers do have products that are priced over $1000?
-- π_{maker} ( σ_{type='pc'}(Product) ⋈ σ_{price>1000}(PC) ) ∪
-- π_{maker} ( σ_{type='laptop'}(Product) ⋈ σ_{price>1000}(Laptop) ) ∪  
-- π_{maker} ( σ_{type='printer'}(Product) ⋈ σ_{price>1000}(Printer) )

-- pc makers
SELECT pr.maker
FROM product pr
WHERE pr.type = 'pc' AND pr.model IN (
    SELECT pc.model
    FROM pc
    WHERE pc.price > 1000
)

UNION

-- laptop makers
SELECT pr.maker
FROM product pr
WHERE pr.type = 'laptop' AND pr.model IN (
    SELECT lp.model
    FROM laptop lp
    WHERE lp.price > 1000
)

UNION

-- printer makers
SELECT pr.maker
FROM product pr
WHERE pr.type = 'printer' AND pr.model IN (
    SELECT p.model
    FROM printer p
    WHERE p.price > 1000
);
