CREATE TABLE posts (
    id SERIAL PRIMARY KEY, 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    url VARCHAR(200) NOT NULL, -- URL of the post
    caption VARCHAR(240),       -- Caption for the post
    lat REAL,                   -- Latitude of the post location
    lng REAL,                   -- Longitude of the post location
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, -- User ID who created the post
    CHECK (lat IS NULL OR (lat >= -90 AND lat <= 90)), -- Check latitude range (-90 to 90)
    CHECK (lng IS NULL OR (lng >= -180 AND lng <= 180)) -- Check longitude range (-180 to 180)
);
