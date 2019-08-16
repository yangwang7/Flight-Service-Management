USE Flight_Service_Test;

CREATE SCHEMA Group1;
GO


CREATE TABLE Group1.Passenger
(
	PassengerID INT IDENTITY NOT NULL PRIMARY KEY,
	PassportID VARBINARY(250)  NOT NULL,
	Gender VARCHAR(45)  NOT NULL,
	BirthDate DATE NOT NULL,
	FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL,
	EmailID INT 
		REFERENCES Group1.Email(EmailID)
)

alter table Group1.Passenger alter column PassportID VARCHAR(250);
CREATE TABLE Group1.Email
(
	EmailID INT IDENTITY NOT NULL PRIMARY KEY,
	EmailAddress VARCHAR(45)  NOT NULL
)

CREATE TABLE Group1.Address
(
	AddressID INT IDENTITY NOT NULL PRIMARY KEY,
	City VARCHAR(45)  NOT NULL,
	Country VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL
)

CREATE TABLE Group1.PassengerAddress
(
	AddressID INT NOT NULL
		REFERENCES Group1.Address(AddressID),
	PassengerID INT NOT NULL
		REFERENCES Group1.Passenger(PassengerID)
)

CREATE TABLE Group1.EmployeeEmail
(
	EmployeeID INT NOT NULL
		REFERENCES Group1.Employee(EmployeeID),
	EmailID INT NOT NULL
		REFERENCES Group1.Email(EmailID)
)

CREATE TABLE Group1.Flight
(
	FlightID INT IDENTITY NOT NULL PRIMARY KEY,
	AirplaneID INT NOT NULL
		REFERENCES Group1.Airplane(AirplaneID),
	ArrivalAirportID INT NOT NULL
		REFERENCES Group1.Airport(AirportID),
	DepartTime DATETIME NOT NULL,
	ArriveTime DATETIME NOT NULL,
	DepartureAirportID INT NOT NULL
		REFERENCES Group1.Airport(AirportID)
)

CREATE TABLE Group1.Airport
(
	AirportID INT IDENTITY NOT NULL PRIMARY KEY,
	Name VARCHAR(45) NOT NULL,
	AddressID INT NOT NULL
		REFERENCES Group1.Address(AddressID)
)

CREATE TABLE Group1.Employee
(
	EmployeeID INT IDENTITY NOT NULL PRIMARY KEY,
	PhoneNumber VARCHAR(45) NOT NULL,
	HireDate DATE NOT NULL,
	FirstName VARCHAR(45) NOT NULL,
	LastName VARCHAR(45) NOT NULL
)

CREATE TABLE Group1.FlightEmployee
(
	FlightID INT NOT NULL
		REFERENCES Group1.Flight(FlightID),
	EmployeeID INT NOT NULL
		REFERENCES Group1.Employee(EmployeeID)
)

CREATE TABLE Group1.Promotion
(
	PromotionID INT IDENTITY NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Discount INT NOT NULL
)

CREATE TABLE Group1.Ticket
(
	TicketID INT IDENTITY NOT NULL PRIMARY KEY,
	FlightID INT NOT NULL
		REFERENCES Group1.Flight(FlightID),
	Price MONEY NOT NULL,
	PassengerID INT NOT NULL
		REFERENCES Group1.Passenger(PassengerID),
)


INSERT INTO Group1.Passenger (PassportID,Gender,BirthDate,FirstName,LastName,EmailID) VALUES 
	('NO456767','Female','2013-04-02','kelly','Wu',1),
	('NO456762','Male','2003-04-12','kelly','Wang',2),
	('NO456769','Female','2012-06-10','Lily','Zhang',3),
	('NO456789','Female','2006-12-02','Miya','Song',4),
	('NO456734','Male','2011-06-22','Cathy','Li',5),
	('NO126767','Female','2003-04-02','Joslin','Green',6),
	('NO346762','Male','2008-08-12','olivia','Chen',7),
	('NO566769','Female','2002-06-21','livia','Su',8),
	('NO786789','Female','2006-12-02','lucy','Zhang',9),
	('NO786734','Male','2011-07-22','yang','Lin',10);

INSERT INTO Group1.Email(EmailAddress) VALUES 
	('abc45@gmail.com'),
	('kkth@gmail.com'),
	('zmee@hotmail.com'),
	('lbyykk@gmail.com'),
	('lob@163.com'),
	('kli567@gmail.com'),
	('zlucy@gmail.com'),
	('livia@hotmail.com'),
	('yang@gmail.com'),
	('js@163.com');

INSERT INTO Group1.Address(City,Country,Address) VALUES
	('seattle','USA','Minor Ave N'),
	('New York','USA','8th Ave'),
	('New York','USA','w 46th'),
	('seattle','USA','9th Ave'),
	('seattle','USA','Broadway'),
	('seattle','USA','JamesSt'),
	('seattle','USA','MadisonSt'),
	('California','USA','Lake Ave'),
	('California','USA','Sonoma Ave'),
	('seattle','USA','10th Ave');

INSERT INTO Group1.Flight(AirplaneID,ArrivalAirportID,DepartTime,ArriveTime,DepartureAirportID)
VALUES(1, 1, '2019-03-21 10:00:00', '2019-03-21 13:00:00', 2),
			 (2, 2, '2019-03-22 10:00:00', '2019-03-22 13:00:00', 3),
			 (3, 3, '2019-03-23 10:00:00', '2019-03-23 13:00:00', 4),
			 (4, 4, '2019-03-24 10:00:00', '2019-03-24 13:00:00', 5),
			 (5, 5, '2019-03-25 10:00:00', '2019-03-25 13:00:00', 6),
			 (6, 6, '2019-03-26 10:00:00', '2019-03-26 13:00:00', 7),
			 (7, 7, '2019-03-27 10:00:00', '2019-03-27 13:00:00', 8),
			 (8, 8, '2019-03-28 10:00:00', '2019-03-25 13:00:00', 9),
			 (9, 9, '2019-03-29 10:00:00', '2019-03-29 13:00:00', 10),
			 (10, 10, '2019-03-30 10:00:00', '2019-03-30 13:00:00', 1);

INSERT Group1.Airport(Name,AddressID)
VALUES('Vancouver International Airport', 1),
			 ('Toronto Pearson International Airport', 2),
			 ('Pittsburgh International Airport', 3),
			 ('Chicago Midway International Airport', 4),
			 ('Los Angeles International Airport', 5),
			 ('San Francisco International Airport', 6),
			 ('John Kennedy International Airport', 7),
			 ('Seattle Tacoma International Airport', 8),
			 ('Orlando International Airport ', 9),
			 ('Portland International Airport', 10);
			
INSERT Group1.Employee(PhoneNumber,HireDate,FirstName,LastName)
VALUES('7781234567', '2017-09-01', 'Harry', 'Potter'),
			 ('4161234567', '2017-09-02', 'Ron', 'Weasley'),
			 ('4121234567', '2017-09-03', 'Hermione', 'Granger'),
			 ('8471234567', '2017-09-04', 'Draco', 'Malfoy'),
			 ('2131234567', '2017-09-05', 'Severus', 'Snape'),
			 ('4151234567', '2017-09-06', 'Sirius', 'Black'),
			 ('2121234567', '2017-09-07', 'James', 'Potter'),
			 ('2061234567', '2017-09-08', 'Remus', 'Lupin'),
			 ('4071234567', '2017-09-09', 'Cedric', 'Diggory'),
			 ('2081234567', '2017-09-10', 'Viktor', 'Krum');
	
INSERT  Group1.Ticket (FlightID,Price,PassengerID) VALUES 
	(6,3445,1)，
	(6,3445,2),
	(6,3445,3),
	(7,3880,4),
	(7,3880,5),	
	(8,4000,6),
	(8,4000,7),
	(9,3945,8),
	(10,6445,9),
	(18,2345,4),
	(11,2000,10);

INSERT  Group1.Ticket (FlightID,Price,PassengerID) VALUES 
	(6,4000,2),
	(7,5870,1),
	(5,8760,3),
	(4,2345,4);
	
CREATE TABLE Group1.AirlineCompany
(
	AirlineCompanyID INT IDENTITY NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Group1.Airplane
(	
	AirplaneID INT IDENTITY NOT NULL PRIMARY KEY,
	AirlineCompanyID INT NOT NULL
		REFERENCES Group1.AirlineCompany(AirlineCompanyID),
	AirplaneType VARCHAR(50) NOT NULL
)

CREATE TABLE Group1.TicketPromotion
(
	TicketID INT NOT NULL
		REFERENCES Group1.Ticket(TicketID),
	PromotionID INT NOT NULL
		REFERENCES Group1.Promotion(PromotionID)
)

INSERT Group1.Promotion(Name,Discount)
	VALUES('NewYear', 20),
			('HalfPrice', 50),
			('Valentine', 30),
			('Vip', 15),
			('VVIP', 20),
			('Employee', 30),
			('Partner', 15),
			('Clearence', 70),
			('Baby', 60),
			('Child', 40);

INSERT Group1.AirlineCompany(Name)
	VALUES('Delta'),
		('AmericanAirlines'),
		('SouthwestAirlines'),
		('UnitedAirlines'),
		('FrontierAirlines'),
		('JetBlue'),
		('AlaskaAirlines'),
		('HawaiianAirlines'),
		('SpiritAirlines'),
		('VirginAmerica');

INSERT Group1.Airplane(AirlineCompanyID,AirplaneType)
	VALUES(1, 'BoeingB747'),
		(2, 'BoeingB777'),
		(3, 'BoeingB787'),
		(4, 'BoeingB787'),
		(5, 'BoeingB777'),
		(6, 'BoeingB777'),
		(7, 'BoeingB747'),
		(8, 'BoeingB787'),
		(9, 'BoeingB747'),
		(10, 'BoeingB787'),
		(1, 'BoeingB787'),
		(2, 'BoeingB787'),
		(1, 'BoeingB727'),
		(5, 'BoeingB727'),
		(6, 'BoeingB787');

INSERT Group1.TicketPromotion  (TicketID,PromotionID) VALUES 
(4,3),(5,1),(6,2),(7,8),(8,3),(9,6),(10,5),(11,4),(12,6),(13,5);

INSERT Group1.PassengerAddress(AddressID,PassengerID) VALUES 
(2,5),(1,3),(3,7),(4,6),(5,5),(6,4),(7,3),(8,2),(9,1),(10,8);

INSERT Group1.FlightEmployee (FlightID,EmployeeID) VALUES 
(6,4),(7,3),(8,2),(9,1),(10,5),(11,7),(12,6),(13,8),(14,9),(15,10);
	
INSERT Group1.EmployeeEmail(EmployeeID,EmailID) VALUES 
(2,8),(1,9),(3,7),(4,6),(5,5),(6,4),(7,3),(8,2),(9,1),(10,10);


SELECT * FROM Group1.Ticket
----- SaleRank View ------

CREATE VIEW Group1.vwSalesRankInfo2
	AS
	SELECT ac.AirlineCompanyID, ac.Name, SUM(ISNULL(t.DiscountedPrice, t.Price))[TotalSale], 
		RANK() OVER (ORDER BY SUM(ISNULL(t.DiscountedPrice, t.Price)) DESC) AS 'Rank'
	FROM Group1.Ticket t
	INNER JOIN Group1.Flight f ON t.FlightID = f.FlightID
	INNER JOIN Group1.Airplane a ON f.AirplaneID = a.AirplaneID
	INNER JOIN Group1.AirlineCompany ac ON a.AirlineCompanyID = ac.AirlineCompanyID
	GROUP BY ac.AirlineCompanyID, ac.Name

SELECT * FROM Group1.vwSalesRankInfo2;

DROP VIEW Group1.vwSalesRankInfo2;	
	

----- View for front desk to inquire passengers' flights ----- 

CREATE VIEW Group1.vw_FrontDeskQuery
AS
SELECT pa.PassengerID, t.TicketID, f.FlightID, ac.Name AS "Company Name", f.AirplaneID, f.DepartTime, f.ArriveTime
FROM TingtingFu_test.Group1.Passenger pa 
JOIN Group1.Ticket t
ON t.PassengerID = pa.PassengerID
JOIN Group1.Flight f
ON f.FlightID = t.FlightID
JOIN Group1.Airplane ape
ON ape.AirplaneID = f.AirplaneID
JOIN Group1. AirlineCompany ac
ON ac.AirlineCompanyID = ape.AirlineCompanyID

SELECT * FROM Group1.vw_FrontDeskQuery;

DROP VIEW Group1.vw_FrontDeskQuery;


----- Table-level CHECK Constraints based on a function ----- 

CREATE FUNCTION Group1.CheckPromotion(@dis INT)
RETURNS SMALLINT
AS
BEGIN
	DECLARE @res SMALLINT = 0
	IF @dis > 80
	BEGIN 
		SET @res = 1
	END
	RETURN @res;
END

ALTER TABLE Group1.Promotion ADD CONSTRAINT Ban80 CHECK (Group1.CheckPromotion(Discount) = 0);

INSERT Group1.Promotion(Name,Discount)
	VALUES('Other', 90)  --to test the CHECK

--------------------------
select * from Group1.Passenger;


----- Computed column to calculate the price after discount ----- 

CREATE FUNCTION Group1.fn_CalcDiscountedPrice(@TID INT)
RETURNS INT
AS
BEGIN
	DECLARE @DiscountedPrice INT = 
		(
			SELECT (pro.Discount * t.Price / 100) 
			FROM Group1.Promotion pro
			JOIN Group1.TicketPromotion tp
			ON pro.PromotionID = tp.PromotionID
			JOIN Group1.Ticket t
			ON t.TicketID = tp.TicketID
			WHERE t.TicketID = @TID
		);
	RETURN @DiscountedPrice;
END

ALTER TABLE Group1.Ticket
ADD DiscountedPrice AS (Group1.fn_CalcDiscountedPrice(TicketID));

SELECT TOP 10 * FROM Group1.Ticket ORDER BY DiscountedPrice DESC

ALTER TABLE Group1.Ticket DROP COLUMN DiscountedPrice;

DROP FUNCTION Group1.fn_CalcDiscountedPrice;


----- Encryption Group1.Passenger.PassportID -----
-- Encrypt Table Columns
-- Demo different data types

-- Create DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'Group1 test certificate',
EXPIRY_DATE = '2026-10-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

insert into Group1.Passenger (PassPortID,Gender,BirthDate,FirstName,LastName,EmailID)
values 
(EncryptByKey(Key_GUID(N'TestSymmetricKey'),  'NO123456'),'Female','2014-09-07','Fang','Li','10');
select * from Group1.Passenger;


-- Use DecryptByKey to decrypt the encrypted data and see what we have in the table
select FirstName,LastName, DecryptByKey(PassPortID)
from Group1.Passenger;

-- Close the symmetric key
CLOSE SYMMETRIC KEY TestSymmetricKey;

-- Drop the symmetric key
DROP SYMMETRIC KEY TestSymmetricKey;

-- Drop the certificate
DROP CERTIFICATE TestCertificate;

--Drop the DMK
DROP MASTER KEY;

USE Master;

SELECT * FROM Group1.Passenger




