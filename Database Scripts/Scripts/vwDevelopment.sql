USE [IMF.WEO]
GO

/****** Object:  View [dbo].[vwDevelopment]    Script Date: 12/19/2023 4:38:00 PM ******/
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


