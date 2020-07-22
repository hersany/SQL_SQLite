SELECT, UPDATE, DELETE, CREATE

SELECT

SELECT *

SELECT Title, FirstName, LastName
FROM employees;

SELECT DISTINCT City
FROM employees;

We can use AND, OR, NOT (NOT IN, NOT BETWEEN) operators with WHERE
=, <>, <, >, >=, <=

SELECT InvoiceDate
FROM invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2012-01-01'    -- BETWEEN is not inclusive for datetime. For others it is inclusive.
ORDER BY InvoiceDate DESC                                  -- default value is ASC for ORDER BY
LIMIT 1;

SELECT FirstName, LastName, Country
FROM customers
WHERE Country IN ('Belgium', 'Canada', 'USA', 'Norway');

% wildcard meet many items
_ wildcard meet one item

SELECT name, Composer
FROM tracks
WHERE Composer LIKE '%bach';

SELECT name, Composer
FROM tracks
WHERE Composer LIKE '_ohann _ebastian __ch';

COUNT MAX MIN SUM AVG

SELECT COUNT(Composer) AS Composers               --it doesn't count NULLs
FROM tracks;

SELECT COUNT(*)    -- it counts NULLs
FROM tracks;

SELECT COUNT(TrackId) AS Track_Numbers
FROM tracks;

SELECT COUNT(DISTINCT Composer) AS Composers_Of_Company             -- 'Composers Of Company'
FROM tracks;

SELECT MIN(Milliseconds) AS shortest_track_lenght, name, Composer
FROM tracks;

SELECT MIN(composer) AS alphabet_order
From tracks;

SELECT TrackId, MAX(Milliseconds) AS longest_track, name, Composer
FROM tracks;

SELECT MIN(Milliseconds) AS shortest, MAX(Milliseconds) AS longest   -- if we want to learn name/composer other infos with same line
FROM tracks;                                                            it is better to use nested query or GROUP BY.

SELECT SUM(total) AS amount_of_earn
FROM invoices;

SELECT AVG(Milliseconds) AS average_duration                 -- it ignores NULL values
FROM tracks;

SELECT name, TrackId  
FROM tracks
WHERE name LIKE '%love%'
ORDER BY TrackId DESC
LIMIT 5;

SELECT AlbumId, COUNT(Albumid)            -- firstly grouped then use aggregate function.
FROM tracks
GROUP BY AlbumId;                         -- we have to use group by value in select value.

SELECT composer, COUNT(*) AS TrackId      -- COUNT(TrackId) = COUNT(*)
FROM tracks
WHERE composer IS NOT NULL                -- IS NOT NULL, IS NULL are used for nulls values.
GROUP BY composer
ORDER BY TrackId DESC;

SELECT Country, City, COUNT(*) AS no_of_customers     -- City is not in count part we have to use it in group by.
FROM customers
GROUP BY Country, City                                -- we do double grouped like tuples.
ORDER BY no_of_customers DESC;

SELECT Country, COUNT(*) AS no_of_customers
FROM customers
GROUP BY Country
HAVING no_of_customers > 5                           -- HAVING clause it filtered the results. different from WHERE. 
ORDER BY no_of_customers DESC;                       -- HAVING can be used wtih GROUP BY. WHERE doesn't work with GROUP BY.

SELECT AlbumId, name, MIN(Milliseconds) AS Durations
FROM tracks
GROUP BY AlbumId
ORDER BY Durations;

SELECT BillingCountry, SUM(total) AS total_income
FROM invoices
GROUP BY BillingCountry
HAVING total_income > 100
ORDER BY total_income DESC;

SELECT 3 * 4 AS Multiply;

SELECT total, total * 1.08 AS inclusive_KDV FROM invoices;

JOIN

INNER JOIN

SELECT students.name, students.exam, students.score, tests.passing_score
FROM students
JOIN tests ON students.exam = tests.exam;          -- JOIN means INNER JOIN

SELECT t.TrackId, t.name, g.name
FROM tracks AS t
JOIN genres AS g ON t.GenreId = g.GenreId
ORDER BY t.TrackId; 

SELECT c.firstname, c.lastname, i.InvoiceDate, i.BillingCountry, i.total, i.InvoiceId
FROM customers AS c
JOIN invoices AS i ON c.CustomerId = i.CustomerId;
