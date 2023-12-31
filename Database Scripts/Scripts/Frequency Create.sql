USE [IMF.WEO]
GO

/****** Object:  Table [dbo].[Frequency]    Script Date: 12/7/2023 8:47:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Frequency](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100)  NOT NULL,
	[Abbreviation] [char](1)  NOT NULL,
	[Date] [date]  NOT NULL,
 CONSTRAINT [PK_Frequency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


