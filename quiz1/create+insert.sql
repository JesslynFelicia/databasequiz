CREATE DATABASE LEESSHIKDANG
GO
USE LEESSHIKDANG
GO
CREATE TABLE MsCustomer (
  CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
  CustomerName VARCHAR(50) NOT NULL,
  CustomerDOB DATE NOT NULL,
  CustomerGender VARCHAR(20) NOT NULL,
  CustomerAddress VARCHAR(50) NOT NULL,
  CustomerPhone VARCHAR(13) NOT NULL,
  CustomerEmail VARCHAR(50) NOT NULL
)
CREATE TABLE MsStaff (
  StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
  StaffName VARCHAR(50) NOT NULL,
  StaffDOB DATE NOT NULL,
  StaffGender VARCHAR(20) NOT NULL,
  StaffSalary INT NOT NULL,
  StaffEmail VARCHAR(50) NOT NULL,
  StaffPhone VARCHAR(13) NOT NULL,
  StaffAddress VARCHAR(50) NOT NULL
)
CREATE TABLE MsFoodType (
    FoodTypeID CHAR(5) PRIMARY KEY CHECK(FoodTypeID LIKE 'FT[0-9][0-9][0-9]'),
    FoodTypeName VARCHAR(50) NOT NULL
)
CREATE TABLE MsFood (
    FoodID CHAR(5) PRIMARY KEY CHECK(FoodID LIKE 'FO[0-9][0-9][0-9]'),
    FoodTypeID CHAR(5) REFERENCES MsFoodType(FoodTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
    FoodName VARCHAR(50) NOT NULL,
    FoodPrice INT NOT NULL
)
CREATE TABLE HeaderTransaction (
  TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
  CustomerID CHAR(5) REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
  StaffID CHAR(5) REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
  TransactionDate DATE NOT NULL,
  PaymentType VARCHAR(30) NOT NULL
)
CREATE TABLE DetailTransaction (
  TransactionID CHAR(5) REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
  FoodID CHAR(5) REFERENCES MsFood(FoodID) ON UPDATE CASCADE ON DELETE CASCADE,
  Quantity INT NOT NULL,
  PRIMARY KEY(TransactionID, FoodID)
)
INSERT INTO MsCustomer VALUES
('CU001', 'Riko Turaga Widjaja', '24-Dec-2006', 'Male', 'Pasar Pecah Kulit Street No. 8', '08999393860', 'Harfondy@yahoo.com'),
('CU002', 'Jeremmy Wijaya', '27-Nov-1995','Male','K.H Syahdan Street No. 12A', '08984254889', 'Venz@gmail.com'),
('CU003', 'Deny Kasasa', '15-Jun-2002','Male','Teluk Gong Street No. 28', '081807191152', 'Dangkasa@yahoo.com' ),
('CU004', 'Lemon Alessandra Tan', '22-May-2004','Female', 'Kalideres Street No. 10', '08385698214', 'ChrisyAlessTan@gmail.com' ),
('CU005', 'Windy Sandra', '23-Mar-1995','Female','Pluit Putri Street 1 No. 5', '08235938751', 'Azel@yahoo.com' ),
('CU006', 'Jessica Cassanova Lim', '06-Apr-1995','Female','Permata Street 10 No. 12', '08996825465', 'JessiCaLim@gmail.com'),
('CU007', 'Kuki Lee', '06-Dec-2001', 'Male','Setia Jaya Street 1 No. 2', '08125654898', 'Kuki.Priyoga@yahoo.com' ),
('CU008', 'Ruby Ling', '26-Mar-1995','Male','Nusa Indah Timur Street No. 15A', '08568948751', 'Ruby@gmail.com' ),
('CU009', 'Stephanus Sujatmoko', '02-Sep-2001','Male','Flamboyan Street No.5C', '08563321598', 'StephenKo@gmail.com'),
('CU010', 'Andry Kurniawan', '24-Apr-2001','Male','Kedoya Akasia Street 2 No. 20', '08985692586', 'Andry.Kurniawan@yahoo.com' )
INSERT INTO MsStaff VALUES
('ST001', 'Eliza Patria', '27-Sep-2001', 'Female', 50000000, 'eliza.pat@gmail.com', '081278654379', 'Quartz Street 27 no.09 Tangerang'),
('ST002', 'Fernando Miko', '13-Mar-2001', 'Male', 45000000, 'Fernan.do123@gmail.com', '081278698625', 'Gading Gajah Street 13 no.4 Tangerang Selatan'),
('ST003', 'Tanzilia Martha', '16-Jul-1999', 'Female', 15000000, 'tanzil.a@gmail.com ', '087657621981', 'Taruna Street 1 no.2 Jakarta'),
('ST004', 'Niki Zefira', '18-Jun-1998', 'Female', 10000000, 'niki.zefanya@gmail.com', '087676121986', 'Flower Street 5 no,24 Jakarta'),
('ST005', 'Rudy Lekai', '07-Sep-1994', 'Male', 7000000, 'rudy.1234@yahoo.com', '087657621982', 'Blossom Street 4 Jakarta'),
('ST006', 'Sony Galaxy', '17-Jan-1993', 'Male', 11000000, 'sony.m.gh@gmail.com', '087897621989', 'Mutiara Street 7 no.12 Tangerang'),
('ST007', 'Fuji Mountina', '14-Jan-1998', 'Female', 6000000, 'fuji.anitnuom', '081251233678', 'Lekong Barat Street Alam Sutera'),
('ST008', 'Gaho Noran', '27-Feb-1997', 'Male', 4000000, 'gaho.yellow@gmail.com', '087657610008', 'Pancoran Street 2 Jakarta'),
('ST009', 'Biru Notred', '23-Feb-2003', 'Female', 3500000, 'biru.bukanmerah@yahoo.com', '087657621112', 'Saveria Apartment no. 112'),
('ST010', 'Rubi Bu Kanbatu', '25-Apr-1994', 'Female', 4500000, 'rubi.bu.kanbatu@yahoo.com', '087657620091', 'M3 Apartment no.228')
INSERT INTO MsFoodType VALUES
('FT001','Side Dish'),
('FT002','Noodle'),
('FT003','Regular Beef'),
('FT004','Premium Beef'),
('FT005','Pork')
INSERT INTO MsFood VALUES
('FO001', 'FT001', 'Kimchi', 0),
('FO002', 'FT001', 'Mu Saengchae', 0),
('FO003', 'FT002', 'Naengmeyon', 45000),
('FO004', 'FT002', 'Bibimyeon', 43000),
('FO005', 'FT003', 'Spicy Bulgogi', 112000),
('FO006', 'FT004', 'Bulgogi', 115000),
('FO007', 'FT004', 'Galbi', 140000),
('FO008', 'FT005', 'Wagyu Original', 165000),
('FO009', 'FT005', 'Wagyu Bulgogi', 167000),
('FO010', 'FT004', 'Samgyeopsal (Pork Belly)', 11000)
INSERT INTO HeaderTransaction VALUES
('TR001', 'CU001', 'ST001', '21-Nov-2021', 'Cash'),
('TR002', 'CU002', 'ST001', '21-Nov-2021', 'OVO'),
('TR003', 'CU003', 'ST002', '29-Dec-2021', 'Gopay'),
('TR004', 'CU004', 'ST003', '1-Nov-2022', 'OVO'),
('TR005', 'CU005', 'ST004', '2-Dec-2021', 'Cash'),
('TR006', 'CU006', 'ST005', '21-Jan-2022', 'Debit'),
('TR007', 'CU007', 'ST006', '17-Nov-2022', 'Cash'),
('TR008', 'CU008', 'ST007', '12-Nov-2021', 'Debit'),
('TR009', 'CU009', 'ST008', '18-Mar-2021', 'OVO'),
('TR010', 'CU010', 'ST009', '27-Nov-2021', 'Cash'),
('TR011', 'CU001', 'ST010', '21-Sep-2022', 'Dana'),
('TR012', 'CU002', 'ST010', '2-Feb-2022', 'Gopay'),
('TR013', 'CU003', 'ST009', '9-Nov-2021', 'Shopee Pay'),
('TR014', 'CU004', 'ST009', '5-Jan-2022', 'Shopee Pay')
INSERT INTO DetailTransaction VALUES
('TR001', 'FO001', 4),
('TR001', 'FO007', 2),
('TR003', 'FO003', 1),
('TR004', 'FO002', 2),
('TR005', 'FO004', 1),
('TR006', 'FO005', 5),
('TR007', 'FO006', 3),
('TR008', 'FO007', 2),
('TR009', 'FO008', 5),
('TR010', 'FO009', 9),
('TR011', 'FO010', 10),
('TR012', 'FO010', 6),
('TR013', 'FO003', 2),
('TR014', 'FO004', 1),
('TR002', 'FO005', 2),
('TR003', 'FO006', 6),
('TR004', 'FO007', 3),
('TR005', 'FO008', 3),
('TR006', 'FO009', 2),
('TR007', 'FO010', 2),
('TR008', 'FO010', 1)
EXEC sp_MSforeachtable 'SELECT * FROM ?'


