CREATE VIEW dbo.CreditCardLonLat AS
SELECT
        credit.Time,
        city.name,
        city.lon,
        city.lat,
        city.alpha2,
        country.companyen,
        credit.V1,
        credit.V2,
        credit.V3,
        credit.V4,
        credit.V5,
        credit.V6,
        credit.V7,
        credit.V8,
        credit.V9,
        credit.V10,
        credit.V11,
        credit.V12,
        credit.V13,
        credit.V14,
        credit.V15,
        credit.V16,
        credit.V17,
        credit.V18,
        credit.V19,
        credit.V20,
        credit.V21,
        credit.V22,
        credit.V23,
        credit.V24,
        credit.V25,
        credit.V26,
        credit.V27,
        credit.V28,
        credit.Amount,
        credit.Class,
        credit.id
FROM
OPENROWSET(
        BULK 'https://synapselabfraud###.blob.core.windows.net/synapse/CreditCardScored.csv',
        FORMAT = 'CSV',
        FIELDTERMINATOR =',',
        FIRSTROW = 2,
        ESCAPECHAR = '\\'
    )
    WITH (
        [Time] float,
        [V1] float,[V2] float,[V3] float,[V4] float,[V5] float,[V6] float,[V7] float,[V8] float,[V9] float,[V10] float,
        [V11] float,[V12] float,[V13] float,[V14] float,[V15] float,[V16] float,[V17] float,[V18] float,[V19] float,[V20] float,
        [V21] float,[V22] float,[V23] float,[V24] float,[V25] float,[V26] float,[V27] float,[V28] float,
        [Amount] float,[Class] int,[id] varchar(20)
    ) AS [credit]
LEFT JOIN
OPENROWSET(
        BULK 'https://synapselabfraud###.dfs.core.windows.net/synapse/CityList.csv',
        FORMAT = 'CSV',
        FIELDTERMINATOR =',',
        FIRSTROW = 2,
        ESCAPECHAR = '\\'
    )
    WITH (
        [id] VARCHAR (20) ,
        [name] VARCHAR (100) COLLATE Latin1_General_100_CI_AI_SC_UTF8,
        [state] VARCHAR (10) ,
        [alpha2] VARCHAR (2) ,
        [lon] float,
        [lat] float
    ) AS [city] ON
    credit.id = city.id
LEFT JOIN
OPENROWSET(
        BULK 'https://synapselabfraud###.dfs.core.windows.net/synapse/CountryList.csv',
        FORMAT = 'CSV',
        FIELDTERMINATOR =',',
        FIRSTROW = 2,
        ESCAPECHAR = '\\'
    )
    WITH (
        [companyjp] VARCHAR (20) COLLATE Latin1_General_100_CI_AI_SC_UTF8,
        [companyen] VARCHAR (100) COLLATE Latin1_General_100_CI_AI_SC_UTF8,
        [numeric] decimal,
        [alpha3] VARCHAR (3) ,
        [alpha2] VARCHAR (2) ,
        [location] VARCHAR (100) COLLATE Latin1_General_100_CI_AI_SC_UTF8,
        [subvivision] VARCHAR (15) COLLATE Latin1_General_100_CI_AI_SC_UTF8
    ) AS [country] ON
    city.alpha2 = country.alpha2