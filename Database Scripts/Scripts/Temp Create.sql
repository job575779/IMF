USE [IMF.WEO]
GO

/****** Object:  Table [dbo].[Temp]    Script Date: 12/8/2023 5:48:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Temp](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NULL,
	[CountryCode] [varchar](4) NULL,
	[IndicatorName] [nvarchar](max) NULL,
	[IndicatorCode] [nvarchar](100) NULL,
	[FrequencyAbbreviation] [char](1) NULL,
	[FrequencyDate] [date] NULL,
	[Value] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


