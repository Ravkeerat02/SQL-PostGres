-- CREATE TABLE orders(
-- 	id SERIAL PRIMARY KEY ,
-- 	name VARCHAR(50) NOT NULL , 
-- 	created_at TIMESTAMP NOT NULL,
-- 	est_delivery TIMESTAMP NOT NULL , 
-- 	CHECK(created_at < est_delivery)
-- )

INSERT into orders( name , created_at , est_delivery)
VALUES('Shirt', '2002-NOV-20 12:00PM', '2002-NOV-24 1:00AM')