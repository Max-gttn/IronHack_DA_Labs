USE lab_mysql;
CREATE TABLE invoices (id int AUTO_INCREMENT PRIMARY KEY, invoice_number VARCHAR(20), date date, VIN varchar(20), customerID varchar(20), staffID varchar(20));
CREATE TABLE cars (id int AUTO_INCREMENT PRIMARY KEY, VIN VARCHAR(20), manufacturer text, model text, year year, color text);
CREATE TABLE customers (id int AUTO_INCREMENT PRIMARY KEY, customerID VARCHAR(20), name text, phone varchar(20), email text, address text, city text, state text, country text, zip int);
CREATE TABLE salesPersons (id int AUTO_INCREMENT PRIMARY KEY, staffID VARCHAR(20), name text, store text);