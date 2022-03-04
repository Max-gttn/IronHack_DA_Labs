DROP TABLE invoices;
SELECT * FROM customers;

INSERT INTO invoices VALUES ROW(0, 852399038, str_to_date("22-08-2018",'%d-%m-%Y'), 0, 1, 3)
	,ROW(NULL,731166526,str_to_date('31-12-2018','%d-%m-%Y'),3,0,5)
    ,ROW(NULL,271135104,str_to_date('22-01-2019','%d-%m-%Y'),2,2,7)
    ;

INSERT INTO cars VALUES ROW(0, '3K096I98581DHSNUP', 'Volkswagen','Tiguan','2019', 'Blue')
	,ROW(NULL,'ZM8G7BEUQZ97IH46V', 'Peugeot','Rifter	','2019', 'Red')
    ,ROW(NULL,'RKXVNNIHLVVZOUB4M', 'Ford','Fusion','2018', 'White')
    ,ROW(NULL,'HKNDGS7CU31E9Z7JW', 'Toyota','RAV4','2018', 'Silver')
    ,ROW(NULL,'DAM41UDN3CHU2WVF6', 'Volvo','V60','2019', 'Gray')
    ,ROW(NULL,'DAM41UDN3CHU2WVF6', 'Volvo','V60 Cross Country	','2019', 'Gray')
    ;
    
INSERT INTO customers VALUES ROW(0, '10001', 'Pablo Picasso','+34 636 17 63 82',NULL, 'Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045)
	,ROW(NULL, '20001', 'Abraham Lincoln','+1 305 907 7086',NULL, '120 SW 8th St','Miami','Florida','United States',33130)
    ,ROW(NULL, '30001', 'Napoléon Bonaparte','+33 1 79 75 40 00',NULL, '40 Rue du Colisée','Paris','Île-de-France	','France',75008)
    ;

INSERT INTO salesPersons VALUES ROW(NULL, '00001', 'Petey Cruiser','Madrid')
	,ROW(NULL,'00002', 'Anna Sthesia','Barcelona')
    ,ROW(NULL,'00003', 'Paul Molive	','Berlin')
    ,ROW(NULL,'00004', 'Gail Forcewind','Paris')
    ,ROW(NULL,'00005', 'Paige Turner','Mimia')
    ,ROW(NULL,'00006', 'Bob Frapples','Mexico City')
	,ROW(NULL,'00007', 'Walter Melon','Amsterdam')
    ,ROW(NULL,'00008', 'Shonda Leer','São Paulo')
    ;
