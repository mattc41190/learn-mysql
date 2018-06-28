-- Get books with authors with a space in their last name
SELECT * FROM books WHERE author_lname LIKE '% %';

-- Get the top three lowest quantity books
SELECT title, released_year, stock_quantity AS quantity FROM books ORDER BY stock_quantity LIMIT 3;


-- Combine Skills
SELECT UPPER(CONCAT("MY FAVORITE AUTHOR IS ", author_fname, " ", author_lname, "!")) AS 'Yell!' 
  FROM books ORDER BY author_lname;
