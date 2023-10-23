-- -- highest 3 id
SELECT * 
FROM users 
ORDER BY id DESC
LIMIT 3

-- joining 2 tables with 200 

SELECT * 
FROM users 
JOIN posts ON posts.user_id = users.id 
WHERE user_id = 200

-- finding the user with the most likes 
-- username nad likes 
SELECT usErname , COUNT(*)
FROM users 
JOIN likes on likes.user_id = users.id
-- seperating on the basis of username
GROUP BY username 

