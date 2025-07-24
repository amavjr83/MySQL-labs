1. Basic SELECT

SELECT * FROM Passengers;

Returns all columns and rows from the Passengers table.

2. SELECT Specific Columns

SELECT Name, DOB FROM Passengers;

Shows only the passenger name and date of birth.

3. WHERE Clause - Filter Prices

SELECT * FROM Tickets WHERE Price > 300;

Displays tickets that cost more than $300.

4. INNER JOIN: Ticket Info with Passenger & Flight

SELECT Passengers.Name, Flights.FlightID, Tickets.Price
FROM Tickets
JOIN Passengers ON Tickets.PassengerID = Passengers.PassengerID
JOIN Flights ON Tickets.FlightID = Flights.FlightID;

Combines tables to show who flew on which flight and what they paid.

5. JOIN with Flight Origins and Destinations

SELECT p.Name, f.Origin, f.Destination, t.Price
FROM Tickets t
JOIN Passengers p ON t.PassengerID = p.PassengerID
JOIN Flights f ON t.FlightID = f.FlightID;

Shows flight routes for each ticket purchase.

6. Filtering by Future Dates

SELECT * FROM Flights WHERE DepartureTime >= '2025-08-05';

Filters for flights scheduled on or after August 5, 2025.

7. Flights Departing from a Specific Airport

SELECT FlightID, DepartureTime FROM Flights WHERE Origin = 1;

Lists all flights that depart from Airport ID 1 (Atlanta).

8. Count of Tickets

SELECT COUNT(*) AS TotalTickets FROM Tickets;

Total number of tickets sold.

9. Average Ticket Price

SELECT AVG(Price) AS AveragePrice FROM Tickets;

Calculates the mean price of all tickets.

10. Average Price by Status

SELECT p.FrequentFlyerStatus, AVG(t.Price) AS AvgPrice
FROM Tickets t
JOIN Passengers p ON t.PassengerID = p.PassengerID
GROUP BY p.FrequentFlyerStatus;

Compares average ticket prices for each loyalty tier.

11. Flights by Destination Country

SELECT a.Country, COUNT(*) AS FlightsToCountry
FROM Flights f
JOIN Airports a ON f.Destination = a.AirportID
GROUP BY a.Country;

How many flights land in each country.

12. Unique Airline Countries

SELECT DISTINCT Country FROM Airlines;

Returns only the unique countries of the airlines.

13. Airline with Most Flights

SELECT AirlineID, COUNT(*) AS TotalFlights
FROM Flights
GROUP BY AirlineID
ORDER BY TotalFlights DESC
LIMIT 1;

Identifies the most active airline in your dataset.

14. Silver Status Passengers

SELECT * FROM Passengers WHERE FrequentFlyerStatus = 'Silver';

All passengers with "Silver" loyalty status.

15. Column Aliases

SELECT Name AS PassengerName, DOB AS BirthDate FROM Passengers;

Renames columns in the output for clarity.

16. Flight Duration in Minutes

SELECT FlightID, TIMESTAMPDIFF(MINUTE, DepartureTime, ArrivalTime) AS DurationMinutes
FROM Flights;

Calculates how long each flight lasts.

17. Top 5 Most Expensive Tickets

SELECT * FROM Tickets ORDER BY Price DESC LIMIT 5;

Shows the five most expensive tickets sold.

18. Flights Grouped by Day

SELECT DAYNAME(DepartureTime) AS DayOfWeek, COUNT(*) AS TotalFlights
FROM Flights
GROUP BY DayOfWeek;

Helps identify peak travel days of the week.

19. Passenger Count per Flight

SELECT FlightID, COUNT(*) AS NumPassengers
FROM Tickets
GROUP BY FlightID;

How many passengers are booked on each flight.

20. Flights with No Tickets Sold

SELECT f.FlightID
FROM Flights f
LEFT JOIN Tickets t ON f.FlightID = t.FlightID
WHERE t.TicketID IS NULL;

Detects any flights that currently have no passengers.
