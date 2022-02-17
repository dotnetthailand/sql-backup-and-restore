/* restore options - restore to the latest point in time with full, differential and transaction log backups */

-- restore full backup
RESTORE DATABASE [MyDatabaseTest]
FROM  DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_000011_4175616.bak'
WITH MOVE N'MyDatabase' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest.mdf',
     MOVE N'MyDatabase_log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest_log.ldf',
NORECOVERY, -- 'restore with norecovery' allows additional backups to be applied - database will be unavailable
REPLACE;

-- restore most recent differential backup
RESTORE DATABASE [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_173001_7071188.dif' WITH NORECOVERY;

-- restore transaction log backups taken after latst differential
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_181501_5856632.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_191501_6847568.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_201501_2697377.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_211502_6835717.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_221502_3743339.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_231502_6227036.trn' WITH NORECOVERY;

-- make database available and no more backup files can be applied
RESTORE LOG [MyDatabaseTest] WITH RECOVERY;-- 'restore with recovery'
