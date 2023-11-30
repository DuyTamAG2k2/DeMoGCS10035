use [master]
go 
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'FPTBook2')
	BEGIN
		-- Database exists. Drop it
		Drop database FPTBook2
	END
ELSE
	BEGIN
		-- Database does not exist. Create it
		create database FPTBook2
	END
GO

use FPTBook2
go

create table tblCategory
(
   catID int identity(1, 1) primary key,
   catName nvarchar(50) not null unique,
   catDetails nvarchar(300) null
)
go

create table tblStoreOwner
(
	ownerID varchar(20) not null primary key,
	ownerPassWord varchar(30) not null,
	ownerName nvarchar(30) not null,
	ownerAddress nvarchar(50) not null,
	ownerPhone varchar(12) null,
	ownerTaxCode varchar(12) null,
	ownerDetails nvarchar(300) null
)
go

create table tblPublisher
(
	publisherID int identity(1, 1) not null primary key,
	publisherName nvarchar(30) not null unique,
	publisherAddress nvarchar(50) null,
	publisherDetails nvarchar(300) null
)
go

create table tblAuthor
(
	authorID varchar(5) not null primary key,
	authorName nvarchar(30) not null,
	authorAdress nvarchar(50) null,
	authorEmail varchar(30) null
)
go

create table tblBook
(
	bookID varchar(10) not null primary key,
	bookTitle nvarchar(30) not null,
	bookPrice int not null default(10),
	bookDetailes nvarchar(500) null,
	bookImagel1 varchar(30) null,
	bookImagel2 varchar(30) null,
	bookImagel3 varchar(30) null,
	bookImagel4 varchar(30) null,
	bookImagel5 varchar(30) null,
	catID int not null,
	ownerID varchar(20) not null,
	publisherID int not null,
	constraint fk_catID foreign key(catID) references tblCategory(catID),
	constraint fk_ownerID foreign key(ownerID) references tblStoreOwner(ownerID),
	constraint fk_publisherID foreign key(publisherID) references tblPublisher(publisherID)
)
go

create table tblBookAuthor
(
	bookID varchar(10) not null,
	authorID varchar(5) not null,
	details nvarchar(300) null,
	constraint pk_bookauthor primary key (bookID, authorID),
	constraint fk_bookID foreign key (bookID) references tblBook(bookID),
	constraint fk_authorID foreign key (authorID) references tblAuthor(authorID)
)
go

create table tblCustomer
(
	customerEmail varchar(20) not null primary key,
	customerPassword varchar(300) not null,
	customerFullname nvarchar(30) not null,
	customerAddress nvarchar(30) null,
	customerPhone varchar(12) null,
	customerPhoto varchar(30) null,
)
go
select*from tblBook
go


  -- add data
insert into tblPublisher (publisherName) 
values (N'Kim Dong'), (N'Giao Duc'), (N'Phuong Nam'), (N'Ha Noi')
go

insert into tblCategory (catName)
values (N'Information Technology'), (N'Children'), (N'Science'), (N'Business')
go

insert into tblStoreOwner (ownerID, ownerPassword, ownerName, ownerAddress)
values (N'SO123', '123456', N'Cửa hàng Thành Phát', N'12 Hai Bà Trưng'),
       (N'SO456', '123456', N'Phương Nam BookStore', N'56 Lý Thường Kiệt'),
	   (N'SO789', '123456', N'Ngọc Mai BookStore', N'245 Hùng Vương')
go
insert into tblBook (bookID, bookTitle, bookPrice, bookDetailes, catID, publisherID, ownerID)
values ('B0001', N'ASP.NET Core MVC', 350, 'book01.jpg', 1, 3, 'SO123'),
       ('B0002', N'C# Programming', 200, 'book02.jpg', 1, 2, 'SO456'),
	   ('B0003', N'Thinking in Java', 150, 'book03.jpg', 1, 1, 'SO789'),
	   ('B0004', N'Microsoft SQL Server 2023', 300, 'book04.jpg', 1, 1, 'SO123'),
	   ('B0005', N'Laravel Framework in Action', 370, 'book05.jpg', 1, 3, 'SO456'),
	   ('B0006', N'AI with Python ', 450, 'book06.jpg', 1, 2, 'SO789'),
	   ('B0007', N'Marchine Learning in PyThon', 480, 'book07.jpg', 1, 2, 'SO123')
go
