DECLARE @databaseName NVARCHAR(64) = '$(databaseName)'
DECLARE @backupFilePath NVARCHAR(256) = '$(backupFilePath)'

BACKUP LOG @databaseName
TO DISK = @backupFilePath
WITH INIT;
