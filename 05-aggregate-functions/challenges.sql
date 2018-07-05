SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT author_fname, author_lname, AVG(released_year) from books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS 'Author', pages from books ORDER BY pages DESC LIMIT 1;

SELECT
  released_year AS 'year',
  COUNT(*) AS 'Number of Books',
  AVG(pages) as 'Average Number of Pages'
FROM books GROUP BY released_year;
