-- Refernce for CRUD based operations - makes it easy to read and understand compelx queries

-- QUERY EXAMPLE
SELECT username , tags.created_at
FROM users 
JOIN (
-- 	UNION - join 2 sets of rows with same call
	SELECT user_id , created_at FROM caption_tags 
	UNION ALL 
	SELECT user_id , created_at FROM photo_tags
-- 	tags criteria
) AS tags ON tags.user_id = users.id 
WHERE tags.created_at < '2010-01-07';

-- common table expression - example
WITH tags AS(
-- 	UNION - join 2 sets of rows with same call
	SELECT user_id , created_at FROM caption_tags 
	UNION ALL 
	SELECT user_id , created_at FROM photo_tags
-- 	tags criteria
)

SELECT username , tags.created_at
FROM users 
JOIN tags ON tags.user_id = users.id 
WHERE tags.created_at < '2010-01-07';

-- CODE EXPLANATION 
"Hash Join  (cost=701.62..884.77 rows=66 width=21)"
"  Hash Cond: (users.id = caption_tags.user_id)"
"  ->  Seq Scan on users  (cost=0.00..162.45 rows=5345 width=17)"
"  ->  Hash  (cost=700.79..700.79 rows=66 width=12)"
"        ->  Append  (cost=0.00..700.79 rows=66 width=12)"
"              ->  Seq Scan on caption_tags  (cost=0.00..368.69 rows=64 width=12)"
"                    Filter: (created_at < '2010-01-07 00:00:00-05'::timestamp with time zone)"
"              ->  Seq Scan on photo_tags  (cost=0.00..331.77 rows=2 width=12)"
"                    Filter: (created_at < '2010-01-07 00:00:00-05'::timestamp with time zone)"
