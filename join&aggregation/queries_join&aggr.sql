-- displays the selected column
SELECT contents , username 
-- gets data from selected table
FROM COMMENTS
-- used to combine the data from content and username
JOIN users on users.id = comments.user_id


-- displays the selected column
SELECT contents , url  
-- gets data from selected table
FROM COMMENTS
-- used to combine the data from content and username
JOIN photos ON photos.id = comments.photo_id

-- Practice Joining Data
-- You are designing a database for a book publishing company.  The database needs to store a table of authors and books. An author has many books.  This means that books should have a foreign key column that references an author.

-- Write a query that will join together these two tables.  For each book, print the title of the book and the name of the author.

-- Table definitions of authors

-- +----+-----------------+
-- | id | name            |
-- +----+-----------------+
-- | 1  | JK Rowling      |
-- +----+-----------------+
-- | 2  | Stephen King    |
-- +----+-----------------+
-- | 3  | Agatha Christie |
-- +----+-----------------+
-- | 4  | Dr Seuss        |
-- +----+-----------------+
-- Table definition of books

-- +----+--------------------+-----------+
-- | id | title              | author_id |
-- +----+--------------------+-----------+
-- | 1  | It                 | 2         |
-- +----+--------------------+-----------+
-- | 2  | Chamber of Secrets | 1         |
-- +----+--------------------+-----------+
-- | 3  | Cat and the Hat    | 4         |
-- +----+--------------------+-----------+
-- | 4  | Affair at Styles   | 3         |
-- +----+--------------------+-----------+

-- SOLUTION 
SELECT title , name 
FROM books 
JOIN authors on authors_id = book.author_id