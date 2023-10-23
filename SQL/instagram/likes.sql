CREATE TABLE likes(
	id SERIAL PRIMARY KEY ,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
-- 	delete all users with that specific id
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
-- 	polymorphic - one of them has to be defined
	post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE , 
	comment_id INTEGER REFERENCES comments(id) ON DELETE CASCADE , 
-- 	checking - either one should be defined 
	CHECK (
-- 		returns 1st arg which aint null - coverting null into bool
		COALESCE ((post_id) :: BOOLEAN::INTEGER,0)
		+
		COALESCE ((comment_id) :: BOOLEAN::INTEGER,0)
		= 1 
		
	)
	
)