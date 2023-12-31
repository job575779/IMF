USE [master]
GO
/****** Object:  Database [IMF.WEO]    Script Date: 12/19/2023 4:42:54 PM ******/
CREATE DATABASE [IMF.WEO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMF.WEO', FILENAME = N'' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IMF.WEO_log', FILENAME = N'' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IMF.WEO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMF.WEO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMF.WEO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMF.WEO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMF.WEO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMF.WEO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMF.WEO] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMF.WEO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMF.WEO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMF.WEO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMF.WEO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMF.WEO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMF.WEO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMF.WEO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMF.WEO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMF.WEO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMF.WEO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IMF.WEO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMF.WEO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMF.WEO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMF.WEO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMF.WEO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMF.WEO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMF.WEO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMF.WEO] SET RECOVERY FULL 
GO
ALTER DATABASE [IMF.WEO] SET  MULTI_USER 
GO
ALTER DATABASE [IMF.WEO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMF.WEO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMF.WEO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMF.WEO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IMF.WEO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IMF.WEO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IMF.WEO', N'ON'
GO
ALTER DATABASE [IMF.WEO] SET QUERY_STORE = OFF
GO
USE [IMF.WEO]
GO
/****** Object:  User [uinventory]    Script Date: 12/19/2023 4:42:55 PM ******/
CREATE USER [uinventory] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/19/2023 4:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicator]    Script Date: 12/19/2023 4:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Indicator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Development]    Script Date: 12/19/2023 4:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Development](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[IndicatorId] [int] NOT NULL,
	[FrequencyId] [int] NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_Development] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Frequency]    Script Date: 12/19/2023 4:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frequency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Abbreviation] [char](1) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Frequency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDevelopment]    Script Date: 12/19/2023 4:42:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDevelopment]
AS
SELECT        dbo.Development.ID, dbo.Country.Name AS [Country Name], dbo.Country.Code AS [Country Code], dbo.Indicator.Name AS [Indicator Name], dbo.Indicator.Code AS [Indicator Code], dbo.Frequency.Abbreviation AS Frequency, 
                         dbo.Frequency.Date, dbo.Development.Value
FROM            dbo.Development INNER JOIN
                         dbo.Frequency ON dbo.Development.FrequencyId = dbo.Frequency.ID INNER JOIN
                         dbo.Indicator ON dbo.Development.IndicatorId = dbo.Indicator.ID INNER JOIN
                         dbo.Country ON dbo.Development.CountryId = dbo.Country.ID
GO
ALTER TABLE [dbo].[Development]  WITH CHECK ADD  CONSTRAINT [FK_Development_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Development] CHECK CONSTRAINT [FK_Development_Country]
GO
ALTER TABLE [dbo].[Development]  WITH CHECK ADD  CONSTRAINT [FK_Development_Frequency] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[Frequency] ([ID])
GO
ALTER TABLE [dbo].[Development] CHECK CONSTRAINT [FK_Development_Frequency]
GO
ALTER TABLE [dbo].[Development]  WITH CHECK ADD  CONSTRAINT [FK_Development_Indicator] FOREIGN KEY([IndicatorId])
REFERENCES [dbo].[Indicator] ([ID])
GO
ALTER TABLE [dbo].[Development] CHECK CONSTRAINT [FK_Development_Indicator]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[4] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Development"
            Begin Extent = 
               Top = 0
               Left = 370
               Bottom = 130
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Frequency"
            Begin Extent = 
               Top = 85
               Left = 656
               Bottom = 215
               Right = 826
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Indicator"
            Begin Extent = 
               Top = 142
               Left = 403
               Bottom = 255
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Country"
            Begin Extent = 
               Top = 139
               Left = 71
               Bottom = 252
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwDevelopment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwDevelopment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwDevelopment'
GO
USE [master]
GO
ALTER DATABASE [IMF.WEO] SET  READ_WRITE 
GO
