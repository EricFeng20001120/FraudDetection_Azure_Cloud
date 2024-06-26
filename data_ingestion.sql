CREATE SCHEMA synapse;

CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<sqlDatabasePassword>';

CREATE DATABASE SCOPED CREDENTIAL AzureStorageAccountKey
WITH IDENTITY = 'ccfraud',
SECRET = '<yourAzureStorageAccountPrivateKey>';

CREATE EXTERNAL DATA SOURCE CSVDataSource WITH
(
    TYPE = HADOOP,
    LOCATION = 'wasbs:files//synapse@ccfraud.blob.core.windows.net',
    CREDENTIAL = AzureStorageAccountKey
);

CREATE EXTERNAL FILE FORMAT CSVFileFormat
WITH (  
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2,
        USE_TYPE_DEFAULT=TRUE
    )
);
GO

CREATE EXTERNAL FILE FORMAT csv
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '',
        DATE_FORMAT = '',
        USE_TYPE_DEFAULT = False
    )
);
GO


CREATE EXTERNAL TABLE synapse.exCreditCard
(
        [Time] float,
        [V1] float,[V2] float,[V3] float,[V4] float,[V5] float,[V6] float,[V7] float,[V8] float,[V9] float,[V10] float,
        [V11] float,[V12] float,[V13] float,[V14] float,[V15] float,[V16] float,[V17] float,[V18] float,[V19] float,[V20] float,
        [V21] float,[V22] float,[V23] float,[V24] float,[V25] float,[V26] float,[V27] float,[V28] float,
        [Amount] float,[Class] bigint,[id] bigint
)
WITH
(
        LOCATION = 'CreditCard.csv',
        DATA_SOURCE = [CSVDataSource],
        FILE_FORMAT = [CSVFileFormat]
);
GO

CREATE EXTERNAL TABLE synapse.[MLModelExt]
(
[Model] [varbinary](max) NULL
)
WITH
(
    LOCATION='credit_card_model.onnx.hex' ,
    DATA_SOURCE = [CSVDataSource] ,
    FILE_FORMAT = csv ,
    REJECT_TYPE = VALUE ,
    REJECT_VALUE = 0
);
GO


