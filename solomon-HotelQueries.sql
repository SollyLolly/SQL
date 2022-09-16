USE HotelDB;

#1.Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.alter
SELECT R.Name, RM.RoomNumber, R.StartDate, R.EndDate
FROM Reservation R, Room RM
WHERE R.RoomID = RM.RoomID
AND MONTH(R.EndDate) = 7 and YEAR(R.EndDate) =2023;

#Walter Holaway, 204, 2023-07-13, 2023-07-14
#Bettyann Seery, 303, 2023-07-28, 2023-07-29
#Wilfred Vise, 401, 2023-07-18, 2023-07-21

#2.Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT R.Name, RM.RoomNumber, R.StartDate, R.EndDate
FROM Reservation R, Room RM, RoomAmenity RA
WHERE RA.RoomID = RM.RoomID
AND RM.RoomID = R.RoomID
AND RA.AmenityID = 4;

#Solomon Nuriyev, 201, 2023-01-19, 2023-01-20
#Karie Yang, 201, 2023-03-06, 2023-03-07
#Bettyann Seery, 203, 2023-02-05, 2023-02-10
#Karie Yang, 203, 2023-09-13, 2023-09-15
#Solomon Nuriyev, 205, 2023-09-19, 2023-09-20
#Wilfred Vise, 207, 2023-04-23, 2023-04-24
#Walter Holaway, 301, 2023-04-09, 2023-04-13
#Mack Simmer, 301, 2023-11-22, 2023-11-25
#Bettyann Seery, 303, 2023-07-28, 2023-07-29
#Duane Cullison, 305, 2023-02-22, 2023-02-24
#Bettyann Seery, 305, 2023-08-30, 2023-09-01

#3.Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)and
SELECT R.Name, RM.RoomNumber, R.StartDate, (R.Adults + R.Children) AS Total
FROM Reservation R, Room RM
WHERE R.RoomID = RM.RoomID
AND R.GuestID = 4;

#Duane Cullison, 305, 2023-02-22, 2
#Duane Cullison, 401, 2023-11-22, 4

#4.Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT R.RoomNumber, RV.ReservationID, RV.TotalCost
FROM Room R, Reservation RV
WHERE R.RoomID = RV.RoomID;

#201, 1, 199.99
#201, 5, 199.99
#202, 7, 349.98
#203, 3, 999.95
#203, 20, 399.98
#204, 15, 184.99
#205, 21, 699.96
#206, 12, 599.96
#206, 23, 449.97
#207, 10, 174.99
#208, 13, 599.96
#208, 19, 149.99
#301, 9, 799.96
#301, 24, 599.97
#302, 6, 924.95
#302, 25, 699.96
#303, 17, 199.99
#304, 14, 184.99
#305, 4, 349.98
#305, 18, 349.98
#308, 2, 299.98
#401, 11, 1199.97
#401, 16, 1259.97
#401, 22, 1199.97

#5.Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023
SELECT RM.*, (R.Adults + R.Children) AS TOTAL
FROM Reservation R, Room RM
WHERE R.RoomID = RM.RoomId
AND MONTH(R.StartDate) = 4 and YEAR(R.StartDate) = 2023
HAVING TOTAL >2;

#Query returns nothing

#6.Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT G.LastName, COUNT(R.ReservationID) AS TOTAL
FROM Guest G, Reservation R
WHERE G.GuestID = R.GuestID
GROUP BY G.LastName
ORDER BY TOTAL DESC;

#Simmer, 4
#Seery, 3
#Nuriyev, 2
#Cullison, 2
#Yang, 2
#Lipton, 2
#Holaway, 2
#Vise, 2
#Tilton, 2
#Tison, 2
#Luechtefeld, 1

#7.Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT G.FirstName, G.LastName, G.Address, G.Phone
FROM Guest G
WHERE G.Phone ='(123) 456-7899';

#Solomon, Nuriyev, 123 Street, (123) 456-7899
