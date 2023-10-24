-- creatig indx for username - for which column
CREATE INDEX on users(username)

-- testing it - -- checking performance
EXPLAIN ANALYZE SELECT *
FROM users
WHERE username = 'Emil30'


-- printing the size
SELECT pg_size_pretty(pg_relation_size('users_username_idx'))

-- CREATE INDEX users_username_idx on users(username)

