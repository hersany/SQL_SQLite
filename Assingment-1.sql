--1

SELECT DISTINCT InvoiceId, CustomerId, total
FROM invoices
ORDER BY CustomerId ASC,
total DESC;

--2

SELECT DISTINCT InvoiceId, CustomerId, total
FROM invoices
ORDER BY total DESC,
CustomerId ASC;

--3. It comes first which one is written before. Firstly it sorted first column which is written before, then it sorted other column 
--within first column sorted rows.

--4

SELECT *
FROM invoices
WHERE total >= 10
LIMIT 10;

--5

SELECT *
FROM invoices
WHERE total < 10
LIMIT 5;

--6

SELECT name
FROM tracks
WHERE name LIKE 'B%s';

--7

SELECT *
FROM invoices
WHERE BillingCountry IN ('USA', 'Germany', 'Norway', 'Canada') AND
InvoiceDate BETWEEN '2010-01-01' AND '2011-01-01'
ORDER BY InvoiceDate DESC;