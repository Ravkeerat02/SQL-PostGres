CREATE TABLE followers(
	id SERIAL PRIMARY KEY , 
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
-- 	trying to follow 
	leader_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE , 
	follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE ,
-- 	keeping them unique(different)
	UNIQUE(leader_id , follower_id)
);