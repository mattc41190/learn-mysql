# mysql-learn-fundamentals


## Install Help:
- https://vladster.net/en/instructions/install-mysql-mac/
- https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7049010?start=0

## Queries:

### Database Fundamentals

- Create a Database:

`CREATE DATABASE <name>;`

- Drop / Delete a Database:

`DROP DATABASE <name>;`

- Use specific Database:

`USE <name>;`

- See current Database:

`SELECT database();`

- Create table in a database:

`CREATE TABLE <table>(name VARCHAR(100), age INT);`

- Show tables in Database:

`SHOW TABLES;`

- Show columns in a particular table:

`SHOW COLUMNS FROM <table>;`
`DESC<table>;`

- Delete / Drop a table

`DROP TABLE <table>`

- Insert a row into a table:

`INSERT INTO <table>(col_a, col_b) VALUES ('val_1', 0) [,('optionally', 0); -- col_a is a varchar(100) col_b is an int`

- Show Warning For Previous Command:

`SHOW WARNINGS;`

- Set a column to not be nullable:

`CREATE TABLE <table>(name VARCHAR(25) NOT NULL)`

- Set a column to have a default value:

`CREATE TABLE <table>(name VARCHAR(25) DEFAULT 'Anonymous User')`

- Set a column to have a default value and not be nullable:

`CREATE TABLE <table>(name VARCHAR(25) NOT NULL DEFAULT 'Anonymous User')`

- Set a column as the Primary Key for a table:

`CREATE TABLE <table>(id INT NOT NULL, name VARCHAR(25) NOT NULL DEFAULT 'Anonymous User', PRIMARY KEY(id))>`

- Set a column as the Auto Incrementing Primary Key for a table:

`CREATE TABLE <table>(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(50) NOT NULL, PRIMARY KEY(id))>`

### CRUD Commands:

#### Read Commands:

- Get all columns for a particular table:

`SELECT * FROM <table>;`

- Get specified columns for a particular table:

`SELECT id, name FROM <table>;`

- Get columns for a particular table where the data matches an expression:

`SELECT * FROM <table> WHERE <expression>; -- Example: "WHERE name='Matt'" `

- Get columns for a particular table and alias the result columns:

`SELECT <REAL_NAME> AS <ALIAS> FROM <table>;`

#### Update Commands:

- Update values for a particular table where an expression criteria is met:

`UPDATE cats SET breed='Short Hair' WHERE breed='tabby';`

#### Delete Commands:

- Delete rows that match a WHERE clause:

`DELETE FROM <table> WHERE <expression>;`

### String Functions

- Concat: Bring multiple strings together

`SELECT CONCAT (author_fname, ' ', author_lname) AS full_name from books;`
`SELECT CONCAT(SUBSTRING(title, 1,10), '...') AS 'Short Title' FROM books;`

- Replace: Replaces a specified char set with a specified replace set

`SELECT REPLACE(title, 'e', '3') FROM books;`

- Char Length: Get's Number of Character in Columns

`SELECT author_lname, CHAR_LENGTH(author_lname) AS len FROM books;`

### Advanced Selects

- Distinct: Getting unique values only

`SELECT DISTINCT author_lname FROM books;`

- Order By: Organize results Alpha Numerically (ASC) Pass DESC to reverse

`SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC;`

- Limit: Limit number of rwo returned (`LIMIT 5, 10` Can also defined a range)

`SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC LIMT 5;`

- Like: We can use `LIKE` to get close to a result. Note the use of the wildcard `%`

`SELECT * FROM books WHERE title LIKE '%the%';`

- Wildcards & Escapes:

`%` - For Anything

`_`  - For Length

`\` - For Escapes

### Aggregate Functions

- Count: Counts what you ask it to count:

`SELECT COUNT(*) AS NUMBER_OF_BOOKS from books;`
`SELECT COUNT(DISTINCT(author_lname)) AS NUMBER_OF_BOOKS from books;`
`SELECT COUNT(*) AS 'Books With "the"' from books WHERE title LIKE '%the%';`

- Group By: Create rows of logically grouped entities:

__NOTE: When Count is combined with other columns it must use GROUP BY__

`SELECT author_fname, author_lname, COUNT(*) AS 'Count' FROM books GROUP BY author_lname, author_fname;`

- Min and Max: Find Minimum and Maximum Values

`SELECT MIN [or MAX](released_year) FROM books;`

`SELECT MAX(CHAR_LENGTH(title)) FROM books;`

- Sub-Queries: Run a query in a qualifier expression to limit result set

__NOTE: Advanced Queries__

`SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);`

`SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;`

`SELECT title, pages FROM books WHERE CHAR_LENGTH(title) = (SELECT MAX(CHAR_LENGTH(title)) FROM books);`

- Min / Max with Group By:

`SELECT CONCAT(author_fname, ' ', author_lname) AS Author, MIN(released_year) AS 'Earleiest Release Year' FROM books GROUP BY author_lname, author_fname;`

- Sum

`SELECT SUM(pages) FROM books;`

`SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_fname, author_lname;`

- Average

`SELECT AVG(pages) FROM books;`

`SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;`

### Logical Operators

- Not

`SELECT * FROM <table> WHERE <column> != value;`

- Greater Than ">"

`SELECT * FROM <table> WHERE <column> > value;`

- Less Than "<"

`SELECT * FROM <table> WHERE <column> < value;`

- "AND" or "&&"

`SELECT * FROM <table> WHERE <column> < value AND <column> = other_value;`

- "OR" or "||"

`SELECT * FROM <table> WHERE <column> < value OR <column> = other_value;`

- Between / Not Between

`SELECT * FROM <table> WHERE <column> BETWEEN value_a AND value_b;`

- In / Not In

`SELECT * FROM <table> WHERE <column> IN (value_a, value_b, value_c);`

- Case

`SELECT title, CASE WHEN released_year >= 2000 THEN 'Modern Lit' ELSE 'Early Lit' END AS genre FROM books;`

### Joins

- Cross Joins
`SELECT * FROM <t1>, <t2>;`

- Implicit Inner Join

`SELECT * FROM <t1>, <t2> WHERE t1.col =  t2.col;`

- Explicit Inner Join

`SELECT * FROM <t1> JOIN <t2> ON t1.col = t2.col;`

- Left Join: Everything From Left (Only Matching From Right)

`SELECT first_name, last_name, IFNULL(SUM(orders.amount), 0) AS total_spent FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id ORDER BY total_spent DESC;`

Right Join: Everything From Right (Only matching from left)

## FAQ / Random Wants:

- I want to interact with MySQL from the Shell:

`cd /usr/local/mysql/bin && sudo ./mysql --p`

- I want to format dates

`select name, date_format(birthdt, '%M : %D : %Y') from <people>;`

- I want to use my regular user to access MySQL from Shell:
