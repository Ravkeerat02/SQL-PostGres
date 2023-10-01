-- Three Way Exercise
-- Hmmm...I wonder if any authors are writing their own reviews for books! You are working with a database of books, authors, and reviews

-- Write a query that will return the title of each book, along with the name of the author, and the rating of a review.  Only show rows where the author of the book is also the author of the review.

-- Table of authors

-- +----+-----------------+
-- | id | name            |
-- +----+-----------------+
-- | 1  | Stephen King    |
-- +----+-----------------+
-- | 2  | Agatha Christie |
-- +----+-----------------+
-- | 3  | JK Rowling      |
-- +----+-----------------+
-- Table of books

-- +----+---------------------+-----------+
-- | id | title               | author_id |
-- +----+---------------------+-----------+
-- | 1  | The Dark Tower      | 1         |
-- +----+---------------------+-----------+
-- | 2  | Affair At Styles    | 2         |
-- +----+---------------------+-----------+
-- | 3  | Chamber of Secrets  | 3         |
-- +----+---------------------+-----------+
-- Table of reviews

-- +----+--------+-------------+---------+
-- | id | rating | reviewer_id | book_id |
-- +----+--------+-------------+---------+
-- | 1  | 3      | 1           | 2       |
-- +----+--------+-------------+---------+
-- | 2  | 4      | 2           | 1       |
-- +----+--------+-------------+---------+
-- | 3  | 5      | 3           | 3       |
-- +----+--------+-------------+---------+

-- selects the column to display
SELECT books.title, authors.name, reviews.rating
-- selects the tables to pull data from
FROM reviews
-- joins the books table to the reviews table
JOIN books ON books.id = reviews.book_id
-- joins the authors table to the books table
JOIN authors ON authors.id = books.author_id AND authors.id = reviews.reviewer_id
