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
