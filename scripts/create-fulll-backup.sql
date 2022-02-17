DECLARE @databaseName NVARCHAR(64) = '$(databaseName)'
DECLARE @backupFilePath NVARCHAR(256) = '$(backupFilePath)'

BACKUP DATABASE @databaseName
TO DISK = @backupFilePath
WITH INIT; -- Specifies that all backup sets should be overwritten
