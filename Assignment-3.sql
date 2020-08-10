--Single-Row Subquries:
--1
SELECT TrackId, Name, Milliseconds
FROM tracks
WHERE Milliseconds = (SELECT MAX(Milliseconds)
                      FROM tracks);
				
--2
SELECT TrackId, Name, Milliseconds
FROM tracks
WHERE Milliseconds = (SELECT MIN(Milliseconds)
                      FROM tracks);
					  
--3
SELECT TrackId, name, Bytes, (SELECT AVG(Bytes)
                              FROM tracks) as Average_Bytes
FROM tracks
WHERE bytes > (SELECT AVG(Bytes)
               FROM tracks)
ORDER BY bytes DESC;

--Multiple-Row Subqueries:
--1
SELECT CustomerId, FirstName, LastName
FROM customers
WHERE SupportRepId IN (SELECT EmployeeId
                       FROM employees
					   WHERE FirstName IN ('Jane', 'Margaret')
					   AND LastName IN ('Peacock', 'Park'));

--2
SELECT c.CustomerId, c.FirstName, c.LastName
FROM customers AS c
JOIN employees AS e
ON c.SupportRepId = e.EmployeeId
WHERE e.FirstName IN ('Jane', 'Margaret')
AND e.LastName IN ('Peacock', 'Park');

--DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements
--1
CREATE TABLE courses
(CourseId INT PRIMARY KEY,
CourseName TEXT NOT NULL,
EmployeeId INTEGER,
CoursePrice NUMERIC,
FOREIGN KEY (EmployeeId)
REFERENCES employees (EmployeeId));


--2
INSERT INTO courses (CourseId, CourseName, EmployeeId, CoursePrice)
VALUES (101, 'Data', 1, 200.5),
(102, 'English', 3, 385),
(103, 'Spanish', 3, 390),
(107, 'Customer Relations', 4, 150),
(110, 'Relations', 3, 150),
(104, 'Invoice Types', 5, 120.8),
(105, 'Management', 1, 167.2),
(106, 'Data Types', 6, 180.7),
(108, 'IT Basic', 7, 120),
(109, 'IT Plus', 8, 180);

--3
DELETE FROM courses
WHERE CourseId = 109;

--4
ALTER TABLE courses
ADD StartDate datetime NOT NULL DEFAULT '2008-01-01';

--5
ALTER TABLE courses
DROP CoursePrice;

--6
DROP TABLE courses;

