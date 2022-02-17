/* restore options - restore to the latest point in time with full, differential and transaction log backups */

-- restore full backup
RESTORE DATABASE [MyDatabaseTest]
FROM  DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_000011_4175616.bak'
WITH
  MOVE N'MyDatabase' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest.mdf',
  MOVE N'MyDatabase_log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest_log.ldf',
  NORECOVERY, -- 'restore with norecovery' allows additional backups to be applied - database will be unavailable
  REPLACE;

-- restore most recent differential backup
RESTORE DATABASE [MyDatabaseTest]
FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_173001_7071188.dif'
WITH RECOVERY; -- make database available and no more backup files can be applied
