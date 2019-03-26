<?php

CREATE TABLE income(
	guest_receipt_no varchar(20),
	amount decimal(12,2),
	income_type varchar(6),
	PRIMARY KEY(guest_receipt_no)
);

CREATE TABLE expense(
	expense_statement_id varchar(20),
	expense_type varchar(20),
	expense_date Date,
	amount decimal(12,2),
	PRIMARY KEY(expense_statement_id)
);

CREATE TABLE room(
	room_no varchar(20) NOT NULL UNIQUE,
	rent decimal(12,2),
	room_type varchar(20),
	reservation boolean,
	occupency boolean,

	PRIMARY KEY(room_no)
);

CREATE TABLE guest_takes(
	guest_id varchar(20) NOT NULL UNIQUE,
	arrival_date Date,
	departure_date Date,
	room_no varchar(20),
	guest_receipt_no varchar(20),
	PRIMARY KEY(guest_id),
	FOREIGN KEY(room_no) REFERENCES room(room_no),
	FOREIGN KEY(guest_receipt_no) REFERENCES income(guest_receipt_no)
);

CREATE TABLE guest(
	guest_id varchar(20),
	name varchar(20),
	address varchar(20),
	phone_no varchar(12),
	nid_no varchar(15),
	merital_status boolean,

	FOREIGN KEY(guest_id) REFERENCES guest_takes(guest_id)
);

CREATE TABLE room_service(
	expense_id varchar(20),
	room_no varchar(20),
	service_charge decimal(12,2),
	vat_amount decimal(12,2),
	discount decimal(12,2),
	received decimal(12,2),
	balance decimal(12,2),
	remarks varchar(20),

	PRIMARY KEY(expense_id),
	FOREIGN KEY(room_no) REFERENCES room(room_no),

	FOREIGN KEY(expense_id) REFERENCES
	expense(expense_statement_id)
);

CREATE TABLE service_charge(
	room_no varchar(20),
	expense_id varchar(20),
	Telephone_bill numeric(12,2),
    Car_bill numeric(12,2),
    Laundry_bill numeric(12,2),
    HonorBar_bill numeric(12,2),
    Food_bill numeric(12,2),

    FOREIGN KEY(room_no) REFERENCES room(room_no),
    FOREIGN KEY(expense_id) REFERENCES
	expense(expense_statement_id)
);

CREATE TABLE granter(
	granter_id varchar(20),
	granter_name varchar(20), 
    granter_phoneNo decimal(12,2),
    granter_address varchar(20),

    PRIMARY KEY(granter_id)
);

CREATE TABLE employee(
    name varchar(20),
    employee_iD varchar(20),
    NID varchar(15),
    contact_no varchar(12),
    salary numeric(12,2),
    address varchar(30),
    granter_id  varchar(20),
    Employee_Account_No numeric(12,2),
    PRIMARY KEY(Employee_ID),

    expense_id varchar(30),
    FOREIGN KEY(expense_id) REFERENCES expense(Expense_Statement_ID),

    FOREIGN KEY(granter_id) REFERENCES granter(granter_id)
);   

?>