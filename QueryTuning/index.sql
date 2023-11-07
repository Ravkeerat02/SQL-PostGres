EXPLAIN SELECT * 
FROM likes 
WHERE created_at < '2013-01-01'

-- used to create index
-- wont help with much in terms of performance
-- CREATE INDEX likes_created_at_idx ON likes(created_at);
-- used to find small and specific set in the data
CREATE INDEX likes_created_at_idx ON likes(created_at);


"Bitmap Heap Scan on likes  (cost=1200.94..6849.76 rows=64066 width=24)"
"  Recheck Cond: (created_at < '2013-01-01 00:00:00-05'::timestamp with time zone)"
"  ->  Bitmap Index Scan on likes_created_at_idx  (cost=0.00..1184.92 rows=64066 width=0)"
"        Index Cond: (created_at < '2013-01-01 00:00:00-05'::timestamp with time zone)"


-- creating index 
CREATE INDEX idx_lastname ON likes(lastname);
-- dropping index 
DROP INDEX idx_lastname;
-- or 
ALTER TABLE likes
DROP INDEX idx_lastname;