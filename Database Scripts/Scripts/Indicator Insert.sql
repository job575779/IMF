USE [IMF.WEO]
GO

INSERT INTO [dbo].[Indicator]
           ([Name]
           ,[Code])
     VALUES
           (	'Nominal GDP in US Dollars'	,	'NGDP_USD'	),
(	'Average CPI inflation, percent change'	,	'PCPI_PCH'	),
(	'Diagnostic of Nominal GDP, percent'	,	'DIAG_NGDP'	)
GO


