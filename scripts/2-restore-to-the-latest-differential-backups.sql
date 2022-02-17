DECLARE @databaseName NVARCHAR(64) = '$(databaseName)'
DECLARE @logName NVARCHAR(64) = '$(databaseName)' + '_log'

DECLARE @fullBackupFilePath NVARCHAR(256) = '$(fullBackupFilePath)'
DECLARE @differentialBackupFilePath NVARCHAR(256) = '$(differentialBackupFilePath)'

DECLARE @databaseFilePath NVARCHAR(256) = '$(databaseFilePath)'
DECLARE @logFilePath NVARCHAR(256) = '$(logFilePath)'

RESTORE DATABASE @databaseName
FROM DISK = @fullBackupFilePath
WITH
  MOVE @databaseName TO @databaseFilePath,
  MOVE @logName TO @logFilePath,
  NORECOVERY, -- 'with recovery' is optional here - it's the default if not specified - database will be available
  REPLACE;

-- Restore most recent differential backup
RESTORE DATABASE @databaseName
FROM DISK = @differentialBackupFilePath
WITH RECOVERY; -- make database available and no more backup files can be applied
