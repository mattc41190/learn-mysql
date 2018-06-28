# MySQL Notes


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

Distinct: Getting unique values only

`SELECT DISTINCT author_lname FROM books;`

Order By: Organize results Alpha Numerically (ASC) Pass DESC to reverse

`SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC;`

Limit: Limit number of rwo returned (`LIMIT 5, 10` Can also defined a range)

`SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC LIMT 5;`

Like: We can use `LIKE` to get close to a result. Note the use of the wildcard `%`

`SELECT * FROM books WHERE title LIKE '%the%';`

Wildcards & Escapes:

`%` - For Anything

`_`  - For Length

`\` - For Escapes


## FAQ / Random Wants:

- I want to interact with MySQL from the Shell:

`cd /usr/local/mysql/bin && sudo ./mysql --p`

- I want to use my regular user to access MySQL from Shell:
