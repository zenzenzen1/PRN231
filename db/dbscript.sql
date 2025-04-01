-- DROP SCHEMA dbo;

create DATABASE MyDatabase
go
use MyDatabase
go

CREATE SCHEMA dbo;
-- online_manga_db.dbo.Authors definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Authors;

CREATE TABLE Authors (
	Id uniqueidentifier NOT NULL,
	SubId bigint IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Authors PRIMARY KEY (Id)
);


-- online_manga_db.dbo.Categories definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Categories;

CREATE TABLE Categories (
	Id uniqueidentifier NOT NULL,
	SubId bigint IDENTITY(1,1) NOT NULL,
	Name nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_Categories PRIMARY KEY (Id)
);


-- online_manga_db.dbo.History definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.History;

CREATE TABLE History (
	Id uniqueidentifier NOT NULL,
	[user] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	hash nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[from] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[to] nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	value nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date] datetime NULL,
	CONSTRAINT PK_History PRIMARY KEY (Id)
);


-- online_manga_db.dbo.IpUserVote definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.IpUserVote;

CREATE TABLE IpUserVote (
	MangaId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NULL,
	Rate int NULL,
	CONSTRAINT pk_my_table PRIMARY KEY (MangaId)
);


-- online_manga_db.dbo.PriceHistory definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.PriceHistory;

CREATE TABLE PriceHistory (
	Id uniqueidentifier NOT NULL,
	Price decimal(18,2) NOT NULL,
	ChangedTime datetime NOT NULL,
	CONSTRAINT PK__PriceHis__3214EC07253B9E2E PRIMARY KEY (Id)
);


-- online_manga_db.dbo.Users definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Users;

CREATE TABLE Users (
	Id uniqueidentifier NOT NULL,
	SubId bigint IDENTITY(1,1) NOT NULL,
	FullName nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Email nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	EmailConfirmed bit NOT NULL,
	Password nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PhoneNumber nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PhoneNumberConfirmed bit NOT NULL,
	AccessFailedCount int NOT NULL,
	CreatedAt datetimeoffset NULL,
	ModifiedAt datetimeoffset NULL,
	IsActive bit NOT NULL,
	Status int NOT NULL,
	Avatar nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	RoleId int NULL,
	CONSTRAINT PK_Users PRIMARY KEY (Id)
);


-- online_manga_db.dbo.Mangas definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Mangas;

CREATE TABLE Mangas (
	Id uniqueidentifier NOT NULL,
	SubId bigint IDENTITY(1,1) NOT NULL,
	AuthorId uniqueidentifier NOT NULL,
	Status int NOT NULL,
	ViewCount int NOT NULL,
	RateCount int NOT NULL,
	Star int NOT NULL,
	FollowCount int NOT NULL,
	Description nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CreatedAt datetimeoffset NULL,
	ModifiedAt datetimeoffset NULL,
	IsActive bit NOT NULL,
	[Image] nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Mangas PRIMARY KEY (Id),
	CONSTRAINT FK_Mangas_Authors FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
);


-- online_manga_db.dbo.Payment definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Payment;

CREATE TABLE Payment (
	PaymentId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	PaymentTime datetime NOT NULL,
	PriceHistoryId uniqueidentifier NOT NULL,
	CONSTRAINT PK__Payment__9B556A38AB2391AF PRIMARY KEY (PaymentId),
	CONSTRAINT FK__Payment__PriceHi__160F4887 FOREIGN KEY (PriceHistoryId) REFERENCES PriceHistory(Id),
	CONSTRAINT FK__Payment__UserId__151B244E FOREIGN KEY (UserId) REFERENCES Users(Id)
);


-- online_manga_db.dbo.ReadingHistory definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.ReadingHistory;

CREATE TABLE ReadingHistory (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	MangaId uniqueidentifier NOT NULL,
	CONSTRAINT PK_ReadingHistory PRIMARY KEY (Id),
	CONSTRAINT FK_ReadingHistory_Mangas FOREIGN KEY (MangaId) REFERENCES Mangas(Id),
	CONSTRAINT FK_ReadingHistory_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);


-- online_manga_db.dbo.UserTokens definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.UserTokens;

CREATE TABLE UserTokens (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	Email nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Expires datetime2 NOT NULL,
	Value nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_UserTokens PRIMARY KEY (UserId),
	CONSTRAINT FK_UserTokens_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);


-- online_manga_db.dbo.CategoryManga definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.CategoryManga;

CREATE TABLE CategoryManga (
	CategoryId uniqueidentifier NOT NULL,
	MangaId uniqueidentifier NOT NULL,
	SubId bigint IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK__Category__4D9BB84A04D52573 PRIMARY KEY (SubId),
	CONSTRAINT FK_CategoryManga_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	CONSTRAINT FK_CategoryManga_Mangas FOREIGN KEY (MangaId) REFERENCES Mangas(Id)
);


-- online_manga_db.dbo.Chapteres definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Chapteres;

CREATE TABLE Chapteres (
	Id uniqueidentifier NOT NULL,
	SubId bigint IDENTITY(1,1) NOT NULL,
	MangaId uniqueidentifier NOT NULL,
	ChapterNumber int NOT NULL,
	Name nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CreatedAt datetimeoffset NOT NULL,
	Status int NOT NULL,
	IsActive bit NOT NULL,
	FilePDF nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Chapteres PRIMARY KEY (Id),
	CONSTRAINT FK_Chapteres_Mangas FOREIGN KEY (MangaId) REFERENCES Mangas(Id)
);


-- online_manga_db.dbo.Comments definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Comments;

CREATE TABLE Comments (
	Id uniqueidentifier NOT NULL,
	MangaId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	Content nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedAt datetimeoffset NOT NULL,
	LikedCount int NOT NULL,
	DislikedCount int NOT NULL,
	IsActive bit NOT NULL,
	CONSTRAINT PK_Comments_1 PRIMARY KEY (Id),
	CONSTRAINT FK_Comments_Mangas FOREIGN KEY (MangaId) REFERENCES Mangas(Id),
	CONSTRAINT FK_Comments_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);


-- online_manga_db.dbo.FollowList definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.FollowList;

CREATE TABLE FollowList (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	MangaId uniqueidentifier NOT NULL,
	CONSTRAINT PK_FollowList PRIMARY KEY (Id),
	CONSTRAINT FK_FollowList_Mangas FOREIGN KEY (MangaId) REFERENCES Mangas(Id),
	CONSTRAINT FK_FollowList_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);


-- online_manga_db.dbo.Notification definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Notification;

CREATE TABLE Notification (
	Id uniqueidentifier NOT NULL,
	SubId bigint NOT NULL,
	Content nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ChapterId uniqueidentifier NOT NULL,
	Status int NOT NULL,
	IsActive bit NOT NULL,
	CONSTRAINT PK_Notification PRIMARY KEY (Id),
	CONSTRAINT FK_Notification_Chapteres FOREIGN KEY (ChapterId) REFERENCES Chapteres(Id)
);


-- online_manga_db.dbo.Pages definition

-- Drop table

-- DROP TABLE online_manga_db.dbo.Pages;

CREATE TABLE Pages (
	Id uniqueidentifier NOT NULL,
	ChapterId uniqueidentifier NOT NULL,
	[Image] nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PageNumber int NOT NULL,
	CONSTRAINT PK_Pages_1 PRIMARY KEY (Id),
	CONSTRAINT FK_Pages_Chapteres FOREIGN KEY (ChapterId) REFERENCES Chapteres(Id)
);


INSERT INTO Authors (Id,Name) VALUES
	 (N'B639C10F-B129-4AD4-BE07-4EEA2842485F',N'Kishimoto Masashi'),
	 (N'76957289-8FCB-4FB6-A42E-5625D3FFC939',N'Eiichiro Oda'),
	 (N'8EAE4958-1157-446E-AAD3-7737FE6AB669',N'Kimetsu No Yaiba'),
	 (N'2FFC2C49-4725-4E2E-9444-A4746A20FAAC',N'Akira Toriyama'),
	 (N'BDCEA30D-607B-4766-A29C-B35ED73FCEEB',N'Đang Cập Nhật');
INSERT INTO Categories (Id,Name) VALUES
	 (N'D8C7163C-1E11-48C0-98D4-16B22C812607',N'Ngôn tình'),
	 (N'6ACCC550-D475-4357-BCB9-17302ED409C4',N'Drama'),
	 (N'FD761C84-897C-4529-AEC7-7A8731EF1B90',N'Trinh thám'),
	 (N'385871E9-75B7-4CF9-9EB3-87F31D6E7BAE',N'Cổ đại'),
	 (N'2660558E-65C0-4EFD-86F8-8B84DE4B9CE4',N'Tình cảm'),
	 (N'766A75B4-6942-4B9B-AECB-BBEEAA36A4B0',N'Anime'),
	 (N'83458358-35E2-4845-BDDC-C00314040CB0',N'Đam mỹ');
INSERT INTO CategoryManga (CategoryId,MangaId) VALUES
	 (N'D8C7163C-1E11-48C0-98D4-16B22C812607',N'C109722C-24A3-4675-81F1-567F4F81BFDA'),
	 (N'6ACCC550-D475-4357-BCB9-17302ED409C4',N'C109722C-24A3-4675-81F1-567F4F81BFDA'),
	 (N'FD761C84-897C-4529-AEC7-7A8731EF1B90',N'7EE8B0A7-6C61-4988-8270-616C6479B76A'),
	 (N'385871E9-75B7-4CF9-9EB3-87F31D6E7BAE',N'7EE8B0A7-6C61-4988-8270-616C6479B76A'),
	 (N'2660558E-65C0-4EFD-86F8-8B84DE4B9CE4',N'7EE8B0A7-6C61-4988-8270-616C6479B76A'),
	 (N'385871E9-75B7-4CF9-9EB3-87F31D6E7BAE',N'F27E7C70-A2AC-48E8-B612-5C0AC99313DC'),
	 (N'2660558E-65C0-4EFD-86F8-8B84DE4B9CE4',N'F27E7C70-A2AC-48E8-B612-5C0AC99313DC'),
	 (N'766A75B4-6942-4B9B-AECB-BBEEAA36A4B0',N'F27E7C70-A2AC-48E8-B612-5C0AC99313DC'),
	 (N'385871E9-75B7-4CF9-9EB3-87F31D6E7BAE',N'1A71DC04-E0E2-495F-A878-63CCCE412641'),
	 (N'766A75B4-6942-4B9B-AECB-BBEEAA36A4B0',N'1A71DC04-E0E2-495F-A878-63CCCE412641');
INSERT INTO CategoryManga (CategoryId,MangaId) VALUES
	 (N'766A75B4-6942-4B9B-AECB-BBEEAA36A4B0',N'467DA999-9011-4F90-B9FB-488110C37879');
INSERT INTO Chapteres (Id,MangaId,ChapterNumber,Name,CreatedAt,Status,IsActive,FilePDF) VALUES
	 (N'E73A7220-705C-4C60-BD67-127475AE394D',N'467DA999-9011-4F90-B9FB-488110C37879',2,N' Chapter 2','2023-07-22 22:16:57.2812426 +07:00',2,1,N'30d3c761-c9df-443c-b527-74fbe17df44d.pdf'),
	 (N'BB8A4CCF-AAA9-4FDA-9C7C-C1F23E9E1770',N'467DA999-9011-4F90-B9FB-488110C37879',1,N' Chapter 1','2023-07-22 22:14:05.6963198 +07:00',1,1,N'dafa7191-5ec8-4add-9967-793527f23fed.pdf');
INSERT INTO Comments (Id,MangaId,UserId,Content,CreatedAt,LikedCount,DislikedCount,IsActive) VALUES
	 (N'B73E937D-7B08-4626-A9A8-64CBCA6E2B0C',N'467DA999-9011-4F90-B9FB-488110C37879',N'2164D540-49CA-45AC-B88E-F7001B82FF66',N'fff','2023-07-22 22:17:43.3718305 +07:00',0,0,1);
INSERT INTO Mangas (Id,AuthorId,Status,ViewCount,RateCount,Star,FollowCount,Description,CreatedAt,ModifiedAt,IsActive,[Image],Name) VALUES
	 (N'467DA999-9011-4F90-B9FB-488110C37879',N'2FFC2C49-4725-4E2E-9444-A4746A20FAAC',1,31,0,0,0,N'Câu truyện kể về một cậu bé tên Songoku cùng nhóm bạn của mình tham gia những chuyến phiêu lưu tìm ngọc rồng, chống lại cái ác bảo vệ trái đất. Nhân vật Songoku được mọi người ưa thích bởi tính thánh thiện và ngây ngô của mình. Câu truyện lôi cuốn người qua những tình huống phiêu lưu kì thú, những pha đấu võ đẹp mắt, và những tình huống hài hước. Dragon ball là bộ truyện tranh thuộc nhóm nổi tiếng nhất thế giới, được rất nhiều bạn trẻ ưa thích.','1999-01-01 00:00:00.0000000 +00:00','2023-07-22 22:04:49.2161270 +07:00',1,N'937dcf5e-98fd-4d14-b2a2-7178c526552e.jpg',N'7 Viên Ngọc Rồng'),
	 (N'C109722C-24A3-4675-81F1-567F4F81BFDA',N'8EAE4958-1157-446E-AAD3-7737FE6AB669',2,2,0,0,0,N'Kimetsu no Yaiba – Tanjirou là con cả của gia đình vừa mất cha. Một ngày nọ, Tanjirou đến thăm thị trấn khác để bán than, khi đêm về cậu ở nghỉ tại nhà người khác thay vì về nhà vì lời đồn thổi về ác quỷ luôn rình mò gần núi vào buổi tối. Khi cậu về nhà vào ngày hôm sau, bị kịch đang đợi chờ cậu…','2020-01-01 00:00:00.0000000 +00:00','2023-07-22 21:59:23.9324700 +07:00',1,N'3a84a426-1e7a-485a-b3bb-862971a55510.jpg',N'Onepunch Man Ngôn tình Đam mỹ 3  20 Chương 1 DORAB'),
	 (N'F27E7C70-A2AC-48E8-B612-5C0AC99313DC',N'76957289-8FCB-4FB6-A42E-5625D3FFC939',1,4,0,0,-1,N'One Piece là câu truyện kể về Luffy và các thuyền viên của mình. Khi còn nhỏ, Luffy ước mơ trở thành Vua Hải Tặc. Cuộc sống của cậu bé thay đổi khi cậu vô tình có được sức mạnh có thể co dãn như cao su, nhưng đổi lại, cậu không bao giờ có thể bơi được nữa. Giờ đây, Luffy cùng những người bạn hải tặc của mình ra khơi tìm kiếm kho báu One Piece, kho báu vĩ đại nhất trên thế giới. Trong One Piece, mỗi nhân vật trong đều mang một nét cá tính đặc sắc kết hợp cùng các tình huống kịch tính, lối dẫn truyện hấp dẫn chứa đầy các bước ngoặt bất ngờ và cũng','2000-01-01 00:00:00.0000000 +00:00','2023-07-22 22:02:21.0403353 +07:00',1,N'4b2401ef-f78e-4023-a1f5-1310aae16ab1.jpg',N'ONE PIECE'),
	 (N'7EE8B0A7-6C61-4988-8270-616C6479B76A',N'BDCEA30D-607B-4766-A29C-B35ED73FCEEB',2,3,0,0,0,N'Ta độ được 999 lần thiên kiếp Chân Hà Đồ, một du khách đến từ thế giới khác. Sau 10 năm tu luyện vẫn chỉ ở Luyện Khí kỳ (8585520/????), không biết bao giờ mới đột phá. Thiên kiếp lần 999, với người tu luyện ai nấy cũng sợ. Cho đến khi sư muội của hắn dẫn đến thì phát hiện ra... hắn thật sự rất mạnh','2021-01-01 00:00:00.0000000 +00:00','2023-07-22 22:01:18.9331192 +07:00',1,N'e067003d-353e-4b47-9de7-003cdd379c97.jpg',N'TA ĐỘ 999 LẦN THIÊN KIẾP'),
	 (N'1A71DC04-E0E2-495F-A878-63CCCE412641',N'B639C10F-B129-4AD4-BE07-4EEA2842485F',1,1,0,0,0,N'Bối cảnh Naruto xảy ra vào mười hai năm trước khi câu chuyện chính thức bắt đầu, một con hồ ly chín đuôi đã tấn công Konohagakure. Nó là một con quái vật có sức mạnh khủng khiếp, chỉ một cái vẫy từ một trong chín cái đuôi của nó có thể tạo ra những cơn sóng thần và san bằng nhiều ngọn núi. Nó gây ra sự hỗn loạn và giết chết rất nhiều người cho đến khi người đứng đầu làng Lá – Hokage đệ tứ – đã đánh bại nó bằng cách đổi lấy mạng sống của mình để phong ấn nó vào trong người một đứa trẻ mới sinh. Đứa trẻ đó tên là Uzumaki Naruto. Bộ truyện kể về cuộc hành trình đầy gian khổ với vô vàn khó khăn, thử thách của Naruto từ khi còn là một cậu bé tới khi trở thành một trong những nhẫn giả vĩ đại nhất. Không chỉ mô tả về một thế giới nhẫn giả huyền bí, Naruto còn mang trong nó nhiều ý nghĩa nhân sinh sâu sắc về tình bạn, tình đồng đội, tình yêu, ước mơ và hi vọng.
','2001-01-01 00:00:00.0000000 +00:00','2023-07-22 22:03:25.8475177 +07:00',1,N'2db45caa-730f-444a-94ca-cac668939fba.jpg',N'Naruto');
INSERT INTO Payment (PaymentId,UserId,PaymentTime,PriceHistoryId) VALUES
	 (N'87A15E17-4144-4264-8514-0290D96E6919',N'07B8AE3C-55AE-4063-9229-FDD0680DEA73','2025-05-24 17:41:00.0',N'0A14CC55-0F12-4467-9464-B6FF1FD0524A'),
	 (N'594F5D37-C992-4367-98B1-9E35651B95BD',N'FD9F24C7-4000-4383-B223-6DC525337192','2023-09-05 17:05:55.0',N'0A14CC55-0F12-4467-9464-B6FF1FD0524A'),
	 (N'5B98280A-FB5F-49E6-8765-A7E0552D5828',N'338CE33C-74BB-4731-AED8-A8A49B0867D9','2025-03-20 15:54:38.883',N'0A14CC55-0F12-4467-9464-B6FF1FD0524A');
INSERT INTO PriceHistory (Id,Price,ChangedTime) VALUES
	 (N'0A14CC55-0F12-4467-9464-B6FF1FD0524A',20000.00,'2025-01-01 00:00:00.0');
INSERT INTO UserTokens (Id,UserId,Email,Expires,Value) VALUES
	 (N'E202A209-13BC-4FCB-86DB-0185D573DBBB',N'E202A209-13BC-4FCB-86DB-0185D573DBB8',N'user1@gmail.com','2025-04-06 10:41:00.0000000',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMjAyYTIwOS0xM2JjLTRmY2ItODZkYi0wMTg1ZDU3M2RiYjgiLCJ1c2VybmFtZSI6InVzZXIxIiwiZW1haWwiOiJ1c2VyMUBnbWFpbC5jb20iLCJyb2xlIjoiVXNlck5vcm1hbCIsImlwQWRkcmVzcyI6IjQyLjExNy4yMzUuMTQzIiwiZXhwIjoxNzQ1MDQxOTM4LCJpc3MiOiJtYW5nYW9ubGluZSIsImF1ZCI6Im1hbmdhb25saW5lIn0.I01rPOuQArcFkRzdU0B1Gh7-txWFoCKtNPJAl95nMYA'),
	 (N'ACF4BD30-60CD-450A-A272-6300E9D2419C',N'2EF75AFD-96E6-4B60-8C11-2F79849CF703',N'lsb45230@zslsz.com','2023-08-20 09:12:50.7354900',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyZWY3NWFmZC05NmU2LTRiNjAtOGMxMS0yZjc5ODQ5Y2Y3MDMiLCJ1c2VybmFtZSI6IlZhbiBUcmFpIENodSIsImVtYWlsIjoibHNiNDUyMzBAenNsc3ouY29tIiwicm9sZSI6IlVzZXJOb3JtYWwiLCJpcEFkZHJlc3MiOiIxMTcuNS4yMTIuOTQiLCJleHAiOjE2OTI2MjgwMDUsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.keyAk-BERcKFj8rkyWPopo9gWqKI5jK7cl4gsawF05w'),
	 (N'B07B67A5-1D17-498B-992D-66F5E15A2D99',N'FD9F24C7-4000-4383-B223-6DC525337192',N'gqf85455@nezid.com','2023-08-18 10:05:55.4227190',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmZDlmMjRjNy00MDAwLTQzODMtYjIyMy02ZGM1MjUzMzcxOTIiLCJ1c2VybmFtZSI6IjEyMyAxMjM0IDQ1NiIsImVtYWlsIjoiZ3FmODU0NTVAbmV6aWQuY29tIiwicm9sZSI6IlVzZXJWaXAiLCJpcEFkZHJlc3MiOiIxMTcuNS4yMTIuOTQiLCJleHAiOjE2OTI2MTcyNDQsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.TfIpZx6NJM7DNEe3jCqnE4GTEtg6ksUhJtFBGOvoi7k'),
	 (N'2382737A-946C-4AB1-AFB0-9F82725918DB',N'EF20386B-2335-4F65-87B2-819E1AEF6612',N'enm55606@nezid.com','2024-07-14 08:22:56.1360013',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZjIwMzg2Yi0yMzM1LTRmNjUtODdiMi04MTllMWFlZjY2MTIiLCJ1c2VybmFtZSI6InRyYWljdiIsImVtYWlsIjoiZW5tNTU2MDZAbmV6aWQuY29tIiwicm9sZSI6IlVzZXJOb3JtYWwiLCJpcEFkZHJlc3MiOiIxMTcuNS4yMTIuOTQiLCJleHAiOjE2OTI2MTcxOTAsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.RHrg7vSqLy-mOl4mA5Y7Ge_yAyI25OqpvPvZYAV_K_I'),
	 (N'17645A4D-DCE6-4FC8-9D5E-19A840486133',N'338CE33C-74BB-4731-AED8-A8A49B0867D9',N'user@gmail.com','2025-04-06 10:41:00.4124302',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMzhjZTMzYy03NGJiLTQ3MzEtYWVkOC1hOGE0OWIwODY3ZDkiLCJ1c2VybmFtZSI6IiIsImVtYWlsIjoidXNlckBnbWFpbC5jb20iLCJyb2xlIjoiVXNlck5vcm1hbCIsImlwQWRkcmVzcyI6IjQyLjExNy4yMzUuMTQzIiwiZXhwIjoxNzQ1MDUwOTEwLCJpc3MiOiJtYW5nYW9ubGluZSIsImF1ZCI6Im1hbmdhb25saW5lIn0.rf23-h5AIwX43nsHA1LeUFpqPlJtvt259Jc6ghi8ocA'),
	 (N'2544AE0E-F2F0-4668-A65D-403305380D7A',N'21599756-8BB3-4CE5-8DFC-C8C5A1F462BE',N'admin@gmail.com','2025-04-06 10:41:00.5563222',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMTU5OTc1Ni04YmIzLTRjZTUtOGRmYy1jOGM1YTFmNDYyYmUiLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpcEFkZHJlc3MiOiI0Mi4xMTcuMjM1LjE0MyIsImV4cCI6MTc0NTA1MzE5OSwiaXNzIjoibWFuZ2FvbmxpbmUiLCJhdWQiOiJtYW5nYW9ubGluZSJ9.VFdIper6f4Grl3s1C_uTnQLdjb2JlcLfgBNjNBHZ-_A'),
	 (N'6F72CD6D-BC69-4B90-9AFE-AFE28D8EEF0C',N'2164D540-49CA-45AC-B88E-F7001B82FF66',N'djn74003@zslsz.com','2024-08-02 07:32:45.8984768',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMTY0ZDU0MC00OWNhLTQ1YWMtYjg4ZS1mNzAwMWI4MmZmNjYiLCJ1c2VybmFtZSI6InRyYWljdiIsImVtYWlsIjoiZGpuNzQwMDNAenNsc3ouY29tIiwicm9sZSI6IkFkbWluIiwiaXBBZGRyZXNzIjoiMTE3LjUuMjEyLjk0IiwiZXhwIjoxNjkyNjMwNTk1LCJpc3MiOiJtYW5nYW9ubGluZSIsImF1ZCI6Im1hbmdhb25saW5lIn0.NZv-Wax78kByn-1LniK-MaE09V4dDqeibbID2Vv3crk'),
	 (N'4BA6C04A-2608-43E8-9BDC-0E9726ED2AFA',N'07B8AE3C-55AE-4063-9229-FDD0680DEA73',N'vipuser@gmail.com','2025-04-06 10:41:00.5556113',N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwN2I4YWUzYy01NWFlLTQwNjMtOTIyOS1mZGQwNjgwZGVhNzMiLCJ1c2VybmFtZSI6IiIsImVtYWlsIjoidmlwdXNlckBnbWFpbC5jb20iLCJyb2xlIjoiVXNlclZpcCIsImlwQWRkcmVzcyI6IjQyLjExNi40MS4xNDgiLCJleHAiOjE3NDM5MzYxNzEsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.B1z9oERykrXqCW5w5l0ABoJpdS-FDAsFP3LMTIDQuE4');
INSERT INTO Users (Id,FullName,Email,EmailConfirmed,Password,PhoneNumber,PhoneNumberConfirmed,AccessFailedCount,CreatedAt,ModifiedAt,IsActive,Status,Avatar,RoleId) VALUES
	 (N'E202A209-13BC-4FCB-86DB-0185D573DBB8',N'user1',N'user1@gmail.com',1,N'$2a$10$Fb5MLrnPXLZrkgkVQNWhxOS9BucOag1fq5fQvQJZZ5xvZI.hXg1fy',NULL,1,0,'2025-03-07 17:41:00.4110000 +00:00','2025-03-07 17:41:00.4110000 +00:00',1,0,NULL,2),
	 (N'2EF75AFD-96E6-4B60-8C11-2F79849CF703',N'Van Trai Chu',N'lsb45230@zslsz.com',1,N'$2a$10$uXPEMwv6wA0Ev61TeaD25.CaPsvcNSRroS1RWAl6RqwA.UYwb6Im6',N'0362351671',1,0,'2023-07-21 16:12:50.7350663 +07:00','2023-07-21 16:13:12.9354063 +07:00',1,0,N'8f49658d-8f6e-47b5-9982-51ed49bc21ea.png',2),
	 (N'FD9F24C7-4000-4383-B223-6DC525337192',N'123 1234 456',N'gqf85455@nezid.com',1,N'$2a$10$.9qj6qzj6V/OdU4F8ez7IOZBm8GqEuyQEsVupQ24bvNnTAvD3bU8S',N'0213456789',1,0,'2023-07-19 17:05:55.4223665 +07:00','2023-07-19 17:06:24.9506041 +07:00',1,0,NULL,3),
	 (N'EF20386B-2335-4F65-87B2-819E1AEF6612',N'traicv',N'enm55606@nezid.com',1,N'$2a$10$wFJohcnCB4WbPREwYvSHiumPdowhVcu4EB4.ZJAUOhf6Vu2YQif0m',N'1234567890',1,0,'2023-06-14 15:22:56.1352367 +07:00','2023-06-14 16:07:04.0387130 +07:00',1,0,NULL,2),
	 (N'338CE33C-74BB-4731-AED8-A8A49B0867D9',N'',N'user@gmail.com',1,N'$2a$10$CXC1fxVipGSXUnb2tkTOwOo2diagtbn5e3g.fjdvXXmlxFqr.PuDy',NULL,1,0,'2025-03-07 17:41:00.3102210 +07:00','2025-03-07 17:41:00.3102248 +07:00',1,0,NULL,3),
	 (N'21599756-8BB3-4CE5-8DFC-C8C5A1F462BE',N'admin',N'admin@gmail.com',1,N'$2a$10$t0RljQwlwrCxa7jeGpJXoOGOTGNV1R6egPNNjGvKoLpV42rQUXLby',NULL,1,0,'2025-03-07 17:41:00.2058367 +07:00','2025-03-07 17:41:00.2058990 +07:00',1,0,NULL,1),
	 (N'2164D540-49CA-45AC-B88E-F7001B82FF66',N'traicv',N'djn74003@zslsz.com',1,N'$2a$10$QQeP/bGJWW0WVg7mG2UQXOATionGp2X8vF8pr4OC1v7YsxROQSNrW',N'1234567890',1,0,'2023-06-14 15:46:27.3331169 +07:00','2023-06-14 15:46:27.3332403 +07:00',1,0,NULL,1),
	 (N'07B8AE3C-55AE-4063-9229-FDD0680DEA73',N'',N'vipuser@gmail.com',1,N'$2a$10$Fb5MLrnPXLZrkgkVQNWhxOS9BucOag1fq5fQvQJZZ5xvZI.hXg1fy',NULL,1,0,'2025-03-07 17:41:00.4119505 +07:00','2025-03-07 17:41:00.4119538 +07:00',1,0,NULL,3);
