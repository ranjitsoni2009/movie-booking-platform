USE db_mbp;

-- Optional but needed for Seats because the schema references SeatType
INSERT INTO SeatType (id, seatType) VALUES
(1, 'VIP'),
(2, 'Regular');

INSERT INTO Cities (id, name, pincode) VALUES
(1, 'Delhi', '110001'),
(2, 'Mumbai', '400001'),
(3, 'Bangalore', '560001');

INSERT INTO Theatres (id, name, address, company) VALUES
(1, 'PVR Cinemas', 'Connaught Place, Delhi', 'PVR'),
(2, 'INOX', 'Bandra, Mumbai', 'INOX'),
(3, 'Cinepolis', 'Koramangala, Bangalore', 'Cinepolis');

INSERT INTO Screens (id, screenName, theatreId) VALUES
(1, 'Screen 1', 1),
(2, 'Screen 2', 1),
(3, 'Screen 1', 2),
(4, 'Screen 1', 3);

INSERT INTO Seats (id, seatName, seatType) VALUES
(1, 'A1', 1),
(2, 'A2', 1),
(3, 'A3', 2),
(4, 'A4', 2),
(5, 'B1', 1),
(6, 'B2', 2),
(7, 'B3', 2),
(8, 'B4', 1);

INSERT INTO Movies (id, movieName, director, producer, leadActor, leadActress, releaseDate) VALUES
(1, 'Inception', 'Christopher Nolan', 'Emma Thomas', 'Leonardo DiCaprio', 'Marion Cotillard', '2010-07-16'),
(2, 'Dangal', 'Nitesh Tiwari', 'Aamir Khan', 'Aamir Khan', 'Sakshi Tanwar', '2016-12-23'),
(3, 'RRR', 'S. S. Rajamouli', 'DVV Danayya', 'N. T. Rama Rao Jr.', 'Ram Charan', '2022-03-25');

INSERT INTO Users (id, firstName, lastName, email, mobile, city, pincode) VALUES
(1, 'Aarav', 'Sharma', 'aarav@example.com', '9876543210', 'Delhi', '110001'),
(2, 'Meera', 'Patel', 'meera@example.com', '9123456780', 'Mumbai', '400001'),
(3, 'Rohan', 'Iyer', 'rohan@example.com', '9988776655', 'Bangalore', '560001');

INSERT INTO Features (id, feature, featureType) VALUES
(1, 'IMAX', 'Screen'),
(2, '3D', 'Screen'),
(3, 'Dolby Atmos', 'Audio');

INSERT INTO ScreenFeatures_Mapping (id, screenId, featureId) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 1),
(5, 4, 3);

INSERT INTO ScreenSeats_Mapping (id, screenId, seatId) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 3, 1),
(10, 3, 2),
(11, 3, 3),
(12, 3, 4),
(13, 4, 5),
(14, 4, 6),
(15, 4, 7),
(16, 4, 8);

INSERT INTO Shows (id, startTime, endTime, showLength, showStatus, movieId) VALUES
(1, '2026-07-02 18:30:00', '2026-07-02 20:45:00', '135 mins', 1, 1),
(2, '2026-07-02 21:00:00', '2026-07-02 23:15:00', '135 mins', 1, 1),
(3, '2026-07-03 14:00:00', '2026-07-03 16:20:00', '140 mins', 1, 2),
(4, '2026-07-03 19:30:00', '2026-07-03 22:10:00', '160 mins', 1, 3);

INSERT INTO ShowScreenSeats_Mapping (id, showId, screenSeatsId, status, bookingId) VALUES
(1, 1, 1, 'Available', NULL),
(2, 1, 2, 'Available', NULL),
(3, 1, 3, 'Available', NULL),
(4, 1, 4, 'Available', NULL),
(5, 2, 5, 'Available', NULL),
(6, 2, 6, 'Available', NULL),
(7, 3, 9, 'Available', NULL),
(8, 3, 10, 'Available', NULL),
(9, 4, 13, 'Available', NULL),
(10, 4, 14, 'Available', NULL);

INSERT INTO MovieFeatures_Mapping (id, movieId, featureId) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 1),
(5, 3, 3);

INSERT INTO CityTheatres_Mapping (id, cityId, theatreId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO ShowTicketPrices (id, showId, seatTypeId, ticketPrice) VALUES
(1, 1, 1, 400),
(2, 1, 2, 250),
(3, 2, 1, 400),
(4, 2, 2, 250),
(5, 3, 1, 350),
(6, 3, 2, 220),
(7, 4, 1, 450),
(8, 4, 2, 280);

INSERT INTO Genres (id, genreName, description) VALUES
(1, 'Sci-Fi', 'Futuristic and imaginative stories'),
(2, 'Sports', 'Stories centered around sports'),
(3, 'Action', 'High-energy action drama');

INSERT INTO Casts (id, actorName, role, bio) VALUES
(1, 'Leonardo DiCaprio', 'Lead Actor', 'Academy Award-winning actor'),
(2, 'Aamir Khan', 'Lead Actor', 'Renowned Indian actor and producer'),
(3, 'N. T. Rama Rao Jr.', 'Lead Actor', 'Prominent Telugu film actor');

INSERT INTO MovieCasts_Mapping (id, movieId, castId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO MovieGenres_Mapping (id, movieId, genreId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

