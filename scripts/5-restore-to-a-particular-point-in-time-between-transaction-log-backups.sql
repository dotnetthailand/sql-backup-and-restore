/* restore to a point in time when a transaction log was backed up */

-- restore full backup
RESTORE DATABASE [MyDatabaseTest]
FROM  DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_000011_4175616.bak'
WITH MOVE N'MyDatabase' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest.mdf',
  MOVE N'MyDatabase_log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest_log.ldf',
  NORECOVERY,  -- 'with norecovery' allows additional backups to be applied - database will be unavailable
  REPLACE;

-- restore differential backup
RESTORE DATABASE [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_013001_9294408.dif' WITH NORECOVERY;

-- restore transaction log backups
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_021501_5352741.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_031501_5822593.trn' WITH NORECOVERY,
        STOPAT = '2021-06-01 02:30:00 AM';

-- make database available and no more backup files can be applied
RESTORE LOG [MyDatabaseTest] WITH RECOVERY;
