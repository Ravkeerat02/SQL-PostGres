CREATE TABLE hashtags_posts(
	id SERIAL PRIMARY KEY , 
-- 	refering to hashtag table - delete automatcailly/manually
	hashtag_id INTEGER NOT NULL REFERENCES hashtags(id) ON DELETE CASCADE,
	post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
	UNIQUE(hashtag_id , post_id)

	
)