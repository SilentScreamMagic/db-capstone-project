use littlelemondb;
create view OrdersView as Select orderId,quantity, totalcost from orders where quantity>2;
select * from OrdersView;

select person.firstName, person.lastName,orders.orderId,orders.totalcost,menu.menuName,menuitems.itemName from orders
inner join bookings on bookings.bookingid = orders.bookingid
inner join customer on customer.customerId = bookings.customerId
inner join person on customer.personid = person.personid
inner join menu on menu.menuid = orders.menuid
inner join menuitems on menuitems.itemid = menu.itemid
where totalcost > 150
order by totalcost; 

select menuName from menu
where menuId = ANY(select menuid from orders where quantity >2);

create procedure GetMaxQuantity()
select max(quantity) from orders;

set @id =1;
prepare GetOrderDetails from 'select orderid, quantity, totalcost from orders where orderid = ?';
Execute GetOrderDetails using @id;

Delimiter //
create procedure CancelOrder(in id int, out output varchar(50))
begin
delete from orders where orderid = id;
select output = concat('Order',id,'has been cancelled') as "Confirmation";
end//
Delimiter ;

set @result= '';
call CancelOrder(3, @result);