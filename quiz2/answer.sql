USE LeagueShop

--1
CREATE table MsStaff(
StaffID CHAR (5) PRIMARY KEY CHECK (StaffID like 'ST[0-9][0-9][0-9]'),
StaffName VARCHAR (20) NOT NULL,
StaffPosition VARCHAR(50) NOT NULL CHECK (StaffPosition in ('Manager','Accountant','Technical Staff'))
)

--SELECT * FROM MsStaff


--2
ALTER TABLE MsSupplier
ADD SupplierPhoneNumber VARCHAR (15)

ALTER TABLE MsSupplier
ADD CONSTRAINT checker CHECK (SupplierPhoneNumber like '+62%')

--SELECT * FROM MsSupplier

--3
INSERT INTO MsCard VALUES ('CD014','Irelia',2,3,35000)
--select * FROM MsCard where cardid = 'cd014'

--4
SELECT UserName, UserEmail,UserGender
FROM MsUser
WHERE year(UserDateOfBirth)=2001 

--5
UPDATE MsUser
SET UserGender = 'Male'
FROM MsUser,HeaderTransaction
WHERE MsUser.UserID = HeaderTransaction.UserID
and SupplierID = 'SP004'

--SELECT * FROM MSUSER

