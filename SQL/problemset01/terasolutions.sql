Problemset01   31-JUL-2018
roja.pilli@accenture.com

1.List full details of all hotels.
A) select * from hotel h inner join room r on h.hotel_no=r.hotel_no;
     H111|Empire Hotel|New York|313|H111|S|145.0
     H111|Empire Hotel|New York|412|H111|N|145.0
     H235|Park Place|New York|1267|H235|N|175.0
     H235|Park Place|New York|1289|H235|N|195.0
     H432|Brownstone Hotel|Tornoto|876|H432|S|124.0
     H432|Brownstone Hotel|Tornoto|898|H432|S|124.0
     H498|James Plaza|Tornoto|345|H498|N|160.0
    H498|James Plaza|Tornoto|467|H498|N|180.0
    H193|Devon Hotel|Boston|1001|H193|S|150.0
    H193|Devon Hotel|Boston|1201|H193|N|175.0
    H437|Clairmont Hotel|Boston|257|H437|N|140.0
    H437|Clairmont Hotel|Boston|223|H437|N|155.0

2.List full details of all hotels in New York.
A) select * from hotel h inner join room r on h.hotel_no=r.hotel_no where city='New York';
  H111|Empire Hotel|New York|313|H111|S|145.0
  H111|Empire Hotel|New York|412|H111|N|145.0
  H235|Park Place|New York|1267|H235|N|175.0
  H235|Park Place|New York|1289|H235|N|195.0

3.List the names and cities of all guests, ordered according to their cities.
A) select * from guest order by city;
    G467|Robert Swift|Atlanta
    G367|Tara Cummings|Baltimore
    G190|Edward Cane|Baltimore
    G230|Tom Hancock|Philadelphia
    G256|Adam Wayne|Pittsburgh
    G879|Vanessa Parry|Pittsburgh

4.List all details for non-smoking rooms in ascending order of price.
A) select * from room where type='N' order by price;
      257|H437|N|140.0
      412|H111|N|145.0
      223|H437|N|155.0
      345|H498|N|160.0
      1267|H235|N|175.0
      1201|H193|N|175.0
      467|H498|N|180.0
      1289|H235|N|195.0

5.List the number of hotels there are.
A)select count(*) from hotel;
   6

6.List the cities in which guests live. Each city should be listed only once.
A) select distinct city from guest;
    Pittsburgh
    Baltimore
    Philadelphia
    Atlanta

 
7.List the average price of a room.
A)  select hotel_no,avg(price) from room group by hotel_no;
    H111|145.0
    H193|162.5
    H235|185.0
    H432|124.0
    H437|147.5
    H498|170.0

8.List hotel names, their room numbers, and the type of that room.
A) select h.name,r.room_no,r.type from hotel h inner join room r on h.hotel_no=r.hotel_no;
      Empire Hotel|313|S
      Empire Hotel|412|N
      Park Place|1267|N
      Park Place|1289|N
      Brownstone Hotel|876|S
      Brownstone Hotel|898|S
      James Plaza|345|N
      James Plaza|467|N
      Devon Hotel|1001|S
      Devon Hotel|1201|N
      Clairmont Hotel|257|N
      Clairmont Hotel|223|N

9.List the hotel names, booking dates, and room numbers for all hotels in New York.
A)select h.name,b.date_from,b.date_to,b.room_no from hotel h inner join booking b on
   h.hotel_no=b.hotel_no inner join room r on b.room_no=r.room_no where h.city='New York';
      Empire Hotel|1999-08-10|412
      Empire Hotel|1999-08-18|412
      Park Place|1999-09-05|1267

10.What is the number of bookings that started in the month of September?
A)select count(*) from Booking where Date_From between '1999-09-01' and '1999-09-30';
     4

11.List the names and cities of guests who began a stay in New York in August.
A) select g.Name,g.City from Guest g inner join Booking b on g.Guest_No=b.Guest_No where b.Hotel_No in(select Hotel_No from Hotel where City='New York')and b.Date_From between '1999-08-01' and '1999-08-31';
    Adam Wayne|Pittsburgh
    Tara Cummings|Baltimore

12.List the hotel names and room numbers of any hotel rooms that have not been    booked.
A)select h.name,r.room_no from hotel h inner join room r on h.hotel_no=r.hotel_no where r.room_no not in(select room_no from booking);
      Clairmont Hotel|257
      Empire Hotel|313
      Brownstone Hotel|876
      Brownstone Hotel|898
      Park Place|1289

13.List the hotel name and city of the hotel with the highest priced room.
A) select h.name,h.city,max(price) from hotel h inner join room r on h.hotel_no=r.hotel_no order by r.price;
      Park Place|New York|195.0

14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.
A) select h.name,r.room_no,h.city,r.price from hotel h inner join room r on h.hotel_no=r.hotel_no where r.price<(select min(r.price) from room r inner join hotel h on h.hotel_no=r.hotel_no  where city='Boston');
    Brownstone Hotel|876|Tornoto|124.0
    Brownstone Hotel|898|Tornoto|124.0

15.List the average price of a room grouped by city.
A) select avg(r.price),r.room_no,h.city from room r inner join hotel h on h.hotel_no=r.hotel_no group by city;
     155.0|223|Boston
     165.0|1289|New York
     147.0|467|Tornoto









