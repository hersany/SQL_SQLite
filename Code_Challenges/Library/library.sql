SELECT *
FROM Books

SELECT *
FROM Loans

SELECT *
FROM Patrons

-- Check book availability

SELECT

(SELECT count(*)
FROM Books
WHERE Title = 'Dracula')
-
(SELECT COUNT (DISTINCT l.BookID)
FROM Books AS b
JOIN Loans AS l
ON b.BookID = l.BookID
WHERE b.Title = 'Dracula' AND l.ReturnedDate ISNULL) 

AS AvailableBooks

-- Add new books to the library

INSERT INTO Books (Title, Author, Published, Barcode)
VALUES ('Dracula', 'Bram Stoker', 1897, 4819277482),
("Gulliver's Travels", 'Jonathan Swift', 1729, 4899254401)

-- Check out books

INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES ((SELECT BookID FROM Books WHERE Barcode = 2855934983),
(SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com'),
'2020-08-25', '2020-09-08'),
((SELECT BookID FROM Books WHERE Barcode = 4043822646),
(SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com'),
'2020-08-25', '2020-09-08')

-- Check for books due back

SELECT *
FROM Loans

SELECT Loans.DueDate, Books.Title, Patrons.Email, Patrons.FirstName
FROM Loans
JOIN Patrons
ON Loans.PatronID = Patrons.PatronID
JOIN Books
ON Loans.BookID = Books.BookID
WHERE DueDate = '2020-07-13'

-- Return books to the library

SELECT *
FROM Loans
WHERE BookID in (
SELECT BookID
FROM Books
WHERE Barcode in (6435968624, 5677520613, 8730298424)) and ReturnedDate ISNULL

UPDATE Loans
SET ReturnedDate = '2020-07-05'
WHERE LoanID in (SELECT LoanID
FROM Loans
WHERE BookID in (
SELECT BookID
FROM Books
WHERE Barcode in (6435968624, 5677520613, 8730298424)) and ReturnedDate ISNULL)

-- Encourage patrons to check out books

SELECT COUNT(Loans.LoanID) AS loancount, Patrons.FirstName, Patrons.Email
FROM Loans
JOIN Patrons
ON Loans.PatronID = Patrons.PatronID
GROUP BY Loans.PatronID
ORDER BY loancount
LIMIT 10

-- Find books to feature for an event

SELECT *
FROM Loans
JOIN Books
ON Loans.BookID = Books.BookID
WHERE Books.Published > 1889 and Books.Published < 1900 and Loans.ReturnedDate NOTNULL
GROUP BY Books.BookID

-- Book Statistics

SELECT COUNT(DISTINCT(Title)) as Quantity, Published
FROM Books
GROUP BY Published
ORDER BY Quantity DESC

SELECT COUNT(Loans.LoanID) as Quantity, Books.Title 
FROM Loans
JOIN Books
ON Loans.BookID = Books.BookID
GROUP BY Books.Title
ORDER BY Quantity DESC
LIMIT 5


