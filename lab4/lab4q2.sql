-- Which makers are producing PC of model 1003?
-- π_{maker} ( σ_{model=1003 ∧ type='pc'}(Product) )

SELECT pr.maker
FROM product pr
WHERE pr.model = 1003 AND pr.type = 'pc';