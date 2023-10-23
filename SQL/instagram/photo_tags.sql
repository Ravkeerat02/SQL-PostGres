CREATE TABLE photo_tags(
	id SERIAL PRIMARY KEY , 
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
-- 	storing cordinates
	x INTEGER NOT NULL, 
	y INTEGER NOT NULL,
-- 	its alwyas different
	UNIQUE(user_id , post_id)

)