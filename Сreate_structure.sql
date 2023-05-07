CREATE DATABASE CreateStructure;

USE	CreateStructure;


create table SKU(
    id int identity primary key,
	Code AS ('s' + CONVERT(nvarchar(23),id)) UNIQUE,
	Name varchar(50) NOT NULL

);


create table Family(
  id int identity primary key,
  SurName varchar(50) NOT NULL, 
  BudgetValue decimal


);


create  table Basket(
  id int identity primary key,
  ID_SKU int,
  ID_Family int ,
  Quantity int CHECK(Quantity>0), 
  Value int CHECK(Value>0),
  PurchaseDate datetime DEFAULT GETDATE(), 
  DiscountValue int,
  
  foreign key(ID_SKU)  references SKU(id) ON DELETE CASCADE ON UPDATE CASCADE,
  
  foreign key(ID_Family)  references Family(id) ON DELETE CASCADE ON UPDATE CASCADE,
);



insert into SKU(Name) 
values
('wood'),
('gadjet');