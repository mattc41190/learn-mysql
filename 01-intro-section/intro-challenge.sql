-- GRADE = A
CREATE TABLE employees(
  id INT NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50),
  age INT NOT NULL,
  current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
  PRIMARY KEY(id)
);
