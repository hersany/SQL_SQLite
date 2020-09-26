SELECT first_name, last_name, salary          -- single-row subqueires
FROM employees
WHERE salary > 
           ( SELECT salary
             FROM employees
 		    WHERE first_name = 'Rodney');        -- inner query works first. Then outer query work with inner's value.
-- 
SELECT first_name, last_name                  -- multiple-row subqueries
FROM employees
WHERE emp_id IN                               -- IN / NOT IN / ANY / ALL
      (SELECT emp_id
 	  FROM departments
 	  WHERE dept_name = 'Operations')
ORDER BY DESC
LIMIT 2;
-- 
SELECT COUNT (gender) AS count_male
FROM employees
WHERE gender = 'Male' and emp_id IN
     (SELECT emp_id
      FROM departments
      WHERE dept_name = 'Operations');
-- 
SELECT
     typeof('100'),
     typeof(100),
     typeof(10.0),
     typeof(x'1000'),
     typeof(NULL);
 
SELECT typeof(emp_id),
typeof(first_name),
typeof(hire_date)
FROM employees
LIMIT 1;
-- 
CREATE TABLE students 
          (student_id INTEGER PRIMARY KEY,
 		 first_name TEXT NOT NULL,
 		 last_name TEXT,
 		 final_score REAL)

CREATE TABLE parents
          (student_id INTEGER PRIMARY KEY,
 		 name_surname TEXT NOT NULL,
 		 FOREIGN KEY (student_id)
 		 REFERENCES students (student_id));

-- students table is parent table. parents table is child table.

INSERT INTO students (last_name, final_score)
VALUES ('Steven', 25.45);
-- 
Select*
From students;

ALTER TABLE parents
RENAME TO family;

ALTER TABLE family
ADD COLUMN city;

DROP TABLE family;

