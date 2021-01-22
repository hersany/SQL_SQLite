-- FirstName, LastName, Email with alphabetical order by last name

SELECT FirstName, LastName, Email
FROM Customers
ORDER BY LastName

-- Create a basic table for CustomerID, PartySize

CREATE TABLE Attendees 
('CustomerID'INT,
'PartySize' INT
)

-- Create different menus

SELECT *
FROM Dishes
ORDER BY Price

SELECT *
FROM Dishes
WHERE Type in ('Appetizer', 'Beverage')
ORDER BY Type

SELECT *
FROM Dishes
WHERE Type <> 'Beverage'
ORDER BY Type

-- Insert new customers info. it creates unique CustomerID

INSERT INTO Customers (FirstName, LastName, Email, Address, City, State, Phone, Birthday)
VALUES('Anna', 'Smith', 'asmith@kinetecoinc.com', '479 Lapis Dr.', 'Memphis', 'TN', '(555) 555-1212', '1973-07-21')

SELECT *
FROM Customers
ORDER BY CustomerID DESC

-- Update customer address

SELECT * 
FROM Customers
WHERE FirstName = 'Taylor'

UPDATE Customers
SET Address = '74 Pine St.', City=  'New York', State = 'NY'
WHERE Address = '27170 6th Center'

-- Remove data from table

SELECT * 
FROM Customers
WHERE FirstName = 'Taylor'


DELETE FROM Customers
WHERE CustomerID = 4

-- Log customer response

SELECT * 
FROM Attendees

INSERT INTO Attendees (CustomerID, PartySize)
VALUES ((SELECT CustomerID FROM Customers WHERE Email = 'atapley2j@kinetecoinc.com'), 4) 

-- Look up reservations

SELECT *
FROM Reservations

SELECT c.FirstName, c.LastName, r.Date, r.PartySize
FROM Reservations AS r
JOIN Customers AS c
ON r.CustomerID = c.CustomerID
WHERE c.LastName like 'Ste%'

-- Take a reservation

SELECT *
FROM Reservations
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Sam' AND LastName = 'McAdams')

INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES('Sam', 'McAdams', 'smac@kinetecoinc.com', '(555) 555-1232')

INSERT INTO Reservations (CustomerID, Date, PartySize)
VALUES('102', '2020-06-14 18:00:00', '5')

-- Take a delivery order

SELECT *
FROM Customers

SELECT *
FROM Dishes

SELECT *
FROM Orders

SELECT *
FROM OrdersDishes

INSERT INTO Orders (CustomerID, OrderDate)
VALUES (...., '.........')

INSERT INTO OrdersDishes (OrderID, DıshID)
VALUES (...., (SELECT DishID FROM Dishes WHERE Name = 'Garden Buffet')),
(........, (SELECT DishID FROM Dishes WHERE Name = 'Parmesan Deviled Eggs'))

SELECT SUM(Price) AS TotalCost
FROM Dishes
WHERE DishID in (1, 6)

SELECT SUM(d.Price)
FROM Dishes AS d
JOIN OrdersDishes AS o 
ON d.DishID = o.DishID
WHERE o.DishID = 1001

-- Track your customer's favorite dishes

SELECT DishID
FROM Dishes
WHERE Name = 'Quinoa Salmon Salad'

SELECT FavoriteDish
FROM Customers
WHERE FirstName = 'Cleo'

UPDATE Customers
SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = 'Quinoa Salmon Salad')
WHERE CustomerID = (SELECT CustomerID FROM Customers WHERE FirstName = 'Cleo')

-- Prepare a report of your top five customers

SELECT *
FROM Customers

SELECT *
FROM Orders

SELECT  COUNT(Orders.OrderDate) AS QuantityOrders, Orders.CustomerID, Customers.FirstName, Customers.LastName, Customers.Email
FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Orders.CustomerID
ORDER BY QuantityOrders DESC
LIMIT 5
