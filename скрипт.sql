USE [master]
GO
/****** Object:  Database [KvalEkzamen]    Script Date: 29.06.2021 10:03:20 ******/
CREATE DATABASE [KvalEkzamen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KvalEkzamen', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KvalEkzamen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KvalEkzamen_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KvalEkzamen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KvalEkzamen] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KvalEkzamen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KvalEkzamen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KvalEkzamen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KvalEkzamen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KvalEkzamen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KvalEkzamen] SET ARITHABORT OFF 
GO
ALTER DATABASE [KvalEkzamen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KvalEkzamen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KvalEkzamen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KvalEkzamen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KvalEkzamen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KvalEkzamen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KvalEkzamen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KvalEkzamen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KvalEkzamen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KvalEkzamen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KvalEkzamen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KvalEkzamen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KvalEkzamen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KvalEkzamen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KvalEkzamen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KvalEkzamen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KvalEkzamen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KvalEkzamen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KvalEkzamen] SET  MULTI_USER 
GO
ALTER DATABASE [KvalEkzamen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KvalEkzamen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KvalEkzamen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KvalEkzamen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KvalEkzamen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KvalEkzamen] SET QUERY_STORE = OFF
GO
USE [KvalEkzamen]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.06.2021 10:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id_category] [int] NOT NULL,
	[category_name] [nvarchar](25) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 29.06.2021 10:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[id_item] [int] NOT NULL,
	[item_name] [nvarchar](30) NULL,
	[category_number] [int] NULL,
	[cost] [float] NULL,
	[about_item] [nvarchar](512) NULL,
	[rate_index_item] [float] NULL,
	[id_producer] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 29.06.2021 10:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id_producer] [int] NOT NULL,
	[name_producer] [nvarchar](25) NULL,
	[country_producer] [nvarchar](25) NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id_producer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Remains]    Script Date: 29.06.2021 10:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remains](
	[id_remains] [int] NOT NULL,
	[id_items] [int] NULL,
	[date_and_time] [datetime] NULL,
	[count_lost] [int] NULL,
 CONSTRAINT [PK_Remains] PRIMARY KEY CLUSTERED 
(
	[id_remains] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([category_number])
REFERENCES [dbo].[Category] ([id_category])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id_producer])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Producer]
GO
ALTER TABLE [dbo].[Remains]  WITH CHECK ADD  CONSTRAINT [FK_Remains_Items] FOREIGN KEY([id_items])
REFERENCES [dbo].[Items] ([id_item])
GO
ALTER TABLE [dbo].[Remains] CHECK CONSTRAINT [FK_Remains_Items]
GO
USE [master]
GO
ALTER DATABASE [KvalEkzamen] SET  READ_WRITE 
GO
