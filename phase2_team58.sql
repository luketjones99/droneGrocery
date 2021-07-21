-- CS4400: Introduction to Database Systems
-- Spring 2021
-- Phase II Create Table and Insert Statements Template

-- Team 58
-- Luke Jones (ljones96)
-- Bernardo Chalita (bchalita3)
-- Tracey Li (tli412)
-- Felipe Nakamura (fnakamura3)

-- Directions:
-- Please follow all instructions from the Phase II assignment PDF.
-- This file must run without error for credit.
-- Create Table statements should be manually written, not taken from an SQL Dump.
-- Rename file to cs4400_phase2_teamX.sql before submission

-- CREATE TABLE STATEMENTS BELOW

DROP DATABASE IF EXISTS drone_grocery;
CREATE DATABASE IF NOT EXISTS drone_grocery;
USE drone_grocery;

DROP TABLE IF EXISTS groc_chain;
CREATE TABLE groc_chain (
	chain_name varchar(20) NOT NULL,
    PRIMARY KEY (chain_name)
) ENGINE=innodb;

INSERT INTO groc_chain VALUES ("Moss Market");
INSERT INTO groc_chain VALUES ("Sprouts");
INSERT INTO groc_chain VALUES ("Query Mart");
INSERT INTO groc_chain VALUES ("Whole Foods");
INSERT INTO groc_chain VALUES ("Publix");
INSERT INTO groc_chain VALUES ("Kroger");
INSERT INTO groc_chain VALUES ("Trader Joe's");
INSERT INTO groc_chain VALUES ('Wal Mart');


DROP TABLE IF EXISTS item;
CREATE TABLE item (
	item_name varchar(30) NOT NULL,
    item_type varchar(30) NOT NULL,
    orgin varchar(30) NOT NULL,
    organic char(3) NOT NULL,
    PRIMARY KEY (item_name)
) ENGINE=innodb;

INSERT INTO item VALUES ('2% Milk', 'Dairy', 'Georgia', 'Yes');
INSERT INTO item VALUES ('4-1 Shampoo', 'Personal Care', 'Michigan', 'No');
INSERT INTO item VALUES ('Almond Milk', 'Dairy', 'Georgia', 'No');
INSERT INTO item VALUES ('Apple Juice', 'Beverages', 'Missouri', 'Yes');
INSERT INTO item VALUES ('Baby Food', 'Produce', 'Georgia', 'Yes');
INSERT INTO item VALUES ('Baby Shampoo', 'Personal Care', 'Michigan', 'Yes');
INSERT INTO item VALUES ('Bagels', 'Bakery', 'Georgia', 'No');
INSERT INTO item VALUES ('Bamboo Brush', 'Personal Care', 'Louisiana', 'Yes');
INSERT INTO item VALUES ('Bamboo Comb', 'Personal Care', 'Louisiana', 'Yes');
INSERT INTO item VALUES ('Bandaids', 'Personal Care', 'Arkansas', 'No');
INSERT INTO item VALUES ('Black Tea', 'Beverages', 'India', 'Yes');
INSERT INTO item VALUES ('Brown bread', 'Bakery', 'Georgia', 'No');
INSERT INTO item VALUES ('Cajun Seasoning', 'Other', 'Lousiana', 'Yes');
INSERT INTO item VALUES ('Campbells Soup', 'Other', 'Georgia', 'Yes');
INSERT INTO item VALUES ('Carrot', 'Produce', 'Alabama', 'No');
INSERT INTO item VALUES ('Chicken Breast', 'Meat', 'Georgia', 'No');
INSERT INTO item VALUES ('Chicken Thighs', 'Meat', 'Georgia', 'Yes');
INSERT INTO item VALUES ('Coca-cola', 'Beverages', 'Georgia', 'No');
INSERT INTO item VALUES ('Coffee', 'Beverages', 'Columbia', 'Yes');
INSERT INTO item VALUES ('Disani', 'Beverages', 'California', 'Yes');
INSERT INTO item VALUES ('Doughnuts', 'Bakery', 'Georgia', 'No');
INSERT INTO item VALUES ('Earl Grey Tea', 'Beverages', 'Italy', 'Yes');
INSERT INTO item VALUES ('Fuji Apple', 'Produce', 'Georgia', 'No');
INSERT INTO item VALUES ('Gala Apple', 'Produce', 'New Zealand', 'Yes');
INSERT INTO item VALUES ('Grape Juice', 'Beverages', 'Missouri', 'No');
INSERT INTO item VALUES ('Grassfed Beef', 'Meat', 'Georgia', 'Yes');
INSERT INTO item VALUES ('Green Tea', 'Beverages', 'India', 'Yes');
INSERT INTO item VALUES ('Green Tea Shampoo', 'Personal Care', 'Michigan', 'Yes');
INSERT INTO item VALUES ('Ground Breef', 'Meat', 'Texas', 'Yes');
INSERT INTO item VALUES ('Ice Cream', 'Dairy', 'Georgia', 'No');
INSERT INTO item VALUES ('Lamb Chops', 'Meat', 'New Zealand', 'Yes');
INSERT INTO item VALUES ('Lavender Handsoap', 'Personal Care', 'France', 'Yes');
INSERT INTO item VALUES ('Lemon Handsoap', 'Personal Care', 'France', 'Yes');
INSERT INTO item VALUES ('Makeup', 'Personal Care', 'New York', 'No');
INSERT INTO item VALUES ('Napkins', 'Paper Goods', 'South Carolina', 'No');
INSERT INTO item VALUES ('Navel Orange', 'Produce', 'California', 'Yes');
INSERT INTO item VALUES ('Onions', 'Produce', 'Mississippi', 'No');
INSERT INTO item VALUES ('Orange Juice', 'Beverages', 'Missouri', 'Yes');
INSERT INTO item VALUES ('Organic Peanut Butter', 'Other ', 'Alabama', 'Yes');
INSERT INTO item VALUES ('Organic Toothpaste', 'Personal Care', 'Florida', 'Yes');
INSERT INTO item VALUES ('Paper Cups', 'Paper Goods', 'South Carolina', 'No');
INSERT INTO item VALUES ('Paper plates', 'Paper Goods', 'South Carolina', 'No');
INSERT INTO item VALUES ('Peanut Butter', 'Other', 'Alabama', 'No');
INSERT INTO item VALUES ('Pepper', 'Other', 'Alaska', 'No');
INSERT INTO item VALUES ('Pepsi', 'Beverages', 'Kansas', 'No');
INSERT INTO item VALUES ('Plastic Brush', 'Personal Care', 'Louisiana', 'No');
INSERT INTO item VALUES ('Plastic Comb', 'Personal Care', 'Louisiana', 'No');
INSERT INTO item VALUES ('Pomagranted Juice', 'Beverages', 'Florida', 'Yes');
INSERT INTO item VALUES ('Potato', 'Produce', 'Alabama', 'No');
INSERT INTO item VALUES ('Pura Life', 'Beverages', 'California', 'Yes');
INSERT INTO item VALUES ('Roma Tomato', 'Produce', 'Mexico', 'Yes');
INSERT INTO item VALUES ('Rosemary Tea', 'Beverages', 'Greece', 'Yes');
INSERT INTO item VALUES ('Sea salt', 'Other', 'Alaska', 'Yes');
INSERT INTO item VALUES ('Spinach', 'Produce', 'Florida', 'Yes');
INSERT INTO item VALUES ('Spring Water', 'Beverages', 'California', 'Yes');
INSERT INTO item VALUES ('Stationary', 'Paper Goods', 'North Carolina', 'No');
INSERT INTO item VALUES ('Strawberries', 'Produce', 'Wisconson', 'Yes');
INSERT INTO item VALUES ('Sunflower Butter', 'Other', 'Alabama', 'No');
INSERT INTO item VALUES ('Swiss Cheese', 'Dairy', 'Italy', 'No');
INSERT INTO item VALUES ('Toilet Paper', 'Personal Care', 'Kentucky', 'No');
INSERT INTO item VALUES ('Toothbrush', 'Personal Care', 'Kansas', 'No');
INSERT INTO item VALUES ('Toothpaste', 'Personal Care', 'Florida', 'No');
INSERT INTO item VALUES ('Turkey Wings', 'Meat', 'Georgia', 'No');
INSERT INTO item VALUES ('White Bread', 'Bakery', 'Georgia', 'No');
INSERT INTO item VALUES ('Whole Milk', 'Dairy', 'Georgia', 'Yes');
INSERT INTO item VALUES ('Yellow Curry Powder', 'Other', 'India', 'No');
INSERT INTO item VALUES ('Yogurt', 'Dairy', 'Georgia', 'No');


DROP TABLE IF EXISTS store;
CREATE TABLE store (
	chain_name varchar(20) NOT NULL,
    store_name varchar(25) NOT NULL,
    street varchar(30) NOT NULL,
    city varchar(20) NOT NULL,
    state char(2) NOT NULL,
    zip char(5) NOT NULL,
	PRIMARY KEY (chain_name, store_name),
    CONSTRAINT fk10 FOREIGN KEY (chain_name) REFERENCES groc_chain (chain_name)
) ENGINE=innodb;

INSERT INTO store VALUES ('Sprouts', 'Abbots Bridge', '116 Bell Rd', 'Johns Creek', 'GA', '30022');
INSERT INTO store VALUES ('Whole Foods', 'North Point', '532 8th St NW', 'Johns Creek', 'GA', '30022');
INSERT INTO store VALUES ('Kroger', 'Norcross', '650 Singleton Road', 'Duluth', 'GA', '30047');
INSERT INTO store VALUES ('Wal Mart', 'Pleasant Hill', '2365 Pleasant Hill Rd', 'Duluth', 'GA', '30047');
INSERT INTO store VALUES ('Moss Market', 'KSU Center', '3305 Busbee Drive NW', 'Kennesaw', 'GA', '30144');
INSERT INTO store VALUES ("Trader Joe's", 'Owl Circle', '48 Owl Circle SW', 'Kennesaw', 'GA', '30144');
INSERT INTO store VALUES ('Publix', 'Park Place', '10 Park Place South SE', 'Atlanta', 'GA', '30303');
INSERT INTO store VALUES ('Publix', 'The Plaza Midtown', '950 W Peachtree St NW', 'Atlanta', 'GA', '30309');
INSERT INTO store VALUES ('Query Mart', 'GT Center', '172 6th St NW', 'Atlanta', 'GA', '30313');
INSERT INTO store VALUES ('Whole Foods', 'North Avenue', '120 North Avenue NW', 'Atlanta', 'GA', '30313');
INSERT INTO store VALUES ('Sprouts', 'Piedmont', '564 Piedmont ave NW', 'Atlanta', 'GA', '30318');
INSERT INTO store VALUES ('Kroger', 'Midtown', '725 Ponce De Leon Ave', 'Atlanta', 'GA', '30332');
INSERT INTO store VALUES ('Moss Market', 'Tech Square', '740 Ferst Drive ', 'Atlanta', 'GA', '30332');
INSERT INTO store VALUES ('Moss Market', 'Bobby Dodd', '150 Bobby Dodd Way NW', 'Atlanta', 'GA', '30332');
INSERT INTO store VALUES ('Query Mart', 'Tech Square', '280 Ferst Drive NW', 'Atlanta', 'GA', '30332');
INSERT INTO store VALUES ('Moss Market', 'College Park', '1895 Phoenix Blvd', 'College Park', 'GA', '30339');
INSERT INTO store VALUES ('Publix', 'Atlanta Station', '595 Piedmot Ave NE', 'Atlanta ', 'GA', '30363');




DROP TABLE IF EXISTS chain_item;
CREATE TABLE chain_item (
	item_name varchar(30) NOT NULL,
    chain_name varchar(20) NOT NULL,
    plu_number int(5) ZEROFILL NOT NULL,
    order_limit int(3) NOT NULL,
    quantity_available int(4) NOT NULL,
    price decimal(4,2) NOT NULL,
    PRIMARY KEY (chain_name, item_name, plu_number),
    CONSTRAINT fk11 FOREIGN KEY (chain_name) REFERENCES groc_chain (chain_name),
    CONSTRAINT fk12 FOREIGN KEY (item_name) REFERENCES item (item_name)
) ENGINE=innodb;

INSERT INTO chain_item VALUES ("2% Milk","Sprouts",10001,10,410,6.38);
INSERT INTO chain_item VALUES ("4-1 Shampoo","Publix",10006,6,60,5.85);
INSERT INTO chain_item VALUES ("Baby Food","Sprouts",10005,5,170,10.56);
INSERT INTO chain_item VALUES ("Bagels","Publix",10009,5,130,5.67);
INSERT INTO chain_item VALUES ("Bandaids","Wal Mart",10002,4,300,14.71);
INSERT INTO chain_item VALUES ("Black Tea","Trader Joe's",10003,8,130,3.31);
INSERT INTO chain_item VALUES ("Brown bread","Kroger",10002,10,80,6.99);
INSERT INTO chain_item VALUES ("Campbells Soup","Moss Market",10003,8,390,13.31);
INSERT INTO chain_item VALUES ("Carrot","Kroger",10004,10,370,8.19),("Carrot","Publix",10001,9,110,9.71);
INSERT INTO chain_item VALUES ("Chicken Thighs","Publix",10008,10,280,2.81);
INSERT INTO chain_item VALUES ("Coca-cola","Wal Mart",10003,6,160,14.85);
INSERT INTO chain_item VALUES ("Coffee","Kroger",10005,8,170,4.30);
INSERT INTO chain_item VALUES ("Earl Grey Tea","Trader Joe's",10005,8,130,20.53);
INSERT INTO chain_item VALUES ("Fuji Apple","Moss Market",10002,2,130,1.99);
INSERT INTO chain_item VALUES ("Gala Apple","Moss Market",10001,8,450,15.32);
INSERT INTO chain_item VALUES ("Grape Juice","Publix",10004,7,150,11.89);
INSERT INTO chain_item VALUES ("Grassfed Beef","Whole Foods",10001,1,170,13.88);
INSERT INTO chain_item VALUES ("Green Tea","Trader Joe's",10002,4,340,7.25);
INSERT INTO chain_item VALUES ("Ice Cream", "Query Mart",10002,2,310,13.58);
INSERT INTO chain_item VALUES ("Lamb Chops", "Query Mart",10001,2,410,7.72), ("Lamb Chops", "Whole Foods",10002,4,280,20.14);
INSERT INTO chain_item VALUES ("Lavender Handsoap", "Kroger",10008,4,140,7.23);
INSERT INTO chain_item VALUES ("Napkins", "Wal Mart",10006,4,410,18.36);
INSERT INTO chain_item VALUES ("Paper Cups", "Publix",10003,10,430,20.18), ("Paper Cups", "Wal Mart",10005,1,50,7.73);
INSERT INTO chain_item VALUES ("Paper plates", "Wal Mart",10007,10,60,20.29);
INSERT INTO chain_item VALUES ("Peanut Butter", "Publix",10002,6,190,10.35), ("Peanut Butter","Sprouts",10004,7,410,1.30);
INSERT INTO chain_item VALUES ("Pepsi", "Kroger",10007,6,340,14.74), ("Pepsi","Publix",10007,6,440,11.19), ("Pepsi", "Wal Mart",10004,10,110,3.21);
INSERT INTO chain_item VALUES ("Roma Tomato", "Publix",10005,6,140,15.91);
INSERT INTO chain_item VALUES ("Rosemary Tea", "Trader Joe's",10004,10,310,10.55);
INSERT INTO chain_item VALUES ("Spinach", "Kroger",10006,8,130,2.35), ("Spinach", "Wal Mart",10001,9,320,11.44);
INSERT INTO chain_item VALUES ("Sunflower Butter", "Trader Joe's",10001,4,160,8.23);
INSERT INTO chain_item VALUES ("White Bread", "Kroger",10001,8,220,7.52);
INSERT INTO chain_item VALUES ("Whole Milk","Sprouts",10002,8,370,15.26);
INSERT INTO chain_item VALUES ("Yellow Curry Powder", "Sprouts",10003,7,230,16.72);
INSERT INTO chain_item VALUES ("Yogurt","Kroger",10003,6,330,3.27);




DROP TABLE IF EXISTS app_user;
CREATE TABLE app_user (
	username varchar(20) NOT NULL,
    user_password varchar(15) NOT NULL,
    first_name varchar(15) NOT NULL,
    last_name varchar(15) NOT NULL,
    street varchar(30) NOT NULL,
    city varchar(20) NOT NULL,
    state char(2) NOT NULL,
    zip char(5) NOT NULL,
    PRIMARY KEY (username)
) ENGINE=innodb;


INSERT INTO app_user VALUES ('mmoss7', 'password2', 'Mark', 'Moss', '15 Tech Lane', 'Duluth', 'GA', '30047');
INSERT INTO app_user VALUES ('lchen27', 'password3', 'Liang', 'Chen', '40 Walker Rd ', 'Kennesaw', 'GA', '30144');
INSERT INTO app_user VALUES ('jhilborn97', 'password4', 'Jack', 'Hilborn', '177 W Beaverdam Rd', 'Atlanta', 'GA', '30303');
INSERT INTO app_user VALUES ('jhilborn98', 'password5', 'Jake', 'Hilborn', '4605 Nasa Pkwy', 'Atlanta', 'GA', '30309');
INSERT INTO app_user VALUES ('ygao10', 'password6', 'Yuan', 'Gao', '27 Paisley Dr SW', 'Atlanta', 'GA', '30313');
INSERT INTO app_user VALUES ('kfrog03', 'password7', 'Kermit', 'Frog', '707 E Norfolk Ave', 'Atlanta', 'GA', '30318');
INSERT INTO app_user VALUES ('cforte58', 'password8', 'Connor', 'Forte', '13817 Shirley Ct NE', 'Atlanta', 'GA', '30332');
INSERT INTO app_user VALUES ('fdavenport49', 'password9', 'Felicia', 'Devenport', '6150 Old Millersport Rd NE', 'College Park', 'GA', '30339');
INSERT INTO app_user VALUES ('hliu88', 'password10', 'Hang', 'Liu', '1855 Fruit St', 'Atlanta', 'GA', '30363');
INSERT INTO app_user VALUES ('akarev16', 'password11', 'Alex', 'Karev', '100 NW 73rd Pl ', 'Johns Creek', 'GA', '30022');
INSERT INTO app_user VALUES ('jdoe381', 'password12', 'Jane ', 'Doe', '12602 Gradwell St', 'Duluth', 'GA', '30047');
INSERT INTO app_user VALUES ('sstrange11', 'password13', 'Stephen', 'Strange', '112 Huron Dr', 'Kennesaw', 'GA', '30144');
INSERT INTO app_user VALUES ('dmcstuffins7', 'password14', 'Doc', 'Mcstuffins', '27 Elio Cir', 'Atlanta', 'GA', '30303');
INSERT INTO app_user VALUES ('mgrey91', 'password15', 'Meredith', 'Grey', '500 N Stanwick Rd', 'Atlanta', 'GA', '30309');
INSERT INTO app_user VALUES ('pwallace51', 'password16', 'Penny', 'Wallace', '3127 Westwood Dr NW', 'Atlanta', 'GA', '30313');
INSERT INTO app_user VALUES ('jrosario34', 'password17', 'Jon', 'Rosario', '1111 Catherine St', 'Atlanta', 'GA', '30318');
INSERT INTO app_user VALUES ('nshea230', 'password18', 'Nicholas', 'Shea', '299 Shady Ln', 'Atlanta', 'GA', '30332');
INSERT INTO app_user VALUES ('mgeller3', 'password19', 'Monica ', 'Geller', '120 Stanley St', 'College Park', 'GA', '30339');
INSERT INTO app_user VALUES ('rgeller9', 'password20', 'Ross', 'Geller ', '4206 106th Pl NE', 'Atlanta', 'GA', '30363');
INSERT INTO app_user VALUES ('jtribbiani27', 'password21', 'Joey ', 'Tribbiani', '143 Pebble Ln', 'Johns Creek', 'GA', '30022');
INSERT INTO app_user VALUES ('pbuffay56', 'password22', 'Phoebe ', 'Buffay', '230 County Rd', 'Duluth', 'GA', '30047');
INSERT INTO app_user VALUES ('rgreen97', 'password23', 'Rachel', 'Green', '40 Frenchburg Ct', 'Kennesaw', 'GA', '30144');
INSERT INTO app_user VALUES ('cbing101', 'password24', 'Chandler ', 'Bing', '204 S Mapletree Ln', 'Atlanta', 'GA', '30303');
INSERT INTO app_user VALUES ('pbeesly61', 'password25', 'Pamela', 'Beesly', '932 Outlaw Bridge Rd', 'Atlanta', 'GA', '30309');
INSERT INTO app_user VALUES ('jhalpert75', 'password26', 'Jim ', 'Halpert', '185 Dry Creek Rd', 'Atlanta', 'GA', '30313');
INSERT INTO app_user VALUES ('dschrute18', 'password27', 'Dwight ', 'Schrute', '3009 Miller Ridge Ln', 'Atlanta', 'GA', '30318');
INSERT INTO app_user VALUES ('amartin365', 'password28', 'Angela ', 'Martin', '905 E Pinecrest Cir', 'Atlanta', 'GA', '30332');
INSERT INTO app_user VALUES ('omartinez13', 'password29', 'Oscar', 'Martinez', '26958 Springcreek Rd', 'College Park', 'GA', '30339');
INSERT INTO app_user VALUES ('mscott845', 'password30', 'Michael ', 'Scott', '105 Calusa Lake Dr', 'Denver', 'CO', '80014');
INSERT INTO app_user VALUES ('abernard224', 'password31', 'Andy ', 'Bernard', '21788 Monroe Rd #284', 'Johns Creek', 'GA', '30022');
INSERT INTO app_user VALUES ('kkapoor155', 'password32', 'Kelly ', 'Kapoor', '100 Forest Point Dr', 'Duluth', 'GA', '30047');
INSERT INTO app_user VALUES ('dphilbin81', 'password33', 'Darryl ', 'Philbin', '800 Washington St', 'Kennesaw', 'GA', '30144');
INSERT INTO app_user VALUES ('sthefirst1', 'password34', 'Sofia', 'Thefirst', '4337 Village Creek Dr', 'Atlanta', 'GA', '30303');
INSERT INTO app_user VALUES ('gburdell1', 'password35', 'George', 'Burdell', '201 N Blossom St', 'Atlanta', 'GA', '30309');
INSERT INTO app_user VALUES ('dsmith102', 'password36', 'Dani', 'Smith', '1648 Polk Rd', 'Atlanta', 'GA', '30313');
INSERT INTO app_user VALUES ('dbrown85', 'password37', 'David', 'Brown', '12831 Yorba Ave', 'Atlanta', 'GA', '30318');
INSERT INTO app_user VALUES ('dkim99', 'password38', 'Dave', 'Kim', '1710 Buckner Rd', 'Atlanta', 'GA', '30332');
INSERT INTO app_user VALUES ('tlee984', 'password39', 'Tom', 'Lee', '205 Mountain Ave', 'College Park', 'GA', '30339');
INSERT INTO app_user VALUES ('jpark29', 'password40', 'Jerry', 'Park', '520 Burberry Way', 'Atlanta', 'GA', '30363');
INSERT INTO app_user VALUES ('vneal101', 'password41', 'Vinay', 'Neal', '190 Drumar Ct', 'Johns Creek', 'GA', '30022');
INSERT INTO app_user VALUES ('hpeterson55', 'password42', 'Haydn', 'Peterson', '878 Grand Ivey Pl', 'Duluth', 'GA', '30047');
INSERT INTO app_user VALUES ('lpiper20', 'password43', 'Leroy', 'Piper', '262 Stonecliffe Aisle', 'Kennesaw', 'GA', '30144');
INSERT INTO app_user VALUES ('mbob2', 'password44', 'Chuck', 'Bass', '505 Bridge St', 'New York', 'NY', '10033');
INSERT INTO app_user VALUES ('mrees785', 'password45', 'Marie', 'Rees', '1081 Florida Ln', 'Atlanta', 'GA', '30309');
INSERT INTO app_user VALUES ('wbryant23', 'password46', 'William', 'Bryant', '109 Maple St', 'Atlanta', 'GA', '30313');
INSERT INTO app_user VALUES ('aallman302', 'password47', 'Aiysha', 'Allman', '420 Austerlitz Rd', 'Atlanta', 'GA', '30318');
INSERT INTO app_user VALUES ('kweston85', 'password48', 'Kyle', 'Weston', '100 Palace Dr', 'Birmingham', 'AL', '35011');
INSERT INTO app_user VALUES ('lknope98', 'password49', 'Leslie ', 'Knope', '10 Dogwood Ln', 'College Park', 'GA', '30339');
INSERT INTO app_user VALUES ('bwaldorf18', 'password50', 'Blair ', 'Waldorf', '1110 Greenway Dr', 'Atlanta', 'GA', '30363');



DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	username varchar(20) NOT NULL,
    cc_number char(19) NOT NULL,
    cvv char(3) NOT NULL,
    exp_date date NOT NULL,
    PRIMARY KEY (username),
    CONSTRAINT fk1 FOREIGN KEY (username) REFERENCES app_user (username)
) ENGINE=innodb;

INSERT INTO customer VALUES ('mscott845', '6518 5559 7446 1663', '551', "2024-02-28");
INSERT INTO customer VALUES ('abernard224', '2328 5670 4310 1965', '644', "2024-05-31");
INSERT INTO customer VALUES ('kkapoor155', '8387 9523 9827 9291', '201', "2031-02-28");
INSERT INTO customer VALUES ('dphilbin81', '6558 8596 9852 5299', '102', "2031-12-31");
INSERT INTO customer VALUES ('sthefirst1', '3414 7559 3721 2479', '489', '2021-11-30');
INSERT INTO customer VALUES ('gburdell1', '5317 1210 9087 2666', '852', '2022-01-31');
INSERT INTO customer VALUES ('dsmith102', '9383 3212 4198 1836', '455', '2029-08-31');
INSERT INTO customer VALUES ('dbrown85', '3110 2669 7949 5605', '744', '2022-10-31');
INSERT INTO customer VALUES ('dkim99', '2272 3555 4078 4744', '606', '2029-08-31');
INSERT INTO customer VALUES ('tlee984', '9276 7639 7883 4273', '862', '2031-08-31');
INSERT INTO customer VALUES ('jpark29', '4652 3726 8864 3798', '258', '2031-12-31');
INSERT INTO customer VALUES ('vneal101', '5478 8420 4436 7471', '857', '2029-09-30');
INSERT INTO customer VALUES ('hpeterson55', '3616 8977 1296 3372', '295', '2023-04-30');
INSERT INTO customer VALUES ('lpiper20', '9954 5698 6355 6952', '794', '2022-04-30');
INSERT INTO customer VALUES ('mbob2', '7580 3274 3724 5356', '269', '2027-05-31');
INSERT INTO customer VALUES ('mrees785', '7907 3513 7161 4248', '858', '2027-08-31');
INSERT INTO customer VALUES ('wbryant23', '1804 2062 7825 9689', '434', '2030-04-30');
INSERT INTO customer VALUES ('aallman302', '2254 7887 8863 3807', '862', '2021-04-30');
INSERT INTO customer VALUES ('kweston85', '8445 8585 2138 1374', '632', '2030-11-30');
INSERT INTO customer VALUES ('lknope98', '1440 2292 5962 4450', '140', '2031-04-30');
INSERT INTO customer VALUES ('bwaldorf18', '5839 2673 8600 1880', '108', '2029-12-31');


drop table if exists drone_technician;
create table drone_technician (
	username varchar(20) not null,
    works_at_chain varchar(50) not null,
    works_at_store varchar(50) not null,
    primary key (username),
    constraint fk2 foreign key (username) references app_user (username),
    constraint fk3 foreign key (works_at_chain, works_at_store) 
		references store (chain_name, store_name)
) ENGINE=InnoDB;

INSERT INTO drone_technician VALUES ('lchen27', 'Moss Market', 'KSU Center');
INSERT INTO drone_technician VALUES ('jhilborn97', 'Publix', 'Park Place');
INSERT INTO drone_technician VALUES ('jhilborn98', 'Publix', 'The Plaza Midtown');
INSERT INTO drone_technician VALUES ('ygao10', 'Whole Foods', 'North Avenue');
INSERT INTO drone_technician VALUES ('kfrog03', 'Sprouts', 'Piedmont');
INSERT INTO drone_technician VALUES ('cforte58', 'Query Mart', 'Tech Square');
INSERT INTO drone_technician VALUES ('fdavenport49', 'Moss Market', 'College Park');
INSERT INTO drone_technician VALUES ('hliu88', 'Publix', 'Atlanta Station');
INSERT INTO drone_technician VALUES ('akarev16', 'Whole Foods', 'North Point');
INSERT INTO drone_technician VALUES ('jdoe381', 'Kroger', 'Norcross');
INSERT INTO drone_technician VALUES ('sstrange11', "Trader Joe's", 'Owl Circle');
INSERT INTO drone_technician VALUES ('dmcstuffins7', 'Publix', 'Park Place');
INSERT INTO drone_technician VALUES ('mgrey91', 'Publix', 'The Plaza Midtown');
INSERT INTO drone_technician VALUES ('pwallace51', 'Query Mart', 'GT Center');
INSERT INTO drone_technician VALUES ('jrosario34', 'Sprouts', 'Piedmont');
INSERT INTO drone_technician VALUES ('nshea230', 'Kroger', 'Midtown');
INSERT INTO drone_technician VALUES ('mgeller3', 'Moss Market', 'College Park');
INSERT INTO drone_technician VALUES ('rgeller9', 'Publix', 'Atlanta Station');
INSERT INTO drone_technician VALUES ('jtribbiani27', 'Sprouts', 'Abbots Bridge');
INSERT INTO drone_technician VALUES ('pbuffay56', 'Wal Mart', 'Pleasant Hill');


drop table if exists manager;
create table manager (
	username varchar(20) not null,
    manages varchar(20) not null,
    primary key (username),
    constraint fk4 foreign key (username) references app_user (username),
    constraint fk5 foreign key (manages) references groc_chain (chain_name)
) ENGINE=InnoDB;

INSERT INTO manager VALUES ('rgreen97', 'Kroger');
INSERT INTO manager VALUES ('cbing101', 'Publix');
INSERT INTO manager VALUES ('pbeesly61', 'Wal Mart');
INSERT INTO manager VALUES ('jhalpert75', "Trader Joe's");
INSERT INTO manager VALUES ('dschrute18', 'Whole Foods');
INSERT INTO manager VALUES ('amartin365', 'Sprouts');
INSERT INTO manager VALUES ('omartinez13', 'Query Mart');


drop table if exists app_admin;
create table app_admin (
	username varchar(20) not null,
    primary key (username),
    constraint fk6 foreign key (username) references app_user (username)
) ENGINE=InnoDB;


INSERT INTO app_admin VALUES ('mmoss7');


drop table if exists drone;
create table drone (
	id int(3) not null,
    drone_status char(10) not null,
    zip char(5) not null,
    radius int(1) not null,
    worked_on_by varchar(20) not null,
    primary key (id),
    constraint fk7 foreign key (worked_on_by) references drone_technician (username)
) ENGINE=InnoDB;

INSERT INTO drone VALUES (103, 'Available', '30144', 3, 'lchen27');
INSERT INTO drone VALUES (114, 'Available', '30303', 8, 'jhilborn97');
INSERT INTO drone VALUES (105, 'Available', '30309', 4, 'jhilborn98');
INSERT INTO drone VALUES (106, 'Available', '30313', 6, 'ygao10');
INSERT INTO drone VALUES (117, 'Available', '30318', 9, 'kfrog03');
INSERT INTO drone VALUES (118, 'Available', '30332', 5, 'cforte58');
INSERT INTO drone VALUES (109, 'Available', '30339', 5, 'fdavenport49');
INSERT INTO drone VALUES (110, 'Available', '30363', 5, 'hliu88');
INSERT INTO drone VALUES (111, 'Busy', '30022', 5, 'akarev16');
INSERT INTO drone VALUES (102, 'Available', '30047', 7, 'jdoe381');
INSERT INTO drone VALUES (113, 'Available', '30144', 6, 'sstrange11');
INSERT INTO drone VALUES (104, 'Busy', '30303', 8, 'dmcstuffins7');
INSERT INTO drone VALUES (115, 'Available', '30309', 7, 'mgrey91');
INSERT INTO drone VALUES (116, 'Available', '30313', 3, 'pwallace51');
INSERT INTO drone VALUES (107, 'Available', '30318', 8, 'jrosario34');
INSERT INTO drone VALUES (108, 'Available', '30332', 7, 'nshea230');
INSERT INTO drone VALUES (119, 'Available', '30339', 7, 'mgeller3');
INSERT INTO drone VALUES (120, 'Available', '30363', 7, 'rgeller9');
INSERT INTO drone VALUES (101, 'Available', '30022', 5, 'jtribbiani27');
INSERT INTO drone VALUES (112, 'Busy', '30047', 6, 'pbuffay56');


drop table if exists app_order;
create table app_order (
	id int(3) not null,
    order_status char(20) not null,
    order_date date not null,
    made_by varchar(20) not null,
    delivered_by int(3),
    primary key (id),
    constraint fk8 foreign key (made_by) references customer (username),
    constraint fk9 foreign key (delivered_by) references drone (id)
) ENGINE=InnoDB;

INSERT INTO app_order VALUES (10001, 'Delivered', "2021-01-03", 'hpeterson55', 102);
INSERT INTO app_order VALUES (10002, 'Delivered', "2021-01-13", 'abernard224', 111);
INSERT INTO app_order VALUES (10003, 'Delivered',"2021-01-12", 'dbrown85', 117);
INSERT INTO app_order VALUES (10004, 'Delivered', "2021-01-16", 'dkim99', 108);
INSERT INTO app_order VALUES (10005, 'Delivered', '2021-01-21', 'dphilbin81', 103);
INSERT INTO app_order VALUES (10006, 'Delivered', '2021-01-22', 'sthefirst1', 104 );
INSERT INTO app_order VALUES (10007, 'Delivered', '2021-01-22', 'sthefirst1', 104);
INSERT INTO app_order VALUES (10008, 'Delivered', '2021-01-28', 'wbryant23', 116);
INSERT INTO app_order VALUES (10009, 'Delivered', '2021-02-01', 'hpeterson55', 112);
INSERT INTO app_order VALUES (10010, 'Delivered', '2021-02-04', 'kkapoor155', 112);
INSERT INTO app_order VALUES (10011, 'Delivered', '2021-02-05', 'aallman302', 117);
INSERT INTO app_order VALUES (10012, 'In Transit', '2021-02-14', 'vneal101', 111);
INSERT INTO app_order VALUES (10013, 'In Transit', '2021-02-14', 'sthefirst1', 104);
INSERT INTO app_order VALUES (10014, 'Drone Assigned', '2021-02-14', 'hpeterson55', 112);
INSERT INTO app_order VALUES (10015, 'Pending', '2021-02-24', 'lpiper20', null);


drop table if exists order_contains;
create table order_contains (
	order_id int(3) not null,
    item_name varchar(30) not null,
    chain_name varchar(20) not null,
    plu_number int(5) ZEROFILL not null,
    quantity int(4) not null,
    primary key (order_id, item_name, chain_name, plu_number),
    constraint fk13 foreign key (order_id) references app_order (id),
    constraint fk14 foreign key (item_name, chain_name, plu_number) 
		references chain_item(item_name, chain_name, plu_number)
) ENGINE=InnoDB;

INSERT INTO order_contains VALUES (10001,"Yogurt","Kroger",10003,4),(10001,"White Bread","Kroger",10001,1),(10001,"Carrot","Kroger",10004,10),(10001,"Coffee","Kroger",10005,1),
(10001,"Spinach","Kroger",10006,2);
INSERT INTO order_contains VALUES (10002,"Lamb Chops","Whole Foods",10002,2);
INSERT INTO order_contains VALUES (10003,"2% Milk","Sprouts",10001,2),(10003,"Yellow Curry Powder","Sprouts",10003,3),(10003,"Peanut Butter","Sprouts",10004,1);
INSERT INTO order_contains VALUES (10004,"Brown Bread","Kroger",10002,2);
INSERT INTO order_contains VALUES (10005,"Gala Apple","Moss Market",10001,6),(10005,"Fuji Apple","Moss Market",10002,2);
INSERT INTO order_contains VALUES (10006,"Peanut Butter","Publix",10002,1),(10006,"Paper Cups","Publix",10003,6),(10006,"Grape Juice","Publix",10004,2),(10006,"Roma Tomato","Publix",10005,6),(10006,"4-1 Shampoo","Publix",10006,1),(10006,"Carrot","Publix",10001,5);
INSERT INTO order_contains VALUES (10007,"4-1 Shampoo","Publix",10006,1);
INSERT INTO order_contains VALUES (10008,"Ice Cream","Query Mart",10002,1);
INSERT INTO order_contains VALUES (10009,"Bandaids","Wal Mart",10002,4);
INSERT INTO order_contains VALUES (10010,"Pepsi","Wal Mart",10004,1),(10010,"Coca-cola","Wal Mart",10003,1);
INSERT INTO order_contains VALUES (10011,"Baby Food","Sprouts",10005,3);
INSERT INTO order_contains VALUES (10012,"Grassfed Beef","Whole Foods",10001,1);
INSERT INTO order_contains VALUES (10013, "Chicken Thighs","Publix",10008,2);
INSERT INTO order_contains VALUES (10014,"Paper Plates","Wal Mart",10007,8);
INSERT INTO order_contains VALUES (10015,"Green Tea","Trader Joe's",10002,2),(10015,"Black Tea","Trader Joe's",10003,2),(10015,"Rosemary Tea","Trader Joe's",10004,2),(10015,"Earl Grey Tea","Trader Joe's",10005,2);


-- INSERT STATEMENTS BELOW

-- data for grocc_chain table
