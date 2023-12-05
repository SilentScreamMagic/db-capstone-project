use littlelemondb;

insert into person values 
(1,"John","Doh"),
(2,"Jane","Soh"),
(3,"Jess","Toh");

insert into customer values 
(1,"0244123456",1),
(2,"0244128476",2),
(3,"0244925426",3);

insert into bookings values
("1",'2022-10-10',5,1),
("2",'2022-11-12',3,3),
("3",'2022-10-11',2,2),
("4",'2022-10-13',2,1);



Delimiter //
create procedure CheckBooking(in bdate date, in tnumber int,out result int)
begin
set result = (select count(bookingid) from bookings where bookingDate=bdate and tableNumber=tnumber);
select if(result > 0,concat("Table ",tnumber," is already booked"), concat("Table ",tnumber," is available")) As 'Table Availability';
end//
delimiter ;

set @val = 0;
call CheckBooking('2022-10-10',5,@val);

delimiter //
create procedure AddValidBooking(in bid int,in bdate date, in tnumber int,in custid int)
begin
start transaction;
insert into bookings value (bid,bdate,tnumber,custid);
set @val =0; 
call CheckBooking(bdate,tnumber,@val);
if @val > 1
  then 
	select concat("Table ",tnumber," is already booked. Booking Cancelled") As 'Booking Status';
    rollback;
  else 
	select concat("Your booking for Table ",tnumber," was successful ") As 'Booking Status';
    commit;
end if ;

end//
delimiter ;

call AddValidBooking(6,'2022-10-10',4,3);

