create database Assign3Db
use Assign3Db

----part 01-----

create table CompanyInfo(
CId int primary key,
CName nvarchar(50) not null
)

create table ProductInfo(
PId int primary key identity(101,1),
PName nvarchar(50) not null,
PPrice float,
PMDate  Date,
CId int foreign key references CompanyInfo
)
insert into CompanyInfo(CId,CName)values (1,'Samsung'),(2,'HP'),(3,'Apple'),(4,'Dell'),
(5,'Toshiba'),(6,'Redmi')

select * from CompanyInfo order by CId

insert into ProductInfo values 
('Laptop',55000.90,'12/12/2023',1),
('Laptop',35000.90,'12/12/2012',2),
('Mobile',15000.90,'12/03/2012',2),
('Laptop',135000.90,'12/12/2012',3),
('Mobile',65000.90,'12/12/2012',3),
('Laptop',35000.90,'12/01/2012',5),
('Mobile',35000.90,'12/01/2012',5),
('Earpod',1000.90,'12/01/2022',3),
('Laptop',85000.90,'12/12/2021',6),
('Mobile',50000.70,'12/12/2020',1)

select * from ProductInfo order by PId

select c.CName as CompanyName,p.PId,p.PName as ProductName,p.PPrice,p.PMDate from
CompanyInfo c join ProductInfo p on c.CId = P.CId

select p.PName as ProductName , c.CName as CompanyName from ProductInfo p join CompanyInfo c on 
p.CId = c.CId

select c.CName as CompanyName,p.PId, p.PName as ProductName ,p.PPrice,p.PMDate from CompanyInfo
c cross join ProductInfo p

-------------part 02--------------

create table Products(PId int primary key,PQ int ,PPrice float,
Discount Decimal(5,2))

insert into Products(PId,PQ,PPrice,Discount) values
(100,9,1200.50,10.15),
(101,25,25000.90,21.30),
(102,45,85000.60,25.00)

select * from Products

create function fnDiscvalue(
@Price float ,
@Discount float
)
returns float
as 
begin
declare @DiscountedValue float;
set @DiscountedValue = @Price - (@Price * (@Discount/100.0))
return @DiscountedValue
end

select PId,PPrice Price,Discount,dbo.fnDiscvalue(PPrice,Discount) as 'Price After Discount' 
from Products

