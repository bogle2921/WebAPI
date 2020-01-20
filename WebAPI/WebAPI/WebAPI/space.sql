Create TABLE Astros (
    astroName VARCHAR(100) NULL,
    craft VARCHAR(100) NULL,
);

DECLARE @Astros VARCHAR(MAX)

SELECT @Astros =
    BulkColumn
    FROM OPENROWSET(BULK'C:\Users\bogle\c#\WebAPI\WebAPI\WebAPI\bin\Debug', SINGLE_BLOB) JSON

IF (ISJSON(@Astros) = 1)
    BEGIN
        PRINT 'JSON file is valid';
        INSERT INTO Astros(astroName, craft)
        Values('$.name', '$.craft');
        
    END
ELSE
    BEGIN
        PRINT 'JSON file is not valid';
    END