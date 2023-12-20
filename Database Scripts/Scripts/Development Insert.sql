
INSERT INTO  [dbo].[Development]
           ([CountryId]
           ,[IndicatorId]
           ,[FrequencyId]
           ,[Value])

SELECT c.ID AS CountryId,
i.ID AS IndicatorId,
f.ID AS FrequencyID, 
tt.Value AS Value

FROM dbo.Temp AS tt
	FULL OUTER JOIN dbo.Frequency f ON (tt.FrequencyAbbreviation = f.Abbreviation AND tt.FrequencyDate = f.Date AND tt.FrequencyAbbreviation = f.Abbreviation) 
	FULL OUTER JOIN dbo.Indicator AS i ON (tt.IndicatorName = i.Name AND tt.IndicatorCode = i.Code AND  tt.IndicatorName = i.Name)
	FULL OUTER JOIN dbo.Country AS c ON (tt.CountryName = c.Name AND tt.CountryCode = c.Code AND tt.CountryName = c.Name)
/*
TESTS

SELECT tt.Value AS Value,
				c.ID AS CountryId, 
				tt.CountryName AS CountryName, tt.CountryCode AS CountryCode, 
				i.ID AS IndicatorId, 
				tt.IndicatorName AS IndicatorName, tt.IndicatorCode AS IndicatorCode,
				f.ID AS FrequencyID, 
				tt.FrequencyAbbreviation AS FrequencyAbbreviation, tt.FrequencyDate AS FrequencyDate 
FROM dbo.Temp AS tt
	FULL OUTER JOIN dbo.Frequency f ON (tt.FrequencyAbbreviation = f.Abbreviation AND tt.FrequencyDate = f.Date AND tt.FrequencyAbbreviation = f.Abbreviation) 
	FULL OUTER JOIN dbo.Indicator AS i ON (tt.IndicatorName = i.Name AND tt.IndicatorCode = i.Code AND  tt.IndicatorName = i.Name)
	FULL OUTER JOIN dbo.Country AS c ON (tt.CountryName = c.Name AND tt.CountryCode = c.Code AND tt.CountryName = c.Name)
WHERE tt.FrequencyDate = f.Date AND tt.FrequencyAbbreviation = f.Abbreviation 
      AND tt.IndicatorCode = i.Code AND  tt.IndicatorName = i.Name
	  AND tt.CountryCode = c.Code AND tt.CountryName = c.Name

---------- ISSUE FOUND WHILE COPYING --------------
SELECT * FROM dbo.Temp AS t INNER JOIN dbo.Country AS c
ON (t.CountryName = c.Name AND t.CountryCode = c.Code AND t.CountryName = c.Name)

SELECT * FROM dbo.Temp AS t INNER JOIN dbo.Indicator AS i
ON (t.IndicatorName = i.Name AND t.IndicatorCode = i.Code AND  t.IndicatorName = i.Name)

SELECT * FROM dbo.Temp AS t INNER JOIN dbo.Frequency AS f
ON (t.FrequencyAbbreviation = f.Abbreviation AND t.FrequencyDate = f.Date AND t.FrequencyAbbreviation = f.Abbreviation)

SELECT * FROM dbo.Indicator

SELECT * FROM dbo.Temp

UPDATE dbo.Temp
SET IndicatorCode = 'NGDP_USD'
WHERE IndicatorCode = 'Average CPI inflation, percent change'

------------- INITIAL SCRIPTS ---------------------
SELECT tt.Value AS Value,
				c.ID AS CountryId, 
				tt.CountryName AS CountryName, tt.CountryCode AS CountryCode, 
				i.ID AS IndicatorId, 
				tt.IndicatorName AS IndicatorName, tt.IndicatorCode AS IndicatorCode,
				f.ID AS FrequencyID, 
				tt.FrequencyAbbreviation AS FrequencyAbbreviation, tt.FrequencyDate AS FrequencyDate 
FROM dbo.Temp AS tt
FULL OUTER JOIN dbo.Frequency f ON (tt.FrequencyAbbreviation = f.Abbreviation AND tt.FrequencyDate = f.Date AND tt.FrequencyAbbreviation = f.Abbreviation) 
	FULL OUTER JOIN dbo.Indicator AS i ON (tt.IndicatorName = i.Name AND tt.IndicatorCode = i.Code AND  tt.IndicatorName = i.Name)
	FULL OUTER JOIN dbo.Country AS c ON (tt.CountryName = c.Name AND tt.CountryCode = c.Code AND tt.CountryName = c.Name)
WHERE tt.FrequencyDate = f.Date AND tt.FrequencyAbbreviation = f.Abbreviation 
      AND tt.IndicatorCode = i.Code AND  tt.IndicatorName = i.Name
	  AND tt.CountryCode = c.Code AND tt.CountryName = c.Name
INTERSECT
SELECT DISTINCT t.Value AS Value,
				c.ID AS CountryId, t.CountryName AS CountryName, t.CountryCode AS CountryCode, 
				i.ID AS IndicatorId, t.IndicatorName AS IndicatorName, t.IndicatorCode AS IndicatorCode,
				f.ID AS FrequencyID, t.FrequencyAbbreviation AS FrequencyAbbreviation, t.FrequencyDate AS FrequencyDate

FROM dbo.Temp AS t 
	, dbo.Frequency AS f  
	, dbo.Indicator AS i 
	, dbo.Country AS c  
WHERE t.FrequencyDate = f.Date AND t.FrequencyAbbreviation = f.Abbreviation 
      AND t.IndicatorCode = i.Code AND  t.IndicatorName = i.Name
	  AND t.CountryCode = c.Code AND t.CountryName = c.Name

FROM dbo.Temp AS t 
	INNER JOIN dbo.Frequency f ON t.FrequencyAbbreviation = f.Abbreviation
	INNER JOIN dbo.Indicator AS i ON t.IndicatorName = i.Name
	INNER JOIN dbo.Country AS c ON t.CountryName = c.Name
WHERE t.FrequencyDate = f.Date AND t.IndicatorCode = i.Code AND t.CountryCode = c.Code


SELECT DISTINCT t.Value AS Value,
				c.ID AS CountryId, t.CountryName AS CountryName, t.CountryCode AS CountryCode, 
				NULL AS IndicatorId, t.IndicatorName AS IndicatorName, t.IndicatorCode AS IndicatorCode,
				NULL AS FrequencyID, t.FrequencyAbbreviation AS FrequencyAbbreviation, t.FrequencyDate AS FrequencyDate
FROM dbo.Country AS c INNER JOIN dbo.Temp AS t ON c.Name = t.CountryName
WHERE c.Code = t.CountryCode
EXCEPT 
SELECT DISTINCT t.Value AS Value,
				NULL AS CountryId, t.CountryName AS CountryName, t.CountryCode AS CountryCode, 
				i.ID AS IndiacatorId, t.IndicatorName AS IndicatorName, t.IndicatorCode AS IndicatorCode,
				NULL AS FrequencyID, t.FrequencyAbbreviation AS FrequencyAbbreviation, t.FrequencyDate AS FrequencyDate
FROM dbo.Indicator AS i INNER JOIN dbo.Temp AS t ON i.Name = t.IndicatorName
WHERE i.Code = t.IndicatorCode
EXCEPT
SELECT DISTINCT t.Value AS Value,
				NULL AS CountryId, t.CountryName AS CountryName, t.CountryCode AS CountryCode, 
				NULL AS IndicatorId, t.IndicatorName AS IndicatorName, t.IndicatorCode AS IndicatorCode,
				f.ID AS FrequencyId, t.FrequencyAbbreviation AS FrequencyAbbreviation, t.FrequencyDate AS FrequencyDate
FROM dbo.Frequency AS f INNER JOIN dbo.Temp AS t ON f.Abbreviation = t.FrequencyAbbreviation
WHERE  f.Date = t.FrequencyDate
*/
