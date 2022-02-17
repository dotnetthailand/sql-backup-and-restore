DECLARE @databaseName NVARCHAR(64) = '$(databaseName)'
DECLARE @backupFilePath NVARCHAR(256) = '$(backupFilePath)'

BACKUP DATABASE @databaseName
To DISK = @backupFilePath
WITH
  DIFFERENTIAL,
  INIT; -- Specifies that all backup sets should be overwritten
