-- RECURSIVE - imp to express by plain simple - able to identify when and how to use
-- USED FOR HIERARCHICAL/NESTED data structure - meaning it involves parents , children and child 
-- creates a loop until a condition is satisfied
-- starts with THE WITH 

WITH RECURSIVE countdown(val) AS(
	SELECT 3 AS val 
	UNION 
	SELECT val - 1 from coutdown WHERE val > 1 	
)
SELECT * 
FROM countdown


