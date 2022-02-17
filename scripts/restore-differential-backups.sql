DECLARE @databaseName NVARCHAR(64) = '$(databaseName)'
DECLARE @backupFilePath NVARCHAR(256) = '$(backupFilePath)'

-- Restore most recent differential backup
RESTORE DATABASE @databaseName
FROM DISK = @backupFilePath
WITH RECOVERY; -- make database available and no more backup files can be applied
