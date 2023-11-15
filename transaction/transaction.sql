CREATE TABLE accounts(
	id SERIAL PRIMARY KEY , 
	name VARCHAR(20) NOT NULL, 
	balance INTEGER NOT NULL
);

INSERT INTO accounts(name , balance)
VALUES
	('Jane',100),
	('Jack',100);

SELECT * FROM accounts

UPDATE accounts 
SET balance = balance - 50 
WHERE name = 'Jane';

SELECT * FROM accounts

	
