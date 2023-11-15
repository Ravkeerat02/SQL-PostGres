-- creating view
CREATE VIEW tags AS (
	SELECT id , created_at , user_id , post_id , 'photo_tag' AS type FROM photo_tags
	UNION ALL 
	SELECT id , created_at , user_id , post_id , 'caption_tag' AS type FROM caption_tags
)


-- testing view - merging tables
SELECT username , COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id 
GROUP BY username 
ORDER BY COUNT(*) DESC


-- -- recent post(top 10) 
CREATE VIEW recent_posts AS (
	SELECT * 
	FROM posts 
	ORDER BY created_at DESC 
	LIMIT 10 
)


-- testing it 
SELECT * FROM recent_posts;

-- testing for the usernames
SELECT username
FROM recent_posts
JOIN users on users.id = recent_posts.user_id;

-- -- applying changes
-- CREATE OR REPLACE VIEW recent_posts AS (
-- 	SELECT * 
-- 	FROM posts 
-- 	ORDER BY created_at DESC 
-- 	limit 15
-- ) 

-- tetsin 
SELECT * FROM recent_posts;


 -- deleting 
DROP VIEW recent_posts


-- materialized query 
-- LEFT JOIN - keep all the rows  - can include null as value 
-- slow query

SELECT * 
FROM likes 
LEFT JOIN posts ON posts.id = likes.post_id 
LEFT JOIN comments ON comments.id = likes.comment_id;

-- getting the date using date trunc 
SELECT 
-- RETURNS THE 1ST ARGUMNET WHICH AINT BULL
	date_trunc('week',COALESCE(posts.created_at , comments.created_at )) AS week , 
	COUNT(posts.id) AS num_posts , 
	COUNT(comments.id) AS num_comments
FROM likes 
LEFT JOIN posts ON posts.id = likes.post_id 
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;


-- -- -- materialized query - wont chnage(update) the data when table is being chnaged(played around) - need to do it manually 
-- -- -- LEFT JOIN - keep all the rows  - can include null as value 
CREATE MATERIALIZED VIEW weekly_likes AS (
	SELECT 
	-- RETURNS THE 1ST ARGUMNET WHICH AINT BULL
		date_trunc('week',COALESCE(posts.created_at , comments.created_at )) AS week , 
		COUNT(posts.id) AS num_posts , 
		COUNT(comments.id) AS num_comments
	FROM likes 
	LEFT JOIN posts ON posts.id = likes.post_id 
	LEFT JOIN comments ON comments.id = likes.comment_id
	GROUP BY week
	ORDER BY week
-- 	RUN AND HOLD(KEEP THE RESULTS)
) WITH DATA ;
SELECT * FROM weekly_likes;


REFRESH MATERIALIZED VIEW weekly_likes;

DELETE from posts 
WHERE created_at < '2010-02-01';

