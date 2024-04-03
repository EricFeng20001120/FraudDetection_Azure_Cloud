DECLARE @modelexample varbinary(max) = (SELECT [Model] FROM synapse.[MLModelExt]);

SELECT
d.*, p.*
INTO synapse.CreditCard
FROM PREDICT(MODEL = @modelexample,
    DATA = synapse.exCreditCard AS d,
    RUNTIME = ONNX) WITH (output_label bigint) AS p;