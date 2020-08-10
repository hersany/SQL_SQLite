--LEFT JOIN

-- SELECT artists.name, albums.*
-- FROM artists
-- LEFT JOIN albums
-- ON artists.ArtistId = albums.ArtistId
-- WHERE albums.AlbumId NOT NULL
-- ORDER BY albums.AlbumId;

--Subqueries

--In Select Statement

-- SELECT SalesORderID, LineTotal,
-- (SELECT AVG(LineTotal)
--  FROM Sales.SalesOrderDetail) 
-- AS AverageLineTotal
-- FROM Sales.SalesOrderDetail

-- SELECT InvoiceId, BillingAddress, total,
--        (SELECT SUM(total)
-- 	       FROM invoices)
-- FROM invoices;

--In From Clause

-- SELECT sub.*
-- FROM (SELECT *
--       FROM tutorial_01
--       WHERE days = 'Friday') sub
-- WHERE sub.resolution = 'NONE'

--In Where Clause

-- SELECT TrackId, name, AlbumId
-- FROM tracks
-- WHERE AlbumId = (SELECT AlbumId
--                  FROM albums
-- 				 WHERE title = 'Faceless');

-- SELECT t.TrackId, t.name, t.AlbumId
-- FROM tracks AS t
-- JOIN albums AS a
-- ON t.AlbumId = a.AlbumId
-- WHERE a.title = 'Faceless';

-- SELECT TrackId, name, albumid
-- FROM tracks
-- WHERE albumid IN (SELECT AlbumId
--                   FROM albums
-- 				  WHERE title IN ('Faceless', 'Let There Be Rock'));
-- 				 
-- CREATE TABLE course_name
-- (course_id INT,
-- course_name TEXT,
-- grade REAL);

-- CREATE TABLE vacation_plan
-- (place_id INT,
-- country VARCHAR,
-- hotel_name TEXT,
-- employee_id INT,
-- vacation_length INT,
-- budget REAL);

-- DROP TABLE IF EXISTS vacation_plan;

-- INSERT INTO vacation_plan(place_id, country, hotel_name, employee_id, vacation_length, budget)
-- VALUES(001, 'Spain', 'Mare Magnum', 198, 7, 10080.80),
-- (002, 'France', 'Monaco Beach', 199, 5, 18230.50);

-- SELECT *
-- FROM vacation_plan;

-- INSERT INTO vacation_plan(place_id, country, hotel_name, employee_id, vacation_length, budget)
-- VALUES(003, 'Italy', 'Dream Island', 197, 7, 9980.80);

-- DELETE FROM vacation_plan
-- WHERE employee_id = 197;

-- DROP TABLE vacation_plan;

-- CREATE TABLE vacation_plan
-- (place_id INT PRIMARY KEY,
-- country VARCHAR,
-- hotel_name TEXT,
-- EmployeeId INT,
-- vacation_length INT,
-- budget REAL NOT NULL,
-- FOREIGN KEY(EmployeeId)
-- REFERENCES employees (EmployeeId));

-- ALTER TABLE vacation_plan
-- RENAME to road_plan;

-- ALTER TABLE road_plan
-- ADD city TEXT;

-- ALTER TABLE road_plan     -- it doesn't work at SQLite but works at MySQL.
-- DROP city;

-- ALTER TABLE road_plan      -- it doesn't work at SQLite but works at MySQL.
-- MODIFY COLUMN budget INT;