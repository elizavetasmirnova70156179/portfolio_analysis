USE [master]
GO
/****** Object:  Database [ЦенныеБумаги]    Script Date: 12.01.2023 21:37:18 ******/
CREATE DATABASE [ЦенныеБумаги]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ЦенныеБумаги', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ЦенныеБумаги.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ЦенныеБумаги_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ЦенныеБумаги_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ЦенныеБумаги] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ЦенныеБумаги].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ЦенныеБумаги] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET ARITHABORT OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ЦенныеБумаги] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ЦенныеБумаги] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ЦенныеБумаги] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ЦенныеБумаги] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET RECOVERY FULL 
GO
ALTER DATABASE [ЦенныеБумаги] SET  MULTI_USER 
GO
ALTER DATABASE [ЦенныеБумаги] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ЦенныеБумаги] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ЦенныеБумаги] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ЦенныеБумаги] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ЦенныеБумаги] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ЦенныеБумаги] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ЦенныеБумаги', N'ON'
GO
ALTER DATABASE [ЦенныеБумаги] SET QUERY_STORE = ON
GO
ALTER DATABASE [ЦенныеБумаги] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ЦенныеБумаги]
GO
/****** Object:  Table [dbo].[АнализСтабильности]    Script Date: 12.01.2023 21:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[АнализСтабильности](
	[Номер] [int] NOT NULL,
	[Дата] [date] NULL,
	[Стоимость] [money] NULL,
	[КодЦеннойБумаги] [int] NULL,
	[КодПреподавателя] [int] NULL,
 CONSTRAINT [PK_АнализСтабильности] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Портфель]    Script Date: 12.01.2023 21:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Портфель](
	[Номер] [int] NOT NULL,
	[Стоимость] [money] NULL,
	[КодЦеннойБумаги] [int] NULL,
	[ДатаСозданиеПортфеля] [date] NULL,
 CONSTRAINT [PK_Портфель] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватели]    Script Date: 12.01.2023 21:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватели](
	[КодПреподавателя] [int] NOT NULL,
	[ФИО] [varchar](50) NULL,
	[Стаж] [int] NULL,
 CONSTRAINT [PK_Преподаватели] PRIMARY KEY CLUSTERED 
(
	[КодПреподавателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЦенныеБумаги]    Script Date: 12.01.2023 21:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЦенныеБумаги](
	[КодЦеннойБумаги] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[ДатаВыпуска] [date] NULL,
 CONSTRAINT [PK_ЦенныеБумаги] PRIMARY KEY CLUSTERED 
(
	[КодЦеннойБумаги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[АнализСтабильности]  WITH CHECK ADD  CONSTRAINT [FK_АнализСтабильности_Преподаватели] FOREIGN KEY([КодПреподавателя])
REFERENCES [dbo].[Преподаватели] ([КодПреподавателя])
GO
ALTER TABLE [dbo].[АнализСтабильности] CHECK CONSTRAINT [FK_АнализСтабильности_Преподаватели]
GO
ALTER TABLE [dbo].[АнализСтабильности]  WITH CHECK ADD  CONSTRAINT [FK_АнализСтабильности_ЦенныеБумаги] FOREIGN KEY([КодЦеннойБумаги])
REFERENCES [dbo].[ЦенныеБумаги] ([КодЦеннойБумаги])
GO
ALTER TABLE [dbo].[АнализСтабильности] CHECK CONSTRAINT [FK_АнализСтабильности_ЦенныеБумаги]
GO
ALTER TABLE [dbo].[Портфель]  WITH CHECK ADD  CONSTRAINT [FK_Портфель_ЦенныеБумаги] FOREIGN KEY([КодЦеннойБумаги])
REFERENCES [dbo].[ЦенныеБумаги] ([КодЦеннойБумаги])
GO
ALTER TABLE [dbo].[Портфель] CHECK CONSTRAINT [FK_Портфель_ЦенныеБумаги]
GO
USE [master]
GO
ALTER DATABASE [ЦенныеБумаги] SET  READ_WRITE 
GO
