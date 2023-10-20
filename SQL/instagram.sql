Table users {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  username VARCHAR(30)
  bio VARCHAR(255)
  avatar VARCHAR(200)
  // storing user data
  phone VARCHAR(25)
  email VARCHAR(100)
  password VARCHAR(50)
  // checking status - online , offline , busy 
  status VARCHAR(15)
}

Table posts {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  url VARCHAR(200)
  user_id INTEGER [ref: > users.id]
  caption VARCHAR(255)
  // NUMERIC DATA TYPE WITH DECIMAL
  lat REAL 
  lng REAL
}

Table comments {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  contents VARCHAR(240)
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
}

Table Likes{
  id SERIAL [pk,increment]
  // USER ID - TO SEE THE LIIES
  created_at TIMESTAMP
  user_id INTEGER [ref: > users.id]
  comment_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > users.id]
}

// used for PHOTO tagging
Table photo_tags{
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  // no beed - but to track when it happned
  updated_at TIMESTAMP
  post_id INTEGER [ref: > posts.id]
  user_id INTEGER [ref: > users.id]
  // storing the location 
  x INTEGER
  y INTEGER
}

//USED FOR CAPTION 
Table caption_tags{
  id SERIAL [pk,increment]
  created_at TIMESTAMP
  post_id INTEGER [ref: > posts.id]
  user_id INTEGER [ref: > users.id]
}

Table hashtags{
  id SERIAL [pk,increment]
  created_at TIMESTAMP
  title VARCHAR(20)
}

Table hashtags_posts {
  id SERIAL [pk,increment]
  // joining to hashtag
  hashtag_id INTEGER [ref: > hashtags.id] 
  // joinign to post
  post_id INTEGER [ref: > posts.id]
}

// following - relation between user & follower
Table followers{
  id serial [pk, increment]
  created_at TIMESTAMP
  // DELETE THE ROW - WHEN SOMEONE UNFOLLOWED
  leader_id INTEGER [ref: > users.id]
  follower_id INTEGER [ref: > users.id]

}




