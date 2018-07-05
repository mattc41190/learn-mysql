-- Questions: 0, 1, 1

SELECT * FROM books WHERE released_year > 1980;

SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books WHERE SUBSTR(author_lname, 1, 1) in ('S', 'C');

SELECT author_lname,
  CASE
    WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' Books')
    ELSE CONCAT(COUNT(*), ' Book')
  END AS 'Count'
FROM books GROUP BY author_lname, author_fname;
