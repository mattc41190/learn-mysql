-- Examples:

-- Cross Join
SELECT * FROM customers, orders;

-- Explicit Inner Join
SELECT * FROM customers INNER JOIN orders ON customers.id = orders.customer_id;

-- Left Join
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;

-- Right Join
SELECT * FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;

-- Setup

CREATE TABLE students(
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50)
);

CREATE TABLE papers(
  student_id INT,
  title VARCHAR(100),
  grade INT,
  FOREIGN KEY(student_id) REFERENCES students(id)
);


INSERT INTO students (first_name) VALUES
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



SELECT
  students.first_name,
  AVG(IFNULL(papers.grade, 0)) AS average_grade,
  CASE
    WHEN AVG(IFNULL(papers.grade, 0)) > 69 THEN 'Pass'
    ELSE 'Fail'
  END AS letter_grade
FROM students
  LEFT JOIN papers ON students.id = papers.student_id
  GROUP BY students.first_name
  ORDER BY average_grade DESC;











-- END
