-- RECURSIVE - imp to express by plain simple - able to identify when and how to use
-- suggestion example 
-- depth - at what level we are finding the suggestion 
-- fetch data from a tree or graph structure - examle - finding the employee(hierarchy)

-- mentioning the table which will be used
WITH RECURSIVE suggestions(leader_id , follower_id , depth ) AS (
-- 	non recursive statement 
	SELECT leader_id , follower_id , 1 AS depth 
	FROM followers
-- 	finding for specifc id 
	WHERE follower_id = 1 
	UNION 
	-- 	recursive statment - find rows which match the data from the columns - selecting specific id which will be used ot generate the data 
		SELECT followers.leader_id , followers.follower_id , depth + 1
		FROM followers 
	-- re running it again  	
		JOIN suggestions ON suggestions.leader_id = followers.follower_id 
	-- 	getting data with depth(row) < 2
	WHERE depth < 3
)

SELECT DISTINCT users.id , users.username 
FROM suggestions 
-- combining the final outcome for the needed data 
JOIN users ON users.id = suggestions.leader_id 
WHERE depth > 1 
LIMIT 25

