USE LEESSHIKDANG

--1
select CustomerID,CustomerName,CustomerGender
from mscustomer
where len(customername) < 15

--2
select MsStaff.StaffID,StaffName,TransactionDate
from msstaff
join headertransaction
on  headertransaction.staffid =msstaff.staffid
where datename(month,transactiondate) = 'December'

--3
select msstaff.StaffID,StaffName,
[Total Transaction]=cast(count(headertransaction.transactionid)  as varchar) + ' Transaction'
from MsStaff
join headertransaction
on  headertransaction.staffid =msstaff.staffid
where StaffName like '% % %'
group by msstaff.StaffID,StaffName

--4
select [StaaffID]= stuff(msstaff.staffid,1,4,'Staff '),
	[StaffName]='Mr. ' + cast(staffname as varchar),
	[AverageFoodPrice]=avg(foodprice), 
	[TotalTransaction]=count(headertransaction.transactionid) 
from msstaff 
join headertransaction
on  headertransaction.staffid =msstaff.staffid
join detailtransaction
on headertransaction.transactionid = detailtransaction.transactionid
join msfood
on msfood.FoodID = DetailTransaction.FoodID
where StaffGender LIKE 'male' and FoodTypeID LIKE 'FT004'
group by msstaff.staffid,staffname

union

select [StaffID]= stuff(msstaff.staffid,1,4,'Staff '),
	[StaffName]='Ms. ' + cast(staffname as varchar),
	[AverageFoodPrice]=avg(foodprice), 
	[TotalTransaction]=count(headertransaction.transactionid) 
from msstaff 
join headertransaction
on  headertransaction.staffid =msstaff.staffid
join detailtransaction
on headertransaction.transactionid = detailtransaction.transactionid
join msfood
on msfood.FoodID = DetailTransaction.FoodID
where StaffGender LIKE 'female' and FoodTypeID LIKE 'FT002'
group by msstaff.staffid,staffname

--5
select headertransaction.TransactionID,FoodName,PaymentType +' '+ cast(year(transactiondate) as varchar) as PaymentType
from HeaderTransaction
join DetailTransaction
on HeaderTransaction.TransactionID = DetailTransaction.TransactionID
join MsFood
on DetailTransaction.FoodID = MsFood.FoodID
join msfoodtype
on msfood.foodtypeid = msfoodtype.foodtypeid
where FoodTypename in ('Pork','Premium Beef') and PaymentType in ('OVO','Gopay')


--6
select [Customer ID]=replace(mscustomer.CustomerID,'CU','Customer '),
[Handle by] = stuff(msstaff.staffid,1,4,'Staff '),
[FoodPrice] = concat('Rp. ' , cast(FoodPrice as varchar)),
FoodName,Quantity
from MsCustomer
join HeaderTransaction
on MsCustomer.CustomerID = HeaderTransaction.CustomerID
join DetailTransaction 
on DetailTransaction.TransactionID = HeaderTransaction.TransactionID
join MsFood
on DetailTransaction.FoodID = MsFood.FoodID
join MsStaff
on HeaderTransaction.StaffID = MsStaff.StaffID
where Quantity > 2 
group by replace(mscustomer.CustomerID,'CU','Customer '),
stuff(msstaff.staffid,1,4,'Staff ')
,FoodPrice,
foodname,Quantity
having FoodPrice = 
(select max(a) from( select foodprice as a
from MsFood
)as b)

--7
create view [ViewTransactionInEvenDay]
as
select mscustomer.customerid,foodid,transactiondate,paymenttype,cast(quantity as varchar) + ' Items' as Quantity
from MsCustomer
join HeaderTransaction
on HeaderTransaction.CustomerID = MsCustomer.CustomerID
join DetailTransaction
on HeaderTransaction.TransactionID = DetailTransaction.TransactionID
where day(transactiondate) %2 = 0 

--8
create view [ViewTransaction]
as
select StaffEmail,TransactionDate, sum (quantity) as [Total Food Sold]
from MsStaff
join HeaderTransaction
on MsStaff.StaffID = HeaderTransaction.StaffID
join DetailTransaction
on HeaderTransaction.TransactionID = DetailTransaction.TransactionID
where StaffEmail like '%@yahoo%' 
group by  StaffEmail,TransactionDate
having sum(quantity) > 1

--9
alter table msstaff add StaffPosition varchar(25)
alter table msstaff add constraint a check (staffposition like 'Manager'  or staffposition like 'Cashier' or staffposition like 'waiter')

select * from msstaff

--10
delete from MsCustomer 
from MsCustomer
join headertransaction
on headertransaction.customerid = mscustomer.customerid
join DetailTransaction
on HeaderTransaction.TransactionID = DetailTransaction.TransactionID
where Quantity> 2 and datename(month,TransactionDate) like 'February' 

select * from MsCustomer