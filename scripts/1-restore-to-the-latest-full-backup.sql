DECLARE @databaseName NVARCHAR(64) = '$(databaseName)'
DECLARE @logName NVARCHAR(64) = '$(databaseName)' + '_log'
DECLARE @backupFilePath NVARCHAR(256) = '$(backupFilePath)'
DECLARE @databaseFilePath NVARCHAR(256) = '$(databaseFilePath)'
DECLARE @logFilePath NVARCHAR(256) = '$(logFilePath)'

/* restore from the latest full backup */

/*
  The RESTORE ... WITH REPLACE allows you to write over an existing database
  when doing a restore without first backing up the tail of the transaction log.
  The WITH REPLACE basically tells SQL Server to just throw out any active contents
  in the transaction log and move forward with the restore
  More details https://www.mssqltips.com/sqlservertutorial/121/restore-sql-server-database-and-overwrite-existing-database/
*/

-- restore database
RESTORE DATABASE @databaseName
FROM DISK = @backupFilePath
WITH
  MOVE @databaseName TO @databaseFilePath,
  MOVE @logName TO @logFilePath,
  RECOVERY, -- 'with recovery' is optional here - it's the default if not specified - database will be available
  REPLACE;
