CREATE DATABASE [LeagueShop]
GO
USE [LeagueShop]
GO
--CREATE TABLE
CREATE TABLE MsCard(
	CardID CHAR(5) PRIMARY KEY CHECK(CardID LIKE 'CD[0-9][0-9][0-9]'),
	CardName VARCHAR(25) NOT NULL,
	CardHealth INT NOT NULL,
	CardPower INT NOT NULL,
	CardPrice INT NOT NULL
)
GO
CREATE TABLE MsUser(
	UserID CHAR(5) PRIMARY KEY CHECK(UserID LIKE 'UR[0-9][0-9][0-9]'),
	UserName VARCHAR(15) NOT NULL,
	UserEmail VARCHAR(20) NOT NULL,
	UserGender VARCHAR(10) NOT NULL,
	UserDateOfBirth DATE NOT NULL
)
GO
CREATE TABLE MsSupplier(
	SupplierID CHAR(5) PRIMARY KEY CHECK (SupplierID LIKE 'SP[0-9][0-9][0-9]'),
	SupplierName VARCHAR(15) NOT NULL,
	SupplierEmail VARCHAR(20) NOT NULL,
	SupplierGender VARCHAR(10) NOT NULL
)
GO
CREATE TABLE HeaderTransaction(
	TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	UserID CHAR(5) FOREIGN KEY REFERENCES MsUser(UserID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SupplierID CHAR(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL
)
GO
CREATE TABLE DetailTransaction(
	TransactionID CHAR(5) FOREIGN KEY REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CardID CHAR(5) FOREIGN KEY REFERENCES MsCard(CardID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL
	PRIMARY KEY(TransactionID, CardID)
)


--INSERT DATA

-- MsCard
INSERT INTO MsCard VALUES
	('CD001', 'Azir', 5, 1, 30000),
	('CD002', 'Renekton', 4, 4, 40000),
	('CD003', 'Teemo', 1, 1, 10000),
	('CD004', 'Diana', 2, 2, 20000),
	('CD005', 'Leblanc', 2,5, 25000),
	('CD006', 'Miss Fortune', 3, 3, 35000),
	('CD007', 'Braum', 5, 0, 20000),
	('CD008', 'Hecarim', 5, 5, 50000),
	('CD009', 'Nasus', 2, 2, 60000),
	('CD010', 'Aurelion Sol', 10, 10, 100000),
	('CD011', 'Tryndamere', 4, 8, 80000),
	('CD012', 'Malphite', 10, 6, 75000),
	('CD013', 'Heimerdinger', 3,1 , 55000)

--MsUser
INSERT INTO MsUser VALUES
	('UR001', 'Jojo', 'jojo221@binus.com', 'Male', '02/27/2002'),
	('UR002', 'Adam', 'adamas@binus.com', 'Male', '12/10/2001'),
	('UR003', 'Adelia', 'adelia92@binus.com', 'Female', '02/09/2001'),
	('UR004', 'Josephine', 'josepin32@binus.com', 'Female', '11/21/2001'),
	('UR005', 'Jessica', 'jess128@binus.com', 'Female', '12/23/1997'),
	('UR006', 'Della', 'deldel123@binus.com', 'Female', '08/07/1992'),
	('UR007', 'Timmy', 'timitimot@binus.com', 'Male', '08/17/1998')

--MsSupplier
INSERT INTO MsSupplier VALUES
	('SP001' , 'Ika', 'ikaika@gmail.com', 'Female'),
	('SP002' , 'Fajar', 'ekafajr@gmail.com', 'Male'),
	('SP003' , 'Simon', 'simisimi@gmail.com', 'Male'),
	('SP004' , 'Stephanie', 'stephie21@gmail.com', 'Female'),
	('SP005' , 'Ical', 'calical@gmail.com', 'Male'),
	('SP006' , 'Christine', 'christ213@gmail.com', 'Female')

--HeaderTransaction
INSERT INTO HeaderTransaction VALUES
	('TR001','UR002', 'SP001', '05/02/2021'),
	('TR002','UR002', 'SP003', '05/02/2021'),
	('TR003','UR001', 'SP002', '09/12/2021'),
	('TR004','UR003', 'SP004', '11/27/2020'),
	('TR005','UR004', 'SP001', '12/25/2020'),
	('TR006','UR005', 'SP002', '06/22/2020'),
	('TR007','UR006', 'SP004', '02/07/2021'),
	('TR008','UR001', 'SP005', '12/02/2021'),
	('TR009','UR005', 'SP006', '01/13/2021'),
	('TR010','UR004', 'SP002', '02/22/2021'),
	('TR011','UR002', 'SP003', '03/12/2021'),
	('TR012','UR004', 'SP001', '01/18/2021'),
	('TR013','UR001', 'SP005', '04/19/2020')

-- DetailTransaction
SELECT * FROM DetailTransaction
INSERT INTO DetailTransaction VALUES
	('TR001', 'CD001', 3),
	('TR001', 'CD002', 2),
	('TR001', 'CD003', 2),
	('TR001', 'CD004', 1),
	('TR002', 'CD003', 2),
	('TR002', 'CD005', 4),
	('TR002', 'CD001', 5),
	('TR003', 'CD001', 3),
	('TR003', 'CD012', 3),
	('TR003', 'CD010', 4),
	('TR003', 'CD009', 5),
	('TR003', 'CD004', 1),
	('TR003', 'CD007', 1),
	('TR004', 'CD002', 2),
	('TR004', 'CD012', 2),
	('TR005', 'CD013', 1),
	('TR005', 'CD009', 3),
	('TR005', 'CD011', 2),
	('TR006', 'CD010', 2),
	('TR007', 'CD007', 1),
	('TR008', 'CD011', 3),
	('TR008', 'CD001', 5),
	('TR008', 'CD005', 4),
	('TR009', 'CD002', 1),
	('TR010', 'CD003', 3),
	('TR010', 'CD008', 5),
	('TR010', 'CD012', 2),
	('TR011', 'CD009', 1),
	('TR011', 'CD010', 1),
	('TR012', 'CD006', 5),
	('TR013', 'CD012', 2)

