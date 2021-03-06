USE [BellTicketTrackingDB]
GO
ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK_Tickets_Employees]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Departments]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 30-Oct-20 10:55:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tickets]') AND type in (N'U'))
DROP TABLE [dbo].[Tickets]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 30-Oct-20 10:55:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 30-Oct-20 10:55:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
DROP TABLE [dbo].[Departments]
GO
USE [master]
GO
/****** Object:  Database [BellTicketTrackingDB]    Script Date: 30-Oct-20 10:55:18 PM ******/
DROP DATABASE [BellTicketTrackingDB]
GO
/****** Object:  Database [BellTicketTrackingDB]    Script Date: 30-Oct-20 10:55:18 PM ******/
CREATE DATABASE [BellTicketTrackingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BellTicketTrackingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BellTicketTrackingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BellTicketTrackingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BellTicketTrackingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BellTicketTrackingDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BellTicketTrackingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BellTicketTrackingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BellTicketTrackingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BellTicketTrackingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BellTicketTrackingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BellTicketTrackingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BellTicketTrackingDB] SET  MULTI_USER 
GO
ALTER DATABASE [BellTicketTrackingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BellTicketTrackingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BellTicketTrackingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BellTicketTrackingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BellTicketTrackingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BellTicketTrackingDB] SET QUERY_STORE = OFF
GO
USE [BellTicketTrackingDB]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 30-Oct-20 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 30-Oct-20 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](60) NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 30-Oct-20 10:55:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[RequestedON] [datetime] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Branch of Extranet Implementation')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Branch of Intranet Computer Maintenance and E-Commerce PC Programming')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'Bureau of Business-Oriented PC Backup and Wireless Telecommunications Control')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Database Programming Branch')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (5, N'Division of Application Security')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (6, N'Division of Telecommunications Extranet Development')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (7, N'Extranet Multimedia Connectivity and Security Division')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (8, N'Hardware Backup Department')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (9, N'Mainframe PC Development and Practical Source Code Acquisition Team')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (10, N'Multimedia Troubleshooting and Maintenance Team')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (11, N'Network Maintenance and Multimedia Implementation Committee')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (12, N'Office of Statistical Data Connectivity')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (13, N'PC Maintenance Department')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (14, N'Software Technology and Networking Department')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (15, N'Wireless Extranet Backup Team')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (1, N'Roma Marcell', 6)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (2, N'Hugo Wess', 7)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (3, N'Kelvin Lahr', 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (4, N'Janelle Newberg', 6)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (5, N'Mellie Lombard', 2)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (6, N'Reita Abshire', 15)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (7, N'Dalila Vickrey', 4)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (8, N'Idella Dallman', 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (9, N'Farah Eldridge', 8)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (10, N'Lana Montes', 8)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (11, N'Leola Thornburg', 7)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (12, N'Marcelo Paris', 4)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (13, N'Ione Tomlin', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (14, N'Hilario Masterson', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (15, N'Janice Skipper', 15)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (16, N'Keren Gillespi', 12)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (17, N'Linh Leitzel', 6)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (18, N'Rosalia Ayoub', 5)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (19, N'Shawna Hood', 2)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (20, N'Wilfredo Stumpf', 11)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (21, N'Alexandra Brendle', 12)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (22, N'Luciano Riddell', 9)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (23, N'Boyce Perales', 11)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (24, N'Alissa Perlman', 6)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (25, N'Latoyia Kremer', 11)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (26, N'Tawna Blackmore', 15)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (27, N'Claudine Valderrama', 8)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (28, N'Katheryn Lepak', 11)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (29, N'Sage Bow', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (30, N'Altha Rudisill', 8)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (31, N'Olympia Vien', 5)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (32, N'Olene Pyron', 13)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (33, N'Delorse Searle', 7)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (34, N'Greta Quigg', 3)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (35, N'Kenneth Bowie', 2)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (36, N'Colton Kranz', 8)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (37, N'Kasie Barclay', 10)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (38, N'Thresa Levins', 7)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (39, N'Diego Hasbrouck', 14)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [DepartmentID]) VALUES (40, N'Tomoko Gale', 4)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (1, N'Test', 2, N'Testing testing', CAST(N'2020-10-29T03:35:26.810' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (2, N'Hdd', 1, N'Testing testing2', CAST(N'2020-10-29T03:36:45.613' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (3, N'asd', 17, N'This is web test linh le as div', CAST(N'2020-10-30T03:44:10.667' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (4, N'Hdd', 10, N'Upgrade Harddisk', CAST(N'2020-10-30T03:49:45.813' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (5, N'asd', 9, N'Actie server/directory', CAST(N'2020-10-30T03:51:19.993' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (6, N'Update PC', 18, N'Upgrade Harddisk', CAST(N'2020-10-30T03:52:05.357' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (7, N'sd', 7, N'Upgrade Harddisk', CAST(N'2020-10-30T03:52:34.943' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (8, N'asd', 34, N'New System', CAST(N'2020-10-30T03:53:51.983' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (9, N'asd', 25, N'New hardware', CAST(N'2020-10-30T03:56:38.930' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (10, N'Update PC', 16, N'New Mobile Connection', CAST(N'2020-10-30T03:56:56.163' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (11, N'asd', 14, N'New Test', CAST(N'2020-10-30T03:57:31.120' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (12, N'Test', 17, N'New Keyboard', CAST(N'2020-10-30T22:22:23.807' AS DateTime))
INSERT [dbo].[Tickets] ([TicketID], [ProjectName], [EmployeeID], [Description], [RequestedON]) VALUES (13, N'Update PC', 12, N'New Credential', CAST(N'2020-10-30T22:22:38.150' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Employees]
GO
USE [master]
GO
ALTER DATABASE [BellTicketTrackingDB] SET  READ_WRITE 
GO
