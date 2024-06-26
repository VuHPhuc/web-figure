CREATE DATABASE SieuThi;
GO
USE [SieuThi]
GO
/** Total Fix: 23 **/
/****** Object:  Table [dbo].[tb_Accounts]    Script Date: 10/1/2023 2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](6) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Categories]    Script Date: 10/1/2023  2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Categories](
	[CatlID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](150) NULL,
	[Desciption] [nvarchar](max) NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NOT NULL,
	[Thumb] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Cover] [nvarchar](250) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_Categories] PRIMARY KEY CLUSTERED 
(
	[CatlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Customers]    Script Date: 10/1/2023 2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Birhday] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](100) NULL,
	[Phone] [varchar](12) NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tb_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_News]    Script Date: 10/1/2023  2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_News](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[SContents] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Alias] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Author] [nvarchar](250) NULL,
	[AccountID] [int] NULL,
	[Tags] [nvarchar](max) NULL,
	[CatlID] [int] NULL,
	[isHot] [bit] NULL,
	[isNewfeed] [bit] NULL,
	[MetaKey] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[Views] [int] NULL,
 CONSTRAINT [PK_tb_TinTuc] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_OrderDetaills]    Script Date: 10/1/2023 2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_OrderDetaills](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_tb_OrderDetaills] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Orders]    Script Date: 10/1/2023 2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[TotalMoney] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[PaymentDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Pages]    Script Date: 10/1/2023 2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_tb_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Products]    Script Date: 10/1/2023  2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[ShortDesc] [nvarchar](250) NULL,
	[Desciption] [nvarchar](max) NULL,
	[CatllD] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](250) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NOT NULL,
	[HomeFlag] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[UnitslnStock] [int] NULL,
 CONSTRAINT [PK_tb_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Roles]    Script Date: 10/1/2023  2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Desciption] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TransactStatus]    Script Date: 10/1/2023 2:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_TrangThai] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Accounts] ON 

INSERT [dbo].[tb_Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES 
(1, N'0945645564', N'tenkono69@gmail.com', N'28092002', NULL, 1, N'Vũ Hồng Phúc', 1, CAST(N'2023-05-22T08:18:55.653' AS DateTime), CAST(N'2023-03-17T00:00:00.000' AS DateTime));
SET IDENTITY_INSERT [dbo].[tb_Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Categories] ON 

INSERT [dbo].[tb_Categories] ([CatlID], [CatName], [Desciption], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES 
(1, N'Gundam', N'Mô Hình Gundam', 124, 1, N'hoa-qua.jpeg', N'Gundam', N'Gundam', N'Gundam', N'Gundam', NULL, N'123'),
(2, N'Scale Figure', N'Mô Hình Scale', 123, 1, N'rau-cu.jpeg', N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', NULL, N'1234');
SET IDENTITY_INSERT [dbo].[tb_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Customers] ON 

INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES 
(34, N'Vũ Phúc', CAST(N'2002-09-23T00:00:00.000' AS DateTime), N'Hà Nội', N'tenkono69@gmail.com', N'0866719363', CAST(N'2023-04-09T11:56:14.013' AS DateTime), N'e586612283bdf38c8261352d11703b44', N'x!u4z     ', NULL, 1),
(32, N'Xuân Nam', CAST(N'2023-04-14T00:00:00.000' AS DateTime), N'Hà Nội', N'nam@email.com', N'8667193634', CAST(N'2023-04-11T12:02:23.053' AS DateTime), N'430399605998e25faf47aae30b14490e', N'6:7ji     ', NULL, 1),
(33, N'Đào Tùng', CAST(N'2023-05-19T00:00:00.000' AS DateTime), N'Hà Nội', N'tung@gmail.com', N'018271251', CAST(N'2023-05-05T10:19:55.950' AS DateTime), N'a124844e4262ee2a501ac7fe13a51255', N'i0!%[     ', NULL, 1),
(31, N'Văn Dũng', CAST(N'2023-05-18T00:00:00.000' AS DateTime), N'Hà Nội', N'dung@gmail.com', N'0124214124', CAST(N'2023-05-12T20:34:31.650' AS DateTime), N'95d66a2b0977ce298e6924261d0242d1', N'4q+wg     ', NULL, 1),
(30, N'Hoàng Hiệp', CAST(N'2023-05-20T00:00:00.000' AS DateTime), N'Hà Nội', N'hiep@gmail.com', N'0124214124', CAST(N'2023-05-12T20:34:31.650' AS DateTime), N'95d66a2b0977ce298e6924261d0242d1', N'4q+wS     ', NULL, 1);
SET IDENTITY_INSERT [dbo].[tb_Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_News] ON 

INSERT [dbo].[tb_News] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatlID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES 
(1, N'Các Chủng Loại Figure', N'Có Bao Nhiêu Loại Figure', N'<p style="overflow-wrap: break-word; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; hyphens: auto; color: rgb(0, 0, 0); line-height: 1.625em; font-size: 18px; text-align: justify; font-family: &quot;Times New Roman&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif !important;"> 1.Scale figure <br> Scale figure là những mô hình figure phỏng theo chính xác hình dáng/ tư thế/ màu sắc của nhân vật trong phim, truyện, game... và được thu nhỏ theo 1 tỉ lệ nhất định. </p><p style="overflow-wrap: break-word; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; hyphens: auto; color: rgb(0, 0, 0); line-height: 1.625em; font-size: 18px; text-align: justify; font-family: &quot;Times New Roman&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif !important;"> 2.Action figure <br> Action Figure là những mô hình động, chúng cử động được, thay đổi tư thế được nhờ vào các khớp trên cơ thể, cổ, vai, cùi chỏ, cổ tay, hông, háng, đầu gối, cổ chân... Và thậm chí là tóc cũng có khớp luôn nha.</p> <p>3.Chibi figure <br> Chibi Figure là những figure hiểu đơn giản là ĐẦU TO - thân nhỏ. Chúng không được chế tác theo tỉ lệ truyền thống của nhân vật trong phim, của con người bình thường. Phần đầu luôn có xu hướng nở ra, bự hơn phần thân nhầm mang lại vẻ ngoài ngộ nghĩnh, dễ cưng cho nhân vật. Rất nhiều người ưa chuộng dòng figure này không chỉ bởi tạo hình đặc biệt, mà còn bị hấp dẫn bởi tính nhỏ gọn, dễ lưu trữ và thậm chí dễ thay đổi khuôn mặt và tạo nhiều tư thế khác nhau. </p>', N'figure_type.jpg', 1, N'Chủng Loại Figure', CAST(N'2023-03-31T00:00:00.000' AS DateTime), N'Vũ Hồng Phúc', NULL, N'figure_type', 1, 1, 1, N'figure_type', N'figure_type', 1),
(2, N'Cách bảo quản mô hình figure PVC', N'Bảo quản và vệ sinh mô hình figure PVC có thể giúp giữ cho nó trông mới và tốt hơn trong nhiều năm.', N'<p>-	Tránh ánh nắng trực tiếp: Ánh nắng trực tiếp có thể làm cho mô hình figure PVC bị mài mòn hoặc bị màu sắc biến đổi. Hãy đặt mô hình figure PVC trong một vị trí tránh ánh nắng trực tiếp. <br> - Tránh ẩm ướt: Ẩm ướt có thể làm cho mô hình figure PVC bị mối mọt và hư hại. Hãy đặt mô hình figure PVC trong một vị trí khô ráo và tránh đặt gần nguồn nước. Sử dụng chất tẩy rửa mềm: Sử dụng chất tẩy rửa mềm để lau chùi mô hình figure PVC. <br> -Tránh sử dụng chất tẩy rửa cứng hoặc chất tẩy rửa có chứa alcohol vì nó có thể làm hư hại cho mô hình. <br> - Bảo vệ khi di chuyển: Khi di chuyển mô hình figure PVC, hãy bảo vệ nó bằng vật bảo vệ hoặc túi để tránh va đập hoặc hư hại. <br> - Chỉ sửa chữa khi cần thiết: Nếu mô hình figure PVC bị hư hại, hãy chỉ sửa chữa khi cần thiết và sử dụng các công cụ và chất liệu phù hợp. Tránh sử dụng các công cụ cắt hoặc thủ công quá mạnh vì nó có thể làm hư hại cho mô hình. <br> - Chỉ sử dụng các phụ kiện phù hợp: Nếu sử dụng các phụ kiện cho mô hình figure PVC, hãy chỉ sử dụng các phụ kiện phù hợp và có chất lượng tốt để tránh hư hại.</p>', N'Figure_safety.jpg', 1, N'Cách bảo quản mô hình figure PVC', CAST(N'2023-04-01T13:54:33.000' AS DateTime), N'Vũ Hồng Phúc', NULL, N'Cách bảo quản mô hình figure PVC', 1, 1, 1, N'Cách bảo quản mô hình figure PVC', N'Cách bảo quản mô hình figure PVC', 2),
(3, N'TOP 4 HÃNG FIGURE CHẤT LƯỢNG ĐỈNH NHẤT Ở NHẬT', N'Với bài viết mới này, JK Figure đã tổng hợp những hãng sản xuất Figure Nhật Bản nổi tiếng nhất và giải thích mọi thứ bạn cần biết về loại Figure chính mà họ sản xuất', N'<p><span style="color: rgb(51, 48, 46); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 15px; text-align: justify;">1. Tập đoàn Bandai Namco <br> Là nhà sản xuất đồ chơi lớn thứ ba trên thế giới (sau Mattel và Hasbro của Mỹ) và tập đoàn này sở hữu và phân phối một số lượng đáng kể giấy phép cho đồ chơi và hàng loạt Figure của Nhật Bản: SH Figuarts, các mô hình Gundam và Gashapon <br> 2.  MegaHouse <br> Được thành lập vào năm 1962, MegaHouse là viết tắt của “Make, Enjoy, Global, Ability” và hãng sản xuất Figure được biết đến nhiều nhất với nhiều loạt mô hình Look Up và GEM. <br> 3. The Good Smile Company <br> Hãng sản xuất Figure với tên gọi rất vui vẻ là Good Smile Company chủ yếu được biết đến với loạt Action Figure Nendoroid (bao gồm Nendoroid More, Plus, Petite và Playset với tổng cộng vài trăm nhân vật), đặc biệt là có một số điểm cử động khớp cũng như vài phiên bản của mặt và phụ kiện, để cho phép người chơi thay đổi các biểu cảm và tạo các cảnh tượng khác nhau. <br> 4. Max Factory <br> Max Factory là hãng sản xuất Figma - một dạng mô hình có khớp nối, (được tạo ra vào năm 2008) cho phép các nhân vật có thể thay đổi nhiều tư thế. Mỗi Figma đều đi kèm với các phụ kiện khác nhau như mặt và tay có thể hoán đổi và các bộ phận tùy chọn khác để cho phép tạo ra các tư thế khác nhau. Các hình này cao khoảng 13-16cm và được làm bằng ABS và PVC với một cánh tay nhỏ có khớp nối kết nối chúng với đế để giữ Figma cân bằng.  </p>', N'figure_best.jpg', 1, N'Top 4 Công Ty', CAST(N'2023-04-01T13:55:07.000' AS DateTime), N'Nguyễn Văn Dũng', NULL, N'Top 4 Công Ty', 1, 1, 1, N'Top 4 Công Ty', N'Top 4 Công Ty', 3);
SET IDENTITY_INSERT [dbo].[tb_News] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_OrderDetaills] ON 

INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES 
(1, 2, 22, NULL, 1, NULL, 20000, CAST(N'2023-04-15T11:12:09.207' AS DateTime), 20000),
(2, 3, 22, NULL, 1, NULL, 20000, CAST(N'2023-04-15T11:15:58.680' AS DateTime), 20000),
(3, 4, 22, NULL, 4, NULL, 80000, CAST(N'2023-04-21T08:09:31.230' AS DateTime), 20000),
(4, 5, 1, NULL, 1, NULL, 20000, CAST(N'2023-04-21T14:28:34.123' AS DateTime), 20000),
(5, 6, 1, NULL, 3, NULL, 60000, CAST(N'2023-05-05T10:22:09.067' AS DateTime), 20000),
(6, 7, 22, NULL, 2, NULL, 40000, CAST(N'2023-05-12T20:35:38.887' AS DateTime), 20000),
(7, 8, 1, NULL, 3, NULL, 60000, CAST(N'2023-05-15T13:50:28.013' AS DateTime), 20000),
(8, 9, 1, NULL, 5, NULL, 100000, CAST(N'2023-05-22T08:15:57.910' AS DateTime), 20000);
SET IDENTITY_INSERT [dbo].[tb_OrderDetaills] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Orders] ON 

INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES 
(2, 30, CAST(N'2023-04-15T11:12:09.050' AS DateTime), NULL, 4, 0, 1, 20000, NULL, CAST(N'2023-05-22T08:19:13.663' AS DateTime)),
(3, 30, CAST(N'2023-04-15T11:15:58.670' AS DateTime), NULL, 1, 0, 0, 20000, N'Hà Nội', NULL),
(4, 30, CAST(N'2023-04-21T08:09:31.117' AS DateTime), CAST(N'2023-04-21T10:07:54.540' AS DateTime), 5, 1, 1, 80000, N'Hà Nội', CAST(N'2023-04-21T10:08:15.543' AS DateTime)),
(5, 30, CAST(N'2023-04-21T14:28:34.043' AS DateTime), NULL, 1, 0, 0, 20000, N'Hà Nội', NULL),
(6, 31, CAST(N'2023-05-05T10:22:08.987' AS DateTime), NULL, 1, 0, 0, 60000, NULL, NULL),
(7, 32, CAST(N'2023-05-12T20:35:38.823' AS DateTime), NULL, 1, 0, 0, 40000, NULL, NULL),
(8, 32, CAST(N'2023-05-15T13:50:27.813' AS DateTime), NULL, 1, 0, 0, 60000, N'Hà Nội', NULL),
(9, 32, CAST(N'2023-05-22T08:15:57.653' AS DateTime), NULL, 4, 0, 1, 100000, N'Hà Nội', CAST(N'2023-05-22T08:20:13.810' AS DateTime));
SET IDENTITY_INSERT [dbo].[tb_Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Pages] ON 

INSERT [dbo].[tb_Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateDate], [Ordering]) VALUES 
(1, N'Hướng Dẫn Mua Hàng', N'<div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px; color: rgb(18, 22, 25); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 12px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">1. Tìm kiếm sản phẩm</span></h3></div><div class="hc_box__body" style="color: rgb(18, 22, 25); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 12px;"><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Có 3 cách để tìm kiếm sản phẩm:</span><br><ul style="margin-bottom: 1rem;"><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px;">Cách 1:&nbsp;</span><span style="font-size: 14px;">Nhập URL sản phẩm vào thanh tìm kiếm.</span></span></li><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119); font-size: 14px;">Cách 2: Tìm kiếm theo danh mục sản phẩm</span></li><li><span style="color: rgb(104, 112, 119); font-size: 14px; line-height: 24px;">Cách 3: Tìm kiếm theo từ khóa/ từ khóa phổ biến.</span></li><li><span style="color: rgb(104, 112, 119); font-size: 14px; line-height: 24px;"><div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px; color: rgb(18, 22, 25); font-size: 12px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">2. Đặt hàng</span></h3></div><div class="hc_box__body" style="color: rgb(18, 22, 25); font-size: 12px;"><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Khi bạn tìm thấy một mặt hàng bạn muốn mua, hãy kiểm tra thông tin chi tiết của mặt hàng: tình trạng hàng hóa, hình ảnh, giá cả, người bán và thời gian giao hàng ước tính.</span></span></p><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Nếu bạn hài lòng với mặt hàng sau đó nhập đầy đủ thông tin đặt hàng theo yêu cầu như: số lượng, màu sắc, kích thước,...</span></span></p><p style="margin-bottom: 1rem; color: rgb(18, 22, 25); background-color: rgb(242, 244, 248);"><span style="color: rgb(0, 0, 0);"><span style="font-size: 18px;"><span style="font-weight: 700;">2.1 Chọn địa chỉ nhận hàng</span></span><span style="font-size: 0.75rem;"><br></span></span></p><div class="row" style="margin-right: -12px; margin-left: -12px; background-color: rgb(242, 244, 248);"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><span style="font-size: 14px; color: rgb(0, 0, 0);">B<span style="color: rgb(104, 112, 119); line-height: 24px;">ạn điền đầy đủ vào các thông tin sau:</span></span><br><ul style="margin-bottom: 1rem;"><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119); font-size: 14px;">Quốc gia.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Mã Zipcode.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Bang/Tỉnh/Thành Phố.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Thành Phố.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Địa chỉ chi tiết.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Họ và tên.</span></li><li><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Số điện thoại.</span></span></li></ul></div><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"><span style="color: rgb(0, 0, 0);"><img src="https://cdn.ezbuy.jp/image/default/2021/9/20/20210920085331.png" alt="" width="90%" height="" style="max-width: 100%; float: right;"></span><br><br></div></div><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;"><br style="color: rgb(18, 22, 25); font-size: 12px; background-color: rgb(242, 244, 248);"><span style="font-size: 12px; background-color: rgb(242, 244, 248); color: rgb(0, 0, 0);"><span style="font-size: 18px;"><span style="font-weight: 700;">2.2&nbsp; Chọn phương thức thanh toán<br><br></span></span><span style="font-size: 14px; line-height: 24px; color: rgb(104, 112, 119);">Bạn chọn một trong số các phương thức thanh toán sau:</span></span><span style="color: rgb(18, 22, 25); font-size: 12px; background-color: rgb(242, 244, 248);"></span></span></span></p><div class="row" style="margin-right: -12px; margin-left: -12px; background-color: rgb(242, 244, 248);"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><ul style="margin-bottom: 1rem;"><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Paypal.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Ví Janbox.</span></li><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px;">Visa/Mastercar</span></span></li><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px;"><div class="hc_box bg_light" style="border: 1px solid rgb(221, 225, 230); padding: 24px; margin: 0px 0px 24px; color: rgb(18, 22, 25); font-size: 12px;"><div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">3. Thanh toán</span></h3></div><div class="hc_box__body"><p style="margin-bottom: 1rem;"><span style="font-size: 18px; color: rgb(0, 0, 0);"><span style="font-weight: 700;">3.1 Kiểm tra đơn hàng&nbsp;</span></span></p><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119); font-size: 14px;"><span style="font-weight: 700;"><span style="line-height: 24px;">* Bạn cần chọn và kiểm tra đơn hàng trước khi thanh toán:</span></span></span></p><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Chọn gói dịch vụ gia tăng:</span><br><ul style="margin-bottom: 1rem; line-height: 22px;"><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Gói cơ bản</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Gói tiêu chuẩn.</span></li><li><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Gói bổ sung.</span></li></ul><span style="font-size: 14px; line-height: 22px; color: rgb(0, 0, 0);"><a href="https://janbox.com/vi/help/phi-goi-165" class="color_blue" style="color: rgb(0, 0, 0); transition: color 0.3s ease 0s;">→ Gói dịch vụ tại Janbox</a></span></div><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"><span style="color: rgb(0, 0, 0);"><img src="https://cdn.ezbuy.jp/image/default/2022/3/30/20220330090631.png" alt="" width="90%" height="" style="max-width: 100%; float: right;"></span><br><br></div></div><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"></div><br><br></div></div><br><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><p style="margin-bottom: 1rem;"><span style="font-size: 18px; color: rgb(0, 0, 0);"><span style="font-weight: 700;">3.2 Thanh toán</span></span></p><ul style="margin-bottom: 1rem;"></ul><p style="margin-bottom: 1rem;"><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Bạn vui lòng kiểm tra lại các thông tin về thanh toán và thêm mã khuyến mãi (nếu có).</span></p><p style="margin-bottom: 1rem;"><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Sau đó chọn "Xác nhận" để hoàn tất quá trình mua hàng.</span></p></div><br><br><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"><span style="color: rgb(0, 0, 0);"><img src="https://cdn.ezbuy.jp/image/default/2022/3/30/20220330090833.png" alt="" width="90%" style="max-width: 100%; float: right;"></span><br><br></div><br><br></div></div><div class="hc_box bg_light" style="border: 1px solid rgb(221, 225, 230); padding: 24px; margin: 0px 0px 24px; color: rgb(18, 22, 25); font-size: 12px;"><div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">4. Mua hàng thành công</span></h3></div><div class="hc_box__body"><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Khi đã đặt hàng thành công, màn hình sẽ hiển thị thông báo “Tạo đơn hàng thành công” và hệ thống sẽ tự động gửi xác nhận đến địa chỉ Email của bạn. Bạn có thể kiểm tra lại đơn hàng và theo dõi tình trạng mua hàng của mình tại mục "Quản lý đơn hàng" trên trang cá nhân.</span></span></p></div></div></div></div></span></span></li></ul></div></div></div><span style="color: rgb(40, 128, 185);"></span></span></li></ul></div>', N'huong-dan-mua-hang.jpeg', 1, N'Hướng dẫn mua hàng trên Hoa Quả Sạch từ A đến Z', N'Hướng Dẫn Mua Hàng', N'Hướng Dẫn Mua Hàng', N'mua hang', CAST(N'2023-03-23T00:00:00.000' AS DateTime), 1),
(11, N'Thông tin liên hệ', N'<p>Thông tin liên hệ<br></p>', N'thong-tin-lien-he.jpeg', 1, N'Thông tin liên hệ', N'Thông tin liên hệ', N'Thông tin liên hệ', N'thong-tin-lien-he', CAST(N'2023-04-01T13:41:39.953' AS DateTime), 2),
(12, N'Giới Thiệu', N'<p>Giới Thiệu<br></p>', N'gioi-thieu.jpeg', 1, N'Giới Thiệu', N'Giới Thiệu', N'Giới Thiệu', N'gioi-thieu', CAST(N'2023-04-01T13:42:35.987' AS DateTime), 3);
SET IDENTITY_INSERT [dbo].[tb_Pages] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Products] ON 

INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES 
(1, N'1/100 NORMA UNX-04S HUNTER KAINAR A-TYPE 2.0 ASY-TAC FRONTEER', N' ', N'<span style="color: rgb(17, 17, 17); font-family: Roboto, Helvetica, sans-serif; font-size: 16px;">THƯƠNG HIỆU : Saying Zone <br> - 9,84 inch (25cm) <br> - Tỉ lệ 1/100 <br> - Chất liệu: Nhựa <br> - Led đầu nam châm ( 3 chế độ sáng, pin loại CR927 ) <br> - Etching part (decal kim loại) <br> - Miếng dán phản quang công nghệ mới - Bảng khắc kim loại Dựa trên phim hoạt hình Trung Quốc Kainar: Asy-Tac Fronteer Khớp nối đầy đủ sau khi hoàn thành <br> PHÂN LOẠI SP : LẮP RÁP', 1, 779000, 3, N'Gundam1.jpg', NULL, CAST(N'2023-04-05T08:01:52.807' AS DateTime), 1, 1, 1, N'Gundam', N'Gundam', N'Gundam', N'Gundam', N'Gundam', 10),
(2, N'HG UC UNICORN GUNDAM 03 PHENEX (UNICORN MODE) (NARRATIVE VER.) [GOLD COATING] BANDAI', N' ', N'<p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(74, 74, 74);">THƯƠNG HIỆU : BANDAI – NHẬT BẢN <br> PHIÊN BẢN : HG 1/144 <br> Chiều cao: 13-16cm <br> PHÂN LOẠI SP : LẮP RÁP</p>', 1, 1350000, 2, N'Gundam2.jpg', CAST(N'2023-03-30T09:05:29.000' AS DateTime), CAST(N'2023-04-05T08:03:40.387' AS DateTime), 1, 1, 1, N'Gundam', N'Gundam', N'Gundam', N'Gundam', N'Gundam', 30),
(3, N'Tokyo Revengers Manjiro Sano Vol.24 Cover Illustration Ver. 1/7', N'  ', N'<p dir="ltr" style="margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px 0px 24px; border: 0px; font-size: 16px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 24px; color: rgb(51, 65, 85); font-family: roboto, Arial, Helvetica, sans-serif;"> Tokyo Revengers Manjiro Sano Vol.24 Cover Illustration Ver. 1/7 <br> Nhân vật: Manjiro Sano(Tokyo Manji Gang President/Mikey) <br> Series: Tokyo Revengers <br> Tỷ lệ: 1/7 <br> Hãng sản xuất: Good Smile Company, Orange Rouge <br> Kích thước: 24cm <br> Phát hành: 4/2024</p>', 2, 7000000, 2, N'Fig1.jpg', CAST(N'2023-04-05T08:11:27.677' AS DateTime), CAST(N'2023-04-05T08:11:27.677' AS DateTime), 1, 0, 1, N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', 10),
(4, N'MG BANDAI RX-78-2 GUNDAM VER 3.0 4573102616104 ', N' ', N'<p>Hãng Sản Xuất: Bandai <br> Tỉ lệ: MG – 1/100 <br> Chiều cao: 18-19cm <br> Tình trạng: Mới nguyên hộp <br> Nguồn gốc: Nhật Bản</p>', 1, 1099000, 5, N'Gundam3.jpg', CAST(N'2023-04-05T08:16:47.607' AS DateTime), CAST(N'2023-04-05T08:16:47.607' AS DateTime), 1, 1, 1, N'Gundam ', N'Gundam ', N'Gundam', N'Gundam ', N'Gundam ', 100),
(5, N'30MS SIS-AC25G FAR-FARINA (CONDUCTOR FORM) BANDAI', N'  ', N'<p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px;">THƯƠNG HIỆU : BANDAI – NHẬT BẢN  <br> Chiều cao: 13-16cm <br> PHÂN LOẠI SP : LẮP RÁP</p>', 1, 599000, 5, N'Gundam4.jpg', CAST(N'2023-04-05T08:21:07.000' AS DateTime), CAST(N'2023-04-05T09:05:06.877' AS DateTime), 1, 1, 1, N'Lựu', N'Lựu', N'luu', N'Lựu', N'Lựu', 100),
(6, N'Arknights Hoshiguma -Wanderer Banner- 1/7', N' ', N'<p><span style="color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(245, 245, 245);"> Arknights Hoshiguma -Wanderer Banner- 1/7 <br> Nhân vật : Hoshiguma <br> Series :  Arknights <br> Tỷ lệ : 1/7 <br> Hãng sản xuất : furyu <br> Kích thước : 27cm <br> Phát hành : 3/2022</p>', 2, 13500000, 10, N'Fig2.jpg', CAST(N'2023-04-05T08:38:07.093' AS DateTime), CAST(N'2023-04-05T08:38:07.093' AS DateTime), 1, 0, 1, N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', 30),
(7, N'MG GUNDAM ASTRAY RED FRAME KAI DABAN - GDC ', N' ', N'<p>Hãng Sản xuất: Daban <br> PHIÊN BẢN : MG <br> Chiều cao: 18-23cm <br> PHÂN LOẠI SP : LẮP RÁP</p>', 1, 399000, 20, N'Gundam5.jpg', CAST(N'2023-04-05T08:50:42.850' AS DateTime), CAST(N'2023-04-05T08:50:42.850' AS DateTime), 1, 1, 1, N'Gundam ', N'Gundam ', N'Gundam', N'Gundam ', N'Gundam ', 100),
(8, N'Arknights Skadi The Corrupting Heart Elite 2 ver. 1/7 DELUXE Edition', N' ', N'<p><span style="font-weight: 700; color: rgb(118, 118, 118); font-family: Roboto, Helvetica, sans-serif;"> Arknights Skadi The Corrupting Heart Elite 2 ver. 1/7 DELUXE Edition <br> Nhân vật: Skadi <br> Series: Arknights <br> Tỷ lệ: 1/7 <br> Hãng sản xuất: Myethos <br> Kích thước: 32cm <br> Phát hành: 12/2023</p>', 2, 13300000, 10, N'Fig3.jpg', CAST(N'2023-04-05T09:18:59.623' AS DateTime), CAST(N'2023-04-05T09:18:59.623' AS DateTime), 1, 1, 1, N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', 100),
(9, N'PRISMA WING Yuru Camp Nadeshiko Kagamihara & Rin Shima 1/7', N' ', N'<p>PRISMA WING Yuru Camp Nadeshiko Kagamihara & Rin Shima 1/7 <br> Nhân vật: Nadeshiko Kagamihara, Rin Shima <br> Series: Yuru Camp (Laid-Back Camp) <br> Tỷ lệ: 1/7 <br> Hãng sản xuất: Prime 1 Studio <br> Kích thước: 24cm <br> Phát hành: 8/2024</p>', 2, 12000000, 10, N'Fig4.jpg', CAST(N'2023-04-05T09:43:06.000' AS DateTime), CAST(N'2023-04-05T09:43:33.480' AS DateTime), 1, 1, 1, N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', N'Scale Figure', 100);
SET IDENTITY_INSERT [dbo].[tb_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Roles] ON 

INSERT [dbo].[tb_Roles] ([RoleID], [RoleName], [Desciption]) VALUES 
(1, N'Admin', N'Quản Trị'),
(2, N'Staff', N'Nhân Viên ');
SET IDENTITY_INSERT [dbo].[tb_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_TransactStatus] ON 

INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES 
(1, N'Chờ lấy hàng', N'Đã xác nhận và đang chuẩn bị hàng'),
(2, N'Chờ xác nhận', N'Đang chờ người bán xác nhận với người mua'),
(3, N'Đang giao', N'Đơn hàng đang được giao tới người mua'),
(4, N'Đã giao thành công', N'Đơn hàng giao thành công đến người mua'),
(5, N'Đã hủy', N'Đơn hàng đã được hủy thành công'),
(6, N'Trả hàng', N'Đơn hàng đã được trả thành công');
SET IDENTITY_INSERT [dbo].[tb_TransactStatus] OFF
GO
ALTER TABLE [dbo].[tb_Accounts]  WITH CHECK ADD  CONSTRAINT [FK_tb_Accounts_tb_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tb_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[tb_Accounts] CHECK CONSTRAINT [FK_tb_Accounts_tb_Roles]
GO
ALTER TABLE [dbo].[tb_News]  WITH CHECK ADD  CONSTRAINT [FK_tb_News_tb_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tb_Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[tb_News] CHECK CONSTRAINT [FK_tb_News_tb_Accounts]
GO
ALTER TABLE [dbo].[tb_News]  WITH CHECK ADD  CONSTRAINT [FK_tb_TinTuc_tb_Categories] FOREIGN KEY([CatlID])
REFERENCES [dbo].[tb_Categories] ([CatlID])
GO
ALTER TABLE [dbo].[tb_News] CHECK CONSTRAINT [FK_tb_TinTuc_tb_Categories]
GO
ALTER TABLE [dbo].[tb_OrderDetaills]  WITH CHECK ADD  CONSTRAINT [FK_tb_OrderDetaills_tb_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tb_Orders] ([OrderID])
GO
ALTER TABLE [dbo].[tb_OrderDetaills] CHECK CONSTRAINT [FK_tb_OrderDetaills_tb_Orders]
GO
ALTER TABLE [dbo].[tb_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tb_Orders_tb_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tb_Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[tb_Orders] CHECK CONSTRAINT [FK_tb_Orders_tb_Customers]
GO
ALTER TABLE [dbo].[tb_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tb_Orders_tb_TrangThai] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[tb_TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[tb_Orders] CHECK CONSTRAINT [FK_tb_Orders_tb_TrangThai]
GO
ALTER TABLE [dbo].[tb_Products]  WITH CHECK ADD  CONSTRAINT [FK_tb_Products_tb_Categories] FOREIGN KEY([CatllD])
REFERENCES [dbo].[tb_Categories] ([CatlID])
GO
ALTER TABLE [dbo].[tb_Products] CHECK CONSTRAINT [FK_tb_Products_tb_Categories]
GO
