USE [master]
GO
/****** Object:  Database [Warehouse_management]    Script Date: 13-04-2022 10:37:12 ******/
CREATE DATABASE [Warehouse_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Warehouse_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Warehouse_management.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Warehouse_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Warehouse_management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Warehouse_management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Warehouse_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Warehouse_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Warehouse_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Warehouse_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Warehouse_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Warehouse_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Warehouse_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Warehouse_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Warehouse_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Warehouse_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Warehouse_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Warehouse_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Warehouse_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Warehouse_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Warehouse_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Warehouse_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Warehouse_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Warehouse_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Warehouse_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Warehouse_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Warehouse_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Warehouse_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Warehouse_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Warehouse_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Warehouse_management] SET  MULTI_USER 
GO
ALTER DATABASE [Warehouse_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Warehouse_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Warehouse_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Warehouse_management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Warehouse_management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Warehouse_management]
GO
/****** Object:  Table [dbo].[Admin_Master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimension_master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dimension] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager_Master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manager_Name] [nvarchar](max) NULL,
	[Company_Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mapping_Master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mapping_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NULL,
	[Slot] [int] NULL,
	[Company_Name] [nvarchar](max) NULL,
	[Size] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Product_Company_Name] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Dimension] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Remove_Product]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remove_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slot] [int] NULL,
	[Company_Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[report_master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prod_name] [nvarchar](50) NULL,
	[add_date] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[slot] [nvarchar](50) NULL,
	[remove_date] [date] NULL,
	[total_price] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slot_Master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slot_ID] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Company] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stockist_Master]    Script Date: 13-04-2022 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stockist_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [nvarchar](max) NULL,
	[Stockist_Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin_Master] ON 

INSERT [dbo].[Admin_Master] ([Id], [Username], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Admin_Master] OFF
SET IDENTITY_INSERT [dbo].[Dimension_master] ON 

INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (1, N'100*10', N'Small')
INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (2, N'100*30', N'Small')
INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (3, N'100*50', N'Small')
INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (4, N'100*60', N'Medium')
INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (5, N'100*80', N'Medium')
INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (6, N'100*250', N'Large')
INSERT [dbo].[Dimension_master] ([id], [Dimension], [Category]) VALUES (7, N'100*500', N'Large')
SET IDENTITY_INSERT [dbo].[Dimension_master] OFF
SET IDENTITY_INSERT [dbo].[Manager_Master] ON 

INSERT [dbo].[Manager_Master] ([ID], [Manager_Name], [Company_Name], [Phone], [Email], [Password]) VALUES (1, N'Rahul Govind', N'Zepto', N'98652441579', N'rahul@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[Manager_Master] OFF
SET IDENTITY_INSERT [dbo].[Mapping_Master] ON 

INSERT [dbo].[Mapping_Master] ([Id], [Product_Id], [Slot], [Company_Name], [Size]) VALUES (5, 4, 1, N'parle', N'Small')
INSERT [dbo].[Mapping_Master] ([Id], [Product_Id], [Slot], [Company_Name], [Size]) VALUES (4, 3, 22, N'Zepto', N'Large')
INSERT [dbo].[Mapping_Master] ([Id], [Product_Id], [Slot], [Company_Name], [Size]) VALUES (6, 4, 1, N'parle', N'Small')
SET IDENTITY_INSERT [dbo].[Mapping_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_master] ON 

INSERT [dbo].[Product_master] ([Id], [Date], [Name], [Product_Company_Name], [Company_Name], [Email], [Dimension]) VALUES (4, CAST(N'2022-04-10 00:00:00.000' AS DateTime), N'parle g', N'parle', N'Zepto', N'parle@gmail.com', N'100*10')
INSERT [dbo].[Product_master] ([Id], [Date], [Name], [Product_Company_Name], [Company_Name], [Email], [Dimension]) VALUES (3, CAST(N'2022-04-12 00:00:00.000' AS DateTime), N'JAM', N'Kissan', N'Zepto', N'Kissan@gmail.com', N'100*250')
SET IDENTITY_INSERT [dbo].[Product_master] OFF
SET IDENTITY_INSERT [dbo].[report_master] ON 

INSERT [dbo].[report_master] ([id], [prod_name], [add_date], [email], [slot], [remove_date], [total_price], [Company_Name]) VALUES (1, N'Pepsi 1L', N'12-04-2022 00:00:00', N'pepsi@pepsi.co.in', N'100*10', CAST(N'2022-04-12' AS Date), N'0', N'Zepto')
INSERT [dbo].[report_master] ([id], [prod_name], [add_date], [email], [slot], [remove_date], [total_price], [Company_Name]) VALUES (2, N'Butter', N'11-04-2022 00:00:00', N'pepsi@pepsi.co.in', N'100*250', CAST(N'2022-04-12' AS Date), N'100', N'Zepto')
SET IDENTITY_INSERT [dbo].[report_master] OFF
SET IDENTITY_INSERT [dbo].[Slot_Master] ON 

INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (1, N'S1', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (2, N'S2', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (3, N'S3', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (4, N'S4', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (5, N'S5', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (6, N'S6', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (7, N'S7', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (8, N'S8', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (9, N'S9', N'small', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (10, N'S10', N'large', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (11, N'S11', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (12, N'S12', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (13, N'S13', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (14, N'S14', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (15, N'S15', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (16, N'S16', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (17, N'S17', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (18, N'S18', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (19, N'S19', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (20, N'S20', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (21, N'S21', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (22, N'S22', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (23, N'S23', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (24, N'S24', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (25, N'S25', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (26, N'S26', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (27, N'S27', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (28, N'S28', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (29, N'S29', N'medium', N'Zepto')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Size], [Company]) VALUES (30, N'S30', N'medium', N'Zepto')
SET IDENTITY_INSERT [dbo].[Slot_Master] OFF
SET IDENTITY_INSERT [dbo].[Stockist_Master] ON 

INSERT [dbo].[Stockist_Master] ([Id], [Company_Name], [Stockist_Name], [Phone], [Email], [Password]) VALUES (1, N'Zepto', N'swapnil', N'98652441579', N'swapnil@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[Stockist_Master] OFF
USE [master]
GO
ALTER DATABASE [Warehouse_management] SET  READ_WRITE 
GO
