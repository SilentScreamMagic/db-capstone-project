use littlelemondb;

delimiter //
create procedure addBooking(in bid int,in bdate date, in tnumber int,in custid int )
begin
insert into bookings values(bid,bdate,tnumber,custid);
select "Booking has been added";
end //

delimiter ;

call addBooking(7,'2022-11-10',2,3);

delimiter //

create procedure updateBooking(in bid int, in bdate date )
begin
update bookings set bookingdate = bdate where bookingid = bid;
select concat("Booking ", bid," has been updated");
end//

delimiter ;

call updatebooking(7,'2022-11-12');

delimiter //

create procedure cancelBooking(in bid int )
begin
delete from bookings where bookingid = bid;
select concat("Booking ", bid," has been cancelled");
end//

delimiter ;

call cancelbooking(7);