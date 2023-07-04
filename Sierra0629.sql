USE [master]
GO
/****** Object:  Database [Sierra0629]    Script Date: 2023/7/4 上午 09:52:49 ******/
CREATE DATABASE [Sierra0629]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sierra0629', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sierra0629.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sierra0629_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sierra0629_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sierra0629] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sierra0629].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sierra0629] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sierra0629] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sierra0629] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sierra0629] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sierra0629] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sierra0629] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sierra0629] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sierra0629] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sierra0629] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sierra0629] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sierra0629] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sierra0629] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sierra0629] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sierra0629] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sierra0629] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sierra0629] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sierra0629] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sierra0629] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sierra0629] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sierra0629] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sierra0629] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sierra0629] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sierra0629] SET RECOVERY FULL 
GO
ALTER DATABASE [Sierra0629] SET  MULTI_USER 
GO
ALTER DATABASE [Sierra0629] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sierra0629] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sierra0629] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sierra0629] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sierra0629] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sierra0629] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sierra0629', N'ON'
GO
ALTER DATABASE [Sierra0629] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sierra0629] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sierra0629]
GO
/****** Object:  User [sa5]    Script Date: 2023/7/4 上午 09:52:50 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponCategories]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponCategories](
	[CouponCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CouponCategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[CouponCategoryId] [int] NOT NULL,
	[DiscountGroupId] [int] NULL,
	[CouponName] [nvarchar](50) NOT NULL,
	[CouponCode] [nvarchar](50) NOT NULL,
	[LimitType] [int] NULL,
	[LimitValue] [int] NULL,
	[DiscountType] [int] NOT NULL,
	[DiscountValue] [int] NULL,
	[StartAt] [datetime] NULL,
	[EndAt] [datetime] NULL,
	[Expiration] [int] NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DessertImages]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DessertImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[DessertId] [int] NULL,
	[DessertImageName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DessertOrderDetails]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DessertOrderDetails](
	[DessertOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DessertOrderId] [int] NOT NULL,
	[DessertId] [int] NOT NULL,
	[DessertName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DessertUnitPrice] [int] NOT NULL,
	[Subtotal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DessertOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DessertOrders]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DessertOrders](
	[DessertOrderId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[DessertOrderStatusId] [int] NOT NULL,
	[CouponId] [int] NULL,
	[CreateTime] [datetime] NOT NULL,
	[Recipient] [nvarchar](50) NOT NULL,
	[RecipientPhone] [nvarchar](10) NOT NULL,
	[RecipientAddress] [nvarchar](100) NOT NULL,
	[ShippingFee] [int] NOT NULL,
	[DessertOrderTotal] [int] NOT NULL,
	[DeliveryMethod] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](200) NULL,
	[OrderCancellationReason] [nvarchar](200) NULL,
	[DiscountInfo] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[DessertOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desserts]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desserts](
	[DessertId] [int] IDENTITY(1,1) NOT NULL,
	[DessertName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DessertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DessertTags]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DessertTags](
	[DessertTagId] [int] IDENTITY(1,1) NOT NULL,
	[DessertId] [int] NULL,
	[DessertTagName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DessertTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountGroupItems]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountGroupItems](
	[DiscountGroupItemId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountGroupId] [int] NOT NULL,
	[DessertId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountGroupItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountGroups]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountGroups](
	[DiscountGroupId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountGroupName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountGroupId] [int] NULL,
	[DiscountName] [nvarchar](50) NOT NULL,
	[LimitType] [int] NULL,
	[LimitValue] [int] NULL,
	[DiscountType] [int] NOT NULL,
	[DiscountValue] [int] NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EncryptedPassword] [nvarchar](200) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeToRoles]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeToRoles](
	[EmployeeId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeToRoles] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonCategories]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonCategories](
	[LessonCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[LessonCategoryName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonImages]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonImages](
	[LessonImageId] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NOT NULL,
	[LessonImageName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonOrderDetails]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonOrderDetails](
	[LessonOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[LessonOrderId] [int] NOT NULL,
	[LessonId] [int] NOT NULL,
	[LessonTitle] [nvarchar](50) NOT NULL,
	[NumberOfPeople] [int] NOT NULL,
	[LessonUnitPrice] [int] NOT NULL,
	[Subtotal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonOrders]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonOrders](
	[LessonOrderId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[LessonOrderStatusId] [int] NOT NULL,
	[CouponId] [int] NULL,
	[CreateTime] [datetime] NOT NULL,
	[LessonOrderTotal] [int] NOT NULL,
	[Note] [nvarchar](200) NULL,
	[OrderCancellationReason] [nvarchar](200) NULL,
	[DiscountInfo] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[LessonCategoryId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[LessonTitle] [nvarchar](50) NOT NULL,
	[LessonInfo] [nvarchar](150) NOT NULL,
	[LessonDetail] [nvarchar](300) NOT NULL,
	[LessonDessert] [nvarchar](20) NOT NULL,
	[LessonTime] [datetime] NOT NULL,
	[LessonHours] [int] NOT NULL,
	[MaximumCapacity] [int] NOT NULL,
	[LessonPrice] [int] NOT NULL,
	[LessonStatus] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonTags]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonTags](
	[LessonTagId] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NOT NULL,
	[LessonTagName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCoupons]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCoupons](
	[MemberCouponId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CouponId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UseAt] [datetime] NULL,
	[ExpireAt] [datetime] NOT NULL,
	[CouponName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberCouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[MemberName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[EncryptedPassword] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Birth] [datetime] NOT NULL,
	[Gender] [bit] NOT NULL,
	[ImageName] [nvarchar](255) NULL,
	[IsBan] [bit] NOT NULL,
	[CancelTimes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[CouponId] [int] NULL,
	[PromotionImage] [nvarchar](255) NOT NULL,
	[PromotionName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[LaunchAt] [datetime] NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleToPermissions]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleToPermissions](
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_RoleToPermissions] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification](
	[SpecificationId] [int] IDENTITY(1,1) NOT NULL,
	[DessertId] [int] NULL,
	[Flavor] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2023/7/4 上午 09:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](20) NOT NULL,
	[TeacherImage] [nvarchar](255) NOT NULL,
	[Specialty] [nvarchar](150) NOT NULL,
	[Experience] [nvarchar](150) NOT NULL,
	[License] [nvarchar](150) NOT NULL,
	[Academic] [nvarchar](150) NOT NULL,
	[TeacherStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'整模蛋糕')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'常溫蛋糕')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'點心')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'長條蛋糕')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'禮盒')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CouponCategories] ON 

INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (1, N'指定發送')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (2, N'活動')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (3, N'遊戲')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (4, N'優惠碼')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (5, N'生日')
INSERT [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName]) VALUES (6, N'新註冊會員')
SET IDENTITY_INSERT [dbo].[CouponCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupons] ON 

INSERT [dbo].[Coupons] ([CouponId], [CouponCategoryId], [DiscountGroupId], [CouponName], [CouponCode], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [Expiration], [CreateAt]) VALUES (1, 2, 1, N'父親節滿1000打88折', N'oikrhygodrjlk', 2, 1000, 2, 88, CAST(N'1905-07-09T00:00:00.000' AS DateTime), CAST(N'1905-07-01T00:00:00.000' AS DateTime), NULL, CAST(N'2023-07-03T09:31:26.350' AS DateTime))
INSERT [dbo].[Coupons] ([CouponId], [CouponCategoryId], [DiscountGroupId], [CouponName], [CouponCode], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [Expiration], [CreateAt]) VALUES (2, 1, NULL, N'300元折價券', N'sgdrfhsdhgsdg', NULL, NULL, 1, 300, NULL, NULL, 365, CAST(N'2023-07-03T09:31:26.350' AS DateTime))
INSERT [dbo].[Coupons] ([CouponId], [CouponCategoryId], [DiscountGroupId], [CouponName], [CouponCode], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [Expiration], [CreateAt]) VALUES (3, 5, NULL, N'生日好禮買2件折100', N'apoigujoihkjjj', 1, 2, 1, 100, NULL, NULL, 30, CAST(N'2023-07-03T09:31:26.350' AS DateTime))
INSERT [dbo].[Coupons] ([CouponId], [CouponCategoryId], [DiscountGroupId], [CouponName], [CouponCode], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [Expiration], [CreateAt]) VALUES (4, 6, NULL, N'新註冊會員50元折價券', N'srgsgdfgfheey', NULL, NULL, 1, 50, NULL, NULL, 7, CAST(N'2023-07-03T09:31:26.350' AS DateTime))
INSERT [dbo].[Coupons] ([CouponId], [CouponCategoryId], [DiscountGroupId], [CouponName], [CouponCode], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [Expiration], [CreateAt]) VALUES (5, 4, NULL, N'廚佛專屬優惠碼滿699送99', N'Fred吃上癮', 2, 699, 1, 99, CAST(N'1905-06-20T00:00:00.000' AS DateTime), CAST(N'1905-06-19T00:00:00.000' AS DateTime), 7, CAST(N'2023-07-03T09:31:26.350' AS DateTime))
INSERT [dbo].[Coupons] ([CouponId], [CouponCategoryId], [DiscountGroupId], [CouponName], [CouponCode], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [Expiration], [CreateAt]) VALUES (6, 2, 2, N'給媽媽的免運券', N'dfhftjkfjk', NULL, NULL, 3, NULL, CAST(N'1905-06-29T00:00:00.000' AS DateTime), CAST(N'1905-06-28T00:00:00.000' AS DateTime), NULL, CAST(N'2023-07-03T09:31:26.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[Coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[DessertImages] ON 

INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (1, 3, N'mocha.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (2, 151, N'truffle.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (3, 180, N'b08c9ea6ffb6489fab2215fb4c05def9.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (4, 22, N'lemon.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (5, 22, N'lemon_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (6, 22, N'lemon_cheese.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (7, 23, N'mocha.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (8, 23, N'cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (9, 24, N'strawberry.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (10, 24, N'strawberry_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (11, 25, N'vanilla.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (12, 26, N'matcha.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (13, 26, N'matcha_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (14, 26, N'matcha_mousse.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (15, 27, N'mango.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (16, 27, N'mango_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (17, 28, N'caramel.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (18, 28, N'caramel_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (19, 28, N'caramel_mousse.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (20, 29, N'raspberry.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (21, 29, N'raspberry_tart.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (22, 30, N'banana.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (23, 30, N'banana_choco.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (24, 31, N'lemon.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (25, 32, N'blueberry.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (26, 33, N'blueberry.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (27, 34, N'durian.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (28, 34, N'durian_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (29, 35, N'oreo.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (30, 35, N'oreo_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (31, 36, N'milk_tea.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (32, 36, N'milk_tea_cake.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (33, 36, N'milk_tea_mousse.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (34, 180, N'366d0c7f49c8436ebf0f68a03d3f76a8.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (35, 7, N'blueberry.jpg')
INSERT [dbo].[DessertImages] ([ImageId], [DessertId], [DessertImageName]) VALUES (36, 212, N'blueberry.jpg')
SET IDENTITY_INSERT [dbo].[DessertImages] OFF
GO
SET IDENTITY_INSERT [dbo].[DessertOrderDetails] ON 

INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (1, 1, 11, N'香蕉巧克力冰淇淋', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (2, 1, 153, N'焦糖提拉米蘇', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (3, 1, 107, N'焦糖香蕉布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (4, 1, 176, N'巧克力覆盆子泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (5, 2, 114, N'香草藍莓布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (6, 2, 31, N'香草奶油泡芙', 1, 450, 450)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (7, 2, 105, N'蘋果肉桂蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (8, 2, 174, N'檸檬乳酪蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (9, 3, 165, N'藍莓慕斯蛋糕', 1, 1180, 1180)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (10, 3, 59, N'榴槤泡芙', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (11, 3, 3, N'巧克力香蕉布朗尼', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (12, 3, 176, N'巧克力覆盆子泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (13, 4, 153, N'焦糖提拉米蘇', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (14, 4, 119, N'香草擠花慕斯蛋糕', 1, 1380, 1380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (15, 5, 119, N'香草擠花慕斯蛋糕', 1, 1380, 1380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (16, 5, 42, N'蘋果肉桂泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (17, 5, 100, N'焦糖杏仁布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (18, 6, 186, N'法式焦糖布蕾', 1, 320, 320)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (19, 6, 4, N'紅豆綠茶雪花冰', 1, 380, 380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (20, 6, 167, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (21, 6, 184, N'巧克力熔岩蛋糕', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (22, 7, 48, N'焦糖奶油布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (23, 7, 38, N'蔓越莓乳酪蛋糕', 1, 1080, 1080)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (24, 7, 184, N'巧克力熔岩蛋糕', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (25, 7, 178, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (26, 8, 80, N'藍莓卡士達泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (27, 8, 170, N'香草藍莓布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (28, 8, 198, N'香草莓果塔', 1, 210, 210)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (29, 8, 86, N'香草千層蛋糕', 1, 1380, 1380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (30, 9, 3, N'巧克力香蕉布朗尼', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (31, 9, 34, N'抹茶紅豆泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (32, 9, 5, N'芒果布丁', 1, 320, 320)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (33, 9, 27, N'抹茶白巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (34, 9, 136, N'草莓卡士達泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (35, 9, 73, N'焦糖松露', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (36, 10, 100, N'焦糖杏仁布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (37, 10, 169, N'焦糖杏仁泡芙', 1, 580, 580)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (38, 10, 45, N'芒果布丁', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (39, 10, 185, N'紅絲絨千層蛋糕', 1, 450, 450)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (40, 10, 59, N'榴槤泡芙', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (41, 11, 142, N'香草藍莓布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (42, 11, 111, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (43, 11, 178, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (44, 11, 198, N'香草莓果塔', 1, 210, 210)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (45, 11, 16, N'榴槤千層蛋糕', 1, 480, 480)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (46, 12, 182, N'香草巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (47, 12, 82, N'焦糖提拉米蘇', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (48, 12, 183, N'提拉米蘇', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (49, 12, 126, N'香草巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (50, 13, 117, N'草莓巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (51, 13, 107, N'焦糖香蕉布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (52, 13, 157, N'香草千層蛋糕', 1, 1380, 1380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (53, 14, 14, N'草莓白巧克力慕斯', 1, 410, 410)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (54, 14, 167, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (55, 14, 35, N'芒果慕斯蛋糕', 1, 1280, 1280)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (56, 14, 190, N'巧克力草莓塔', 1, 320, 320)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (57, 15, 195, N'紅莓夾心餅乾', 1, 320, 320)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (58, 15, 184, N'巧克力熔岩蛋糕', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (59, 15, 85, N'香蕉肉桂泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (60, 15, 2, N'抹茶草莓千層蛋糕', 1, 500, 500)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (61, 15, 171, N'巧克力草莓蛋糕', 1, 1280, 1280)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (62, 16, 36, N'黑森林蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (63, 16, 196, N'焦糖榛子布丁', 1, 420, 420)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (64, 16, 84, N'櫻花塔', 1, 920, 920)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (65, 17, 43, N'香草千層蛋糕', 1, 1380, 1380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (66, 17, 207, N'巧克力波士頓派 ', 1, 450, 450)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (67, 17, 15, N'抹茶紅豆蛋糕捲', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (68, 17, 107, N'焦糖香蕉布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (69, 18, 159, N'芒果布丁', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (70, 18, 48, N'焦糖奶油布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (71, 18, 71, N'香草藍莓布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (72, 18, 7, N'巧克力香草軟餅乾', 1, 280, 280)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (73, 18, 78, N'焦糖香蕉布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (74, 19, 37, N'檸檬塔', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (75, 19, 78, N'焦糖香蕉布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (76, 19, 25, N'巧克力草莓塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (77, 20, 15, N'抹茶紅豆蛋糕捲', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (78, 20, 177, N'焦糖香蕉布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (79, 20, 9, N'焦糖拿鐵布蕾', 1, 420, 420)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (80, 20, 188, N'芒果慕斯塔爾特', 1, 320, 320)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (81, 20, 207, N'巧克力波士頓派 ', 1, 450, 450)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (82, 20, 77, N'巧克力覆盆子泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (83, 21, 40, N'焦糖香蕉布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (84, 21, 51, N'藍莓慕斯蛋糕', 1, 1180, 1180)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (85, 21, 84, N'櫻花塔', 1, 920, 920)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (86, 22, 27, N'抹茶白巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (87, 22, 42, N'蘋果肉桂泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (88, 22, 220, N'法式經典瑪德蓮禮盒', 1, 570, 570)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (89, 22, 111, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (90, 23, 193, N'草莓白巧克力慕斯', 1, 420, 420)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (91, 23, 120, N'巧克力覆盆子泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (92, 23, 151, N'藍莓卡士達泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (93, 23, 97, N'芒果塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (94, 23, 196, N'焦糖榛子布丁', 1, 420, 420)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (95, 24, 34, N'抹茶紅豆泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (96, 24, 111, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (97, 24, 98, N'黑白巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (98, 24, 212, N'達克瓦茲禮盒(巧克力口味)', 1, 435, 435)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (99, 24, 78, N'焦糖香蕉布朗尼', 1, 680, 680)
GO
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (100, 25, 134, N'焦糖奶油布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (101, 25, 94, N'藍莓慕斯蛋糕', 1, 1180, 1180)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (102, 25, 87, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (103, 26, 138, N'焦糖拿鐵布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (104, 26, 53, N'抹茶紅豆蛋糕', 1, 1080, 1080)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (105, 26, 54, N'芒果塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (106, 27, 32, N'藍莓乳酪蛋糕', 1, 1080, 1080)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (107, 27, 47, N'草莓巧克力泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (108, 27, 202, N'櫻花杏仁蛋糕捲', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (109, 27, 202, N'櫻花杏仁蛋糕捲', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (110, 28, 97, N'芒果塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (111, 28, 59, N'榴槤泡芙', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (112, 28, 210, N'大溪地香草蘭姆可麗露', 1, 400, 400)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (113, 28, 97, N'芒果塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (114, 29, 52, N'焦糖拿鐵布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (115, 29, 30, N'巧克力花園塔', 1, 920, 920)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (116, 29, 64, N'焦糖香蕉布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (117, 30, 126, N'香草巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (118, 30, 91, N'焦糖奶油布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (119, 30, 174, N'檸檬乳酪蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (120, 30, 183, N'提拉米蘇', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (121, 31, 104, N'巧克力焦糖塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (122, 31, 65, N'抹茶巧克力泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (123, 31, 18, N'焦糖海鹽巧克力', 1, 360, 360)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (124, 31, 44, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (125, 32, 132, N'提拉米蘇', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (126, 32, 26, N'紅莓乳酪蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (127, 32, 167, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (128, 33, 84, N'櫻花塔', 1, 920, 920)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (129, 33, 32, N'藍莓乳酪蛋糕', 1, 1080, 1080)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (130, 33, 160, N'提拉米蘇', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (131, 34, 4, N'紅豆綠茶雪花冰', 1, 380, 380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (132, 34, 152, N'葡萄乳酪蛋糕', 1, 1080, 1080)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (133, 34, 126, N'香草巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (134, 34, 2, N'抹茶草莓千層蛋糕', 1, 500, 500)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (135, 34, 103, N'香草布丁', 1, 480, 480)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (136, 35, 119, N'香草擠花慕斯蛋糕', 1, 1380, 1380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (137, 35, 95, N'焦糖拿鐵布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (138, 35, 182, N'香草巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (139, 35, 21, N'檸檬起司蛋糕', 1, 380, 380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (140, 36, 26, N'紅莓乳酪蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (141, 36, 130, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (142, 36, 87, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (143, 37, 210, N'大溪地香草蘭姆可麗露', 1, 400, 400)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (144, 37, 116, N'焦糖松露', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (145, 37, 214, N'達克瓦茲禮盒(巧克力口味)', 1, 435, 435)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (146, 37, 102, N'榴槤泡芙', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (147, 38, 196, N'焦糖榛子布丁', 1, 420, 420)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (148, 38, 134, N'焦糖奶油布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (149, 38, 60, N'香草布丁', 1, 480, 480)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (150, 38, 135, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (151, 39, 27, N'抹茶白巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (152, 39, 134, N'焦糖奶油布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (153, 39, 46, N'提拉米蘇', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (154, 39, 21, N'檸檬起司蛋糕', 1, 380, 380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (155, 40, 174, N'檸檬乳酪蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (156, 40, 12, N'覆盆子芝士塔', 1, 380, 380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (157, 40, 118, N'檸檬乳酪蛋糕', 1, 980, 980)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (158, 40, 170, N'香草藍莓布丁', 1, 590, 590)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (159, 41, 14, N'草莓白巧克力慕斯', 1, 410, 410)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (160, 41, 135, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (161, 41, 154, N'香草巧克力泡芙', 1, 550, 550)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (162, 41, 199, N'巧克力杏仁酥脆球', 1, 320, 320)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (163, 41, 150, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (164, 42, 173, N'草莓巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (165, 42, 7, N'巧克力香草軟餅乾', 1, 280, 280)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (166, 42, 177, N'焦糖香蕉布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (167, 42, 172, N'焦糖松露', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (168, 43, 172, N'焦糖松露', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (169, 43, 28, N'焦糖海鹽布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (170, 43, 219, N'鐵觀音提拉米蘇', 1, 860, 860)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (171, 43, 167, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (172, 44, 3, N'巧克力香蕉布朗尼', 1, 350, 350)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (173, 44, 77, N'巧克力覆盆子泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (174, 44, 177, N'焦糖香蕉布朗尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (175, 44, 21, N'檸檬起司蛋糕', 1, 380, 380)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (176, 45, 77, N'巧克力覆盆子泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (177, 45, 130, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (178, 45, 70, N'焦糖杏仁泡芙', 1, 580, 580)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (179, 45, 74, N'草莓巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (180, 46, 74, N'草莓巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (181, 46, 130, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (182, 46, 156, N'香蕉肉桂泡芙', 1, 520, 520)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (183, 46, 139, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (184, 47, 169, N'焦糖杏仁泡芙', 1, 580, 580)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (185, 47, 24, N'焙茶芋泥布丁蛋糕', 1, 1280, 1280)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (186, 47, 111, N'檸檬蛋糕', 1, 750, 750)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (187, 48, 178, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (188, 48, 149, N'焦糖香蕉布丹尼', 1, 680, 680)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (189, 48, 150, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (190, 48, 169, N'焦糖杏仁泡芙', 1, 580, 580)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (191, 49, 14, N'草莓白巧克力慕斯', 1, 410, 410)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (192, 49, 47, N'草莓巧克力泡芙', 1, 620, 620)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (193, 49, 79, N'抹茶白巧克力塔', 1, 850, 850)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (194, 50, 30, N'巧克力花園塔', 1, 920, 920)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (195, 50, 44, N'巧克力杏仁塔', 1, 780, 780)
INSERT [dbo].[DessertOrderDetails] ([DessertOrderDetailId], [DessertOrderId], [DessertId], [DessertName], [Quantity], [DessertUnitPrice], [Subtotal]) VALUES (196, 50, 132, N'提拉米蘇', 1, 980, 980)
SET IDENTITY_INSERT [dbo].[DessertOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[DessertOrders] ON 

INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (1, 15, 2, 3, CAST(N'2021-02-27T05:13:10.000' AS DateTime), N'邱啟文', N'0972833417', N'花蓮縣中正區中正路337號', 60, 2540, N'宅配', N'嗨這邊是註記唷', N'想變更送貨地址', NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (2, 83, 3, 3, CAST(N'2021-12-02T21:50:52.000' AS DateTime), N'高志成', N'0972310902', N'桃園市中區文化路85號', 60, 3000, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (3, 40, 2, 3, CAST(N'2022-12-17T07:01:01.000' AS DateTime), N'孫建興', N'0948401203', N'花蓮縣山區信義路349號', 60, 2830, N'宅配', N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (4, 38, 4, 4, CAST(N'2023-05-05T20:28:18.000' AS DateTime), N'賀柏崴', N'0980058732', N'雲林縣南區中山路465號', 60, 2360, N'宅配', N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (5, 2, 3, 2, CAST(N'2013-03-12T22:46:20.000' AS DateTime), N'付雅琪', N'0940650019', N'桃園市中和區忠孝路134號', 60, 2580, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (6, 13, 2, 5, CAST(N'2018-01-11T19:26:22.000' AS DateTime), N'熊信宏', N'0970271946', N'彰化縣北區敦化路63號', 60, 1800, N'宅配', NULL, N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (7, 41, 3, 3, CAST(N'2017-02-24T02:01:21.000' AS DateTime), N'胡哲瑋', N'0963141427', N'台北市中區民生路321號', 60, 2960, N'宅配', NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (8, 72, 3, 6, CAST(N'2015-07-13T21:01:17.000' AS DateTime), N'段宗豪', N'0913223466', N'台東縣山區信義路70號', 60, 2700, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (9, 7, 2, 6, CAST(N'2021-09-19T18:11:11.000' AS DateTime), N'鄭玉華', N'0933037225', N'嘉義市中區中正路68號', 60, 2940, N'宅配', N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (10, 73, 2, 2, CAST(N'2020-11-13T22:09:12.000' AS DateTime), N'馬正偉', N'0958711765', N'台南市南市區民生路117號', 60, 2940, N'宅配', N'嗨這邊是註記唷', N'想變更送貨地址', NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (11, 97, 4, 1, CAST(N'2018-07-13T20:10:36.000' AS DateTime), N'賀婉華', N'0986266459', N'台北市西區成功路482號', 60, 2880, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (12, 62, 2, 3, CAST(N'2018-03-31T22:18:50.000' AS DateTime), N'董振宇', N'0935448558', N'連江縣中山區忠孝路377號', 60, 2430, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (13, 17, 4, 3, CAST(N'2022-01-01T06:56:26.000' AS DateTime), N'張淑玉', N'0912069552', N'新竹市海區成功路124號', 60, 2820, N'宅配', NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (14, 45, 2, 4, CAST(N'2022-02-15T07:56:24.000' AS DateTime), N'范雯芳', N'0943778879', N'連江縣山區忠孝路108號', 60, 2760, N'宅配', N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (15, 90, 3, 5, CAST(N'2014-06-05T12:29:42.000' AS DateTime), N'張家銘', N'0930626147', N'新竹市海區光復路221號', 60, 2970, N'宅配', NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (16, 98, 4, 2, CAST(N'2015-11-20T00:56:16.000' AS DateTime), N'姜健豪', N'0973252806', N'花蓮縣新區建國路411號', 60, 2320, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (17, 10, 2, 4, CAST(N'2019-03-16T06:23:06.000' AS DateTime), N'閆瑞菁', N'0909538242', N'嘉義縣北區中山路93號', 60, 2770, N'宅配', N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (18, 5, 2, 3, CAST(N'2016-08-14T20:36:01.000' AS DateTime), N'曹振宇', N'0900736056', N'新竹市中正區建國路101號', 60, 2780, N'宅配', NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (19, 94, 1, 5, CAST(N'2022-06-28T19:14:12.000' AS DateTime), N'石啟豪', N'0963752887', N'嘉義市新區文化路27號', 60, 2210, N'宅配', NULL, N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (20, 99, 3, 3, CAST(N'2023-01-30T14:32:01.000' AS DateTime), N'蔡宏達', N'0955404618', N'台東縣海區光復路165號', 60, 2840, N'宅配', NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (21, 32, 1, 3, CAST(N'2017-12-03T08:06:12.000' AS DateTime), N'羅宇軒', N'0941747013', N'澎湖縣中和區成功路343號', 60, 2780, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (22, 2, 2, 4, CAST(N'2020-04-17T18:38:23.000' AS DateTime), N'丁宇翔', N'0964854755', N'金門縣海區民生路378號', 60, 2390, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (23, 25, 1, 2, CAST(N'2022-06-03T09:15:15.000' AS DateTime), N'錢欣玉', N'0906876628', N'苗栗縣北區和平路147號', 60, 2760, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (24, 33, 4, 2, CAST(N'2019-02-26T08:11:00.000' AS DateTime), N'萬綺玲', N'0981605712', N'基隆市中區信義路183號', 60, 2935, N'宅配', N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (25, 70, 2, 1, CAST(N'2021-09-26T01:25:06.000' AS DateTime), N'熊美玉', N'0931206566', N'新竹市中區中正路158號', 60, 2640, N'宅配', NULL, NULL, NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (26, 79, 3, 2, CAST(N'2020-07-18T17:40:45.000' AS DateTime), N'丁宏達', N'0914849088', N'屏東縣中正區中正路138號', 60, 2540, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (27, 30, 4, 6, CAST(N'2014-07-20T13:40:20.000' AS DateTime), N'江維傑', N'0988667280', N'台中市中和區民生路320號', 60, 2400, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (28, 84, 2, 1, CAST(N'2013-11-14T02:51:40.000' AS DateTime), N'黃慧華', N'0973898494', N'台南市中和區文化路107號', 60, 2640, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (29, 62, 1, 2, CAST(N'2021-03-10T18:44:48.000' AS DateTime), N'黃淑君', N'0986398394', N'南投縣山區光復路397號', 60, 2190, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (30, 66, 2, 6, CAST(N'2015-01-23T06:51:49.000' AS DateTime), N'馮國豪', N'0929086225', N'苗栗縣東區中山路117號', 60, 2560, N'宅配', N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (31, 82, 3, 1, CAST(N'2013-03-11T17:27:20.000' AS DateTime), N'覃秀芳', N'0997601358', N'台北市山區敦化路367號', 60, 2610, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (32, 42, 3, 4, CAST(N'2018-12-03T14:46:14.000' AS DateTime), N'孫怡玲', N'0999432251', N'彰化縣山區福建路188號', 60, 2710, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (33, 20, 4, 5, CAST(N'2014-12-10T08:58:06.000' AS DateTime), N'郭雅萍', N'0935598535', N'台中市南區福建路275號', 60, 2980, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (34, 2, 1, 4, CAST(N'2017-06-01T08:06:43.000' AS DateTime), N'郝婉君', N'0969921400', N'新竹市中正區文化路196號', 60, 2990, N'宅配', N'嗨這邊是註記唷', NULL, NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (35, 7, 3, 4, CAST(N'2014-01-11T02:52:48.000' AS DateTime), N'戴哲瑋', N'0960840321', N'台東縣北區忠孝路56號', 60, 2990, N'宅配', N'嗨這邊是註記唷', N'其他', NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (36, 45, 1, 2, CAST(N'2021-06-27T06:30:03.000' AS DateTime), N'丁綺玲', N'0937149166', N'台東縣新區光復路45號', 60, 2540, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (37, 48, 4, 5, CAST(N'2023-05-05T07:56:07.000' AS DateTime), N'王冠霖', N'0941705837', N'苗栗縣海區和平路286號', 60, 2195, N'宅配', NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (38, 19, 2, 1, CAST(N'2021-04-28T12:06:45.000' AS DateTime), N'梁志成', N'0926863063', N'新北市海區福建路56號', 60, 2430, N'宅配', N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (39, 51, 1, 3, CAST(N'2021-07-02T09:55:22.000' AS DateTime), N'韋怡君', N'0974178470', N'新竹縣新區敦化路293號', 60, 2590, N'宅配', NULL, N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (40, 3, 4, 3, CAST(N'2017-05-25T13:13:55.000' AS DateTime), N'周柏崴', N'0968362847', N'台中市新區中正路139號', 60, 2930, N'宅配', N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (41, 2, 1, 2, CAST(N'2020-07-09T19:23:05.000' AS DateTime), N'范啟豪', N'0935561000', N'雲林縣山區敦化路91號', 60, 2980, N'宅配', NULL, N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (42, 8, 1, 2, CAST(N'2022-01-05T07:34:44.000' AS DateTime), N'韋秀華', N'0975124798', N'花蓮縣舊區福建路445號', 60, 2490, N'宅配', NULL, NULL, NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (43, 41, 1, 3, CAST(N'2013-05-21T08:16:18.000' AS DateTime), N'金宏偉', N'0924830437', N'新竹市舊區中山路292號', 60, 2970, N'宅配', N'嗨這邊是註記唷', N'重複購買', NULL)
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (44, 77, 2, 2, CAST(N'2020-09-09T22:30:43.000' AS DateTime), N'余美惠', N'0963171036', N'基隆市中正區光復路360號', 60, 2030, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (45, 88, 4, 2, CAST(N'2014-04-11T01:16:57.000' AS DateTime), N'廖美容', N'0966783467', N'新竹縣舊區敦化路309號', 60, 2830, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (46, 48, 4, 5, CAST(N'2014-04-19T07:26:17.000' AS DateTime), N'葉泰瑋', N'0902452285', N'連江縣舊區忠孝路25號', 60, 2900, N'宅配', N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (47, 24, 4, 6, CAST(N'2013-06-14T15:45:01.000' AS DateTime), N'朱建中', N'0933569641', N'雲林縣中山區民生路274號', 60, 2610, N'宅配', N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (48, 53, 3, 3, CAST(N'2018-10-11T19:13:42.000' AS DateTime), N'邵玉華', N'0952412868', N'高雄市海區忠孝路137號', 60, 2960, N'宅配', N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (49, 55, 1, 5, CAST(N'2022-01-18T10:55:40.000' AS DateTime), N'段怡如', N'0991422926', N'花蓮縣南市區成功路61號', 60, 1880, N'宅配', NULL, N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[DessertOrders] ([DessertOrderId], [MemberId], [DessertOrderStatusId], [CouponId], [CreateTime], [Recipient], [RecipientPhone], [RecipientAddress], [ShippingFee], [DessertOrderTotal], [DeliveryMethod], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (50, 20, 3, 2, CAST(N'2021-12-20T01:07:54.000' AS DateTime), N'段瑜珊', N'0931624703', N'屏東縣南區福建路171號', 60, 2680, N'宅配', NULL, N'無法如期付款', NULL)
SET IDENTITY_INSERT [dbo].[DessertOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Desserts] ON 

INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (1, N'焙茶芋泥布丁蛋糕', 3, 1280, N'台灣在地大甲芋泥，日本中澤頂級奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (2, N'抹茶草莓千層蛋糕', 2, 500, N'濃郁的抹茶奶油搭配新鮮草莓層層疊疊', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (3, N'巧克力香蕉布朗尼', 1, 350, N'香蕉與巧克力的完美結合，濕潤鬆軟口感', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (4, N'紅豆綠茶雪花冰', 4, 380, N'清涼又美味的夏日甜點，綠茶冰淇淋搭配紅豆醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (5, N'芒果布丁', 2, 320, N'新鮮芒果果肉加上順滑布丁，酸甜口感絕佳', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (6, N'藍莓乳酪塔', 1, 420, N'酸甜藍莓與濃郁乳酪的絕妙組合，外層酥脆可口', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (7, N'巧克力香草軟餅乾', 3, 280, N'香草風味餅乾內夾軟綿綿巧克力，入口即化', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (8, N'草莓奶油泡芙', 2, 360, N'鬆軟泡芙內填滿新鮮草莓與奶油，每口都是驚喜', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (9, N'焦糖拿鐵布蕾', 4, 420, N'經典的拿鐵風味與焦糖布蕾的濃郁口感結合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (10, N'紅絲絨紅豆捲', 3, 320, N'紅絲絨蛋糕搭配紅豆內餡，綿密軟綿的口感', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (11, N'香蕉巧克力冰淇淋', 1, 350, N'香蕉口味冰淇淋中夾著香濃巧克力粒，迷人組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (12, N'覆盆子芝士塔', 2, 380, N'酸甜覆盆子搭配濃郁芝士，完美平衡的口感', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (13, N'提拉米蘇杯子蛋糕', 3, 390, N'充滿咖啡香氣的提拉米蘇，方便攜帶的迷你尺寸', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (14, N'草莓白巧克力慕斯', 4, 410, N'滑順慕斯中融入鮮甜草莓與香醇白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (15, N'抹茶紅豆蛋糕捲', 1, 350, N'香濃抹茶蛋糕外夾著香甜紅豆，美味又好看', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (16, N'榴槤千層蛋糕', 3, 480, N'榴槤醬搭配層層酥皮，榴槤控絕對不能錯過', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (17, N'蘋果肉桂派', 2, 320, N'酸甜蘋果片撒上肉桂粉，外層酥脆內餡多汁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (18, N'焦糖海鹽巧克力', 1, 360, N'香濃巧克力中加入焦糖與微妙海鹽風味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (19, N'紅豆抹茶蛋糕', 4, 390, N'抹茶口味蛋糕上鋪滿紅豆，綠茶愛好者必點', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (20, N'草莓卡士達可頌', 2, 420, N'新鮮草莓與濃郁卡士達醬搭配酥脆可頌皮', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (21, N'檸檬起司蛋糕', 1, 380, N'清新檸檬風味的起司蛋糕，酸甜口感一流', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (22, N'香草覆盆子泡芙', 3, 350, N'香草口味泡芙內填滿覆盆子奶油，香甜酸爽', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (23, N'芒果雪花冰淇淋', 4, 390, N'新鮮芒果果肉混入綿密冰淇淋，消暑首選', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (24, N'焙茶芋泥布丁蛋糕', 3, 1280, N'台灣在地大甲芋泥，日本中澤頂級奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (25, N'巧克力草莓塔', 1, 780, N'濃郁巧克力搭配新鮮草莓，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (26, N'紅莓乳酪蛋糕', 2, 980, N'頂級乳酪搭配酸甜紅莓，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (27, N'抹茶白巧克力泡芙', 4, 550, N'濃郁抹茶內餡包裹著香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (28, N'焦糖海鹽布朗尼', 1, 680, N'香濃焦糖和微妙的海鹽味道結合在一起', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (29, N'草莓千層蛋糕', 3, 1380, N'層層鬆軟蛋糕中夾著新鮮草莓', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (30, N'巧克力花園塔', 2, 920, N'精緻巧克力外觀，內含多種巧克力口味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (31, N'香草奶油泡芙', 4, 450, N'香濃香草奶油注入酥脆泡芙中', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (32, N'藍莓乳酪蛋糕', 2, 1080, N'頂級乳酪搭配酸甜藍莓，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (33, N'焦糖拿鐵布丁', 3, 590, N'頂級拿鐵搭配濃郁焦糖布丁，美味絕妙', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (34, N'抹茶紅豆泡芙', 4, 520, N'濃郁抹茶內餡搭配甜蜜紅豆', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (35, N'芒果慕斯蛋糕', 1, 1280, N'新鮮芒果與濃郁慕斯的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (36, N'黑森林蛋糕', 2, 980, N'濃郁巧克力蛋糕中夾著酒漬櫻桃', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (37, N'檸檬塔', 1, 750, N'清新檸檬口味，酸甜可口', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (38, N'蔓越莓乳酪蛋糕', 2, 1080, N'頂級乳酪搭配酸甜蔓越莓，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (39, N'綠茶紅豆泡芙', 4, 520, N'濃郁綠茶內餡搭配甜蜜紅豆', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (40, N'焦糖香蕉布朗尼', 1, 680, N'香濃焦糖和香甜香蕉結合在一起', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (41, N'綿雲花園塔', 2, 920, N'精緻如同綿雲般外觀，內含多種口味', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (42, N'蘋果肉桂泡芙', 4, 520, N'香甜蘋果內餡搭配肉桂風味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (43, N'香草千層蛋糕', 3, 1380, N'層層鬆軟蛋糕中夾著香草奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (44, N'巧克力杏仁塔', 1, 780, N'濃郁巧克力搭配香脆杏仁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (45, N'芒果布丁', 3, 550, N'新鮮芒果和香滑布丁的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (46, N'提拉米蘇', 2, 980, N'經典意大利甜點，濃郁咖啡和香醇奶酒', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (47, N'草莓巧克力泡芙', 4, 620, N'酸甜草莓搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (48, N'焦糖奶油布朗尼', 1, 680, N'香濃焦糖和濃郁奶油結合在一起', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (49, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (50, N'草莓卡士達泡芙', 4, 520, N'酸甜草莓搭配滑順卡士達醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (51, N'藍莓慕斯蛋糕', 1, 1180, N'酸甜藍莓與濃郁慕斯的絕妙組合', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (52, N'焦糖拿鐵布朗尼', 3, 680, N'香濃焦糖和濃郁拿鐵結合在一起', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (53, N'抹茶紅豆蛋糕', 2, 1080, N'濃郁抹茶蛋糕中夾著甜蜜紅豆', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (54, N'芒果塔', 1, 780, N'新鮮芒果搭配酥脆塔皮，口感豐富', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (55, N'黑白巧克力泡芙', 4, 550, N'濃郁黑巧克力和香甜白巧克力內餡', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (56, N'蘋果派', 3, 650, N'新鮮蘋果和香脆派皮的完美結合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (57, N'焦糖杏仁布朗尼', 1, 680, N'香濃焦糖和脆口杏仁的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (58, N'覆盆子乳酪蛋糕', 2, 1080, N'頂級乳酪搭配酸甜覆盆子，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (59, N'榴槤泡芙', 4, 680, N'濃郁榴槤內餡包裹著酥脆泡芙', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (60, N'香草布丁', 3, 480, N'香濃香草奶油搭配滑順布丁', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (61, N'巧克力焦糖塔', 2, 850, N'濃郁巧克力搭配香濃焦糖', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (62, N'蘋果肉桂蛋糕', 1, 980, N'香甜蘋果蛋糕灑上肉桂粉', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (63, N'草莓奶油泡芙', 4, 520, N'酸甜草莓搭配香滑奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (64, N'焦糖香蕉布丁', 3, 590, N'香濃焦糖和香甜香蕉結合在布丁中', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (65, N'抹茶巧克力泡芙', 4, 620, N'濃郁抹茶內餡搭配香甜巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (66, N'藍莓芝士蛋糕', 2, 1280, N'頂級芝士搭配酸甜藍莓，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (67, N'焦糖拿鐵布朗尼', 1, 680, N'香濃焦糖和濃郁拿鐵的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (68, N'檸檬蛋糕', 3, 750, N'清新檸檬風味的鬆軟蛋糕', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (69, N'覆盆子塔', 2, 850, N'酸甜覆盆子搭配香脆塔皮，口感豐富', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (70, N'焦糖杏仁泡芙', 4, 580, N'香濃焦糖和脆口杏仁的美味組合', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (71, N'香草藍莓布丁', 3, 590, N'香濃香草奶油搭配酸甜藍莓布丁', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (72, N'巧克力草莓蛋糕', 1, 1280, N'濃郁巧克力蛋糕中夾著新鮮草莓', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (73, N'焦糖松露', 2, 680, N'香濃焦糖包裹著濃郁巧克力松露', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (74, N'草莓巧克力塔', 1, 850, N'酸甜草莓搭配濃郁巧克力，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (75, N'檸檬乳酪蛋糕', 2, 980, N'頂級乳酪搭配清新檸檬，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (76, N'榴槤慕斯蛋糕', 1, 1480, N'濃郁榴槤與滑順慕斯的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.000' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (77, N'巧克力覆盆子泡芙', 4, 620, N'濃郁巧克力內餡搭配酸甜覆盆子', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (78, N'焦糖香蕉布朗尼', 1, 680, N'香濃焦糖和香甜香蕉的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (79, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (80, N'藍莓卡士達泡芙', 4, 520, N'酸甜藍莓搭配滑順卡士達醬', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (81, N'葡萄乳酪蛋糕', 2, 1080, N'頂級乳酪搭配甜蜜葡萄，口感滑順', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (82, N'焦糖提拉米蘇', 3, 980, N'經典意大利甜點，濃郁焦糖和咖啡', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (83, N'香草巧克力泡芙', 4, 550, N'香濃香草奶油搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (84, N'櫻花塔', 2, 920, N'精緻櫻花外觀，內含多種口味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (85, N'香蕉肉桂泡芙', 4, 520, N'香甜香蕉內餡搭配肉桂風味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (86, N'香草千層蛋糕', 3, 1380, N'層層鬆軟蛋糕中夾著香草奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (87, N'巧克力杏仁塔', 1, 780, N'濃郁巧克力搭配香脆杏仁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (88, N'芒果布丁', 3, 550, N'新鮮芒果和香滑布丁的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (89, N'提拉米蘇', 2, 980, N'經典意大利甜點，濃郁咖啡和香醇奶酒', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (90, N'草莓巧克力泡芙', 4, 620, N'酸甜草莓搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (91, N'焦糖奶油布朗尼', 1, 680, N'香濃焦糖和濃郁奶油結合在一起', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (92, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (93, N'草莓卡士達泡芙', 4, 520, N'酸甜草莓搭配滑順卡士達醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (94, N'藍莓慕斯蛋糕', 1, 1180, N'酸甜藍莓與濃郁慕斯的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (95, N'焦糖拿鐵布朗尼', 3, 680, N'香濃焦糖和濃郁拿鐵結合在一起', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (96, N'抹茶紅豆蛋糕', 2, 1080, N'濃郁抹茶蛋糕中夾著甜蜜紅豆', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (97, N'芒果塔', 1, 780, N'新鮮芒果搭配酥脆塔皮，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (98, N'黑白巧克力泡芙', 4, 550, N'濃郁黑巧克力和香甜白巧克力內餡', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (99, N'蘋果派', 3, 650, N'新鮮蘋果和香脆派皮的完美結合', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
GO
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (100, N'焦糖杏仁布朗尼', 1, 680, N'香濃焦糖和脆口杏仁的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (101, N'覆盆子乳酪蛋糕', 2, 1080, N'頂級乳酪搭配酸甜覆盆子，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (102, N'榴槤泡芙', 4, 680, N'濃郁榴槤內餡包裹著酥脆泡芙', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (103, N'香草布丁', 3, 480, N'香濃香草奶油搭配滑順布丁', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (104, N'巧克力焦糖塔', 2, 850, N'濃郁巧克力搭配香濃焦糖', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (105, N'蘋果肉桂蛋糕', 1, 980, N'香甜蘋果蛋糕灑上肉桂粉', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (106, N'草莓奶油泡芙', 4, 520, N'酸甜草莓搭配香滑奶油', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (107, N'焦糖香蕉布丁', 3, 590, N'香濃焦糖和香甜香蕉結合在布丁中', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (108, N'抹茶巧克力泡芙', 4, 620, N'濃郁抹茶內餡搭配香甜巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (109, N'藍莓芝士蛋糕', 2, 1280, N'頂級芝士搭配酸甜藍莓，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (110, N'焦糖拿鐵布朗尼', 3, 680, N'香濃焦糖和濃郁拿鐵的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (111, N'檸檬蛋糕', 1, 750, N'清新檸檬風味的鬆軟蛋糕', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (112, N'覆盆子塔', 2, 850, N'酸甜覆盆子搭配香脆塔皮，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (113, N'焦糖杏仁泡芙', 4, 580, N'香濃焦糖和脆口杏仁的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (114, N'香草藍莓布丁', 3, 590, N'香濃香草奶油搭配酸甜藍莓布丁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (115, N'巧克力草莓蛋糕', 1, 1280, N'濃郁巧克力蛋糕中夾著新鮮草莓', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (116, N'焦糖松露', 2, 680, N'香濃焦糖包裹著濃郁巧克力松露', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (117, N'草莓巧克力塔', 1, 850, N'酸甜草莓搭配濃郁巧克力，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (118, N'檸檬乳酪蛋糕', 2, 980, N'頂級乳酪搭配清新檸檬，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (119, N'香草擠花慕斯蛋糕', 1, 1380, N'香草擠花與滑順慕斯的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.000' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (120, N'巧克力覆盆子泡芙', 4, 620, N'濃郁巧克力內餡搭配酸甜覆盆子', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (121, N'焦糖香蕉布朗尼', 1, 680, N'香濃焦糖和香甜香蕉的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (122, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (123, N'藍莓卡士達泡芙', 4, 520, N'酸甜藍莓搭配滑順卡士達醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (124, N'葡萄乳酪蛋糕', 2, 1080, N'頂級乳酪搭配甜蜜葡萄，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (125, N'焦糖提拉米蘇', 3, 980, N'經典意大利甜點，濃郁焦糖和咖啡', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (126, N'香草巧克力泡芙', 4, 550, N'香濃香草奶油搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (127, N'櫻花塔', 2, 920, N'精緻櫻花外觀，內含多種口味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (128, N'香蕉肉桂泡芙', 4, 520, N'香甜香蕉內餡搭配肉桂風味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (129, N'香草千層蛋糕', 3, 1380, N'層層鬆軟蛋糕中夾著香草奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (130, N'巧克力杏仁塔', 1, 780, N'濃郁巧克力搭配香脆杏仁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (131, N'芒果布丁', 3, 550, N'新鮮芒果和香滑布丁的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (132, N'提拉米蘇', 2, 980, N'經典意大利甜點，濃郁咖啡和香醇奶酒', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (133, N'草莓巧克力泡芙', 4, 620, N'酸甜草莓搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (134, N'焦糖奶油布朗尼', 1, 680, N'香濃焦糖和濃郁奶油結合在一起', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (135, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (136, N'草莓卡士達泡芙', 4, 520, N'酸甜草莓搭配滑順卡士達醬', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (137, N'藍莓慕斯蛋糕', 1, 1180, N'酸甜藍莓與濃郁慕斯的絕妙組合', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (138, N'焦糖拿鐵布朗尼', 3, 680, N'香濃焦糖和濃郁拿鐵的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (139, N'檸檬蛋糕', 1, 750, N'清新檸檬風味的鬆軟蛋糕', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (140, N'覆盆子塔', 2, 850, N'酸甜覆盆子搭配香脆塔皮，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (141, N'焦糖杏仁泡芙', 4, 580, N'香濃焦糖和脆口杏仁的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (142, N'香草藍莓布丁', 3, 590, N'香濃香草奶油搭配酸甜藍莓布丁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (143, N'巧克力草莓蛋糕', 1, 1280, N'濃郁巧克力蛋糕中夾著新鮮草莓', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (144, N'焦糖松露', 2, 680, N'香濃焦糖包裹著濃郁巧克力松露', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (145, N'草莓巧克力塔', 1, 850, N'酸甜草莓搭配濃郁巧克力，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (146, N'檸檬乳酪蛋糕', 2, 980, N'頂級乳酪搭配清新檸檬，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (147, N'榴槤慕斯蛋糕', 1, 1380, N'濃郁榴槤與滑順慕斯的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (148, N'巧克力覆盆子泡芙', 4, 620, N'濃郁巧克力內餡搭配酸甜覆盆子', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (149, N'焦糖香蕉布丹尼', 1, 680, N'香濃焦糖和香甜香蕉的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (150, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (151, N'藍莓卡士達泡芙', 4, 520, N'酸甜藍莓搭配滑順卡士達醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (152, N'葡萄乳酪蛋糕', 2, 1080, N'頂級乳酪搭配甜蜜葡萄，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (153, N'焦糖提拉米蘇', 3, 980, N'經典意大利甜點，濃郁焦糖和咖啡', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (154, N'香草巧克力泡芙', 4, 550, N'香濃香草奶油搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (155, N'櫻花塔', 2, 920, N'精緻櫻花外觀，內含多種口味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (156, N'香蕉肉桂泡芙', 4, 520, N'香甜香蕉內餡搭配肉桂風味', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (157, N'香草千層蛋糕', 3, 1380, N'層層鬆軟蛋糕中夾著香草奶油', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (158, N'巧克力杏仁塔', 1, 780, N'濃郁巧克力搭配香脆杏仁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (159, N'芒果布丁', 3, 550, N'新鮮芒果和香滑布丁的絕妙組合', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (160, N'提拉米蘇', 2, 980, N'經典意大利甜點，濃郁咖啡和香醇奶酒', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (161, N'草莓巧克力泡芙', 4, 620, N'酸甜草莓搭配濃郁巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (162, N'焦糖奶油布朗尼', 1, 680, N'香濃焦糖和濃郁奶油結合在一起', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (163, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (164, N'草莓卡士達泡芙', 4, 520, N'酸甜草莓搭配滑順卡士達醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (165, N'藍莓慕斯蛋糕', 1, 1180, N'酸甜藍莓與濃郁慕斯的絕妙組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (166, N'焦糖拿鐵布朗尼', 3, 680, N'香濃焦糖和濃郁拿鐵的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (167, N'檸檬蛋糕', 1, 750, N'清新檸檬風味的鬆軟蛋糕', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (168, N'覆盆子塔', 2, 850, N'酸甜覆盆子搭配香脆塔皮，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (169, N'焦糖杏仁泡芙', 4, 580, N'香濃焦糖和脆口杏仁的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (170, N'香草藍莓布丁', 3, 590, N'香濃香草奶油搭配酸甜藍莓布丁', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (171, N'巧克力草莓蛋糕', 1, 1280, N'濃郁巧克力蛋糕中夾著新鮮草莓', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (172, N'焦糖松露', 2, 680, N'香濃焦糖包裹著濃郁巧克力松露', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (173, N'草莓巧克力塔', 1, 850, N'酸甜草莓搭配濃郁巧克力，口感豐富', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (174, N'檸檬乳酪蛋糕', 2, 980, N'頂級乳酪搭配清新檸檬，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (175, N'榴槤慕斯蛋糕', 1, 1380, N'濃郁榴槤與滑順慕斯的絕妙組合', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (176, N'巧克力覆盆子泡芙', 4, 620, N'濃郁巧克力內餡搭配酸甜覆盆子', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (177, N'焦糖香蕉布朗尼', 1, 680, N'香濃焦糖和香甜香蕉的美味組合', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (178, N'抹茶白巧克力塔', 2, 850, N'濃郁抹茶搭配香甜白巧克力', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (179, N'藍莓卡士達泡芙', 4, 520, N'酸甜藍莓搭配滑順卡士達醬', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (180, N'葡萄乳酪蛋糕', 2, 1080, N'頂級乳酪搭配甜蜜葡萄，口感滑順', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (181, N'焦糖提拉米蘇', 3, 980, N'經典意大利甜點，濃郁焦糖和咖啡', 1, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (182, N'香草巧克力泡芙', 4, 550, N'香濃香草奶油搭配濃郁巧克力', 0, CAST(N'2023-06-20T21:00:33.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (183, N'提拉米蘇', 1, 350, N'提拉米蘇蛋糕濃郁的巧克力，搭配馬茲卡彭起司。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (184, N'巧克力熔岩蛋糕', 2, 350, N'巧克力熔岩蛋糕外酥內軟，一切下去，濃郁的巧克力熔岩便會流出來。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (185, N'紅絲絨千層蛋糕', 1, 450, N'紅絲絨千層蛋糕層層疊疊，每一層都滿滿的香甜紅絲絨蛋糕與奶油，每一口都是絕對的享受。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (186, N'法式焦糖布蕾', 3, 320, N'法式焦糖布蕾外脆內嫩，每一口都能感受到焦糖的滑順口感，搭配淡淡的香草風味，讓人愛不釋手。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (187, N'抹茶雪花冰淇淋捲', 3, 380, N'抹茶雪花冰淇淋捲有著濃郁的抹茶口味，外層捲上了薄薄的雪花冰淇淋，清涼又美味。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (188, N'芒果慕斯塔爾特', 3, 320, N'芒果慕斯塔爾特融合了新鮮芒果和鬆軟慕斯，每一口都帶來水果的甜蜜和慕斯的綿密口感。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (189, N'焦糖杏仁塔', 3, 380, N'焦糖杏仁塔外酥內軟，口感香脆，搭配濃郁的焦糖，帶來絕妙的口味饗宴。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (190, N'巧克力草莓塔', 3, 320, N'巧克力草莓塔的外層是酥脆的塔皮，內層則是滿滿的巧克力和新鮮草莓，口感豐富，酸甜交融。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (191, N'藍莓起司蛋糕', 1, 420, N'藍莓起司蛋糕口感綿密濃郁，搭配新鮮藍莓的微酸，給人一種迷人的風味。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (192, N'焦糖海鹽巧克力杯', 3, 350, N'焦糖海鹽巧克力杯結合了濃郁的巧克力和微鹹的海鹽，帶來一種令人上癮的口感。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (193, N'草莓白巧克力慕斯', 3, 420, N'草莓白巧克力慕斯口感細膩，白巧克力的香甜和草莓的酸甜交織在一起，美味無比。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (194, N'檸檬蛋糕捲', 4, 380, N'檸檬蛋糕捲以清新的檸檬為主角，搭配軟綿的蛋糕，帶來一份口感輕盈的甜點享受。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (195, N'紅莓夾心餅乾', 3, 320, N'酥脆的餅乾與酸甜紅莓醬', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (196, N'焦糖榛子布丁', 3, 420, N'焦糖榛子布丁口感滑順，焦糖的甜味和榛子的香脆結合在一起，讓人回味無窮。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (197, N'朱古力曲奇冰淇淋三明治', 3, 350, N'朱古力曲奇冰淇淋三明治結合了濃郁的朱古力和酥脆的曲奇，冰涼的口感讓人愛不釋手。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (198, N'香草莓果塔', 3, 210, N'香草莓果塔以香氣四溢的香草為底，配上新鮮草莓，帶來一份甜蜜的口感享受。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (199, N'巧克力杏仁酥脆球', 3, 320, N'巧克力杏仁酥脆球外層酥脆，內層包裹著香脆的杏仁和美味的巧克力，讓人愛不釋手。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
GO
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (200, N'焦糖香蕉布朗尼', 1, 420, N'焦糖香蕉布朗尼口感濃郁，焦糖的甜味與香蕉的香甜完美結合，給人一種極致的享受。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (201, N'蘋果肉桂派', 3, 380, N'蘋果肉桂派以新鮮蘋果為主角，搭配香氣四溢的肉桂，帶來一份溫暖的口感和香料風味。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (202, N'櫻花杏仁蛋糕捲', 4, 350, N'櫻花杏仁蛋糕捲以柔滑的杏仁為底，點綴著櫻花花瓣，帶來一份優雅的口感和花香味道。', 1, CAST(N'2023-06-20T21:02:24.113' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (207, N'巧克力波士頓派 ', 1, 450, N'百年傳統', 1, CAST(N'2023-06-22T01:08:37.047' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (209, N'老奶奶檸檬蛋糕', 1, 450, N'使用新鮮檸檬製作香氣天然，濕潤蛋糕體上層使用新鮮檸檬汁
加入檸檬皮製作的檸檬糖霜，入口清爽無負擔。甜蜜中帶檸檬酸香
深受大大小小的喜愛，快來吃一口夏日風情吧！', 1, CAST(N'2023-06-22T17:50:22.303' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (210, N'大溪地香草蘭姆可麗露', 3, 400, N'產地原料 |法國麵粉 葉黃素機能蛋 新鮮香草莢', 1, CAST(N'2023-06-22T18:58:06.677' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (211, N'達克瓦茲禮盒(巧克力口味)', 5, 435, N'巧克力口味的', 1, CAST(N'2023-06-23T13:01:35.610' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (212, N'達克瓦茲禮盒(巧克力口味)', 5, 435, N'巧克力口味的', 1, CAST(N'2023-06-23T13:03:43.610' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (213, N'達克瓦茲禮盒(巧克力口味)', 5, 435, N'好吃的達克瓦茲', 1, CAST(N'2023-06-23T13:04:18.740' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (214, N'達克瓦茲禮盒(巧克力口味)', 5, 435, N'巧克力口味', 1, CAST(N'2023-06-23T13:10:00.753' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (215, N'布列塔尼酥餅', 3, 380, N'布列塔尼三重奏當然少不了經典的布列塔尼酥餅!
濃郁奶油香氣配上些許法國鹽之花點綴，
甜中帶點鹹，讓人一口接', 0, CAST(N'2023-06-23T14:00:01.707' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (216, N'大溪地香草蘭姆可麗露', 3, 400, N'la vie!!!

產地原料 |
法國麵粉
葉黃素機能蛋
新鮮香草莢', 1, CAST(N'2023-06-23T14:02:23.953' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (217, N'巧克力波士頓派', 1, 450, N'百年傳統', 1, CAST(N'2023-06-25T13:36:34.530' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (218, N'巧克力波士頓派', 1, 600, N'百年傳統', 1, CAST(N'2023-06-25T13:37:03.340' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (219, N'鐵觀音提拉米蘇', 1, 860, N'獨家自製鐵觀音MASCARPONE CHEESE、  自然農法靈芝蛋、台灣裝園級espresso咖啡、台灣極細低溫烘焙鐵觀音
', 1, CAST(N'2023-06-25T13:40:48.543' AS DateTime))
INSERT [dbo].[Desserts] ([DessertId], [DessertName], [CategoryId], [UnitPrice], [Description], [Status], [CreateTime]) VALUES (220, N'法式經典瑪德蓮禮盒', 5, 570, N'全品項皆為蛋奶素，無添加防腐劑、抗氧化劑，請安心食用！
甜度皆固定，無法依照個人口味做調整。
部分產品含有牛奶、雞蛋、堅果、麩質穀類等，對其過敏體質者請留意。', 1, CAST(N'2023-06-26T19:04:07.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[Desserts] OFF
GO
SET IDENTITY_INSERT [dbo].[DessertTags] ON 

INSERT [dbo].[DessertTags] ([DessertTagId], [DessertId], [DessertTagName]) VALUES (1, NULL, N'新品')
INSERT [dbo].[DessertTags] ([DessertTagId], [DessertId], [DessertTagName]) VALUES (2, NULL, N'暢銷')
SET IDENTITY_INSERT [dbo].[DessertTags] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountGroupItems] ON 

INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (1, 2, 74)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (2, 2, 100)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (3, 2, 121)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (4, 2, 85)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (5, 2, 98)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (6, 2, 90)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (7, 2, 75)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (8, 2, 188)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (9, 2, 165)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (10, 2, 175)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (11, 2, 170)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (12, 3, 180)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (13, 1, 3)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (14, 1, 6)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (15, 1, 11)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (16, 1, 12)
INSERT [dbo].[DiscountGroupItems] ([DiscountGroupItemId], [DiscountGroupId], [DessertId]) VALUES (17, 1, 40)
SET IDENTITY_INSERT [dbo].[DiscountGroupItems] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountGroups] ON 

INSERT [dbo].[DiscountGroups] ([DiscountGroupId], [DiscountGroupName]) VALUES (1, N'父親節優惠')
INSERT [dbo].[DiscountGroups] ([DiscountGroupId], [DiscountGroupName]) VALUES (2, N'母親節優惠')
INSERT [dbo].[DiscountGroups] ([DiscountGroupId], [DiscountGroupName]) VALUES (3, N'雙11優惠')
SET IDENTITY_INSERT [dbo].[DiscountGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountId], [DiscountGroupId], [DiscountName], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [CreateAt]) VALUES (1, NULL, N'母親節特惠全館89折', NULL, NULL, 2, 89, CAST(N'1905-06-29T00:00:00.000' AS DateTime), CAST(N'1905-06-28T00:00:00.000' AS DateTime), CAST(N'1905-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Discounts] ([DiscountId], [DiscountGroupId], [DiscountName], [LimitType], [LimitValue], [DiscountType], [DiscountValue], [StartAt], [EndAt], [CreateAt]) VALUES (2, 3, N'雙11指定商品滿3折100', 1, 3, 1, 100, CAST(N'1905-06-25T00:00:00.000' AS DateTime), CAST(N'1905-06-25T00:00:00.000' AS DateTime), CAST(N'1905-06-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (1, N'Admin', N'123', CAST(N'2000-07-19T13:38:44.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (2, N'Violet', N'123', CAST(N'2021-08-23T15:54:47.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (3, N'Gerard', N'123', CAST(N'2022-09-24T06:15:55.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (4, N'Una', N'123', CAST(N'2022-07-13T16:44:09.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (5, N'Germaine', N'123', CAST(N'2015-09-03T05:41:57.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (6, N'Dawn', N'123', CAST(N'2014-01-29T16:37:45.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (7, N'Rachel', N'123', CAST(N'2018-03-07T10:09:47.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (8, N'Joanne', N'123', CAST(N'2023-03-13T00:53:55.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (9, N'Evadne', N'123', CAST(N'2022-08-02T04:37:39.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (10, N'Julius', N'123', CAST(N'2020-10-04T23:20:40.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (11, N'Cedric', N'123', CAST(N'2016-12-10T09:02:51.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (12, N'Becky', N'123', CAST(N'2022-05-17T14:04:55.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (13, N'Viv', N'123', CAST(N'2019-01-07T21:03:18.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (14, N'Wally', N'123', CAST(N'2014-01-02T14:50:25.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (15, N'Mabel', N'123', CAST(N'2013-06-03T22:17:08.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (16, N'Quincy', N'123', CAST(N'2016-08-15T00:03:07.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (17, N'Bud', N'123', CAST(N'2015-02-08T11:18:04.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (18, N'Pru', N'123', CAST(N'2020-04-21T23:56:00.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (19, N'Rosalie', N'123', CAST(N'2023-04-01T09:29:32.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (20, N'Adolf', N'123', CAST(N'2017-08-04T04:30:55.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (21, N'Naomi', N'123', CAST(N'2021-09-24T17:45:46.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (22, N'Katie', N'123', CAST(N'2020-09-08T11:42:13.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (23, N'Judy', N'123', CAST(N'2021-06-30T13:20:37.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (24, N'Angie', N'123', CAST(N'2015-08-14T15:12:54.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (25, N'Hilda', N'123', CAST(N'2013-01-11T10:13:20.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (26, N'Delia', N'123', CAST(N'2022-11-08T07:20:50.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (27, N'Roberta', N'123', CAST(N'2019-03-17T21:50:24.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (28, N'Isabella', N'123', CAST(N'2022-11-22T15:41:31.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (29, N'Graeme', N'123', CAST(N'2022-07-10T11:44:26.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (30, N'Ollie', N'123', CAST(N'2013-07-09T12:55:31.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (31, N'Grace', N'123', CAST(N'2013-11-06T17:13:36.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (32, N'Di', N'123', CAST(N'2014-05-03T06:18:54.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (33, N'Frances', N'123', CAST(N'2013-09-12T11:42:42.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (34, N'Steven', N'123', CAST(N'2016-03-28T08:41:46.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (35, N'Wally', N'123', CAST(N'2023-02-20T12:55:29.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (36, N'Mervyn', N'123', CAST(N'2023-01-17T22:33:04.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (37, N'Ebenezer', N'123', CAST(N'2019-03-14T08:14:53.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (38, N'Norma', N'123', CAST(N'2020-12-10T12:21:38.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (39, N'Sophie', N'123', CAST(N'2022-08-28T09:32:44.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (40, N'Richie', N'123', CAST(N'2022-01-03T13:24:56.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (41, N'Saul', N'123', CAST(N'2023-01-20T03:57:45.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (42, N'Fidelia', N'123', CAST(N'2018-08-14T02:05:16.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (43, N'Tim', N'123', CAST(N'2013-01-19T18:41:42.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (44, N'Mike', N'123', CAST(N'2020-03-27T20:49:14.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (45, N'Napoleon', N'123', CAST(N'2013-04-13T20:53:57.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (46, N'Rosalind', N'123', CAST(N'2017-12-04T14:22:56.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (47, N'Rosemary', N'123', CAST(N'2016-09-13T03:17:45.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (48, N'Burt', N'123', CAST(N'2016-01-18T17:24:32.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (49, N'Olga', N'123', CAST(N'2018-03-25T19:31:40.000' AS DateTime))
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EncryptedPassword], [CreateAt]) VALUES (50, N'Charlene', N'123', CAST(N'2019-08-03T07:12:48.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (5, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (6, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (7, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (8, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (9, 2)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (10, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (11, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (12, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (13, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (14, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (15, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (16, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (17, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (18, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (19, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (20, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (21, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (22, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (23, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (24, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (25, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (26, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (27, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (28, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (29, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (30, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (31, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (32, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (33, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (34, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (35, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (36, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (37, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (38, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (39, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (40, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (41, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (42, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (43, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (44, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (45, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (46, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (47, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (48, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (49, 3)
INSERT [dbo].[EmployeeToRoles] ([EmployeeId], [RoleId]) VALUES (50, 3)
GO
SET IDENTITY_INSERT [dbo].[LessonCategories] ON 

INSERT [dbo].[LessonCategories] ([LessonCategoryId], [LessonCategoryName]) VALUES (1, N'小蛋糕')
INSERT [dbo].[LessonCategories] ([LessonCategoryId], [LessonCategoryName]) VALUES (2, N'餅乾')
INSERT [dbo].[LessonCategories] ([LessonCategoryId], [LessonCategoryName]) VALUES (3, N'點心')
SET IDENTITY_INSERT [dbo].[LessonCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonImages] ON 

INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (1, 12, N'Lesson1.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (2, 11, N'Lesson2.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (3, 37, N'Lesson3.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (4, 30, N'Lesson4.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (5, 12, N'Lesson5.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (6, 15, N'Lesson6.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (7, 27, N'Lesson7.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (8, 29, N'Lesson8.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (9, 37, N'Lesson9.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (10, 13, N'Lesson10.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (11, 20, N'Lesson11.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (12, 1, N'Lesson12.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (13, 42, N'Lesson13.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (14, 11, N'Lesson14.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (15, 39, N'Lesson15.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (16, 11, N'Lesson16.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (17, 39, N'Lesson17.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (18, 18, N'Lesson18.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (19, 32, N'Lesson19.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (20, 14, N'Lesson20.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (21, 10, N'Lesson21.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (22, 1, N'Lesson22.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (23, 28, N'Lesson23.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (24, 7, N'Lesson24.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (25, 2, N'Lesson25.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (26, 17, N'Lesson26.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (27, 29, N'Lesson27.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (28, 4, N'Lesson28.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (29, 9, N'Lesson29.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (30, 4, N'Lesson30.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (31, 18, N'Lesson31.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (32, 49, N'Lesson32.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (33, 32, N'Lesson33.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (34, 30, N'Lesson34.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (35, 48, N'Lesson35.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (36, 11, N'Lesson36.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (37, 15, N'Lesson37.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (38, 3, N'Lesson38.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (39, 30, N'Lesson39.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (40, 35, N'Lesson40.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (41, 4, N'Lesson41.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (42, 35, N'Lesson42.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (43, 32, N'Lesson43.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (44, 43, N'Lesson44.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (45, 1, N'Lesson45.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (46, 49, N'Lesson46.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (47, 30, N'Lesson47.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (48, 22, N'Lesson48.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (49, 8, N'Lesson49.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (50, 35, N'Lesson50.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (51, 3, N'Lesson51.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (52, 15, N'Lesson52.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (53, 8, N'Lesson53.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (54, 11, N'Lesson54.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (55, 23, N'Lesson55.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (56, 48, N'Lesson56.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (57, 49, N'Lesson57.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (58, 16, N'Lesson58.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (59, 21, N'Lesson59.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (60, 14, N'Lesson60.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (61, 12, N'Lesson61.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (62, 42, N'Lesson62.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (63, 48, N'Lesson63.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (64, 4, N'Lesson64.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (65, 49, N'Lesson65.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (66, 46, N'Lesson66.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (67, 3, N'Lesson67.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (68, 19, N'Lesson68.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (69, 45, N'Lesson69.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (70, 32, N'Lesson70.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (71, 50, N'Lesson71.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (72, 13, N'Lesson72.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (73, 41, N'Lesson73.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (74, 47, N'Lesson74.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (75, 30, N'Lesson75.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (76, 50, N'Lesson76.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (77, 26, N'Lesson77.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (78, 5, N'Lesson78.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (79, 45, N'Lesson79.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (80, 17, N'Lesson80.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (81, 49, N'Lesson81.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (82, 9, N'Lesson82.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (83, 46, N'Lesson83.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (84, 18, N'Lesson84.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (85, 46, N'Lesson85.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (86, 42, N'Lesson86.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (87, 2, N'Lesson87.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (88, 32, N'Lesson88.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (89, 8, N'Lesson89.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (90, 9, N'Lesson90.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (91, 16, N'Lesson91.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (92, 35, N'Lesson92.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (93, 45, N'Lesson93.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (94, 32, N'Lesson94.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (95, 38, N'Lesson95.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (96, 3, N'Lesson96.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (97, 28, N'Lesson97.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (98, 24, N'Lesson98.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (99, 36, N'Lesson99.jpg')
GO
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (100, 37, N'Lesson100.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (101, 26, N'Lesson101.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (102, 45, N'Lesson102.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (103, 29, N'Lesson103.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (104, 38, N'Lesson104.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (105, 47, N'Lesson105.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (106, 42, N'Lesson106.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (107, 13, N'Lesson107.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (108, 35, N'Lesson108.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (109, 21, N'Lesson109.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (110, 23, N'Lesson110.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (111, 1, N'Lesson111.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (112, 11, N'Lesson112.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (113, 25, N'Lesson113.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (114, 48, N'Lesson114.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (115, 18, N'Lesson115.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (116, 4, N'Lesson116.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (117, 32, N'Lesson117.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (118, 11, N'Lesson118.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (119, 5, N'Lesson119.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (120, 2, N'Lesson120.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (121, 45, N'Lesson121.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (122, 16, N'Lesson122.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (123, 5, N'Lesson123.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (124, 31, N'Lesson124.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (125, 13, N'Lesson125.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (126, 33, N'Lesson126.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (127, 14, N'Lesson127.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (128, 12, N'Lesson128.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (129, 7, N'Lesson129.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (130, 40, N'Lesson130.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (131, 13, N'Lesson131.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (132, 5, N'Lesson132.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (133, 7, N'Lesson133.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (134, 28, N'Lesson134.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (135, 21, N'Lesson135.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (136, 16, N'Lesson136.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (137, 15, N'Lesson137.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (138, 9, N'Lesson138.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (139, 4, N'Lesson139.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (140, 18, N'Lesson140.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (141, 15, N'Lesson141.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (142, 42, N'Lesson142.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (143, 15, N'Lesson143.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (144, 21, N'Lesson144.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (145, 32, N'Lesson145.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (146, 20, N'Lesson146.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (147, 6, N'Lesson147.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (148, 43, N'Lesson148.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (149, 2, N'Lesson149.jpg')
INSERT [dbo].[LessonImages] ([LessonImageId], [LessonId], [LessonImageName]) VALUES (150, 6, N'Lesson150.jpg')
SET IDENTITY_INSERT [dbo].[LessonImages] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonOrderDetails] ON 

INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (1, 1, 47, N'手工製作覆盆子冰淇淋', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (2, 1, 40, N'手工製作巧克力夾心餅乾', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (3, 2, 5, N'手工製作草莓千層蛋糕', 1, 2900, 2900)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (4, 2, 34, N'手工製作草莓芝士鬆餅', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (5, 3, 37, N'手工製作檸檬塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (6, 3, 47, N'手工製作覆盆子冰淇淋', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (7, 4, 3, N'手工製作法式馬卡龍', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (8, 4, 28, N'手工製作抹茶布丁', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (9, 5, 41, N'手工製作櫻桃派', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (10, 5, 4, N'手工製作提拉米蘇', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (11, 5, 4, N'手工製作提拉米蘇', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (12, 6, 6, N'手工製作提拉米蘇千層蛋糕', 1, 3000, 3000)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (13, 6, 13, N'手工製作巧克力夾心餅乾', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (14, 7, 49, N'手工製作巧克力曲奇餅', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (15, 7, 49, N'手工製作巧克力曲奇餅', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (16, 8, 46, N'手工製作草莓塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (17, 8, 35, N'手工製作巧克力慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (18, 9, 34, N'手工製作草莓芝士鬆餅', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (19, 9, 39, N'手工製作提子戚風蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (20, 10, 26, N'手工製作巧克力杏仁餅乾', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (21, 10, 24, N'手工製作藍莓起司蛋糕', 1, 2900, 2900)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (22, 11, 34, N'手工製作草莓芝士鬆餅', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (23, 11, 33, N'手工製作黑森林蛋糕', 1, 2900, 2900)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (24, 12, 13, N'手工製作巧克力夾心餅乾', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (25, 12, 32, N'手工製作草莓白巧克力杯子蛋糕', 1, 2700, 2700)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (26, 13, 14, N'手工製作覆盆子起士蛋糕', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (27, 13, 2, N'手工製作焦糖巧克力塔', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (28, 14, 12, N'手工製作草莓奶油蛋糕', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (29, 14, 24, N'手工製作藍莓起司蛋糕', 1, 2900, 2900)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (30, 15, 34, N'手工製作草莓芝士鬆餅', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (31, 15, 13, N'手工製作巧克力夾心餅乾', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (32, 16, 21, N'手工製作提拉米蘇', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (33, 16, 1, N'手工製作巧克力杯子蛋糕', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (34, 17, 1, N'手工製作巧克力杯子蛋糕', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (35, 17, 42, N'手工製作檸檬蛋糕乳酪塔', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (36, 18, 28, N'手工製作抹茶布丁', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (37, 18, 45, N'手工製作抹茶布丁', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (38, 19, 21, N'手工製作提拉米蘇', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (39, 19, 28, N'手工製作抹茶布丁', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (40, 20, 6, N'手工製作提拉米蘇千層蛋糕', 1, 3000, 3000)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (41, 20, 47, N'手工製作覆盆子冰淇淋', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (42, 21, 35, N'手工製作巧克力慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (43, 21, 31, N'手工製作提拉米蘇捲', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (44, 22, 2, N'手工製作焦糖巧克力塔', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (45, 22, 12, N'手工製作草莓奶油蛋糕', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (46, 23, 28, N'手工製作抹茶布丁', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (47, 23, 35, N'手工製作巧克力慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (48, 24, 30, N'手工製作焦糖布丁', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (49, 24, 18, N'手工製作抹茶慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (50, 25, 46, N'手工製作草莓塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (51, 25, 8, N'手工製作藍莓起士蛋糕', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (52, 26, 42, N'手工製作檸檬蛋糕乳酪塔', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (53, 26, 49, N'手工製作巧克力曲奇餅', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (54, 27, 11, N'手工製作焦糖馬卡龍', 1, 2900, 2900)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (55, 27, 19, N'手工製作巧克力杯子蛋糕', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (56, 28, 16, N'手工製作巧克力杏仁酥', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (57, 28, 30, N'手工製作焦糖布丁', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (58, 28, 34, N'手工製作草莓芝士鬆餅', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (59, 29, 47, N'手工製作覆盆子冰淇淋', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (60, 29, 19, N'手工製作巧克力杯子蛋糕', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (61, 30, 46, N'手工製作草莓塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (62, 30, 18, N'手工製作抹茶慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (63, 31, 45, N'手工製作抹茶布丁', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (64, 31, 46, N'手工製作草莓塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (65, 31, 46, N'手工製作草莓塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (66, 32, 10, N'手工製作紅絲絨杯子蛋糕', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (67, 32, 21, N'手工製作提拉米蘇', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (68, 33, 36, N'手工製作焦糖馬卡龍', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (69, 33, 19, N'手工製作巧克力杯子蛋糕', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (70, 34, 15, N'手工製作提拉米蘇慕斯蛋糕', 1, 3000, 3000)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (71, 34, 24, N'手工製作藍莓起司蛋糕', 1, 2900, 2900)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (72, 35, 30, N'手工製作焦糖布丁', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (73, 35, 48, N'手工製作提拉米蘇', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (74, 36, 36, N'手工製作焦糖馬卡龍', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (75, 36, 9, N'手工製作巧克力慕斯蛋糕', 1, 2700, 2700)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (76, 37, 48, N'手工製作提拉米蘇', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (77, 37, 41, N'手工製作櫻桃派', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (78, 38, 2, N'手工製作焦糖巧克力塔', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (79, 38, 9, N'手工製作巧克力慕斯蛋糕', 1, 2700, 2700)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (80, 39, 23, N'手工製作巧克力酥皮塔', 1, 2700, 2700)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (81, 39, 50, N'手工製作紅絲絨蛋糕', 1, 2700, 2700)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (82, 40, 16, N'手工製作巧克力杏仁酥', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (83, 40, 22, N'手工製作草莓塔', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (84, 40, 16, N'手工製作巧克力杏仁酥', 1, 2200, 2200)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (85, 41, 36, N'手工製作焦糖馬卡龍', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (86, 41, 44, N'手工製作提拉米蘇杯子蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (87, 42, 39, N'手工製作提子戚風蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (88, 42, 42, N'手工製作檸檬蛋糕乳酪塔', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (89, 43, 2, N'手工製作焦糖巧克力塔', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (90, 43, 40, N'手工製作巧克力夾心餅乾', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (91, 44, 3, N'手工製作法式馬卡龍', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (92, 44, 27, N'手工製作法式馬卡龍', 1, 3000, 3000)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (93, 45, 41, N'手工製作櫻桃派', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (94, 45, 42, N'手工製作檸檬蛋糕乳酪塔', 1, 2500, 2500)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (95, 46, 9, N'手工製作巧克力慕斯蛋糕', 1, 2700, 2700)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (96, 46, 30, N'手工製作焦糖布丁', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (97, 47, 26, N'手工製作巧克力杏仁餅乾', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (98, 47, 1, N'手工製作巧克力杯子蛋糕', 1, 2300, 2300)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (99, 48, 30, N'手工製作焦糖布丁', 1, 2300, 2300)
GO
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (100, 48, 17, N'手工製作檸檬蛋糕', 1, 2400, 2400)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (101, 49, 35, N'手工製作巧克力慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (102, 49, 18, N'手工製作抹茶慕斯蛋糕', 1, 2600, 2600)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (103, 50, 48, N'手工製作提拉米蘇', 1, 2800, 2800)
INSERT [dbo].[LessonOrderDetails] ([LessonOrderDetailId], [LessonOrderId], [LessonId], [LessonTitle], [NumberOfPeople], [LessonUnitPrice], [Subtotal]) VALUES (104, 50, 49, N'手工製作巧克力曲奇餅', 1, 2600, 2600)
SET IDENTITY_INSERT [dbo].[LessonOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonOrders] ON 

INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (1, 27, 4, 4, CAST(N'2020-10-23T15:41:27.000' AS DateTime), 5300, N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (2, 37, 2, 1, CAST(N'2018-01-30T01:17:45.000' AS DateTime), 5300, NULL, N'無法如期付款', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (3, 16, 4, 1, CAST(N'2018-08-23T14:34:56.000' AS DateTime), 4700, NULL, NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (4, 66, 4, 1, CAST(N'2016-09-27T21:48:29.000' AS DateTime), 4700, N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (5, 57, 2, 4, CAST(N'2013-03-19T22:43:18.000' AS DateTime), 6800, N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (6, 15, 4, 5, CAST(N'2016-11-09T04:53:54.000' AS DateTime), 5500, N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (7, 51, 4, 5, CAST(N'2021-01-02T21:40:54.000' AS DateTime), 5200, NULL, N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (8, 98, 2, 1, CAST(N'2014-03-19T11:23:51.000' AS DateTime), 4800, N'嗨這邊是註記唷', N'無法如期付款', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (9, 34, 2, 4, CAST(N'2017-09-23T07:09:59.000' AS DateTime), 5000, N'嗨這邊是註記唷', N'重複購買', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (10, 67, 1, 2, CAST(N'2013-01-24T04:41:52.000' AS DateTime), 5700, N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (11, 9, 4, 1, CAST(N'2022-12-08T01:24:26.000' AS DateTime), 5300, N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (12, 87, 1, 5, CAST(N'2015-11-27T19:22:14.000' AS DateTime), 5200, N'嗨這邊是註記唷', N'想修改現有訂單', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (13, 46, 3, 3, CAST(N'2017-09-21T20:18:23.000' AS DateTime), 5600, NULL, NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (14, 58, 1, 5, CAST(N'2021-04-09T18:31:42.000' AS DateTime), 5300, NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (15, 76, 2, 2, CAST(N'2018-11-07T10:04:21.000' AS DateTime), 4900, N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (16, 80, 1, 4, CAST(N'2021-10-06T06:46:38.000' AS DateTime), 4800, N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (17, 41, 3, 6, CAST(N'2023-06-14T05:57:11.000' AS DateTime), 4800, N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (18, 19, 3, 5, CAST(N'2020-12-31T22:07:39.000' AS DateTime), 4500, N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (19, 64, 1, 1, CAST(N'2021-08-19T12:01:21.000' AS DateTime), 4700, N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (20, 60, 2, 4, CAST(N'2021-05-27T08:41:47.000' AS DateTime), 5500, N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (21, 1, 3, 1, CAST(N'2017-08-02T12:18:46.000' AS DateTime), 5100, N'嗨這邊是註記唷', N'想變更送貨地址', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (22, 47, 1, 3, CAST(N'2014-04-09T09:43:06.000' AS DateTime), 5200, N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (23, 25, 1, 6, CAST(N'2017-08-08T15:35:02.000' AS DateTime), 4800, NULL, N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (24, 87, 3, 2, CAST(N'2021-01-17T10:54:40.000' AS DateTime), 4900, NULL, N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (25, 30, 3, 2, CAST(N'2016-08-17T21:09:47.000' AS DateTime), 4700, N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (26, 28, 2, 3, CAST(N'2020-08-16T16:42:23.000' AS DateTime), 5100, N'嗨這邊是註記唷', N'想修改現有訂單', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (27, 93, 2, 2, CAST(N'2015-05-13T12:58:37.000' AS DateTime), 5200, N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (28, 54, 2, 3, CAST(N'2015-12-04T03:41:17.000' AS DateTime), 6900, N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (29, 81, 3, 3, CAST(N'2022-11-24T20:47:08.000' AS DateTime), 4800, NULL, N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (30, 35, 4, 2, CAST(N'2017-08-16T06:15:58.000' AS DateTime), 4800, NULL, NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (31, 30, 3, 2, CAST(N'2018-03-02T04:57:39.000' AS DateTime), 6700, N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (32, 7, 1, 5, CAST(N'2018-03-13T01:04:24.000' AS DateTime), 4700, N'嗨這邊是註記唷', N'其他', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (33, 51, 4, 1, CAST(N'2022-05-23T05:54:51.000' AS DateTime), 5100, N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (34, 79, 3, 2, CAST(N'2013-06-30T06:39:11.000' AS DateTime), 5900, N'嗨這邊是註記唷', N'無法如期付款', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (35, 99, 3, 1, CAST(N'2021-04-06T21:31:35.000' AS DateTime), 5100, N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (36, 69, 1, 4, CAST(N'2020-10-14T01:38:57.000' AS DateTime), 5500, NULL, N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (37, 50, 4, 2, CAST(N'2023-05-25T02:38:37.000' AS DateTime), 5200, N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (38, 28, 3, 3, CAST(N'2014-07-12T08:13:45.000' AS DateTime), 5500, N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (39, 79, 2, 3, CAST(N'2019-06-04T00:26:01.000' AS DateTime), 5400, N'嗨這邊是註記唷', N'重複購買', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (40, 15, 4, 4, CAST(N'2022-08-11T21:35:52.000' AS DateTime), 6600, N'嗨這邊是註記唷', N'想修改現有訂單', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (41, 94, 3, 2, CAST(N'2014-11-04T07:27:58.000' AS DateTime), 5400, N'嗨這邊是註記唷', NULL, N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (42, 44, 3, 4, CAST(N'2015-09-28T04:59:26.000' AS DateTime), 5100, NULL, N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (43, 77, 2, 6, CAST(N'2020-02-18T21:48:31.000' AS DateTime), 5600, N'嗨這邊是註記唷', N'想修改現有訂單', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (44, 63, 4, 6, CAST(N'2016-10-25T16:57:08.000' AS DateTime), 5500, N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (45, 18, 4, 4, CAST(N'2020-09-26T12:16:00.000' AS DateTime), 4900, N'嗨這邊是註記唷', N'其他', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (46, 95, 1, 2, CAST(N'2013-11-10T21:33:19.000' AS DateTime), 5000, N'嗨這邊是註記唷', N'想變更送貨地址', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (47, 8, 2, 1, CAST(N'2014-08-18T16:55:09.000' AS DateTime), 5100, NULL, N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (48, 96, 3, 5, CAST(N'2022-12-16T19:10:17.000' AS DateTime), 4700, N'嗨這邊是註記唷', N'重複購買', N'嗨這邊是折扣訊息唷')
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (49, 64, 4, 2, CAST(N'2017-03-04T16:05:33.000' AS DateTime), 5200, NULL, N'想修改現有訂單', NULL)
INSERT [dbo].[LessonOrders] ([LessonOrderId], [MemberId], [LessonOrderStatusId], [CouponId], [CreateTime], [LessonOrderTotal], [Note], [OrderCancellationReason], [DiscountInfo]) VALUES (50, 93, 4, 1, CAST(N'2014-03-14T07:04:03.000' AS DateTime), 5400, N'嗨這邊是註記唷', N'想變更送貨地址', N'嗨這邊是折扣訊息唷')
SET IDENTITY_INSERT [dbo].[LessonOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (1, 1, 10, N'手工製作巧克力杯子蛋糕', N'巧克力的濃郁和杯子蛋糕的綿密口感相互呼應。', N'在這個課程中，您將學習手工製作巧克力杯子蛋糕。從杯子蛋糕的製作、巧克力醬料到最後的裝飾，讓您的巧克力杯子蛋糕香氣撲鼻、口感綿密。', N'巧克力杯子蛋糕 8 個', CAST(N'2023-06-20T14:00:00.000' AS DateTime), 2, 12, 2300, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (2, 1, 15, N'手工製作焦糖巧克力塔', N'焦糖的香甜和巧克力塔的濃郁相得益彰。', N'在這個課程中，您將學習手工製作焦糖巧克力塔。從塔皮的製作、焦糖餡料到最後的裝飾，讓您的焦糖巧克力塔香氣撲鼻、口感濃郁。', N'焦糖巧克力塔 8 個', CAST(N'2023-07-01T10:30:00.000' AS DateTime), 3, 10, 2800, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (3, 1, 23, N'手工製作法式馬卡龍', N'色彩繽紛、口感獨特的法式甜點。', N'在這個課程中，您將學習手工製作法式馬卡龍。從馬卡龍的製作、內餡的調配到最後的裝飾，讓您的法式馬卡龍美味可口、色彩豐富。', N'法式馬卡龍 12 顆', CAST(N'2023-07-08T15:45:00.000' AS DateTime), 2, 15, 2500, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (4, 2, 7, N'手工製作提拉米蘇', N'意大利經典甜點，濃郁香醇的層次滋味。', N'在這個課程中，您將學習手工製作提拉米蘇。從蛋糕層的製作、咖啡餡料的調配到最後的裝飾，讓您的提拉米蘇濃郁香醇、層次豐富。', N'提拉米蘇 1 個', CAST(N'2023-07-12T18:00:00.000' AS DateTime), 2, 8, 2200, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (5, 3, 12, N'手工製作草莓千層蛋糕', N'新鮮草莓和蛋糕層的絕妙組合。', N'在這個課程中，您將學習手工製作草莓千層蛋糕。從蛋糕層的製作、草莓餡料的調配到最後的裝飾，讓您的草莓千層蛋糕美味清爽、口感豐富。', N'草莓千層蛋糕 1 個', CAST(N'2023-07-18T13:15:00.000' AS DateTime), 3, 10, 2900, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (6, 2, 17, N'手工製作提拉米蘇千層蛋糕', N'提拉米蘇與千層蛋糕的完美結合。', N'在這個課程中，您將學習手工製作提拉米蘇千層蛋糕。蛋糕層與提拉米蘇餡料的交替疊加，讓您的提拉米蘇千層蛋糕口感豐富、層次鮮明。', N'提拉米蘇千層蛋糕 1 個', CAST(N'2023-07-25T16:30:00.000' AS DateTime), 4, 12, 3000, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (7, 1, 28, N'手工製作巧克力夾心餅乾', N'外酥內軟的巧克力美味。', N'在這個課程中，您將學習手工製作巧克力夾心餅乾。從餅乾的製作、巧克力餡料的包裹到最後的裝飾，讓您的巧克力夾心餅乾外脆內軟、美味可口。', N'巧克力夾心餅乾 10 個', CAST(N'2023-08-02T11:00:00.000' AS DateTime), 2, 8, 2300, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (8, 2, 5, N'手工製作藍莓起士蛋糕', N'酸甜藍莓與濃郁起士的絕妙結合。', N'在這個課程中，您將學習手工製作藍莓起士蛋糕。從蛋糕底的製作、起士餡料的調配到最後的裝飾，讓您的藍莓起士蛋糕口感柔滑、味道豐富。', N'藍莓起士蛋糕 1 個', CAST(N'2023-08-09T14:45:00.000' AS DateTime), 3, 10, 2500, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (9, 3, 19, N'手工製作巧克力慕斯蛋糕', N'濃郁巧克力與輕盈慕斯的組合。', N'在這個課程中，您將學習手工製作巧克力慕斯蛋糕。從巧克力蛋糕層的製作、慕斯餡料的調配到最後的裝飾，讓您的巧克力慕斯蛋糕口感濃郁、輕盈美妙。', N'巧克力慕斯蛋糕 1 個', CAST(N'2023-08-16T17:30:00.000' AS DateTime), 2, 12, 2700, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (10, 1, 8, N'手工製作紅絲絨杯子蛋糕', N'鮮豔紅色和絲滑口感的完美結合。', N'在這個課程中，您將學習手工製作紅絲絨杯子蛋糕。從杯子蛋糕的製作、奶油鮮奶油的調配到最後的裝飾，讓您的紅絲絨杯子蛋糕外觀精美、口感細膩。', N'紅絲絨杯子蛋糕 8 個', CAST(N'2023-08-23T12:15:00.000' AS DateTime), 2, 10, 2200, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (11, 2, 14, N'手工製作焦糖馬卡龍', N'焦糖的香甜與馬卡龍的綿密口感結合。', N'在這個課程中，您將學習手工製作焦糖馬卡龍。從馬卡龍的製作、焦糖餡料的調配到最後的裝飾，讓您的焦糖馬卡龍口感獨特、香甜可口。', N'焦糖馬卡龍 12 顆', CAST(N'2023-08-30T15:00:00.000' AS DateTime), 3, 12, 2900, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (12, 3, 26, N'手工製作草莓奶油蛋糕', N'新鮮草莓和奶油的搭配綻放美味。', N'在這個課程中，您將學習手工製作草莓奶油蛋糕。從蛋糕底的製作、草莓奶油餡料的調配到最後的裝飾，讓您的草莓奶油蛋糕口感柔軟、清新美味。', N'草莓奶油蛋糕 1 個', CAST(N'2023-09-06T18:45:00.000' AS DateTime), 2, 8, 2400, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (13, 1, 9, N'手工製作巧克力夾心餅乾', N'外酥內軟的巧克力美味。', N'在這個課程中，您將學習手工製作巧克力夾心餅乾。從餅乾的製作、巧克力餡料的包裹到最後的裝飾，讓您的巧克力夾心餅乾外脆內軟、美味可口。', N'巧克力夾心餅乾 10 個', CAST(N'2023-09-13T10:30:00.000' AS DateTime), 2, 10, 2500, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (14, 2, 18, N'手工製作覆盆子起士蛋糕', N'酸甜覆盆子與濃郁起士的絕妙組合。', N'在這個課程中，您將學習手工製作覆盆子起士蛋糕。從蛋糕底的製作、起士餡料的調配到最後的裝飾，讓您的覆盆子起士蛋糕口感細膩、味道豐富。', N'覆盆子起士蛋糕 1 個', CAST(N'2023-09-20T13:45:00.000' AS DateTime), 3, 12, 2800, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (15, 3, 7, N'手工製作提拉米蘇慕斯蛋糕', N'提拉米蘇和慕斯蛋糕的完美結合。', N'在這個課程中，您將學習手工製作提拉米蘇慕斯蛋糕。慕斯蛋糕層與提拉米蘇餡料的交替疊加，讓您的提拉米蘇慕斯蛋糕口感豐富、層次鮮明。', N'提拉米蘇慕斯蛋糕 1 個', CAST(N'2023-09-27T16:00:00.000' AS DateTime), 4, 10, 3000, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (16, 1, 12, N'手工製作巧克力杏仁酥', N'香脆杏仁與濃郁巧克力的絕妙組合。', N'在這個課程中，您將學習手工製作巧克力杏仁酥。從酥皮的製作、巧克力餡料的調配到最後的裝飾，讓您的巧克力杏仁酥香脆可口、美味無比。', N'巧克力杏仁酥 10 個', CAST(N'2023-10-04T11:15:00.000' AS DateTime), 2, 12, 2200, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (17, 2, 25, N'手工製作檸檬蛋糕', N'清新檸檬與蛋糕的結合令人愉悅。', N'在這個課程中，您將學習手工製作檸檬蛋糕。從蛋糕底的製作、檸檬餡料的調配到最後的裝飾，讓您的檸檬蛋糕口感清新、酸甜可口。', N'檸檬蛋糕 1 個', CAST(N'2023-10-11T14:30:00.000' AS DateTime), 3, 8, 2400, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (18, 3, 11, N'手工製作抹茶慕斯蛋糕', N'濃郁抹茶的香氣與輕盈慕斯的口感結合。', N'在這個課程中，您將學習手工製作抹茶慕斯蛋糕。從抹茶蛋糕層的製作、慕斯餡料的調配到最後的裝飾，讓您的抹茶慕斯蛋糕口感濃郁、回味無窮。', N'抹茶慕斯蛋糕 1 個', CAST(N'2023-10-18T17:45:00.000' AS DateTime), 2, 10, 2600, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (19, 1, 22, N'手工製作巧克力杯子蛋糕', N'巧克力的濃郁和杯子蛋糕的綿密口感相互呼應。', N'在這個課程中，您將學習手工製作巧克力杯子蛋糕。從杯子蛋糕的製作、巧克力醬料到最後的裝飾，讓您的巧克力杯子蛋糕香氣撲鼻、口感綿密。', N'巧克力杯子蛋糕 8 個', CAST(N'2023-10-25T12:00:00.000' AS DateTime), 2, 12, 2300, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (20, 2, 16, N'手工製作焦糖巧克力塔', N'焦糖的香甜和巧克力塔的濃郁相得益彰。', N'在這個課程中，您將學習手工製作焦糖巧克力塔。從塔皮的製作、焦糖餡料到最後的裝飾，讓您的焦糖巧克力塔香氣撲鼻、口感濃郁。', N'焦糖巧克力塔 8 個', CAST(N'2023-11-01T10:30:00.000' AS DateTime), 3, 10, 2800, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (21, 3, 20, N'手工製作提拉米蘇', N'濃郁的咖啡與香滑的奶油融合成經典的義式甜點。', N'在這個課程中，您將學習手工製作提拉米蘇。從蛋糕層的製作、奶油餡料的調配到最後的裝飾，讓您的提拉米蘇口感濃郁、香滑可口。', N'提拉米蘇 1 個', CAST(N'2023-11-08T16:00:00.000' AS DateTime), 2, 10, 2500, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (22, 1, 13, N'手工製作草莓塔', N'新鮮草莓的酸甜和塔皮的酥脆相得益彰。', N'在這個課程中，您將學習手工製作草莓塔。從塔皮的製作、草莓餡料的調配到最後的裝飾，讓您的草莓塔色澤鮮亮、口感酥脆。', N'草莓塔 1 個', CAST(N'2023-11-15T11:30:00.000' AS DateTime), 3, 8, 2200, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (23, 2, 25, N'手工製作巧克力酥皮塔', N'巧克力的香甜和酥皮的酥脆交織出美味的結合。', N'在這個課程中，您將學習手工製作巧克力酥皮塔。從塔皮的製作、巧克力餡料的調配到最後的裝飾，讓您的巧克力酥皮塔口感濃郁、酥脆可口。', N'巧克力酥皮塔 1 個', CAST(N'2023-11-22T14:30:00.000' AS DateTime), 2, 10, 2700, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (24, 3, 18, N'手工製作藍莓起司蛋糕', N'酸甜藍莓與濃郁起司的完美組合。', N'在這個課程中，您將學習手工製作藍莓起司蛋糕。從蛋糕的製作、藍莓醬料的調配到最後的裝飾，讓您的藍莓起司蛋糕口感滑嫩、酸甜可口。', N'藍莓起司蛋糕 1 個', CAST(N'2023-11-29T13:00:00.000' AS DateTime), 3, 12, 2900, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (25, 1, 29, N'手工製作水果塔', N'多種水果的鮮甜與塔皮的酥脆交織出繽紛的口感。', N'在這個課程中，您將學習手工製作水果塔。從塔皮的製作、水果餡料的調配到最後的裝飾，讓您的水果塔色彩繽紛、口感清新。', N'水果塔 1 個', CAST(N'2023-12-06T15:30:00.000' AS DateTime), 2, 8, 2400, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (26, 2, 30, N'手工製作巧克力杏仁餅乾', N'香濃巧克力與杏仁的香脆口感相互呼應。', N'在這個課程中，您將學習手工製作巧克力杏仁餅乾。從餅乾的製作、巧克力餡料的調配到最後的烘焙，讓您的巧克力杏仁餅乾香氣四溢、口感香脆可口。', N'巧克力杏仁餅乾 10 個', CAST(N'2023-12-13T16:30:00.000' AS DateTime), 3, 12, 2800, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (27, 3, 23, N'手工製作法式馬卡龍', N'彩色馬卡龍的外觀和口感兼具美感和美味。', N'在這個課程中，您將學習手工製作法式馬卡龍。從麥芽巧克力的製作、馬卡龍外殼的製作到內餡的調配，讓您的法式馬卡龍色彩繽紛、口感獨特。', N'法式馬卡龍 12 個', CAST(N'2023-12-20T13:00:00.000' AS DateTime), 2, 12, 3000, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (28, 1, 16, N'手工製作抹茶布丁', N'抹茶的濃郁和布丁的綿密口感相互交融。', N'在這個課程中，您將學習手工製作抹茶布丁。從布丁的製作、抹茶醬料的調配到最後的裝飾，讓您的抹茶布丁香氣撲鼻、口感綿密。', N'抹茶布丁 6 個', CAST(N'2024-01-03T10:30:00.000' AS DateTime), 3, 10, 2200, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (29, 2, 22, N'手工製作提拉米蘇杯子蛋糕', N'濃郁的咖啡與香滑的奶油融合成經典的義式甜點。', N'在這個課程中，您將學習手工製作提拉米蘇杯子蛋糕。從杯子蛋糕的製作、提拉米蘇餡料的調配到最後的裝飾，讓您的提拉米蘇杯子蛋糕口感濃郁、香滑可口。', N'提拉米蘇杯子蛋糕 8 個', CAST(N'2024-01-10T14:00:00.000' AS DateTime), 2, 12, 2600, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (30, 3, 19, N'手工製作焦糖布丁', N'焦糖的香甜和布丁的綿密口感相得益彰。', N'在這個課程中，您將學習手工製作焦糖布丁。從布丁的製作、焦糖醬料的調配到最後的裝飾，讓您的焦糖布丁香氣撲鼻、口感綿密。', N'焦糖布丁 6 個', CAST(N'2024-01-17T11:30:00.000' AS DateTime), 3, 10, 2300, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (31, 2, 11, N'手工製作提拉米蘇捲', N'濃郁的咖啡與香滑的奶油融合成經典的義式甜點。', N'在這個課程中，您將學習手工製作提拉米蘇捲。從蛋糕捲的製作、提拉米蘇餡料的調配到最後的裝飾，讓您的提拉米蘇捲口感濃郁、香滑可口。', N'提拉米蘇捲 1 個', CAST(N'2024-01-24T14:30:00.000' AS DateTime), 2, 10, 2500, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (32, 1, 14, N'手工製作草莓白巧克力杯子蛋糕', N'新鮮草莓的酸甜和白巧克力蛋糕的濃郁相得益彰。', N'在這個課程中，您將學習手工製作草莓白巧克力杯子蛋糕。從杯子蛋糕的製作、白巧克力醬料的調配到最後的裝飾，讓您的草莓白巧克力杯子蛋糕香氣撲鼻、口感綿密。', N'草莓白巧克力杯子蛋糕 8 個', CAST(N'2024-01-31T13:00:00.000' AS DateTime), 3, 12, 2700, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (33, 3, 12, N'手工製作黑森林蛋糕', N'巧克力的濃郁和櫻桃的酸甜完美融合。', N'在這個課程中，您將學習手工製作黑森林蛋糕。從蛋糕的製作、巧克力餡料和櫻桃醬的調配到最後的裝飾，讓您的黑森林蛋糕口感濃郁、酸甜可口。', N'黑森林蛋糕 1 個', CAST(N'2024-02-07T15:30:00.000' AS DateTime), 2, 10, 2900, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (34, 1, 17, N'手工製作草莓芝士鬆餅', N'新鮮草莓的酸甜和芝士鬆餅的鬆軟口感相互呼應。', N'在這個課程中，您將學習手工製作草莓芝士鬆餅。從鬆餅的製作、草莓餡料和芝士餡料的調配到最後的裝飾，讓您的草莓芝士鬆餅香氣撲鼻、口感鬆軟可口。', N'草莓芝士鬆餅 4 個', CAST(N'2024-02-14T16:30:00.000' AS DateTime), 3, 12, 2400, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (35, 2, 20, N'手工製作巧克力慕斯蛋糕', N'濃郁的巧克力和綿密的慕斯口感讓人陶醉。', N'在這個課程中，您將學習手工製作巧克力慕斯蛋糕。從蛋糕的製作、巧克力醬料和慕斯餡料的調配到最後的裝飾，讓您的巧克力慕斯蛋糕口感濃郁、綿密可口。', N'巧克力慕斯蛋糕 1 個', CAST(N'2024-02-21T13:00:00.000' AS DateTime), 2, 10, 2600, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (36, 3, 13, N'手工製作焦糖馬卡龍', N'焦糖的香甜和馬卡龍的外觀兼具美感和美味。', N'在這個課程中，您將學習手工製作焦糖馬卡龍。從焦糖餡料的製作、馬卡龍外殼的製作到最後的裝飾，讓您的焦糖馬卡龍色澤金黃、口感獨特。', N'焦糖馬卡龍 12 個', CAST(N'2024-02-28T10:30:00.000' AS DateTime), 3, 12, 2800, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (37, 1, 29, N'手工製作檸檬塔', N'檸檬的清新和塔皮的酥脆交織出酸甜可口的口感。', N'在這個課程中，您將學習手工製作檸檬塔。從塔皮的製作、檸檬餡料的調配到最後的裝飾，讓您的檸檬塔色彩鮮亮、口感酸甜可口。', N'檸檬塔 1 個', CAST(N'2024-03-06T11:30:00.000' AS DateTime), 2, 8, 2200, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (38, 2, 30, N'手工製作蘋果派', N'新鮮蘋果的酸甜和酥脆派皮的完美結合。', N'在這個課程中，您將學習手工製作蘋果派。從派皮的製作、蘋果餡料的調配到最後的裝飾，讓您的蘋果派香氣四溢、口感酥脆可口。', N'蘋果派 1 個', CAST(N'2024-03-13T14:00:00.000' AS DateTime), 3, 12, 2400, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (39, 3, 23, N'手工製作提子戚風蛋糕', N'提子的香甜和戚風蛋糕的蓬鬆口感相得益彰。', N'在這個課程中，您將學習手工製作提子戚風蛋糕。從蛋糕的製作、提子醬料的調配到最後的裝飾，讓您的提子戚風蛋糕香氣撲鼻、口感蓬鬆可口。', N'提子戚風蛋糕 1 個', CAST(N'2024-03-20T15:30:00.000' AS DateTime), 2, 10, 2600, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (40, 1, 16, N'手工製作巧克力夾心餅乾', N'濃郁的巧克力和酥脆的餅乾口感令人愉悅。', N'在這個課程中，您將學習手工製作巧克力夾心餅乾。從餅乾的製作、巧克力餡料的調配到最後的烘焙，讓您的巧克力夾心餅乾香氣四溢、口感酥脆可口。', N'巧克力夾心餅乾 10 個', CAST(N'2024-03-27T13:00:00.000' AS DateTime), 3, 12, 2800, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (41, 2, 22, N'手工製作櫻桃派', N'櫻桃的酸甜和酥脆派皮的完美結合。', N'在這個課程中，您將學習手工製作櫻桃派。從派皮的製作、櫻桃餡料的調配到最後的裝飾，讓您的櫻桃派香氣四溢、口感酥脆可口。', N'櫻桃派 1 個', CAST(N'2024-04-03T14:30:00.000' AS DateTime), 2, 10, 2400, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (42, 3, 19, N'手工製作檸檬蛋糕乳酪塔', N'檸檬的清新和乳酪塔的濃郁口感相互呼應。', N'在這個課程中，您將學習手工製作檸檬蛋糕乳酪塔。從塔皮的製作、檸檬蛋糕餡料的調配到最後的裝飾，讓您的檸檬蛋糕乳酪塔香氣撲鼻、口感濃郁可口。', N'檸檬蛋糕乳酪塔 1 個', CAST(N'2024-04-10T11:30:00.000' AS DateTime), 3, 12, 2500, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (43, 1, 14, N'手工製作焦糖馬卡龍', N'焦糖的香甜和馬卡龍的外觀兼具美感和美味。', N'在這個課程中，您將學習手工製作焦糖馬卡龍。從焦糖餡料的製作、馬卡龍外殼的製作到最後的裝飾，讓您的焦糖馬卡龍色澤金黃、口感獨特。', N'焦糖馬卡龍 12 個', CAST(N'2024-04-17T16:00:00.000' AS DateTime), 2, 10, 2700, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (44, 2, 11, N'手工製作提拉米蘇杯子蛋糕', N'濃郁的咖啡與香滑的奶油融合成經典的義式甜點。', N'在這個課程中，您將學習手工製作提拉米蘇杯子蛋糕。從杯子蛋糕的製作、提拉米蘇餡料的調配到最後的裝飾，讓您的提拉米蘇杯子蛋糕口感濃郁、香滑可口。', N'提拉米蘇杯子蛋糕 8 個', CAST(N'2024-04-24T14:00:00.000' AS DateTime), 2, 12, 2600, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (45, 3, 12, N'手工製作抹茶布丁', N'抹茶的香濃和布丁的綿密口感相互交融。', N'在這個課程中，您將學習手工製作抹茶布丁。從布丁的製作、抹茶粉的調配到最後的裝飾，讓您的抹茶布丁色澤綠意、口感綿密可口。', N'抹茶布丁 4 個', CAST(N'2024-05-01T15:30:00.000' AS DateTime), 3, 10, 2300, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (46, 1, 17, N'手工製作草莓塔', N'新鮮草莓的酸甜和酥脆塔皮的絕佳搭配。', N'在這個課程中，您將學習手工製作草莓塔。從塔皮的製作、草莓餡料的調配到最後的裝飾，讓您的草莓塔香氣撲鼻、口感酥脆可口。', N'草莓塔 1 個', CAST(N'2024-05-08T13:00:00.000' AS DateTime), 2, 8, 2200, 0, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (47, 2, 20, N'手工製作覆盆子冰淇淋', N'鮮美的覆盆子和冰涼的冰淇淋令人心醉。', N'在這個課程中，您將學習手工製作覆盆子冰淇淋。從冰淇淋的製作、覆盆子醬料的調配到最後的裝飾，讓您的覆盆子冰淇淋色彩鮮亮、口感冰涼可口。', N'覆盆子冰淇淋 500 克', CAST(N'2024-05-15T14:30:00.000' AS DateTime), 3, 12, 2500, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (48, 3, 13, N'手工製作提拉米蘇', N'咖啡的濃郁和香滑的奶油交織出經典的義式甜點。', N'在這個課程中，您將學習手工製作提拉米蘇。從蛋糕的製作、奶油餡料和咖啡餡料的調配到最後的裝飾，讓您的提拉米蘇口感濃郁、香滑可口。', N'提拉米蘇 1 個', CAST(N'2024-05-22T16:00:00.000' AS DateTime), 2, 10, 2800, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (49, 1, 29, N'手工製作巧克力曲奇餅', N'濃郁的巧克力和酥脆的曲奇餅令人愉悅。', N'在這個課程中，您將學習手工製作巧克力曲奇餅。從曲奇餅的製作、巧克力餡料的調配到最後的烘焙，讓您的巧克力曲奇餅香氣四溢、口感酥脆可口。', N'巧克力曲奇餅 10 個', CAST(N'2024-05-29T14:00:00.000' AS DateTime), 3, 12, 2600, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
INSERT [dbo].[Lessons] ([LessonId], [LessonCategoryId], [TeacherId], [LessonTitle], [LessonInfo], [LessonDetail], [LessonDessert], [LessonTime], [LessonHours], [MaximumCapacity], [LessonPrice], [LessonStatus], [CreateTime]) VALUES (50, 2, 22, N'手工製作紅絲絨蛋糕', N'鮮紅的紅絲絨蛋糕和香滑奶油芝士的絕妙組合。', N'在這個課程中，您將學習手工製作紅絲絨蛋糕。從蛋糕的製作、奶油芝士餡料的調配到最後的裝飾，讓您的紅絲絨蛋糕色彩鮮豔、口感綿密可口。', N'紅絲絨蛋糕 1 個', CAST(N'2024-06-05T15:30:00.000' AS DateTime), 2, 10, 2700, 1, CAST(N'2023-07-03T09:31:26.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonTags] ON 

INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (1, 20, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (2, 21, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (3, 2, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (4, 28, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (5, 8, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (6, 11, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (7, 32, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (8, 24, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (9, 1, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (10, 25, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (11, 27, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (12, 45, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (13, 40, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (14, 14, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (15, 44, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (16, 29, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (17, 47, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (18, 6, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (19, 36, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (20, 2, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (21, 33, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (22, 38, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (23, 15, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (24, 17, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (25, 15, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (26, 49, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (27, 14, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (28, 46, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (29, 21, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (30, 38, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (31, 1, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (32, 47, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (33, 26, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (34, 36, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (35, 45, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (36, 10, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (37, 30, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (38, 32, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (39, 6, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (40, 15, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (41, 18, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (42, 29, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (43, 34, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (44, 1, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (45, 42, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (46, 44, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (47, 29, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (48, 31, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (49, 27, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (50, 9, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (51, 30, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (52, 50, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (53, 44, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (54, 42, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (55, 36, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (56, 13, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (57, 23, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (58, 11, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (59, 8, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (60, 37, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (61, 20, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (62, 42, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (63, 6, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (64, 5, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (65, 28, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (66, 25, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (67, 39, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (68, 50, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (69, 23, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (70, 7, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (71, 25, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (72, 5, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (73, 34, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (74, 14, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (75, 39, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (76, 42, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (77, 14, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (78, 3, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (79, 44, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (80, 48, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (81, 29, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (82, 38, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (83, 7, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (84, 2, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (85, 49, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (86, 28, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (87, 21, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (88, 3, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (89, 21, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (90, 11, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (91, 23, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (92, 3, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (93, 48, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (94, 4, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (95, 4, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (96, 35, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (97, 6, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (98, 21, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (99, 31, N'母親節特別活動')
GO
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (100, 49, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (101, 27, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (102, 12, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (103, 44, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (104, 38, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (105, 25, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (106, 34, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (107, 35, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (108, 8, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (109, 19, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (110, 6, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (111, 50, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (112, 1, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (113, 11, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (114, 9, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (115, 38, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (116, 6, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (117, 29, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (118, 40, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (119, 12, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (120, 24, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (121, 34, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (122, 40, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (123, 43, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (124, 45, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (125, 37, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (126, 18, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (127, 46, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (128, 36, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (129, 18, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (130, 4, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (131, 24, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (132, 6, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (133, 28, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (134, 34, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (135, 40, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (136, 47, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (137, 39, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (138, 17, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (139, 31, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (140, 46, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (141, 15, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (142, 49, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (143, 45, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (144, 18, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (145, 47, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (146, 5, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (147, 50, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (148, 43, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (149, 3, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (150, 48, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (151, 39, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (152, 6, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (153, 31, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (154, 3, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (155, 39, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (156, 46, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (157, 39, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (158, 2, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (159, 16, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (160, 25, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (161, 37, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (162, 24, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (163, 11, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (164, 46, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (165, 25, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (166, 12, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (167, 45, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (168, 28, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (169, 22, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (170, 10, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (171, 14, N'創意烘焙')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (172, 42, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (173, 24, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (174, 43, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (175, 12, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (176, 48, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (177, 4, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (178, 24, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (179, 39, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (180, 49, N'素食甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (181, 46, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (182, 45, N'母親節特別活動')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (183, 6, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (184, 7, N'熱銷課程')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (185, 47, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (186, 27, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (187, 38, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (188, 5, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (189, 30, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (190, 9, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (191, 16, N'巧克力藝術')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (192, 12, N'亞洲風味')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (193, 10, N'手工製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (194, 8, N'家庭廚藝')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (195, 38, N'冰淇淋製作')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (196, 50, N'健康甜點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (197, 36, N'法式糕點')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (198, 35, N'季節限定')
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (199, 50, N'熱銷課程')
GO
INSERT [dbo].[LessonTags] ([LessonTagId], [LessonId], [LessonTagName]) VALUES (200, 39, N'創意烘焙')
SET IDENTITY_INSERT [dbo].[LessonTags] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberCoupons] ON 

INSERT [dbo].[MemberCoupons] ([MemberCouponId], [MemberId], [CouponId], [Status], [CreateAt], [UseAt], [ExpireAt], [CouponName]) VALUES (1, 1, 1, 1, CAST(N'1905-06-15T00:00:00.000' AS DateTime), NULL, CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'父親節滿1000打88折')
INSERT [dbo].[MemberCoupons] ([MemberCouponId], [MemberId], [CouponId], [Status], [CreateAt], [UseAt], [ExpireAt], [CouponName]) VALUES (2, 1, 2, 3, CAST(N'1905-07-11T00:00:00.000' AS DateTime), CAST(N'1905-06-29T00:00:00.000' AS DateTime), CAST(N'1905-07-12T00:00:00.000' AS DateTime), N'300元折價券')
INSERT [dbo].[MemberCoupons] ([MemberCouponId], [MemberId], [CouponId], [Status], [CreateAt], [UseAt], [ExpireAt], [CouponName]) VALUES (3, 1, 4, 4, CAST(N'1905-07-15T00:00:00.000' AS DateTime), NULL, CAST(N'1905-07-08T00:00:00.000' AS DateTime), N'新註冊會員50元折價券')
SET IDENTITY_INSERT [dbo].[MemberCoupons] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (1, N'Adolf', N'adolf@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'基隆市海區文化路146號', N'0928414628', CAST(N'2017-12-14T18:38:28.000' AS DateTime), CAST(N'1980-01-19T00:00:00.000' AS DateTime), 0, N'image140.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (2, N'Ebenezer', N'ebenezer@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'桃園市舊區建國路192號', N'0944719668', CAST(N'2015-01-02T10:44:00.000' AS DateTime), CAST(N'1999-07-21T00:00:00.000' AS DateTime), 0, N'image7.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (3, N'Bradford', N'bradford@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣東區福建路257號', N'0914688362', CAST(N'2019-08-13T10:01:06.000' AS DateTime), CAST(N'2000-09-26T00:00:00.000' AS DateTime), 1, N'image89.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (4, N'Matt', N'matt@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣山區敦化路430號', N'0957544183', CAST(N'2022-12-27T03:24:20.000' AS DateTime), CAST(N'2003-08-22T00:00:00.000' AS DateTime), 0, N'image174.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (5, N'Eugene', N'eugene@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣新區和平路82號', N'0904960856', CAST(N'2015-11-14T23:26:23.000' AS DateTime), CAST(N'2016-01-14T00:00:00.000' AS DateTime), 1, N'image15.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (6, N'Susan', N'susan@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市山區忠孝路444號', N'0972064104', CAST(N'2021-05-15T19:32:16.000' AS DateTime), CAST(N'2009-10-09T00:00:00.000' AS DateTime), 1, N'image190.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (7, N'Edward', N'edward@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市舊區信義路274號', N'0929343350', CAST(N'2013-08-18T05:25:11.000' AS DateTime), CAST(N'2002-10-21T00:00:00.000' AS DateTime), 0, N'image4.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (8, N'Norma', N'norma@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市新區成功路390號', N'0955493919', CAST(N'2022-10-02T20:03:27.000' AS DateTime), CAST(N'1982-03-31T00:00:00.000' AS DateTime), 1, N'image134.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (9, N'Jonathan', N'jonathan@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣北區中正路55號', N'0977385466', CAST(N'2018-04-12T00:26:06.000' AS DateTime), CAST(N'2009-06-26T00:00:00.000' AS DateTime), 0, N'image89.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (10, N'Desmond', N'desmond@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣中和區敦化路160號', N'0959282142', CAST(N'2022-06-30T20:51:01.000' AS DateTime), CAST(N'1988-03-31T00:00:00.000' AS DateTime), 0, N'image90.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (11, N'Jean', N'jean@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣山區建國路117號', N'0953433931', CAST(N'2021-12-21T09:04:06.000' AS DateTime), CAST(N'1975-07-20T00:00:00.000' AS DateTime), 1, N'image14.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (12, N'Hubert', N'hubert@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市海區信義路127號', N'0963639529', CAST(N'2022-06-18T17:14:23.000' AS DateTime), CAST(N'1991-04-12T00:00:00.000' AS DateTime), 0, N'image14.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (13, N'Gene', N'gene@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣舊區中山路418號', N'0975760053', CAST(N'2021-08-15T23:55:55.000' AS DateTime), CAST(N'2016-12-20T00:00:00.000' AS DateTime), 1, N'image126.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (14, N'Laura', N'laura@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣北區忠孝路404號', N'0944233172', CAST(N'2020-03-13T16:07:10.000' AS DateTime), CAST(N'1974-03-13T00:00:00.000' AS DateTime), 0, N'image22.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (15, N'Rudolph', N'rudolph@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市北市區敦化路304號', N'0906818137', CAST(N'2015-05-18T00:35:38.000' AS DateTime), CAST(N'2001-06-16T00:00:00.000' AS DateTime), 0, N'image25.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (16, N'Harriet', N'harriet@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市南市區和平路378號', N'0966660653', CAST(N'2018-10-02T14:16:59.000' AS DateTime), CAST(N'1992-07-22T00:00:00.000' AS DateTime), 0, N'image150.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (17, N'Fred', N'fred@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣北區光復路377號', N'0967366145', CAST(N'2020-01-26T04:11:05.000' AS DateTime), CAST(N'2010-10-04T00:00:00.000' AS DateTime), 1, N'image189.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (18, N'Neddy', N'neddy@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣北市區和平路170號', N'0902961381', CAST(N'2022-05-11T13:02:10.000' AS DateTime), CAST(N'2022-09-14T00:00:00.000' AS DateTime), 1, N'image170.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (19, N'Alistair', N'alistair@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'彰化縣山區光復路479號', N'0948090577', CAST(N'2019-04-08T17:45:34.000' AS DateTime), CAST(N'1995-04-10T00:00:00.000' AS DateTime), 1, N'image189.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (20, N'Laura', N'laura@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中正區中正路392號', N'0916934670', CAST(N'2014-12-05T22:32:41.000' AS DateTime), CAST(N'1973-03-03T00:00:00.000' AS DateTime), 1, N'image99.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (21, N'Jessy', N'jessy@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'高雄市中和區福建路167號', N'0984456071', CAST(N'2023-04-09T10:47:30.000' AS DateTime), CAST(N'1996-08-29T00:00:00.000' AS DateTime), 0, N'image137.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (22, N'Eileen', N'eileen@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣山區和平路300號', N'0979631549', CAST(N'2021-03-03T18:51:25.000' AS DateTime), CAST(N'1974-08-21T00:00:00.000' AS DateTime), 1, N'image193.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (23, N'Donna', N'donna@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中正區中山路211號', N'0999976984', CAST(N'2018-09-18T22:10:27.000' AS DateTime), CAST(N'1979-09-09T00:00:00.000' AS DateTime), 0, N'image97.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (24, N'Richard', N'richard@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣北市區中山路94號', N'0954443394', CAST(N'2020-01-25T23:20:30.000' AS DateTime), CAST(N'2009-09-21T00:00:00.000' AS DateTime), 0, N'image15.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (25, N'Marvin', N'marvin@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣中正區和平路260號', N'0926633316', CAST(N'2019-03-10T10:26:55.000' AS DateTime), CAST(N'1976-01-04T00:00:00.000' AS DateTime), 0, N'image145.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (26, N'Joyce', N'joyce@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市北區文化路61號', N'0954647699', CAST(N'2014-07-09T02:03:40.000' AS DateTime), CAST(N'1979-02-17T00:00:00.000' AS DateTime), 0, N'image36.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (27, N'Kay', N'kay@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣東區文化路365號', N'0967782101', CAST(N'2021-12-07T05:42:29.000' AS DateTime), CAST(N'2019-09-27T00:00:00.000' AS DateTime), 1, N'image186.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (28, N'Dick', N'dick@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣中山區中正路27號', N'0993605578', CAST(N'2016-06-08T04:13:44.000' AS DateTime), CAST(N'2020-08-04T00:00:00.000' AS DateTime), 0, N'image29.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (29, N'Maud', N'maud@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣新區文化路466號', N'0957727816', CAST(N'2013-07-04T13:02:57.000' AS DateTime), CAST(N'2009-06-29T00:00:00.000' AS DateTime), 1, N'image158.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (30, N'Cedric', N'cedric@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣海區光復路478號', N'0923249773', CAST(N'2013-05-14T12:52:02.000' AS DateTime), CAST(N'1978-05-03T00:00:00.000' AS DateTime), 0, N'image74.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (31, N'Edgar', N'edgar@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣中和區和平路67號', N'0940094810', CAST(N'2015-12-05T12:06:45.000' AS DateTime), CAST(N'1990-04-24T00:00:00.000' AS DateTime), 0, N'image175.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (32, N'Nina', N'nina@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣北市區福建路286號', N'0964865755', CAST(N'2017-08-07T20:14:38.000' AS DateTime), CAST(N'1984-11-08T00:00:00.000' AS DateTime), 0, N'image6.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (33, N'Viv', N'viv@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市東區忠孝路263號', N'0992334225', CAST(N'2021-10-27T00:09:53.000' AS DateTime), CAST(N'1988-12-12T00:00:00.000' AS DateTime), 0, N'image49.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (34, N'Roberta', N'roberta@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣中正區成功路8號', N'0951295220', CAST(N'2018-03-01T14:37:06.000' AS DateTime), CAST(N'2007-07-05T00:00:00.000' AS DateTime), 1, N'image122.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (35, N'Lisa', N'lisa@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣新區文化路455號', N'0964851839', CAST(N'2016-08-21T01:02:44.000' AS DateTime), CAST(N'1990-11-17T00:00:00.000' AS DateTime), 1, N'image184.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (36, N'Jan', N'jan@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣新區中山路287號', N'0924538852', CAST(N'2019-09-05T18:56:59.000' AS DateTime), CAST(N'1986-10-04T00:00:00.000' AS DateTime), 0, N'image200.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (37, N'Suzanne', N'suzanne@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣北市區建國路356號', N'0991079594', CAST(N'2021-12-03T19:49:57.000' AS DateTime), CAST(N'2002-07-28T00:00:00.000' AS DateTime), 1, N'image39.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (38, N'Hugh', N'hugh@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市東區敦化路279號', N'0987380454', CAST(N'2018-08-16T15:43:12.000' AS DateTime), CAST(N'1989-04-27T00:00:00.000' AS DateTime), 1, N'image56.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (39, N'Lydia', N'lydia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市南區民生路74號', N'0965133815', CAST(N'2020-10-15T05:30:32.000' AS DateTime), CAST(N'1992-05-03T00:00:00.000' AS DateTime), 1, N'image15.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (40, N'Elizabeth', N'elizabeth@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣中區信義路426號', N'0913756924', CAST(N'2019-05-19T23:54:31.000' AS DateTime), CAST(N'2007-06-08T00:00:00.000' AS DateTime), 0, N'image120.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (41, N'Althea', N'althea@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣北區中山路96號', N'0934818470', CAST(N'2017-07-15T05:45:07.000' AS DateTime), CAST(N'2000-03-18T00:00:00.000' AS DateTime), 1, N'image55.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (42, N'Barnaby', N'barnaby@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市中正區信義路441號', N'0954472086', CAST(N'2019-10-23T07:44:54.000' AS DateTime), CAST(N'2008-06-07T00:00:00.000' AS DateTime), 1, N'image90.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (43, N'Violet', N'violet@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣山區中正路321號', N'0935913256', CAST(N'2018-02-23T17:54:05.000' AS DateTime), CAST(N'1979-05-06T00:00:00.000' AS DateTime), 1, N'image141.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (44, N'Lance', N'lance@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣南市區成功路226號', N'0920268722', CAST(N'2016-01-03T18:44:37.000' AS DateTime), CAST(N'1978-02-27T00:00:00.000' AS DateTime), 0, N'image124.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (45, N'Ursula', N'ursula@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市山區敦化路247號', N'0935749510', CAST(N'2023-03-14T18:12:34.000' AS DateTime), CAST(N'1981-07-30T00:00:00.000' AS DateTime), 1, N'image136.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (46, N'Ida', N'ida@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市山區敦化路83號', N'0999723611', CAST(N'2021-09-05T23:29:46.000' AS DateTime), CAST(N'1979-05-19T00:00:00.000' AS DateTime), 1, N'image83.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (47, N'Aggie', N'aggie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市舊區民生路206號', N'0960452226', CAST(N'2021-04-14T17:01:43.000' AS DateTime), CAST(N'2021-01-02T00:00:00.000' AS DateTime), 0, N'image182.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (48, N'Charlotte', N'charlotte@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'彰化縣中山區建國路94號', N'0965464612', CAST(N'2020-09-26T16:15:46.000' AS DateTime), CAST(N'1996-07-16T00:00:00.000' AS DateTime), 0, N'image47.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (49, N'Ian', N'ian@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市海區福建路260號', N'0936713812', CAST(N'2018-04-13T07:48:34.000' AS DateTime), CAST(N'1992-04-29T00:00:00.000' AS DateTime), 0, N'image63.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (50, N'Ray', N'ray@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣新區文化路138號', N'0963748740', CAST(N'2017-08-20T18:12:47.000' AS DateTime), CAST(N'2017-01-03T00:00:00.000' AS DateTime), 0, N'image145.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (51, N'Charlotte', N'charlotte@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'桃園市舊區福建路96號', N'0919166369', CAST(N'2013-02-10T17:46:23.000' AS DateTime), CAST(N'2005-06-18T00:00:00.000' AS DateTime), 0, N'image27.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (52, N'Stephanie', N'stephanie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'桃園市舊區敦化路309號', N'0994786226', CAST(N'2014-06-08T16:40:51.000' AS DateTime), CAST(N'1976-06-06T00:00:00.000' AS DateTime), 0, N'image195.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (53, N'Tabitha', N'tabitha@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣舊區福建路118號', N'0914903144', CAST(N'2014-09-24T05:22:15.000' AS DateTime), CAST(N'2010-12-26T00:00:00.000' AS DateTime), 0, N'image16.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (54, N'Homer', N'homer@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市北市區忠孝路495號', N'0921352950', CAST(N'2021-05-23T11:45:29.000' AS DateTime), CAST(N'2017-02-08T00:00:00.000' AS DateTime), 0, N'image104.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (55, N'Rex', N'rex@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣南市區和平路230號', N'0943114002', CAST(N'2023-04-21T21:30:03.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), 0, N'image120.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (56, N'Joanne', N'joanne@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市海區中正路480號', N'0993233634', CAST(N'2016-06-09T05:45:54.000' AS DateTime), CAST(N'1977-07-26T00:00:00.000' AS DateTime), 1, N'image198.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (57, N'Terence', N'terence@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣西區民生路30號', N'0900299739', CAST(N'2016-07-05T16:35:27.000' AS DateTime), CAST(N'2007-12-08T00:00:00.000' AS DateTime), 0, N'image66.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (58, N'Brad', N'brad@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'基隆市中區建國路243號', N'0958552984', CAST(N'2020-01-30T07:11:43.000' AS DateTime), CAST(N'1989-04-23T00:00:00.000' AS DateTime), 1, N'image112.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (59, N'Robert', N'robert@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市中正區光復路466號', N'0949949484', CAST(N'2013-12-26T12:28:40.000' AS DateTime), CAST(N'2001-11-30T00:00:00.000' AS DateTime), 1, N'image55.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (60, N'Stella', N'stella@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣中區敦化路197號', N'0988133704', CAST(N'2017-01-27T12:17:22.000' AS DateTime), CAST(N'2013-02-10T00:00:00.000' AS DateTime), 0, N'image119.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (61, N'Ruth', N'ruth@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣東區民生路12號', N'0946734663', CAST(N'2017-11-07T21:14:42.000' AS DateTime), CAST(N'2017-01-18T00:00:00.000' AS DateTime), 0, N'image25.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (62, N'Ida', N'ida@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣新區光復路223號', N'0959026393', CAST(N'2020-07-31T07:17:34.000' AS DateTime), CAST(N'2001-03-28T00:00:00.000' AS DateTime), 1, N'image73.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (63, N'Pearce', N'pearce@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市新區忠孝路42號', N'0915114592', CAST(N'2020-05-11T22:55:21.000' AS DateTime), CAST(N'2022-12-24T00:00:00.000' AS DateTime), 1, N'image128.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (64, N'Cora', N'cora@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市中和區和平路489號', N'0952661961', CAST(N'2019-12-29T20:12:09.000' AS DateTime), CAST(N'2011-07-25T00:00:00.000' AS DateTime), 0, N'image169.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (65, N'Mort', N'mort@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'連江縣海區民生路200號', N'0909580642', CAST(N'2020-12-09T07:59:27.000' AS DateTime), CAST(N'1983-10-18T00:00:00.000' AS DateTime), 1, N'image125.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (66, N'Patrick', N'patrick@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市中正區成功路78號', N'0954845535', CAST(N'2022-02-09T18:46:43.000' AS DateTime), CAST(N'1982-12-18T00:00:00.000' AS DateTime), 0, N'image182.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (67, N'Silvia', N'silvia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣中正區民生路467號', N'0990530703', CAST(N'2020-03-13T06:33:46.000' AS DateTime), CAST(N'2007-12-10T00:00:00.000' AS DateTime), 1, N'image10.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (68, N'Vincent', N'vincent@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣中正區福建路57號', N'0909986317', CAST(N'2013-05-29T06:01:25.000' AS DateTime), CAST(N'1979-07-11T00:00:00.000' AS DateTime), 0, N'image145.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (69, N'Cary', N'cary@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣南區忠孝路459號', N'0983182629', CAST(N'2019-11-13T23:48:44.000' AS DateTime), CAST(N'2000-08-03T00:00:00.000' AS DateTime), 1, N'image192.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (70, N'Viv', N'viv@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣東區中山路346號', N'0914256894', CAST(N'2020-08-30T01:49:11.000' AS DateTime), CAST(N'2013-06-14T00:00:00.000' AS DateTime), 0, N'image133.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (71, N'Bradford', N'bradford@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'桃園市北市區中正路254號', N'0992993232', CAST(N'2022-10-01T17:33:21.000' AS DateTime), CAST(N'1985-03-21T00:00:00.000' AS DateTime), 1, N'image32.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (72, N'Silvia', N'silvia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'基隆市東區和平路296號', N'0935943697', CAST(N'2017-09-24T03:18:18.000' AS DateTime), CAST(N'2017-09-18T00:00:00.000' AS DateTime), 1, N'image125.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (73, N'Ada', N'ada@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市南區民生路358號', N'0975155411', CAST(N'2020-10-20T09:33:21.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), 0, N'image193.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (74, N'Marilyn', N'marilyn@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣中正區信義路246號', N'0917107187', CAST(N'2016-05-22T04:40:20.000' AS DateTime), CAST(N'1974-05-27T00:00:00.000' AS DateTime), 1, N'image85.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (75, N'George', N'george@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市東區建國路384號', N'0904063559', CAST(N'2016-11-26T16:28:11.000' AS DateTime), CAST(N'1986-01-24T00:00:00.000' AS DateTime), 0, N'image162.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (76, N'Prudence', N'prudence@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣山區和平路22號', N'0901712654', CAST(N'2013-04-20T18:14:16.000' AS DateTime), CAST(N'1979-07-24T00:00:00.000' AS DateTime), 0, N'image129.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (77, N'Thea', N'thea@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中和區光復路480號', N'0970600667', CAST(N'2022-06-11T13:03:47.000' AS DateTime), CAST(N'1996-04-12T00:00:00.000' AS DateTime), 1, N'image114.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (78, N'Bob', N'bob@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣舊區信義路209號', N'0941838914', CAST(N'2017-08-16T11:13:50.000' AS DateTime), CAST(N'1973-06-16T00:00:00.000' AS DateTime), 1, N'image60.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (79, N'Doug', N'doug@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣中山區文化路413號', N'0943743542', CAST(N'2014-07-16T04:17:18.000' AS DateTime), CAST(N'1991-09-26T00:00:00.000' AS DateTime), 1, N'image78.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (80, N'Valerie', N'valerie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市中正區建國路28號', N'0924339902', CAST(N'2015-11-10T09:24:26.000' AS DateTime), CAST(N'1990-01-17T00:00:00.000' AS DateTime), 0, N'image5.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (81, N'Warren', N'warren@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市北區忠孝路24號', N'0913276628', CAST(N'2016-11-23T09:49:05.000' AS DateTime), CAST(N'1995-03-25T00:00:00.000' AS DateTime), 0, N'image41.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (82, N'Ellie', N'ellie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市海區民生路116號', N'0928744366', CAST(N'2022-03-07T05:18:21.000' AS DateTime), CAST(N'1990-03-21T00:00:00.000' AS DateTime), 1, N'image174.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (83, N'Anthea', N'anthea@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中正區文化路106號', N'0949849101', CAST(N'2015-04-15T13:46:04.000' AS DateTime), CAST(N'2017-01-16T00:00:00.000' AS DateTime), 0, N'image10.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (84, N'Padraic', N'padraic@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣南區信義路478號', N'0927675690', CAST(N'2018-08-19T12:42:29.000' AS DateTime), CAST(N'2022-01-31T00:00:00.000' AS DateTime), 1, N'image55.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (85, N'Olga', N'olga@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市北市區建國路301號', N'0958701132', CAST(N'2017-03-06T19:18:35.000' AS DateTime), CAST(N'1993-09-19T00:00:00.000' AS DateTime), 0, N'image3.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (86, N'Walter', N'walter@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'連江縣南市區文化路118號', N'0942950856', CAST(N'2019-09-25T05:52:26.000' AS DateTime), CAST(N'1997-02-16T00:00:00.000' AS DateTime), 0, N'image131.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (87, N'Errol', N'errol@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市北區信義路20號', N'0927132358', CAST(N'2022-10-31T07:07:40.000' AS DateTime), CAST(N'2009-02-16T00:00:00.000' AS DateTime), 0, N'image180.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (88, N'Erica', N'erica@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣西區福建路88號', N'0962123711', CAST(N'2018-08-17T04:00:44.000' AS DateTime), CAST(N'2003-04-11T00:00:00.000' AS DateTime), 1, N'image78.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (89, N'Tony', N'tony@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣北市區和平路193號', N'0960161768', CAST(N'2022-09-19T02:09:53.000' AS DateTime), CAST(N'2020-04-13T00:00:00.000' AS DateTime), 0, N'image71.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (90, N'Daniel', N'daniel@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣南市區敦化路413號', N'0960244036', CAST(N'2018-06-13T20:35:03.000' AS DateTime), CAST(N'2012-04-17T00:00:00.000' AS DateTime), 1, N'image166.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (91, N'Isaac', N'isaac@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣西區民生路26號', N'0952655745', CAST(N'2020-08-19T10:53:45.000' AS DateTime), CAST(N'2000-02-06T00:00:00.000' AS DateTime), 1, N'image60.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (92, N'Monroe', N'monroe@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣西區福建路341號', N'0975346038', CAST(N'2020-06-14T02:03:39.000' AS DateTime), CAST(N'2005-03-13T00:00:00.000' AS DateTime), 1, N'image183.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (93, N'Sean', N'sean@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市南市區建國路247號', N'0990753653', CAST(N'2021-06-02T14:15:07.000' AS DateTime), CAST(N'2017-03-05T00:00:00.000' AS DateTime), 0, N'image81.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (94, N'Felicity', N'felicity@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣北區文化路222號', N'0980941938', CAST(N'2015-05-20T22:10:55.000' AS DateTime), CAST(N'2015-03-02T00:00:00.000' AS DateTime), 0, N'image59.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (95, N'Hamilton', N'hamilton@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣中區和平路142號', N'0942495698', CAST(N'2015-09-15T00:42:14.000' AS DateTime), CAST(N'2021-01-03T00:00:00.000' AS DateTime), 1, N'image182.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (96, N'Martha', N'martha@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣新區和平路248號', N'0980354511', CAST(N'2021-08-26T05:01:57.000' AS DateTime), CAST(N'2014-05-17T00:00:00.000' AS DateTime), 0, N'image4.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (97, N'Lew', N'lew@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣北市區敦化路204號', N'0968888935', CAST(N'2022-12-27T22:06:26.000' AS DateTime), CAST(N'2018-06-21T00:00:00.000' AS DateTime), 0, N'image8.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (98, N'Pru', N'pru@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市中正區福建路75號', N'0957886199', CAST(N'2023-05-16T22:29:53.000' AS DateTime), CAST(N'1976-11-29T00:00:00.000' AS DateTime), 1, N'image136.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (99, N'Sinclair', N'sinclair@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣南區和平路410號', N'0902246632', CAST(N'2021-02-16T17:40:40.000' AS DateTime), CAST(N'1983-05-31T00:00:00.000' AS DateTime), 1, N'image153.jpg', 1, 5)
GO
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (100, N'Nadine', N'nadine@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣新區民生路342號', N'0937898317', CAST(N'2015-05-29T07:36:30.000' AS DateTime), CAST(N'2008-07-09T00:00:00.000' AS DateTime), 1, N'image190.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (101, N'Owen', N'owen@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市南區民生路408號', N'0978029717', CAST(N'2013-09-12T06:37:30.000' AS DateTime), CAST(N'2013-11-02T00:00:00.000' AS DateTime), 1, N'image62.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (102, N'Mervyn', N'mervyn@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'基隆市新區敦化路262號', N'0972330132', CAST(N'2020-03-11T07:42:47.000' AS DateTime), CAST(N'2016-10-24T00:00:00.000' AS DateTime), 1, N'image171.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (103, N'Patricia', N'patricia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'金門縣東區敦化路203號', N'0930216112', CAST(N'2015-10-31T19:02:44.000' AS DateTime), CAST(N'1989-05-12T00:00:00.000' AS DateTime), 1, N'image153.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (104, N'Robert', N'robert@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市舊區光復路441號', N'0975648301', CAST(N'2018-09-07T01:08:43.000' AS DateTime), CAST(N'2016-03-02T00:00:00.000' AS DateTime), 1, N'image177.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (105, N'Carl', N'carl@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣北區中正路353號', N'0948687068', CAST(N'2016-04-26T23:17:41.000' AS DateTime), CAST(N'2014-01-11T00:00:00.000' AS DateTime), 1, N'image152.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (106, N'Donald', N'donald@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'高雄市中和區中山路62號', N'0974707826', CAST(N'2022-01-18T13:54:43.000' AS DateTime), CAST(N'1993-11-04T00:00:00.000' AS DateTime), 0, N'image128.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (107, N'Theobald', N'theobald@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣舊區民生路371號', N'0976319696', CAST(N'2017-01-16T11:22:05.000' AS DateTime), CAST(N'1982-08-15T00:00:00.000' AS DateTime), 1, N'image169.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (108, N'Agnes', N'agnes@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市南市區敦化路24號', N'0931810382', CAST(N'2023-03-11T13:52:06.000' AS DateTime), CAST(N'1983-01-24T00:00:00.000' AS DateTime), 1, N'image168.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (109, N'Hank', N'hank@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市海區中山路434號', N'0937966204', CAST(N'2021-07-03T16:25:23.000' AS DateTime), CAST(N'2007-01-28T00:00:00.000' AS DateTime), 1, N'image88.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (110, N'Joe', N'joe@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣海區敦化路176號', N'0958544441', CAST(N'2020-06-24T19:54:04.000' AS DateTime), CAST(N'1996-01-05T00:00:00.000' AS DateTime), 0, N'image68.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (111, N'Ian', N'ian@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市舊區信義路336號', N'0937362382', CAST(N'2021-06-29T13:43:55.000' AS DateTime), CAST(N'2012-12-27T00:00:00.000' AS DateTime), 1, N'image12.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (112, N'Mildred', N'mildred@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市北市區光復路92號', N'0993179870', CAST(N'2014-10-08T04:34:34.000' AS DateTime), CAST(N'1992-11-09T00:00:00.000' AS DateTime), 0, N'image194.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (113, N'Christopher', N'christopher@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'連江縣東區敦化路87號', N'0960537578', CAST(N'2021-10-25T00:55:46.000' AS DateTime), CAST(N'2006-12-05T00:00:00.000' AS DateTime), 1, N'image106.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (114, N'Terry', N'terry@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'桃園市中山區光復路239號', N'0911858122', CAST(N'2015-04-22T11:53:37.000' AS DateTime), CAST(N'2010-12-16T00:00:00.000' AS DateTime), 1, N'image149.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (115, N'Seamas', N'seamas@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'高雄市北市區建國路93號', N'0902252781', CAST(N'2013-08-05T07:28:10.000' AS DateTime), CAST(N'1978-07-18T00:00:00.000' AS DateTime), 1, N'image106.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (116, N'Lucia', N'lucia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣南市區信義路493號', N'0985578439', CAST(N'2013-01-26T13:02:54.000' AS DateTime), CAST(N'1984-01-21T00:00:00.000' AS DateTime), 1, N'image43.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (117, N'Adrian', N'adrian@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣中區民生路336號', N'0941252305', CAST(N'2013-01-08T16:39:13.000' AS DateTime), CAST(N'1980-10-17T00:00:00.000' AS DateTime), 1, N'image175.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (118, N'Cleo', N'cleo@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市中區光復路201號', N'0968389731', CAST(N'2019-04-06T12:09:20.000' AS DateTime), CAST(N'1994-07-14T00:00:00.000' AS DateTime), 1, N'image77.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (119, N'Abe', N'abe@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣西區建國路329號', N'0982520000', CAST(N'2022-11-05T03:16:13.000' AS DateTime), CAST(N'1990-05-30T00:00:00.000' AS DateTime), 0, N'image196.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (120, N'Yvonne', N'yvonne@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣北市區民生路83號', N'0920524642', CAST(N'2019-12-16T06:55:43.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), 1, N'image149.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (121, N'Lou', N'lou@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣北市區忠孝路151號', N'0900163894', CAST(N'2018-04-29T01:51:00.000' AS DateTime), CAST(N'1998-12-16T00:00:00.000' AS DateTime), 0, N'image173.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (122, N'Harriet', N'harriet@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市山區和平路273號', N'0907604244', CAST(N'2017-06-04T20:45:15.000' AS DateTime), CAST(N'1975-07-05T00:00:00.000' AS DateTime), 1, N'image84.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (123, N'Juliet', N'juliet@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中正區中正路443號', N'0936651411', CAST(N'2022-02-20T00:30:33.000' AS DateTime), CAST(N'2005-11-16T00:00:00.000' AS DateTime), 0, N'image20.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (124, N'Joshua', N'joshua@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣山區敦化路153號', N'0986944668', CAST(N'2021-12-01T21:38:07.000' AS DateTime), CAST(N'2020-07-04T00:00:00.000' AS DateTime), 1, N'image147.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (125, N'Vera', N'vera@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣舊區福建路128號', N'0935758280', CAST(N'2013-10-14T19:56:55.000' AS DateTime), CAST(N'1980-04-13T00:00:00.000' AS DateTime), 1, N'image112.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (126, N'Fran', N'fran@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣海區中山路110號', N'0901259468', CAST(N'2013-04-30T12:07:36.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime), 1, N'image40.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (127, N'Gloria', N'gloria@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市中山區福建路430號', N'0982177601', CAST(N'2019-07-29T17:15:36.000' AS DateTime), CAST(N'1987-09-12T00:00:00.000' AS DateTime), 1, N'image54.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (128, N'Troy', N'troy@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣海區光復路249號', N'0934479698', CAST(N'2013-09-06T23:38:26.000' AS DateTime), CAST(N'1998-11-01T00:00:00.000' AS DateTime), 1, N'image191.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (129, N'Virginia', N'virginia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'金門縣北市區建國路132號', N'0926058916', CAST(N'2017-07-03T21:12:09.000' AS DateTime), CAST(N'1992-01-04T00:00:00.000' AS DateTime), 1, N'image133.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (130, N'Livia', N'livia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市南市區中正路375號', N'0938210298', CAST(N'2015-11-25T10:49:29.000' AS DateTime), CAST(N'2019-03-26T00:00:00.000' AS DateTime), 1, N'image151.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (131, N'Madge', N'madge@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣海區建國路318號', N'0918330747', CAST(N'2018-01-24T00:32:22.000' AS DateTime), CAST(N'2016-01-26T00:00:00.000' AS DateTime), 0, N'image73.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (132, N'Norma', N'norma@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣舊區文化路373號', N'0906673975', CAST(N'2020-02-01T03:16:03.000' AS DateTime), CAST(N'1985-04-03T00:00:00.000' AS DateTime), 0, N'image179.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (133, N'Albin', N'albin@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣中和區福建路61號', N'0929885466', CAST(N'2022-11-11T04:09:00.000' AS DateTime), CAST(N'1990-04-08T00:00:00.000' AS DateTime), 0, N'image146.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (134, N'Cliff', N'cliff@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市中山區民生路327號', N'0943152388', CAST(N'2014-07-05T02:49:25.000' AS DateTime), CAST(N'1975-02-04T00:00:00.000' AS DateTime), 0, N'image196.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (135, N'Charlie', N'charlie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣新區建國路31號', N'0996740736', CAST(N'2022-10-28T20:46:33.000' AS DateTime), CAST(N'1998-08-02T00:00:00.000' AS DateTime), 1, N'image74.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (136, N'Clint', N'clint@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣中和區信義路207號', N'0955116816', CAST(N'2014-12-01T19:51:16.000' AS DateTime), CAST(N'1994-11-18T00:00:00.000' AS DateTime), 0, N'image17.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (137, N'Audrey', N'audrey@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中山區建國路60號', N'0955890200', CAST(N'2014-03-12T17:57:54.000' AS DateTime), CAST(N'1976-08-13T00:00:00.000' AS DateTime), 0, N'image52.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (138, N'Tom', N'tom@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中山區光復路251號', N'0912605824', CAST(N'2020-06-03T08:11:44.000' AS DateTime), CAST(N'1985-05-31T00:00:00.000' AS DateTime), 1, N'image60.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (139, N'Nathan', N'nathan@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'高雄市南區福建路290號', N'0937226724', CAST(N'2019-11-14T14:22:50.000' AS DateTime), CAST(N'1981-10-23T00:00:00.000' AS DateTime), 0, N'image169.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (140, N'Kim', N'kim@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣中山區中正路205號', N'0997822286', CAST(N'2021-05-09T18:53:10.000' AS DateTime), CAST(N'2006-07-27T00:00:00.000' AS DateTime), 1, N'image154.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (141, N'Theodoric', N'theodoric@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市中和區信義路327號', N'0954935231', CAST(N'2014-10-16T08:39:36.000' AS DateTime), CAST(N'1999-09-07T00:00:00.000' AS DateTime), 0, N'image39.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (142, N'Eugene', N'eugene@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣東區建國路281號', N'0997030045', CAST(N'2014-12-27T22:49:41.000' AS DateTime), CAST(N'1995-09-20T00:00:00.000' AS DateTime), 1, N'image171.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (143, N'Doris', N'doris@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'連江縣山區成功路309號', N'0951316767', CAST(N'2015-05-28T01:33:48.000' AS DateTime), CAST(N'1987-01-12T00:00:00.000' AS DateTime), 0, N'image51.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (144, N'Baldwin', N'baldwin@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣山區忠孝路254號', N'0935446280', CAST(N'2017-02-02T13:04:40.000' AS DateTime), CAST(N'2019-09-16T00:00:00.000' AS DateTime), 1, N'image32.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (145, N'Carrie', N'carrie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣新區福建路457號', N'0987207731', CAST(N'2020-01-02T04:23:24.000' AS DateTime), CAST(N'2001-01-26T00:00:00.000' AS DateTime), 1, N'image142.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (146, N'Catherine', N'catherine@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣南市區忠孝路109號', N'0942554459', CAST(N'2022-09-12T05:42:38.000' AS DateTime), CAST(N'2010-07-27T00:00:00.000' AS DateTime), 1, N'image156.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (147, N'Ken', N'ken@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣南區福建路471號', N'0916184384', CAST(N'2018-07-18T21:57:32.000' AS DateTime), CAST(N'2016-05-05T00:00:00.000' AS DateTime), 1, N'image98.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (148, N'Freddie', N'freddie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣山區和平路464號', N'0967255987', CAST(N'2022-05-29T21:27:47.000' AS DateTime), CAST(N'1988-10-21T00:00:00.000' AS DateTime), 1, N'image72.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (149, N'Philippa', N'philippa@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市中區民生路350號', N'0912178919', CAST(N'2019-10-21T07:20:24.000' AS DateTime), CAST(N'1990-02-03T00:00:00.000' AS DateTime), 0, N'image131.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (150, N'Carmen', N'carmen@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市海區敦化路70號', N'0900979149', CAST(N'2017-12-26T22:00:42.000' AS DateTime), CAST(N'1996-01-14T00:00:00.000' AS DateTime), 0, N'image63.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (151, N'Louis', N'louis@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣南市區忠孝路192號', N'0971932382', CAST(N'2014-02-08T17:17:23.000' AS DateTime), CAST(N'2015-07-09T00:00:00.000' AS DateTime), 0, N'image177.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (152, N'Charles', N'charles@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市西區信義路339號', N'0982508952', CAST(N'2022-06-17T19:22:39.000' AS DateTime), CAST(N'2019-10-15T00:00:00.000' AS DateTime), 1, N'image176.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (153, N'Rodge', N'rodge@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'宜蘭縣中正區光復路40號', N'0978861665', CAST(N'2014-06-27T15:41:09.000' AS DateTime), CAST(N'2001-04-03T00:00:00.000' AS DateTime), 1, N'image196.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (154, N'Oswald', N'oswald@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣中區信義路354號', N'0994094976', CAST(N'2020-11-30T08:37:38.000' AS DateTime), CAST(N'1995-08-21T00:00:00.000' AS DateTime), 0, N'image87.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (155, N'Sam', N'sam@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣山區文化路261號', N'0955593462', CAST(N'2014-05-21T03:30:25.000' AS DateTime), CAST(N'2002-11-23T00:00:00.000' AS DateTime), 1, N'image191.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (156, N'Gerry', N'gerry@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市中和區中正路412號', N'0945876078', CAST(N'2018-03-03T17:52:23.000' AS DateTime), CAST(N'1981-08-01T00:00:00.000' AS DateTime), 0, N'image62.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (157, N'Georgia', N'georgia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'金門縣中山區成功路31號', N'0942171586', CAST(N'2019-06-18T23:42:18.000' AS DateTime), CAST(N'2016-01-07T00:00:00.000' AS DateTime), 0, N'image18.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (158, N'Percy', N'percy@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'金門縣北區中山路168號', N'0999167573', CAST(N'2018-01-31T00:10:51.000' AS DateTime), CAST(N'2015-07-30T00:00:00.000' AS DateTime), 0, N'image150.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (159, N'Maisie', N'maisie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市舊區建國路234號', N'0983784032', CAST(N'2021-12-05T23:59:05.000' AS DateTime), CAST(N'1996-05-23T00:00:00.000' AS DateTime), 1, N'image89.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (160, N'Patricia', N'patricia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣南區信義路103號', N'0970788194', CAST(N'2021-08-11T18:02:40.000' AS DateTime), CAST(N'1995-02-24T00:00:00.000' AS DateTime), 1, N'image125.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (161, N'Adrian', N'adrian@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣南區光復路226號', N'0918906272', CAST(N'2016-08-01T22:21:53.000' AS DateTime), CAST(N'1980-04-16T00:00:00.000' AS DateTime), 0, N'image168.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (162, N'Tabitha', N'tabitha@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣新區中正路53號', N'0944579469', CAST(N'2020-04-29T22:17:19.000' AS DateTime), CAST(N'1975-08-17T00:00:00.000' AS DateTime), 1, N'image46.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (163, N'Isaac', N'isaac@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'雲林縣南市區中正路271號', N'0980593378', CAST(N'2015-08-08T05:30:54.000' AS DateTime), CAST(N'1988-09-12T00:00:00.000' AS DateTime), 0, N'image46.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (164, N'Dolly', N'dolly@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台東縣南區中正路157號', N'0962999394', CAST(N'2021-09-30T02:57:24.000' AS DateTime), CAST(N'1986-02-10T00:00:00.000' AS DateTime), 1, N'image7.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (165, N'Christian', N'christian@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣北區文化路81號', N'0924909169', CAST(N'2020-01-15T05:30:36.000' AS DateTime), CAST(N'1991-11-19T00:00:00.000' AS DateTime), 0, N'image22.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (166, N'Raphael', N'raphael@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣南區文化路298號', N'0901157057', CAST(N'2013-01-30T06:49:06.000' AS DateTime), CAST(N'1981-07-24T00:00:00.000' AS DateTime), 1, N'image128.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (167, N'Diana', N'diana@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市北市區忠孝路402號', N'0935486087', CAST(N'2022-02-04T10:22:30.000' AS DateTime), CAST(N'1973-04-03T00:00:00.000' AS DateTime), 1, N'image120.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (168, N'Freddie', N'freddie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中山區忠孝路421號', N'0916211234', CAST(N'2018-03-11T00:23:34.000' AS DateTime), CAST(N'1981-05-05T00:00:00.000' AS DateTime), 1, N'image155.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (169, N'Ivor', N'ivor@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣西區成功路160號', N'0979691283', CAST(N'2015-06-20T02:54:50.000' AS DateTime), CAST(N'1977-03-10T00:00:00.000' AS DateTime), 0, N'image182.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (170, N'Karl', N'karl@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣中和區文化路455號', N'0997098140', CAST(N'2020-09-09T04:00:33.000' AS DateTime), CAST(N'1980-04-10T00:00:00.000' AS DateTime), 0, N'image67.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (171, N'Henrietta', N'henrietta@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市南區忠孝路327號', N'0989112097', CAST(N'2022-11-02T17:57:33.000' AS DateTime), CAST(N'2015-07-12T00:00:00.000' AS DateTime), 1, N'image130.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (172, N'Moira', N'moira@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市北市區中山路486號', N'0991918880', CAST(N'2015-07-29T04:05:31.000' AS DateTime), CAST(N'1975-12-23T00:00:00.000' AS DateTime), 0, N'image192.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (173, N'Millicent', N'millicent@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣山區忠孝路114號', N'0918766380', CAST(N'2022-10-07T06:42:04.000' AS DateTime), CAST(N'1984-11-15T00:00:00.000' AS DateTime), 0, N'image65.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (174, N'Lewis', N'lewis@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣中和區文化路105號', N'0947508345', CAST(N'2018-05-20T13:46:49.000' AS DateTime), CAST(N'1992-05-17T00:00:00.000' AS DateTime), 1, N'image131.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (175, N'Dominic', N'dominic@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'苗栗縣海區敦化路368號', N'0981876310', CAST(N'2013-08-17T08:32:46.000' AS DateTime), CAST(N'1987-07-17T00:00:00.000' AS DateTime), 0, N'image120.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (176, N'Ferdinand', N'ferdinand@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台北市北區建國路139號', N'0955730490', CAST(N'2022-11-05T16:34:41.000' AS DateTime), CAST(N'2011-10-06T00:00:00.000' AS DateTime), 0, N'image80.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (177, N'Jennifer', N'jennifer@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣南區光復路99號', N'0917965598', CAST(N'2022-03-25T03:14:00.000' AS DateTime), CAST(N'1979-02-18T00:00:00.000' AS DateTime), 1, N'image125.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (178, N'Mervyn', N'mervyn@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'連江縣北市區建國路133號', N'0945105995', CAST(N'2018-11-13T19:29:29.000' AS DateTime), CAST(N'2004-04-27T00:00:00.000' AS DateTime), 0, N'image98.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (179, N'Aileen', N'aileen@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'連江縣北區成功路106號', N'0967646508', CAST(N'2016-05-10T03:20:49.000' AS DateTime), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 1, N'image56.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (180, N'Warren', N'warren@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣北市區福建路34號', N'0945489088', CAST(N'2017-07-04T20:47:11.000' AS DateTime), CAST(N'2017-01-05T00:00:00.000' AS DateTime), 0, N'image143.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (181, N'Trudie', N'trudie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣山區忠孝路394號', N'0990653259', CAST(N'2015-07-17T08:07:41.000' AS DateTime), CAST(N'2016-09-07T00:00:00.000' AS DateTime), 1, N'image61.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (182, N'Felicity', N'felicity@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義縣中正區成功路46號', N'0929275512', CAST(N'2018-04-05T05:10:00.000' AS DateTime), CAST(N'2001-04-25T00:00:00.000' AS DateTime), 0, N'image148.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (183, N'Evadne', N'evadne@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'基隆市南市區敦化路314號', N'0983498690', CAST(N'2022-07-20T23:50:10.000' AS DateTime), CAST(N'2000-05-07T00:00:00.000' AS DateTime), 0, N'image184.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (184, N'Willy', N'willy@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'嘉義市中區忠孝路195號', N'0982758046', CAST(N'2018-01-06T13:17:22.000' AS DateTime), CAST(N'2012-05-29T00:00:00.000' AS DateTime), 1, N'image88.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (185, N'Robbie', N'robbie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市南市區成功路23號', N'0978609968', CAST(N'2023-04-28T03:48:21.000' AS DateTime), CAST(N'1982-10-19T00:00:00.000' AS DateTime), 0, N'image178.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (186, N'Joanne', N'joanne@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'澎湖縣舊區中山路498號', N'0917728773', CAST(N'2019-05-07T20:49:38.000' AS DateTime), CAST(N'1974-04-26T00:00:00.000' AS DateTime), 0, N'image142.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (187, N'Amos', N'amos@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'花蓮縣中正區和平路208號', N'0971059269', CAST(N'2014-01-27T03:30:08.000' AS DateTime), CAST(N'1980-03-25T00:00:00.000' AS DateTime), 0, N'image19.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (188, N'Olivia', N'olivia@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市南區成功路464號', N'0973947278', CAST(N'2021-09-09T22:15:28.000' AS DateTime), CAST(N'1983-06-08T00:00:00.000' AS DateTime), 0, N'image27.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (189, N'Dulcie', N'dulcie@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣西區信義路231號', N'0992912230', CAST(N'2019-07-22T22:29:23.000' AS DateTime), CAST(N'1982-02-26T00:00:00.000' AS DateTime), 1, N'image180.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (190, N'Elsa', N'elsa@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'桃園市舊區光復路176號', N'0957209103', CAST(N'2015-04-22T05:30:55.000' AS DateTime), CAST(N'2012-11-10T00:00:00.000' AS DateTime), 1, N'image170.jpg', 0, 2)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (191, N'Anna', N'anna@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣南區民生路168號', N'0941950721', CAST(N'2018-07-15T16:14:52.000' AS DateTime), CAST(N'2022-10-31T00:00:00.000' AS DateTime), 0, N'image69.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (192, N'Bernadette', N'bernadette@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新北市中區建國路321號', N'0903581046', CAST(N'2017-11-25T01:52:12.000' AS DateTime), CAST(N'2013-10-03T00:00:00.000' AS DateTime), 1, N'image66.jpg', 0, 3)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (193, N'Bartholomew', N'bartholomew@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台中市中正區福建路11號', N'0937074114', CAST(N'2022-09-09T16:33:18.000' AS DateTime), CAST(N'2014-11-26T00:00:00.000' AS DateTime), 1, N'image4.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (194, N'Enoch', N'enoch@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市舊區敦化路95號', N'0938939862', CAST(N'2015-09-23T17:49:51.000' AS DateTime), CAST(N'1977-06-24T00:00:00.000' AS DateTime), 1, N'image175.jpg', 0, 1)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (195, N'Abel', N'abel@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹市南區建國路401號', N'0901086769', CAST(N'2015-09-16T00:36:04.000' AS DateTime), CAST(N'1988-10-02T00:00:00.000' AS DateTime), 1, N'image40.jpg', 1, 5)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (196, N'Montgomery', N'montgomery@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'屏東縣東區民生路305號', N'0988502984', CAST(N'2014-12-06T01:59:36.000' AS DateTime), CAST(N'1996-05-01T00:00:00.000' AS DateTime), 0, N'image123.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (197, N'Alfred', N'alfred@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'新竹縣舊區和平路221號', N'0913754114', CAST(N'2021-05-17T09:29:29.000' AS DateTime), CAST(N'2010-07-03T00:00:00.000' AS DateTime), 1, N'image153.jpg', 0, 4)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (198, N'Matt', N'matt@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣南區信義路389號', N'0960796469', CAST(N'2014-06-16T23:00:19.000' AS DateTime), CAST(N'2012-01-03T00:00:00.000' AS DateTime), 1, N'image199.jpg', 0, 0)
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (199, N'Uerica', N'uerica@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'南投縣舊區信義路299號', N'0966047415', CAST(N'2014-09-13T18:48:59.000' AS DateTime), CAST(N'1977-11-12T00:00:00.000' AS DateTime), 1, N'image87.jpg', 0, 0)
GO
INSERT [dbo].[Members] ([MemberId], [MemberName], [Email], [EncryptedPassword], [Address], [Phone], [CreateAt], [Birth], [Gender], [ImageName], [IsBan], [CancelTimes]) VALUES (200, N'Abe', N'abe@gmail.com', N'8F4A58FD14BDBD1C733FEC3D234E2D838BDF809584CA7586B6B6A3C927A093C4', N'台南市海區和平路101號', N'0910796629', CAST(N'2013-12-28T10:02:39.000' AS DateTime), CAST(N'2002-12-16T00:00:00.000' AS DateTime), 0, N'image65.jpg', 0, 3)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([OrderStatusId], [StatusName]) VALUES (1, N'已下訂，未付款(請於24小時內付款)')
INSERT [dbo].[OrderStatuses] ([OrderStatusId], [StatusName]) VALUES (2, N'確認付款成功，待出貨')
INSERT [dbo].[OrderStatuses] ([OrderStatusId], [StatusName]) VALUES (3, N'已出貨')
INSERT [dbo].[OrderStatuses] ([OrderStatusId], [StatusName]) VALUES (4, N'未成功於24小時內付款，訂單已取消')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (1, N'新增員工')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (2, N'刪除員工')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (3, N'查詢員工')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (4, N'編輯員工')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (5, N'查詢會員')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (6, N'編輯會員')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (7, N'操作Desserts')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (8, N'操作Categories')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (9, N'操作DessertTags')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (10, N'操作DessertImages')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (11, N'操作Specification')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (12, N'操作Lessons')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (13, N'操作LessonCategories')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (14, N'操作LessonTags')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (15, N'操作LessonImages')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (16, N'操作Coupons')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (17, N'操作CouponCategories')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (18, N'操作MemberCoupons')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (19, N'操作DiscountGroups')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (20, N'操作DiscountGroupItems')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (21, N'操作Promotions')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (22, N'操作Discounts')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (23, N'操作LessonOrders')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (24, N'操作LessonOrderDetails')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (25, N'操作DessertOrders')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (26, N'操作DessertOrderDetails')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (27, N'操作OrderStatus')
INSERT [dbo].[Permissions] ([PermissionId], [PermissionName]) VALUES (28, N'操作Teachers')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([PromotionId], [CouponId], [PromotionImage], [PromotionName], [Description], [LaunchAt], [StartAt], [EndAt], [CreateAt]) VALUES (1, 1, N'promotion1.jpg', N'2023父親節活動', N'這是父親節活動這是父親節活動這是父親節活動這是父親節活動這是父親節活動這是父親節活動這是父親節活動這是父親節活動這是父親節活動', CAST(N'1905-06-26T00:00:00.000' AS DateTime), CAST(N'1905-07-09T00:00:00.000' AS DateTime), CAST(N'1905-07-01T00:00:00.000' AS DateTime), CAST(N'1905-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Promotions] ([PromotionId], [CouponId], [PromotionImage], [PromotionName], [Description], [LaunchAt], [StartAt], [EndAt], [CreateAt]) VALUES (2, NULL, N'promotion2.jpg', N'雙11指定商品滿3折100', N'雙11活動雙11活動雙11活動雙11活動雙11活動雙11活動雙11活動雙11活動雙11活動雙11活動', CAST(N'1905-07-06T00:00:00.000' AS DateTime), CAST(N'1905-06-25T00:00:00.000' AS DateTime), CAST(N'1905-06-25T00:00:00.000' AS DateTime), CAST(N'1905-07-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'管理者')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'主管')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'一般員工')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 1)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 2)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 3)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 4)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 5)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 6)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 7)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 8)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 9)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 10)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 11)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 12)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 13)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 14)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 15)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 16)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 17)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 18)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 19)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 20)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 21)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 22)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 23)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 24)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 25)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 26)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 27)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (1, 28)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 3)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 5)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 7)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 8)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 9)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 10)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 11)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 12)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 13)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 14)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 15)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 16)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 17)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 18)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 19)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 20)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 21)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 22)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 23)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 24)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 25)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 26)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 27)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (2, 28)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 7)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 8)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 9)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 10)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 11)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 12)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 13)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 14)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 15)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 16)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 17)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 18)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 19)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 20)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 21)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 22)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 23)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 24)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 25)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 26)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 27)
INSERT [dbo].[RoleToPermissions] ([RoleId], [PermissionId]) VALUES (3, 28)
GO
SET IDENTITY_INSERT [dbo].[Specification] ON 

INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (1, 1, NULL, N'6吋')
INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (2, 2, NULL, N'6吋')
INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (3, 3, NULL, N'4入')
INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (4, 217, NULL, N'6吋')
INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (5, 218, NULL, N'8吋')
INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (6, 219, NULL, N'6吋')
INSERT [dbo].[Specification] ([SpecificationId], [DessertId], [Flavor], [Size]) VALUES (7, 220, N'可可', N'9入')
SET IDENTITY_INSERT [dbo].[Specification] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (1, N'王美姬 Maggie 老師', N'teacher1.jpg', N'手創立體造型饅頭', N'美姬饅頭 創辦人 創新藝點餐飲培育協會 理事長 禾沐生活學苑 創意總監', N'乙級烘焙食品技術士 丙級中式麵食加工-發麵類', N'國立高雄餐旅學院 烘焙管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (2, N'張小芳 Linda 老師', N'teacher2.jpg', N'法式巧克力甜點', N'五星級飯店甜點主廚 甜點工作坊導師', N'高級烘焙技師', N'法國雷諾特廚藝學校 法式甜點學程', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (3, N'陳大同 David 老師', N'teacher3.jpg', N'歐式麵包與蛋糕', N'知名烘焙書籍作者 麵包講師', N'專業烘焙師證書', N'瑞士廚藝管理大學', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (4, N'李正偉 Emily 老師', N'teacher4.jpg', N'抹茶甜點與和?子', N'日本京都甜點學校畢業 專業和?子師', N'抹茶師範認證', N'京都糕點麵包技術專門學校 日式糕點高級科', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (5, N'吳明宇 Ryan 老師', N'teacher5.jpg', N'台灣傳統糕點', N'台灣傳統糕點師傅 開設糕點店30年', N'台灣烘焙糕點技能士證書', N'國立高雄餐旅大學 烘焙管理系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (6, N'林小慧 Amy 老師', N'teacher6.jpg', N'健康蛋糕與無麩質甜點', N'營養師出身 開設健康烘焙坊', N'營養師證照', N'實踐大學食品營養與保健生技學系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (7, N'張光明 Kevin 老師', N'teacher7.jpg', N'法國傳統麵包', N'法國巴黎麵包學校畢業 主修法國麵包', N'法國烘焙證書', N'法國巴黎烘焙學院', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (8, N'王小春 Cindy 老師', N'teacher8.jpg', N'美式甜點與派', N'紐約知名餐廳甜點師傅', N'美國烘焙證書', N'康乃爾大學 飲食學系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (9, N'劉文彬 Peter 老師', N'teacher9.jpg', N'中式點心與月餅', N'知名中式點心店店主', N'中式點心技術士證書', N'廣州東南國際烹飪學校 中式烹飪專業', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (10, N'張雅文 Alice 老師', N'teacher10.jpg', N'韓式甜點與糕點', N'韓國首爾著名甜點師傅', N'韓國烘焙師證書', N'韓國梨花女子大學食品營養系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (11, N'蔡宜倫 Eric 老師', N'teacher11.jpg', N'義式甜點與冰淇淋', N'義大利米蘭烘焙學校畢業', N'義大利烘焙證書', N'ALMA 義大利國際烹飪學院 義大利烹飪課', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (12, N'黃蕾 Jenny 老師', N'teacher12.jpg', N'素食甜點與蛋糕', N'專注於素食甜點的創作', N'素食烘焙師證書', N'國立餐旅大學 烘焙管理系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (13, N'李大山 Sam 老師', N'teacher13.jpg', N'台灣古早味糕點', N'傳統古早味糕點傳人', N'台灣古早味糕點技術士證書', N'國立餐旅大學 烘焙管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (14, N'許心悅 Grace 老師', N'teacher14.jpg', N'東南亞甜點與點心', N'旅居東南亞多年的甜點研究家', N'東南亞甜點烘焙證書', N'義守大學 廚藝學系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (15, N'林怡君 Jessica 老師', N'teacher15.jpg', N'紐約風格糕點與甜點', N'曾在紐約知名烘焙坊實習', N'烘焙學士學位', N'ICE Pastry & Baking Arts  糕點烘焙課程', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (16, N'張小娟 Annie 老師', N'teacher16.jpg', N'澳洲特色甜點與餅乾', N'澳洲墨爾本烘焙學院畢業', N'澳洲烘焙證書', N'澳洲威廉安格理斯學院 烘焙課程', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (17, N'陳思宇 Jimmy 老師', N'teacher17.jpg', N'季節限定甜點', N'季節甜點專家', N'專業季節限定烘焙師證書', N'國立嘉義大學 食品科學系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (18, N'謝怡君 Sophia 老師', N'teacher18.jpg', N'咖啡糕點與配方開發', N'糕點與咖啡專家', N'糕點與咖啡師證書', N'國立高雄餐旅學院 烘焙管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (19, N'王明輝 Ray 老師', N'teacher19.jpg', N'酵母麵包與麵團製作', N'酵母麵包達人', N'酵母麵包師證書', N'國立屏東科技大學 餐旅管理系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (20, N'李小琳 Lily 老師', N'teacher20.jpg', N'糖霜塗餅與裝飾技巧', N'糖霜塗餅專家', N'糖霜塗餅師證書', N'弘光科技大學 餐旅管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (21, N'陳思婷 Tina 老師', N'teacher21.jpg', N'歐式傳統糕點', N'歐洲傳統糕點學院畢業 主修法式糕點', N'歐洲烘焙證書', N'景文技術學院 餐飲管理系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (22, N'黃明達 Tony 老師', N'teacher22.jpg', N'亞洲口味甜點', N'亞洲甜點研究專家', N'亞洲烘焙學士學位', N'元培科技大學 餐飲管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (23, N'張宇翔 Alex 老師', N'teacher23.jpg', N'創意糕點與造型蛋糕', N'糕點藝術創作者', N'創意糕點師證書', N'嘉南科技大學 餐旅管理系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (24, N'蔡心怡 Lisa 老師', N'teacher24.jpg', N'優格甜點與無糖烘焙', N'健康無糖烘焙專家', N'烘焙學士學位', N'國立高雄餐旅學院 烘焙管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (25, N'王正偉 Alan 老師', N'teacher25.jpg', N'麵粉製作與配方開發', N'專業麵粉配方師', N'烘焙學士學位', N'國立高雄餐旅學院 烘焙學程', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (26, N'楊靜宜 Rachel 老師', N'teacher26.jpg', N'台灣特色糕點與點心', N'台灣傳統糕點傳承者', N'台灣烘焙技術師證書', N'義守大學 廚藝學系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (27, N'吳家豪 Andy 老師', N'teacher27.jpg', N'西式甜點與塔', N'西點廚師出身', N'西點烘焙學士學位', N'景文科大餐飲管理系', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (28, N'陳怡伶 Irene 老師', N'teacher28.jpg', N'水果甜點與凍品', N'水果甜點設計師', N'水果甜點師證書', N'崑山科技大學餐飲管理及廚藝系', 0)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (29, N'張小雅 Mia 老師', N'teacher29.jpg', N'亞洲口味糕點', N'亞洲糕點專家', N'亞洲烘焙技術士證書', N'廣州東南國際烹飪學校  西式麵點', 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherImage], [Specialty], [Experience], [License], [Academic], [TeacherStatus]) VALUES (30, N'劉家銘 Henry 老師', N'teacher30.jpg', N'葡萄牙傳統糕點', N'葡萄牙糕點學院畢業 主修葡式糕點', N'葡萄牙烘焙證書', N'法國藍帶 甜點課程', 0)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Coupons__D349080064B43002]    Script Date: 2023/7/4 上午 09:52:50 ******/
ALTER TABLE [dbo].[Coupons] ADD UNIQUE NONCLUSTERED 
(
	[CouponCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Coupons] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[DessertOrders] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Desserts] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Discounts] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[LessonOrders] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Lessons] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[MemberCoupons] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Promotions] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD FOREIGN KEY([CouponCategoryId])
REFERENCES [dbo].[CouponCategories] ([CouponCategoryId])
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD FOREIGN KEY([DiscountGroupId])
REFERENCES [dbo].[DiscountGroups] ([DiscountGroupId])
GO
ALTER TABLE [dbo].[DessertImages]  WITH CHECK ADD FOREIGN KEY([DessertId])
REFERENCES [dbo].[Desserts] ([DessertId])
GO
ALTER TABLE [dbo].[DessertOrderDetails]  WITH CHECK ADD FOREIGN KEY([DessertOrderId])
REFERENCES [dbo].[DessertOrders] ([DessertOrderId])
GO
ALTER TABLE [dbo].[DessertOrderDetails]  WITH CHECK ADD FOREIGN KEY([DessertId])
REFERENCES [dbo].[Desserts] ([DessertId])
GO
ALTER TABLE [dbo].[DessertOrders]  WITH CHECK ADD FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
GO
ALTER TABLE [dbo].[DessertOrders]  WITH CHECK ADD FOREIGN KEY([DessertOrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([OrderStatusId])
GO
ALTER TABLE [dbo].[DessertOrders]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[Desserts]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[DessertTags]  WITH CHECK ADD FOREIGN KEY([DessertId])
REFERENCES [dbo].[Desserts] ([DessertId])
GO
ALTER TABLE [dbo].[DiscountGroupItems]  WITH CHECK ADD FOREIGN KEY([DessertId])
REFERENCES [dbo].[Desserts] ([DessertId])
GO
ALTER TABLE [dbo].[DiscountGroupItems]  WITH CHECK ADD FOREIGN KEY([DiscountGroupId])
REFERENCES [dbo].[DiscountGroups] ([DiscountGroupId])
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD FOREIGN KEY([DiscountGroupId])
REFERENCES [dbo].[DiscountGroups] ([DiscountGroupId])
GO
ALTER TABLE [dbo].[LessonImages]  WITH CHECK ADD FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
ALTER TABLE [dbo].[LessonOrderDetails]  WITH CHECK ADD FOREIGN KEY([LessonOrderId])
REFERENCES [dbo].[LessonOrders] ([LessonOrderId])
GO
ALTER TABLE [dbo].[LessonOrderDetails]  WITH CHECK ADD FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
ALTER TABLE [dbo].[LessonOrders]  WITH CHECK ADD FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
GO
ALTER TABLE [dbo].[LessonOrders]  WITH CHECK ADD FOREIGN KEY([LessonOrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([OrderStatusId])
GO
ALTER TABLE [dbo].[LessonOrders]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD FOREIGN KEY([LessonCategoryId])
REFERENCES [dbo].[LessonCategories] ([LessonCategoryId])
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
GO
ALTER TABLE [dbo].[LessonTags]  WITH CHECK ADD FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
ALTER TABLE [dbo].[MemberCoupons]  WITH CHECK ADD FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
GO
ALTER TABLE [dbo].[MemberCoupons]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
GO
ALTER TABLE [dbo].[Specification]  WITH CHECK ADD FOREIGN KEY([DessertId])
REFERENCES [dbo].[Desserts] ([DessertId])
GO
USE [master]
GO
ALTER DATABASE [Sierra0629] SET  READ_WRITE 
GO
