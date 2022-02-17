/* restore to the latest point in time with full and transaction log backups */

-- restore full backup - foundation for restoring transaction log backups
RESTORE DATABASE [MyDatabaseTest]
FROM  DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_000011_4175616.bak'
WITH MOVE N'MyDatabase' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest.mdf',
     MOVE N'MyDatabase_log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyDatabaseTest_log.ldf',
NORECOVERY, -- 'restore with norecovery' allows additional backups to be applied - database will be unavailable
REPLACE;

-- restore transaction log backups
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_001502_1580793.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_011501_4325128.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_021501_5352741.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_031501_5822593.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_041501_8351922.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_051502_0940555.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_061501_5368917.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_071502_5161373.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_081501_5644279.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_091501_6308147.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_101502_4623997.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_111502_5178928.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_121503_0205342.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_131503_3755175.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_141501_8916226.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_151501_2361858.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_161501_4941559.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_171501_2457229.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_181501_5856632.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_191501_6847568.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_201501_2697377.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_211502_6835717.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_221502_3743339.trn' WITH NORECOVERY;
RESTORE LOG [MyDatabaseTest] FROM DISK = N'D:\Backups\MyDatabase_backup_2021_06_01_231502_6227036.trn' WITH NORECOVERY;

-- make database available and no more backup files can be applied
RESTORE LOG [MyDatabaseTest] WITH RECOVERY; -- 'restore with recovery' so no additional transaction logs will be applied
