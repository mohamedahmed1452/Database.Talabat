USE [master]
GO
/****** Object:  Database [E-CommerceApp2]    Script Date: 21/09/2024 10:20:20 ص ******/
CREATE DATABASE [E-CommerceApp2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-CommerceApp2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\E-CommerceApp2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-CommerceApp2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\E-CommerceApp2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E-CommerceApp2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-CommerceApp2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-CommerceApp2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-CommerceApp2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-CommerceApp2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [E-CommerceApp2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-CommerceApp2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [E-CommerceApp2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET RECOVERY FULL 
GO
ALTER DATABASE [E-CommerceApp2] SET  MULTI_USER 
GO
ALTER DATABASE [E-CommerceApp2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-CommerceApp2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-CommerceApp2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-CommerceApp2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-CommerceApp2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-CommerceApp2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E-CommerceApp2', N'ON'
GO
ALTER DATABASE [E-CommerceApp2] SET QUERY_STORE = ON
GO
ALTER DATABASE [E-CommerceApp2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E-CommerceApp2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[DeliveryTime] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_ProductId] [int] NOT NULL,
	[Product_ProductName] [nvarchar](max) NOT NULL,
	[Product_PictureUrl] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerEmail] [nvarchar](max) NOT NULL,
	[OrderDate] [datetimeoffset](7) NOT NULL,
	[ShippingAddress_FirstName] [nvarchar](max) NOT NULL,
	[ShippingAddress_LastName] [nvarchar](max) NOT NULL,
	[ShippingAddress_Street] [nvarchar](max) NOT NULL,
	[ShippingAddress_Country] [nvarchar](max) NOT NULL,
	[ShippingAddress_City] [nvarchar](max) NOT NULL,
	[DeliveryMethodId] [int] NULL,
	[Status] [nvarchar](max) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[PaymentIntenteId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBrands]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBrands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductBrands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PictureUrl] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductBrandId] [int] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 21/09/2024 10:20:20 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 21/09/2024 10:20:20 ص ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DeliveryMethodId]    Script Date: 21/09/2024 10:20:20 ص ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DeliveryMethodId] ON [dbo].[Orders]
(
	[DeliveryMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductBrandId]    Script Date: 21/09/2024 10:20:20 ص ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductBrandId] ON [dbo].[Products]
(
	[ProductBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 21/09/2024 10:20:20 ص ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DeliveryMethods] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductBrands_ProductBrandId] FOREIGN KEY([ProductBrandId])
REFERENCES [dbo].[ProductBrands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductBrands_ProductBrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
USE [master]
GO
ALTER DATABASE [E-CommerceApp2] SET  READ_WRITE 
GO
