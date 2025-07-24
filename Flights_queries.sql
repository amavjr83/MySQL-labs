-- 1. Basic SELECT
SELECT *
  FROM Passengers
  ;

-- 2. SELECT Specific Columns
SELECT Name, DOB
  FROM Passengers
  ;

-- 3. Filtering with WHERE Clause
SELECT * FROM Tickets
  WHERE Price > 300
  ;

-- 4. INNER JOIN to Combine Tables
SELECT Passengers.Name, Flights.FlightID, Tickets.Price
FROM Tickets
JOIN Passengers ON Tickets.PassengerID = Passengers.PassengerID
JOIN Flights ON Tickets.FlightID = Flights.FlightID
  ;

-- 5. JOIN with Flight and Passenger Details
SELECT p.Name, f.Origin, f.Destination, t.Price
FROM Tickets t
JOIN Passengers p ON t.PassengerID = p.PassengerID
JOIN Flights f ON t.FlightID = f.FlightID
  ;

-- 6. Filtering Flights by Date
SELECT * FROM Flights 
  WHERE DepartureTime >= '2025-08-05'
  ;

-- 7. Flights Departing from a Specific Airport
SELECT FlightID, DepartureTime 
  FROM Flights 
  WHERE Origin = 1
  ;

-- 8. Counting Total Tickets Sold
SELECT COUNT(*) AS TotalTickets 
  FROM Tickets
  ;

-- 9. Calculating Average Ticket Price
SELECT AVG(Price) AS AveragePrice 
  FROM Tickets
  ;

-- 10. Average Ticket Price by Frequent Flyer Status
SELECT p.FrequentFlyerStatus, AVG(t.Price) AS AvgPrice
FROM Tickets t
JOIN Passengers p ON t.PassengerID = p.PassengerID
GROUP BY p.FrequentFlyerStatus
  ;

-- 11. Count of Flights by Destination Country
SELECT a.Country, COUNT(*) AS FlightsToCountry
FROM Flights f
JOIN Airports a ON f.Destination = a.AirportID
GROUP BY a.Country
  ;

-- 12. Using DISTINCT to Find Unique Values
SELECT DISTINCT Country FROM Airlines;

-- 13. Airline with the Most Flights
SELECT AirlineID, COUNT(*) AS TotalFlights
FROM Flights
GROUP BY AirlineID
ORDER BY TotalFlights DESC
LIMIT 1
  ;

-- 14. Selecting Passengers by Status
SELECT * FROM Passengers 
  WHERE FrequentFlyerStatus = 'Silver'
  ;

-- 15. Using ALIAS to Rename Columns
SELECT Name AS PassengerName, DOB AS BirthDate 
  FROM Passengers
  ;

-- 16. Calculating Flight Duration in Minutes (MySQL-specific)
SELECT FlightID, TIMESTAMPDIFF(MINUTE, DepartureTime, ArrivalTime) AS DurationMinutes
FROM Flights
  ;

-- 17. Top 5 Most Expensive Tickets
SELECT * FROM Tickets 
  ORDER BY Price DESC LIMIT 5
  ;

-- 18. Grouping Flights by Day of the Week
SELECT DAYNAME(DepartureTime) AS DayOfWeek, COUNT(*) AS TotalFlights
FROM Flights
GROUP BY DayOfWeek
  ;

-- 19. Number of Passengers per Flight
SELECT FlightID, COUNT(*) AS NumPassengers
FROM Tickets
GROUP BY FlightID
  ;

-- 20. Finding Flights with No Passengers
SELECT f.FlightID
FROM Flights f
LEFT JOIN Tickets t ON f.FlightID = t.FlightID
WHERE t.TicketID IS NULL
  ;
