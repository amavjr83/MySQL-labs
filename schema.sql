-- Step 1: Create the database (only if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS FlightDB;

-- Step 2: Use the database
USE FlightDB;

-- Step 3: Drop tables if they already exist to avoid errors during creation
DROP TABLE IF EXISTS Tickets;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS Airlines;
DROP TABLE IF EXISTS Airports;

-- Step 4: Create tables

CREATE TABLE Airports (
    AirportID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Origin INT,
    Destination INT,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    AirlineID INT,
    FOREIGN KEY (Origin) REFERENCES Airports(AirportID),
    FOREIGN KEY (Destination) REFERENCES Airports(AirportID),
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    FrequentFlyerStatus VARCHAR(50)
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- Step 5: Insert data

-- Airports
INSERT INTO Airports (AirportID, Name, Location, Country) VALUES
(1, 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta, GA', 'USA'),
(2, 'Los Angeles International Airport', 'Los Angeles, CA', 'USA'),
(3, 'Chicago O\'Hare International Airport', 'Chicago, IL', 'USA'),
(4, 'Dallas/Fort Worth International Airport', 'Dallas, TX', 'USA'),
(5, 'Denver International Airport', 'Denver, CO', 'USA');

-- Airlines
INSERT INTO Airlines (AirlineID, Name, Country) VALUES
(1, 'American Airlines', 'USA'),
(2, 'Delta Air Lines', 'USA'),
(3, 'United Airlines', 'USA'),
(4, 'Southwest Airlines', 'USA'),
(5, 'JetBlue Airways', 'USA');

-- Flights
INSERT INTO Flights (FlightID, Origin, Destination, DepartureTime, ArrivalTime, AirlineID) VALUES
(101, 1, 2, '2025-08-01 06:00', '2025-08-01 08:00', 1),
(102, 2, 3, '2025-08-02 09:00', '2025-08-02 12:00', 2),
(103, 3, 4, '2025-08-03 13:00', '2025-08-03 16:00', 3),
(104, 4, 5, '2025-08-04 07:00', '2025-08-04 09:30', 4),
(105, 5, 1, '2025-08-05 14:00', '2025-08-05 16:00', 5),
(106, 1, 3, '2025-08-06 06:30', '2025-08-06 09:00', 1),
(107, 2, 4, '2025-08-07 10:00', '2025-08-07 13:30', 2),
(108, 3, 5, '2025-08-08 11:00', '2025-08-08 13:00', 3),
(109, 4, 2, '2025-08-09 15:00', '2025-08-09 17:00', 4),
(110, 5, 3, '2025-08-10 08:30', '2025-08-10 10:30', 5);

-- Passengers (diverse names: American, Chinese, Latino)
INSERT INTO Passengers (PassengerID, Name, DOB, FrequentFlyerStatus) VALUES
(201, 'James Miller', '1985-06-15', 'Gold'),
(202, 'Ana Martinez', '1990-09-21', 'Silver'),
(203, 'Wei Zhang', '1995-12-11', 'Platinum'),
(204, 'Emily Johnson', '1988-03-19', 'None'),
(205, 'Carlos Ramirez', '1992-07-02', 'Gold'),
(206, 'Linda Nguyen', '2000-05-23', 'None'),
(207, 'Robert Chen', '1983-10-12', 'Silver'),
(208, 'Sofia Garcia', '1991-01-29', 'Gold'),
(209, 'Michael Lee', '1994-04-18', 'None'),
(210, 'Isabella Rivera', '1987-08-30', 'Platinum'),
(211, 'Kevin Lopez', '1996-06-05', 'Silver'),
(212, 'Grace Lin', '1989-11-25', 'None'),
(213, 'Daniel Gonzalez', '1993-03-17', 'Gold'),
(214, 'Jasmine Wang', '1998-09-09', 'Silver'),
(215, 'Matthew Harris', '1986-12-01', 'Platinum'),
(216, 'Natalie Flores', '1997-07-27', 'None'),
(217, 'Jason Wu', '1984-02-13', 'Gold'),
(218, 'Andrea Torres', '1990-10-03', 'Silver'),
(219, 'Brian Huang', '1999-01-14', 'None'),
(220, 'Alexa Chavez', '1992-05-09', 'Gold'),
(221, 'Steven Yang', '1985-03-20', 'Silver'),
(222, 'Jessica Ramos', '1993-06-22', 'None'),
(223, 'Nathaniel Moore', '1991-04-07', 'Platinum'),
(224, 'Luisa Delgado', '1994-12-19', 'Gold'),
(225, 'Eric Martinez', '1995-08-11', 'Silver');

-- Step 6: Insert Tickets

INSERT INTO Tickets (TicketID, PassengerID, FlightID, Price) VALUES
(301, 201, 101, 250.00),
(302, 202, 102, 340.00),
(303, 203, 103, 280.50),
(304, 204, 104, 310.00),
(305, 205, 105, 200.00),
(306, 206, 106, 275.75),
(307, 207, 107, 360.00),
(308, 208, 108, 290.20),
(309, 209, 109, 310.00),
(310, 210, 110, 220.00),
(311, 211, 101, 260.00),
(312, 212, 102, 345.00),
(313, 213, 103, 278.00),
(314, 214, 104, 305.00),
(315, 215, 105, 215.50),
(316, 216, 106, 268.75),
(317, 217, 107, 355.00),
(318, 218, 108, 298.90),
(319, 219, 109, 312.00),
(320, 220, 110, 225.00),
(321, 221, 101, 252.00),
(322, 222, 102, 342.00),
(323, 223, 103, 282.00),
(324, 224, 104, 315.00),
(325, 225, 105, 218.00);
