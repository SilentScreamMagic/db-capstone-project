use littlelemondb;

create procedure addBooking(in bid int,in bdate date, in tnumber int,in custid int )
insert into bookings values(bid,bdate,tnumber,custid);

call addBooking(7,'2022-11-10',2,3);

delimiter //

create procedure updateBooking(in bid int, in bdate date )
begin
update bookings set bookingdate = bdate where bookingid = bid;
select concat("Booking ", bid," has been updated");
end//

delimiter ;

call updatebooking(7,'2022-11-12');

create procedure cancelBooking(in bid int )
delete from bookings where bookingid = bid;


call cancelbooking(7);