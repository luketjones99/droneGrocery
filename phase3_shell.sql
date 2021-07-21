/*
CS4400: Introduction to Database Systems
Spring 2021
Phase III Template


Team 58
Luke Jones (ljones96)
Bernardo Chalita (bchalita3)
Tracey Li (tli412)
Felipe Nakamura (fnakamura3)


Directions:
Please follow all instructions from the Phase III assignment PDF.
This file must run without error for credit.
*/

-- ID: 2a
-- Author: asmith457
-- Name: register_customer
DROP PROCEDURE IF EXISTS register_customer;
DELIMITER //
CREATE PROCEDURE register_customer(
	   IN i_username VARCHAR(40),
       IN i_password VARCHAR(40),
	   IN i_fname VARCHAR(40),
       IN i_lname VARCHAR(40),
       IN i_street VARCHAR(40),
       IN i_city VARCHAR(40),
       IN i_state VARCHAR(2),
	   IN i_zipcode CHAR(5),
       IN i_ccnumber VARCHAR(40),
	   IN i_cvv CHAR(3),
       IN i_exp_date DATE
)
sp_main: BEGIN
    if char_length(i_password) < 8 then leave sp_main; end if;
    if char_length(i_zipcode) != 5 then leave sp_main; end if;
	insert into USERS values (i_username, MD5(i_password), i_fname, i_lname, i_street,
		i_city, i_state, i_zipcode);
	insert into CUSTOMER values (i_username, i_ccnumber, i_cvv, i_exp_date);
END //
DELIMITER ;


-- ID: 2b
-- Author: asmith457
-- Name: register_employee
DROP PROCEDURE IF EXISTS register_employee;
DELIMITER //
CREATE PROCEDURE register_employee(
	   IN i_username VARCHAR(40),
       IN i_password VARCHAR(40),
	   IN i_fname VARCHAR(40),
       IN i_lname VARCHAR(40),
       IN i_street VARCHAR(40),
       IN i_city VARCHAR(40),
       IN i_state VARCHAR(2),
       IN i_zipcode CHAR(5)
)
sp_main: BEGIN
	if char_length(i_password) < 8 then leave sp_main; end if;
    if char_length(i_zipcode) != 5 then leave sp_main; end if;
	insert into USERS values (i_username, MD5(i_password), i_fname, i_lname,
		i_street, i_city, i_state, i_zipcode);
	insert into EMPLOYEE values (i_username);
END //
DELIMITER ;

-- ID: 4a
-- Author: asmith457
-- Name: admin_create_grocery_chain
DROP PROCEDURE IF EXISTS admin_create_grocery_chain;
DELIMITER //
CREATE PROCEDURE admin_create_grocery_chain(
        IN i_grocery_chain_name VARCHAR(40)
)
BEGIN
	insert into CHAIN values (i_grocery_chain_name);
END //
DELIMITER ;

-- ID: 5a
-- Author: ahatcher8
-- Name: admin_create_new_store
DROP PROCEDURE IF EXISTS admin_create_new_store;
DELIMITER //
CREATE PROCEDURE admin_create_new_store(
    	IN i_store_name VARCHAR(40),
        IN i_chain_name VARCHAR(40),
    	IN i_street VARCHAR(40),
    	IN i_city VARCHAR(40),
    	IN i_state VARCHAR(2),
    	IN i_zipcode CHAR(5)
)
sp_main: BEGIN
	if i_zipcode in (select Zipcode from STORE where ChainName = i_chain_name)
		then leave sp_main; end if;
	if i_store_name in (select StoreName from STORE where ChainName = i_chain_name)
		then leave sp_main; end if;
	insert into STORE values (i_store_name, i_chain_name, i_street, i_city,
		i_state, i_zipcode);
END //
DELIMITER ;


-- ID: 6a
-- Author: ahatcher8
-- Name: admin_create_drone
DROP PROCEDURE IF EXISTS admin_create_drone;
DELIMITER //
CREATE PROCEDURE admin_create_drone(
	   IN i_drone_id INT,
       IN i_zip CHAR(5),
       IN i_radius INT,
       IN i_drone_tech VARCHAR(40)
)
sp_main: BEGIN
    if i_drone_tech not in (select Username from DRONE_TECH
		where (ChainName, StoreName) in (select ChainName, StoreName from STORE where Zipcode = i_zip))
		then leave sp_main; end if;
	insert into DRONE values (i_drone_id, 'Available', i_zip, i_radius, i_drone_tech);
END //
DELIMITER ;


-- ID: 7a
-- Author: ahatcher8
-- Name: admin_create_item
DROP PROCEDURE IF EXISTS admin_create_item;
DELIMITER //
CREATE PROCEDURE admin_create_item(
        IN i_item_name VARCHAR(40),
        IN i_item_type VARCHAR(40),
        IN i_organic VARCHAR(3),
        IN i_origin VARCHAR(40)
)
sp_main: BEGIN
	if i_organic not like 'yes' and i_organic not like 'no' then leave sp_main; end if;
	insert into ITEM values (i_item_name, i_item_type, i_origin, i_organic);
END //
DELIMITER ;

-- ID: 8a
-- Author: dvaidyanathan6
-- Name: admin_view_customers
DROP PROCEDURE IF EXISTS admin_view_customers;
DELIMITER //
CREATE PROCEDURE admin_view_customers(
	   IN i_first_name VARCHAR(40),
       IN i_last_name VARCHAR(40)
)
BEGIN
	drop table if exists admin_view_customers_result;
	create table admin_view_customers_result (
		Username varchar(40),
		FullName varchar(40),
		Address varchar(100)
	);
	Insert into admin_view_customers_result
		SELECT USERS.Username, concat(USERS.FirstName, ' ', USERS.LastName) as FullName, concat(USERS.Street, ', ', USERS.City, ', ', USERS.State, ' ', USERS.Zipcode) as Address
		from USERS where USERS.Username in (select Username from CUSTOMER)
        and (USERS.FirstName = i_first_name or i_first_name like 'all' or i_first_name is null)
        and (USERS.LastName = i_last_name or i_last_name like 'all' or i_last_name is null);
END //
DELIMITER ;

-- ID: 9a
-- Author: dvaidyanathan6
-- Name: manager_create_chain_item
DROP PROCEDURE IF EXISTS manager_create_chain_item;
DELIMITER //
CREATE PROCEDURE manager_create_chain_item(
        IN i_chain_name VARCHAR(40),
    	IN i_item_name VARCHAR(40),
    	IN i_quantity INT,
    	IN i_order_limit INT,
    	IN i_PLU_number INT,
    	IN i_price DECIMAL(4, 2)
)
BEGIN
	insert into CHAIN_ITEM values (i_item_name, i_chain_name, i_PLU_number, i_order_limit,
		i_quantity, i_price);
END //
DELIMITER ;

-- ID: 10a
-- Author: dvaidyanathan6
-- Name: manager_view_drone_technicians
DROP PROCEDURE IF EXISTS manager_view_drone_technicians;
DELIMITER //
CREATE PROCEDURE manager_view_drone_technicians(
	   IN i_chain_name VARCHAR(40),
       IN i_drone_tech VARCHAR(40),
       IN i_store_name VARCHAR(40)
)
BEGIN
	drop table if exists manager_view_drone_technicians_result;
	create table manager_view_drone_technicians_result
		select drone_tech.Username, concat(Temp.FirstName, ' ', Temp.LastName) as FullName, drone_tech.StoreName as Location
		from drone_tech join (select FirstName, LastName, Username from USERS) as Temp
		on drone_tech.Username = Temp.Username
		where (drone_tech.ChainName = i_chain_name)
		and (i_drone_tech is null or i_drone_tech like 'all' or drone_tech.Username = i_drone_tech)
		and (i_store_name is null or i_store_name like 'all' or drone_tech.StoreName = i_store_name);

END //
DELIMITER ;

-- ID: 11a
-- Author: vtata6
-- Name: manager_view_drones
DROP PROCEDURE IF EXISTS manager_view_drones;
DELIMITER //
CREATE PROCEDURE manager_view_drones(
	   IN i_mgr_username varchar(40),
	   IN i_drone_id int, drone_radius int
)
sp_main: BEGIN
drop table if exists manager_view_drones_result;
create table manager_view_drones_result(
	ID int,
    Operator varchar(40),
    Radius int,
    Zip char(5),
    DroneStatus varchar(40)
);
if i_mgr_username not in (select Username from MANAGER) then leave sp_main; end if;
select ChainName into @the_chain from MANAGER where Username = i_mgr_username;
insert into manager_view_drones_result
	select ID, DroneTech, Radius, Zip, DroneStatus from Drone
	where DroneTech in (select Username from DRONE_TECH where ChainName = @the_chain)
	and (i_drone_id is null or ID = i_drone_id) and (drone_radius is null or Radius >= drone_radius);

END //
DELIMITER ;

drop function if exists get_order_total;
delimiter //
create function get_order_total(order_id int)
	returns decimal(8,2) deterministic
begin
	select sum(CONTAINS.Quantity * Price) into @order_total from CONTAINS join CHAIN_ITEM
    on CONTAINS.ChainName = CHAIN_ITEM.ChainName
    and ChainItemName = ItemName and CONTAINS.PLUNumber = CHAIN_ITEM.PLUNumber
    where OrderID = order_id
    group by OrderID;
    return @order_total;
end //
delimiter ;

drop function if exists get_store_total;
delimiter //
create function get_store_total(chain_name varchar(40), store_name varchar(40))
	returns decimal(8,2) deterministic
begin
	select sum(get_order_total(ID)) into @store_total from Orders where DroneID in (select ID from Drone where DroneTech in
    (select Username from DRONE_TECH where ChainName = chain_name and StoreName = store_name));
    return @store_total;
end //
delimiter ;

drop function if exists get_num_of_orders;
delimiter //
create function get_num_of_orders(chain_name varchar(40), store_name varchar(40))
	returns int deterministic
begin
	select count(*) into @num from ORDERS where DroneID in (select ID from DRONE where DroneTech in
    (select Username from DRONE_TECH where ChainName = chain_name and StoreName = store_name));
    return @num;
end //
delimiter ;

drop function if exists get_num_of_employees;
delimiter //
create function get_num_of_employees(chain_name varchar(40), store_name varchar(40))
	returns int deterministic
begin
	select count(*) into @num_of_dt from DRONE_TECH where ChainName = chain_name and StoreName = store_name;
    select count(*) into @num_of_mgr from MANAGER where ChainName = chain_name;
    set @num = @num_of_dt + @num_of_mgr;
    return @num;
end //
delimiter ;

-- ID: 12a
-- Author: vtata6
-- Name: manager_manage_stores
DROP PROCEDURE IF EXISTS manager_manage_stores;
DELIMITER //
CREATE PROCEDURE manager_manage_stores(
	   IN i_mgr_username varchar(50),
	   IN i_storeName varchar(50),
	   IN i_minTotal int,
	   IN i_maxTotal int
)
sp_main: BEGIN
	drop table if exists manager_manage_stores_result;
    create table manager_manage_stores_result (
		StoreName varchar(40),
        Address varchar(100),
        Orders int,
        Employees int,
        Total decimal(10,2)
	);
    if i_minTotal > i_maxTotal then leave sp_main; end if;
    if i_mgr_username not in (select Username from Manager) then leave sp_main; end if;
    select ChainName into @mgr_chain from MANAGER where Username = i_mgr_username;
    insert into manager_manage_stores_result
		select StoreName, concat(Street, ' ', City, ', ', State, ' ', Zipcode) as Address,
        get_num_of_orders(@mgr_chain, StoreName), get_num_of_employees(@mgr_chain, StoreName),
        get_store_total(@mgr_chain, StoreName) from STORE
        where ChainName = @mgr_chain and  get_store_total(@mgr_chain, StoreName) is not null
        and (i_storeName is null or i_storeName like 'all' or StoreName = i_storeName)
        and ((i_minTotal is not null and i_maxTotal is not null and
        (get_store_total(@mgr_chain, StoreName) between i_minTotal and i_maxTotal))
        or (i_minTotal is null and i_maxTotal is null)
        or (i_minTotal is null and i_maxTotal is not null and get_store_total(@mgr_chain, StoreName) <= i_maxTotal)
        or (i_minTotal is not null and get_store_total(@mgr_chain, StoreName) >= i_minTotal and i_maxTotal is null));
END //
DELIMITER ;

-- ID: 13a
-- Author: vtata6
-- Name: customer_change_credit_card_information
DROP PROCEDURE IF EXISTS customer_change_credit_card_information;
DELIMITER //
CREATE PROCEDURE customer_change_credit_card_information(
	   IN i_custUsername varchar(40),
	   IN i_new_cc_number varchar(19),
	   IN i_new_CVV int,
	   IN i_new_exp_date date
)
sp_main: BEGIN
	if i_new_exp_date < curdate() then leave sp_main; end if;
    update CUSTOMER set CcNumber = i_new_cc_number where Username = i_custUsername;
    update CUSTOMER set CVV = i_new_CVV where Username = i_custUsername;
    update CUSTOMER set EXP_DATE = i_new_exp_date where Username = i_custUsername;
END //
DELIMITER ;

-- ID: 14a
-- Author: ftsang3
-- Name: customer_view_order_history
DROP PROCEDURE IF EXISTS customer_view_order_history;
DELIMITER //
CREATE PROCEDURE customer_view_order_history(
	   IN i_username VARCHAR(40),
       IN i_orderid INT
)
sp_main: BEGIN
drop table if exists customer_view_order_history_result;
create table customer_view_order_history_result(
	total_amount decimal(10,2),
    total_items int,
    orderdate date,
    droneID int,
    dronetech varchar(40),
    orderstatus varchar(40)
);
if i_username not in (select Username from CUSTOMER) then leave sp_main; end if;
if i_username not in (select CustomerUsername from ORDERS where ID = i_orderid) then leave sp_main; end if;
select sum(CONTAINS.Quantity) into @num_of_items from CONTAINS where OrderID = i_orderid;
insert into customer_view_order_history_result
	select get_order_total(i_orderid), @num_of_items, OrderDate, DroneID, DroneTech, OrderStatus from ORDERS join Drone
    on DRONE.ID = DroneID
    where ORDERS.ID = i_orderid;
END //
DELIMITER ;

-- ID: 15a
-- Author: ftsang3
-- Name: customer_view_store_items
DROP PROCEDURE IF EXISTS customer_view_store_items;
DELIMITER //
CREATE PROCEDURE customer_view_store_items(
	   IN i_username VARCHAR(40),
       IN i_chain_name VARCHAR(40),
       IN i_store_name VARCHAR(40),
       IN i_item_type VARCHAR(40)
)
sp_main: BEGIN
drop table if exists customer_view_store_items_result;
	create table customer_view_store_items_result(
		chainitemname varchar(40),
        orderlimit int
        );
	if i_username not in (select Username from CUSTOMER)
		then leave sp_main; end if;
    select Zipcode into @customer_zip from USERS where Username = i_username;
	if @customer_zip not in (select Zipcode from STORE where StoreName = i_store_name and ChainName = i_chain_name)
		then leave sp_main; end if;

	insert into customer_view_store_items_result
		select ChainItemName, Orderlimit from CHAIN_ITEM join ITEM on ChainItemName = ItemName
        where ChainName = i_chain_name and Quantity > 0 and
		(ChainItemName in (select ItemName from ITEM where ItemType = i_item_type) or i_item_type like 'all');
END //
DELIMITER ;

-- ID: 15b
-- Author: ftsang3
-- Name: customer_select_items
DROP PROCEDURE IF EXISTS customer_select_items;
DELIMITER //
CREATE PROCEDURE customer_select_items(
	    IN i_username VARCHAR(40),
    	IN i_chain_name VARCHAR(40),
    	IN i_store_name VARCHAR(40),
    	IN i_item_name VARCHAR(40),
    	IN i_quantity INT
)
sp_main: BEGIN
	if i_username not in (select Username from CUSTOMER)
		then leave sp_main; end if;
	select EXP_DATE into @expdate from CUSTOMER where Username = i_username;
    if @expdate < curdate() then leave sp_main; end if;
	select Zipcode into @customer_zip from USERS where Username = i_username;
	if @customer_zip not in (select Zipcode from STORE where StoreName = i_store_name and ChainName = i_chain_name)
		then leave sp_main; end if;
	select Orderlimit into @orderlim from CHAIN_ITEM where ChainItemName = i_item_name and ChainName = i_chain_name;
    if i_quantity > @orderlim or i_quantity < 0 then leave sp_main; end if;
    if i_item_name not in (select ChainItemName from CHAIN_ITEM where ChainName = i_chain_name) then leave sp_main; end if;
    if 'Creating' not in (select OrderStatus from ORDERS where CustomerUsername = i_username) then
		insert into ORDERS values (null, 'Creating', curdate(), i_username, null); end if;
    select ID into @id from ORDERS where i_username = CustomerUsername and OrderStatus = 'Creating';
    select PLUNumber into @plu from CHAIN_ITEM where ChainItemName = i_item_name and ChainName = i_chain_name;
    insert into CONTAINS values (@id, i_item_name, i_chain_name, @plu, i_quantity);
END //
DELIMITER ;

-- ID: 16a
-- Author: jkomskis3
-- Name: customer_review_order
DROP PROCEDURE IF EXISTS customer_review_order;
DELIMITER //
CREATE PROCEDURE customer_review_order(
	   IN i_username VARCHAR(40)
)
sp_main: BEGIN
	drop table if exists customer_review_order_result;
    create table customer_review_order_result(
		ItemName varchar(40),
        Quantity int,
        Price decimal(8,2)
	);
	if i_username not in (select CustomerUsername from ORDERS)
		then leave sp_main; end if;
	insert into customer_review_order_result
		select ItemName, CONTAINS.Quantity, Price from CONTAINS join CHAIN_ITEM on ItemName = ChainItemName and
			CONTAINS.ChainName = CHAIN_ITEM.ChainName and CONTAINS.PLUNumber = CHAIN_ITEM.PLUNumber
			where OrderID in (select ID from ORDERS where i_username = CustomerUsername and OrderStatus = 'Creating');
END //
DELIMITER ;

-- ID: 16b
-- Author: jkomskis3
-- Name: customer_update_order
DROP PROCEDURE IF EXISTS customer_update_order;
DELIMITER //
CREATE PROCEDURE customer_update_order(
	   IN i_username VARCHAR(40),
       IN i_item_name VARCHAR(40),
       IN i_quantity INT
)
sp_main: BEGIN
	if i_username not in (select CustomerUsername from ORDERS)
			then leave sp_main; end if;
	select ID into @order_id from ORDERS where CustomerUsername = i_username and OrderStatus = 'Creating';
    if @order_id is null then leave sp_main; end if;
    select ChainName into @chain_name from CONTAINS where OrderID = @order_id and ItemName = i_item_name;
    select Orderlimit into @orderlim from CHAIN_ITEM where ChainName = @chain_name and ChainItemName = i_item_name;
    if i_quantity > @orderlim or i_quantity < 0 then leave sp_main; end if;
    if i_quantity = 0 then delete from CONTAINS where OrderID = @order_id and ItemName = i_item_name;
    else
		update CONTAINS set Quantity = i_quantity where OrderID = @order_id and ItemName = i_item_name;
	end if;
END //
DELIMITER ;

drop function if exists get_full_name;
delimiter //
create function get_full_name(un varchar(40))
	returns varchar(50) deterministic
begin
	select FirstName into @fname from USERS where Username = un;
    select LastName into @lname from USERS where Username = un;
    return concat(@fname, ' ', @lname);
end //
delimiter ;

drop function if exists get_order_dt;
delimiter //
create function get_order_dt(order_id int)
	returns varchar(50) deterministic
begin
	if exists (select DroneTech from Drone where Drone.ID in
    (select DroneID from ORDERS where ORDERS.ID = order_id))
    then select DroneTech into @dt_username from Drone where Drone.ID in
    (select DroneID from ORDERS where ORDERS.ID = order_id);
    select FirstName into @fname from USERS where Username = @dt_username;
    select LastName into @lname from USERS where Username = @dt_username;
    return concat(@fname, ' ', @lname);
    else
		return null;
	end if;
end //
delimiter ;

-- ID: 17a
-- Author: jkomskis3
-- Name: customer_update_order
DROP PROCEDURE IF EXISTS drone_technician_view_order_history;
DELIMITER //
CREATE PROCEDURE drone_technician_view_order_history(
        IN i_username VARCHAR(40),
    	IN i_start_date DATE,
    	IN i_end_date DATE
)
sp_main: begin

drop table if exists drone_technician_view_order_history_result;
if i_username not in (select Username from DRONE_TECH) then leave sp_main; end if;
select ChainName into @chain_name from DRONE_TECH where Username = i_username;
select StoreName into @store from DRONE_TECH where Username = i_username;
select Zipcode into @zip from STORE where ChainName = @chain_name and StoreName = @store;

create table drone_technician_view_order_history_result
	select distinct ORDERS.ID as 'ID', get_order_dt(ORDERS.ID) as 'Operator', ORDERS.OrderDate as 'Date', ORDERS.DroneID as 'Drone ID',
    ORDERS.OrderStatus as 'Status', get_order_total(ORDERS.ID) as 'Total' from ORDERS join CONTAINS
    on ORDERS.ID = CONTAINS.OrderID
    where CONTAINS.ChainName = @chain_name and ORDERS.CustomerUsername in (select Username from USERS where Zipcode = @zip)
    and (i_start_date is null or ORDERS.OrderDate >= i_start_date)
    and (i_end_date is null or ORDERS.OrderDate <= i_end_date);
END //
DELIMITER ;

-- ID: 17b
-- Author: agoyal89
-- Name: dronetech_assign_order
DROP PROCEDURE IF EXISTS dronetech_assign_order;
DELIMITER //
CREATE PROCEDURE dronetech_assign_order(
	   IN i_username VARCHAR(40),
       IN i_droneid INT,
       IN i_status VARCHAR(20),
       IN i_orderid INT
)
sp_main: BEGIN
	if i_username not in (select Username from DRONE_TECH) then leave sp_main; end if;
    if i_droneid not in (select ID from DRONE where DroneTech = i_username)
		then leave sp_main; end if;
	select OrderStatus into @order_status from ORDERS where ID = i_orderid;
    if @order_status = 'Pending' then
		update ORDERS set DroneID = i_droneid  where ID = i_orderid;
        update DRONE set DroneStatus = "Busy" where ID = i_droneid; end if;
	update ORDERS set OrderStatus = i_status where ID = i_orderid;


END //
DELIMITER ;

-- ID: 18a
-- Author: agoyal89
-- Name: dronetech_order_details
DROP PROCEDURE IF EXISTS dronetech_order_details;
DELIMITER //
CREATE PROCEDURE dronetech_order_details(
	   IN i_username VARCHAR(40),
       IN i_orderid VARCHAR(40)
)
BEGIN
drop table if exists dronetech_order_details_result;

drop table if exists temp3;
create temporary table temp3
select concat(USERS.FirstName," ", USERS.LastName) as Customer_Name, ID as Order_ID, OrderDate as Date_of_Purchase, DroneID as Drone_ID, OrderStatus as Order_Status, concat(Street, ", ", City, ", ", State, " ", Zipcode) as Address
from ORDERS join USERS where ID = i_orderid and Username = CustomerUsername;

drop table if exists temp4;
create table temp4
select OrderID, sum(CONTAINS.Quantity * Price) as Total_Amount, sum(CONTAINS.Quantity) as Total_Items
from CONTAINS join CHAIN_ITEM on ItemName = ChainItemName and CONTAINS.ChainName = CHAIN_ITEM.ChainName and CONTAINS.PLUNumber = CHAIN_ITEM.PLUNumber
group by OrderID;

drop table if exists temp5;
create table temp5
select concat(USERS.FirstName," ", USERS.LastName) as Store_Associate
from USERS
where Username = i_username;

create table dronetech_order_details_result
select temp3.Customer_Name, temp3.Order_ID, temp4.Total_Amount, temp4.Total_Items, temp3.Date_of_Purchase, temp3.Drone_ID, temp5.Store_Associate, temp3.Order_Status, temp3.Address
from temp3 join temp4 on temp3.Order_ID = temp4.OrderID join temp5;
drop table if exists temp3;
drop table if exists temp4;
drop table if exists temp5;

END //
DELIMITER ;


-- ID: 18b
-- Author: agoyal89
-- Name: dronetech_order_items
DROP PROCEDURE IF EXISTS dronetech_order_items;
DELIMITER //
CREATE PROCEDURE dronetech_order_items(
        IN i_username VARCHAR(40),
    	IN i_orderid INT
)
sp_main: BEGIN
#if i_username not in (select Username from DRONE_TECH) then leave sp_main; end if;
#drop table if exists dronetech_order_items_result;
#create table dronetech_order_items_result
#	select ItemName, Quantity from CONTAINS where OrderID = i_orderid;

drop table if exists dronetech_order_items_result;
    create table dronetech_order_items_result
    select ItemName as Item, Quantity as Count
    from CONTAINS where OrderID = i_orderid;

END //
DELIMITER ;

-- ID: 19a
-- Author: agoyal89
-- Name: dronetech_assigned_drones
DROP PROCEDURE IF EXISTS dronetech_assigned_drones;
DELIMITER //
CREATE PROCEDURE dronetech_assigned_drones(
        IN i_username VARCHAR(40),
    	IN i_droneid INT,
    	IN i_status VARCHAR(20)
)
sp_main: BEGIN
#if i_username not in (select Username from DRONE_TECH) then leave sp_main; end if;
#drop table if exists dronetech_assigned_drones_result;
#create table dronetech_assigned_drones_result(

#);
	#select ID as Drone_ID, DroneStatus, Radius from DRONE where ID = i_droneid and DroneStatus = i_status
   # and DroneTech = i_username;
   -- Type solution below
	drop table if exists dronetech_assigned_drones_result;
    -- all drones and no specific ID
    if i_status = "All" and i_droneid is null then
		create table dronetech_assigned_drones_result
		select ID as Drone_ID, DroneStatus as Drone_Status, Radius
        from DRONE where DroneTech = i_username;
    -- All drones but specific ID
	elseif i_status = "All" and i_droneid is not null then
		create table dronetech_assigned_drones_result
		select ID as Drone_ID, DroneStatus as Drone_Status, Radius
        from DRONE where DroneTech = i_username and i_droneid = ID;
	-- specific status but not specific droneid:
    elseif i_status != "All" and i_droneid is null then
		create table dronetech_assigned_drones_result
		select ID as Drone_ID, DroneStatus as Drone_Status, Radius
        from DRONE where DroneTech = i_username and i_status = DroneStatus;
    -- specific droneid and status:
    else
		create table dronetech_assigned_drones_result
		select ID as Drone_ID, DroneStatus as Drone_Status, Radius
        from DRONE where DroneTech = i_username and i_status = DroneStatus and i_droneid = ID;
    end if;

END //
DELIMITER ;
