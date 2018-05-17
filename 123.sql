USE [master]
GO
/****** Object:  Database [TSQLV4]    Script Date: 2018/5/17 22:29:25 ******/
CREATE DATABASE [TSQLV4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TSQLV4', FILENAME = N'F:\Backups User FIles\文档\SQL\MSSQL11.MSSQLSERVER\MSSQL\DATA\TSQLV4.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TSQLV4_log', FILENAME = N'F:\Backups User FIles\文档\SQL\MSSQL11.MSSQLSERVER\MSSQL\DATA\TSQLV4_log.ldf' , SIZE = 7744KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TSQLV4] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TSQLV4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TSQLV4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TSQLV4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TSQLV4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TSQLV4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TSQLV4] SET ARITHABORT OFF 
GO
ALTER DATABASE [TSQLV4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TSQLV4] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TSQLV4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TSQLV4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TSQLV4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TSQLV4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TSQLV4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TSQLV4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TSQLV4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TSQLV4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TSQLV4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TSQLV4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TSQLV4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TSQLV4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TSQLV4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TSQLV4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TSQLV4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TSQLV4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TSQLV4] SET RECOVERY FULL 
GO
ALTER DATABASE [TSQLV4] SET  MULTI_USER 
GO
ALTER DATABASE [TSQLV4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TSQLV4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TSQLV4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TSQLV4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TSQLV4', N'ON'
GO
USE [TSQLV4]
GO
/****** Object:  Schema [HR]    Script Date: 2018/5/17 22:29:25 ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Production]    Script Date: 2018/5/17 22:29:25 ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Sales]    Script Date: 2018/5/17 22:29:25 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Schema [Stats]    Script Date: 2018/5/17 22:29:25 ******/
CREATE SCHEMA [Stats]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[custid] [int] NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[country] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[city] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[custid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nums]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nums](
	[n] [int] NOT NULL,
 CONSTRAINT [PK_Nums] PRIMARY KEY CLUSTERED 
(
	[n] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Employees]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employees](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[lastname] [nvarchar](20) NOT NULL,
	[firstname] [nvarchar](10) NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[titleofcourtesy] [nvarchar](25) NOT NULL,
	[birthdate] [date] NOT NULL,
	[hiredate] [date] NOT NULL,
	[address] [nvarchar](60) NOT NULL,
	[city] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[postalcode] [nvarchar](10) NULL,
	[country] [nvarchar](15) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
	[mgrid] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Production].[Categories]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Categories](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](15) NOT NULL,
	[description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Production].[Products]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Products](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](40) NOT NULL,
	[supplierid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
	[unitprice] [money] NOT NULL,
	[discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Production].[Suppliers]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Suppliers](
	[supplierid] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[contactname] [nvarchar](30) NOT NULL,
	[contacttitle] [nvarchar](30) NOT NULL,
	[address] [nvarchar](60) NOT NULL,
	[city] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[postalcode] [nvarchar](10) NULL,
	[country] [nvarchar](15) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
	[fax] [nvarchar](24) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Customers]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Customers](
	[custid] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[contactname] [nvarchar](30) NOT NULL,
	[contacttitle] [nvarchar](30) NOT NULL,
	[address] [nvarchar](60) NOT NULL,
	[city] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[postalcode] [nvarchar](10) NULL,
	[country] [nvarchar](15) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
	[fax] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[custid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[OrderDetails]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[OrderDetails](
	[orderid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[unitprice] [money] NOT NULL,
	[qty] [smallint] NOT NULL,
	[discount] [numeric](4, 3) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Orders]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[custid] [int] NULL,
	[empid] [int] NOT NULL,
	[orderdate] [date] NOT NULL,
	[requireddate] [date] NOT NULL,
	[shippeddate] [date] NULL,
	[shipperid] [int] NOT NULL,
	[freight] [money] NOT NULL,
	[shipname] [nvarchar](40) NOT NULL,
	[shipaddress] [nvarchar](60) NOT NULL,
	[shipcity] [nvarchar](15) NOT NULL,
	[shipregion] [nvarchar](15) NULL,
	[shippostalcode] [nvarchar](10) NULL,
	[shipcountry] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Shippers]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Shippers](
	[shipperid] [int] IDENTITY(1,1) NOT NULL,
	[companyname] [nvarchar](40) NOT NULL,
	[phone] [nvarchar](24) NOT NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[shipperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Stats].[Scores]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Stats].[Scores](
	[testid] [varchar](10) NOT NULL,
	[studentid] [varchar](10) NOT NULL,
	[score] [tinyint] NOT NULL,
 CONSTRAINT [PK_Scores] PRIMARY KEY CLUSTERED 
(
	[testid] ASC,
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Stats].[Tests]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Stats].[Tests](
	[testid] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[GetNums]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetNums](@low AS BIGINT, @high AS BIGINT) RETURNS TABLE
AS
RETURN
  WITH
    L0   AS (SELECT c FROM (SELECT 1 UNION ALL SELECT 1) AS D(c)),
    L1   AS (SELECT 1 AS c FROM L0 AS A CROSS JOIN L0 AS B),
    L2   AS (SELECT 1 AS c FROM L1 AS A CROSS JOIN L1 AS B),
    L3   AS (SELECT 1 AS c FROM L2 AS A CROSS JOIN L2 AS B),
    L4   AS (SELECT 1 AS c FROM L3 AS A CROSS JOIN L3 AS B),
    L5   AS (SELECT 1 AS c FROM L4 AS A CROSS JOIN L4 AS B),
    Nums AS (SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rownum
             FROM L5)
  SELECT TOP(@high - @low + 1) @low + rownum - 1 AS n
  FROM Nums
  ORDER BY rownum;

GO
/****** Object:  View [Sales].[CustOrders]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Sales].[CustOrders]
  WITH SCHEMABINDING
AS

SELECT
  O.custid, 
  DATEADD(month, DATEDIFF(month, CAST('19000101' AS DATE), O.orderdate), CAST('19000101' AS DATE)) AS ordermonth,
  SUM(OD.qty) AS qty
FROM Sales.Orders AS O
  JOIN Sales.OrderDetails AS OD
    ON OD.orderid = O.orderid
GROUP BY custid, DATEADD(month, DATEDIFF(month, CAST('19000101' AS DATE), O.orderdate), CAST('19000101' AS DATE));

GO
/****** Object:  View [Sales].[EmpOrders]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Sales].[EmpOrders]  
  WITH SCHEMABINDING  
AS  
  
SELECT  
  O.empid,
  DATEADD(month, DATEDIFF(month, CAST('19000101' AS DATE), O.orderdate), CAST('19000101' AS DATE)) AS ordermonth,
  SUM(OD.qty) AS qty,
  CAST(SUM(OD.qty * OD.unitprice * (1 - discount))  
       AS NUMERIC(12, 2)) AS val,
  COUNT(*) AS numorders  
FROM Sales.Orders AS O  
  JOIN Sales.OrderDetails AS OD  
    ON OD.orderid = O.orderid  
GROUP BY empid, DATEADD(month, DATEDIFF(month, CAST('19000101' AS DATE), O.orderdate), CAST('19000101' AS DATE));

GO
/****** Object:  View [Sales].[OrderTotalsByYear]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Sales].[OrderTotalsByYear]
  WITH SCHEMABINDING
AS

SELECT
  YEAR(O.orderdate) AS orderyear,
  SUM(OD.qty) AS qty
FROM Sales.Orders AS O
  JOIN Sales.OrderDetails AS OD
    ON OD.orderid = O.orderid
GROUP BY YEAR(orderdate);

GO
/****** Object:  View [Sales].[OrderValues]    Script Date: 2018/5/17 22:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------
-- Create Views and Functions
---------------------------------------------------------------------

CREATE VIEW [Sales].[OrderValues]
  WITH SCHEMABINDING
AS

SELECT O.orderid, O.custid, O.empid, O.shipperid, O.orderdate, O.requireddate, O.shippeddate,
  SUM(OD.qty) AS qty,
  CAST(SUM(OD.qty * OD.unitprice * (1 - OD.discount))
       AS NUMERIC(12, 2)) AS val
FROM Sales.Orders AS O
  JOIN Sales.OrderDetails AS OD
    ON O.orderid = OD.orderid
GROUP BY O.orderid, O.custid, O.empid, O.shipperid, O.orderdate, O.requireddate, O.shippeddate;

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_lastname]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_lastname] ON [HR].[Employees]
(
	[lastname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_postalcode]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_postalcode] ON [HR].[Employees]
(
	[postalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_categoryname]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_categoryname] ON [Production].[Categories]
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_categoryid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_categoryid] ON [Production].[Products]
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_productname]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_productname] ON [Production].[Products]
(
	[productname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_supplierid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_supplierid] ON [Production].[Products]
(
	[supplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_companyname]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_companyname] ON [Production].[Suppliers]
(
	[companyname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_postalcode]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_postalcode] ON [Production].[Suppliers]
(
	[postalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_city]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_city] ON [Sales].[Customers]
(
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_companyname]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_companyname] ON [Sales].[Customers]
(
	[companyname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_postalcode]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_postalcode] ON [Sales].[Customers]
(
	[postalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_region]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_region] ON [Sales].[Customers]
(
	[region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_orderid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_orderid] ON [Sales].[OrderDetails]
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_productid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_productid] ON [Sales].[OrderDetails]
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_custid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_custid] ON [Sales].[Orders]
(
	[custid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_empid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_empid] ON [Sales].[Orders]
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_orderdate]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_orderdate] ON [Sales].[Orders]
(
	[orderdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_shippeddate]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_shippeddate] ON [Sales].[Orders]
(
	[shippeddate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_nc_shipperid]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_shipperid] ON [Sales].[Orders]
(
	[shipperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_shippostalcode]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_shippostalcode] ON [Sales].[Orders]
(
	[shippostalcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_nc_testid_score]    Script Date: 2018/5/17 22:29:25 ******/
CREATE NONCLUSTERED INDEX [idx_nc_testid_score] ON [Stats].[Scores]
(
	[testid] ASC,
	[score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Production].[Products] ADD  CONSTRAINT [DFT_Products_unitprice]  DEFAULT ((0)) FOR [unitprice]
GO
ALTER TABLE [Production].[Products] ADD  CONSTRAINT [DFT_Products_discontinued]  DEFAULT ((0)) FOR [discontinued]
GO
ALTER TABLE [Sales].[OrderDetails] ADD  CONSTRAINT [DFT_OrderDetails_unitprice]  DEFAULT ((0)) FOR [unitprice]
GO
ALTER TABLE [Sales].[OrderDetails] ADD  CONSTRAINT [DFT_OrderDetails_qty]  DEFAULT ((1)) FOR [qty]
GO
ALTER TABLE [Sales].[OrderDetails] ADD  CONSTRAINT [DFT_OrderDetails_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [Sales].[Orders] ADD  CONSTRAINT [DFT_Orders_freight]  DEFAULT ((0)) FOR [freight]
GO
ALTER TABLE [HR].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([mgrid])
REFERENCES [HR].[Employees] ([empid])
GO
ALTER TABLE [HR].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [Production].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryid])
REFERENCES [Production].[Categories] ([categoryid])
GO
ALTER TABLE [Production].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [Production].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([supplierid])
REFERENCES [Production].[Suppliers] ([supplierid])
GO
ALTER TABLE [Production].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderid])
REFERENCES [Sales].[Orders] ([orderid])
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([productid])
REFERENCES [Production].[Products] ([productid])
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([custid])
REFERENCES [Sales].[Customers] ([custid])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([empid])
REFERENCES [HR].[Employees] ([empid])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [Sales].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([shipperid])
REFERENCES [Sales].[Shippers] ([shipperid])
GO
ALTER TABLE [Sales].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [Stats].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_Scores_Tests] FOREIGN KEY([testid])
REFERENCES [Stats].[Tests] ([testid])
GO
ALTER TABLE [Stats].[Scores] CHECK CONSTRAINT [FK_Scores_Tests]
GO
ALTER TABLE [HR].[Employees]  WITH CHECK ADD  CONSTRAINT [CHK_birthdate] CHECK  (([birthdate]<=CONVERT([date],sysdatetime())))
GO
ALTER TABLE [HR].[Employees] CHECK CONSTRAINT [CHK_birthdate]
GO
ALTER TABLE [Production].[Products]  WITH CHECK ADD  CONSTRAINT [CHK_Products_unitprice] CHECK  (([unitprice]>=(0)))
GO
ALTER TABLE [Production].[Products] CHECK CONSTRAINT [CHK_Products_unitprice]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CHK_discount] CHECK  (([discount]>=(0) AND [discount]<=(1)))
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [CHK_discount]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CHK_qty] CHECK  (([qty]>(0)))
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [CHK_qty]
GO
ALTER TABLE [Sales].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CHK_unitprice] CHECK  (([unitprice]>=(0)))
GO
ALTER TABLE [Sales].[OrderDetails] CHECK CONSTRAINT [CHK_unitprice]
GO
ALTER TABLE [Stats].[Scores]  WITH CHECK ADD  CONSTRAINT [CHK_Scores_score] CHECK  (([score]>=(0) AND [score]<=(100)))
GO
ALTER TABLE [Stats].[Scores] CHECK CONSTRAINT [CHK_Scores_score]
GO
USE [master]
GO
ALTER DATABASE [TSQLV4] SET  READ_WRITE 
GO
