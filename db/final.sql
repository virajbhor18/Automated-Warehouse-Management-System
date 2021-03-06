USE [master]
GO
/****** Object:  Database [Warehouse_management]    Script Date: 07-04-2020 12:33:56 ******/
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
/****** Object:  Table [dbo].[Admin_Master]    Script Date: 07-04-2020 12:33:56 ******/
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
/****** Object:  Table [dbo].[Manager_Master]    Script Date: 07-04-2020 12:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [nvarchar](50) NULL,
	[Manager_Name] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mapping_Master]    Script Date: 07-04-2020 12:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mapping_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NULL,
	[Slot] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_master]    Script Date: 07-04-2020 12:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[Slot_Period] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[report_master]    Script Date: 07-04-2020 12:33:56 ******/
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
/****** Object:  Table [dbo].[Slot_Master]    Script Date: 07-04-2020 12:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slot_ID] [nvarchar](50) NULL,
	[Period] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin_Master] ON 

INSERT [dbo].[Admin_Master] ([Id], [Username], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Admin_Master] OFF
SET IDENTITY_INSERT [dbo].[Manager_Master] ON 

INSERT [dbo].[Manager_Master] ([ID], [Company_Name], [Manager_Name], [Username], [Password]) VALUES (1, N'Mahindra&Mahindra', N'Rupesh Singh', N'r@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[Manager_Master] OFF
SET IDENTITY_INSERT [dbo].[Mapping_Master] ON 

INSERT [dbo].[Mapping_Master] ([Id], [Product_Id], [Slot]) VALUES (3, 3, 1)
INSERT [dbo].[Mapping_Master] ([Id], [Product_Id], [Slot]) VALUES (2, 2, 11)
SET IDENTITY_INSERT [dbo].[Mapping_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_master] ON 

INSERT [dbo].[Product_master] ([Id], [Date], [Name], [Company_Name], [Email], [Slot_Period]) VALUES (3, CAST(N'2020-03-31 00:00:00.000' AS DateTime), N'XUV', N'Mahindra&Mahindra', N'mahindra@gmail.com', N'7Days')
INSERT [dbo].[Product_master] ([Id], [Date], [Name], [Company_Name], [Email], [Slot_Period]) VALUES (2, CAST(N'2020-03-31 00:00:00.000' AS DateTime), N'Bollero', N'Mahindra&Mahindra', N'mahindra@gmail.com', N'15Days')
SET IDENTITY_INSERT [dbo].[Product_master] OFF
SET IDENTITY_INSERT [dbo].[report_master] ON 

INSERT [dbo].[report_master] ([id], [prod_name], [add_date], [email], [slot], [remove_date], [total_price], [Company_Name]) VALUES (1, N'Thar', N'20-02-2020 00:00:00', N'mahindra@gmail.com', N'30Days', CAST(N'2020-03-31' AS Date), N'4000', N'Mahindra&Mahindra')
SET IDENTITY_INSERT [dbo].[report_master] OFF
SET IDENTITY_INSERT [dbo].[Slot_Master] ON 

INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (1, N'S1', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (2, N'S2', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (3, N'S3', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (4, N'S4', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (5, N'S5', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (6, N'S6', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (7, N'S7', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (8, N'S8', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (9, N'S9', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (10, N'S10', N'7Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (11, N'S11', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (12, N'S12', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (13, N'S13', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (14, N'S14', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (15, N'S15', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (16, N'S16', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (17, N'S17', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (18, N'S18', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (19, N'S19', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (20, N'S20', N'15Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (21, N'S21', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (22, N'S22', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (23, N'S23', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (24, N'S24', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (25, N'S25', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (26, N'S26', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (27, N'S27', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (28, N'S28', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (29, N'S29', N'30Days')
INSERT [dbo].[Slot_Master] ([Id], [Slot_ID], [Period]) VALUES (30, N'S30', N'30Days')
SET IDENTITY_INSERT [dbo].[Slot_Master] OFF
USE [master]
GO
ALTER DATABASE [Warehouse_management] SET  READ_WRITE 
GO
