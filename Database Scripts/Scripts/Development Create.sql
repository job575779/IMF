USE [IMF.WEO]
GO

/****** Object:  Table [dbo].[Development]    Script Date: 12/8/2023 6:23:19 AM ******/
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


