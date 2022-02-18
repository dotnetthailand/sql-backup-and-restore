$databaseName = "my-db"
$connectionString = "Server=localhost,1433; Database=$databaseName; User Id=sa; Password=12345Abc%;"
$backupFolderPath = "/var/opt/mssql/backup"

# Inialize a database
$inputFile = "../init-db.sql"
Invoke-Sqlcmd `
  -ConnectionString "Server=localhost,1433; Database=master; User Id=sa; Password=12345Abc%;" `
  -InputFile $inputFile `
  -Verbose

# Create full backup
$inputFile = "./create-full-backup.sql"
$variables = @(
  "databaseName=$databaseName"
  "backupFilePath=$(Join-Path $backupFolderPath "$databaseName.bak")"
)
Invoke-Sqlcmd `
  -ConnectionString $connectionString `
  -InputFile $inputFile `
  -Variable $variables `
  -Verbose

# Insert some data
$query = "INSERT INTO [User] VALUES ('Phuong', 'Realman', '2018-01-01');"
Invoke-Sqlcmd -ConnectionString $connectionString -Query $query -Verbose

# Create differential backup
$inputFile = "./create-differential-backup.sql"
$variables = @(
  "databaseName=$databaseName"
  "backupFilePath=$(Join-Path $backupFolderPath "$databaseName.dif")"
)
Invoke-Sqlcmd `
  -ConnectionString $connectionString `
  -InputFile $inputFile `
  -Variable $variables `
  -Verbose

# Insert some data
$query = "INSERT INTO [User] VALUES ('Yai', 'Realman', '2018-01-01');"
Invoke-Sqlcmd -ConnectionString $connectionString -Query $query -Verbose

# Create transaction log backup
$inputFile = "./create-transaction-log-backup.sql"
$variables = @(
  "databaseName=$databaseName"
  "backupFilePath=$(Join-Path $backupFolderPath "$databaseName.trn")"
)
Invoke-Sqlcmd `
  -ConnectionString $connectionString `
  -InputFile $inputFile `
  -Variable $variables `
  -Verbose

# Verify
<#
  docker exec -it sql_server_compose_db /bin/bash
  ls -l --block-size=K /var/opt/mssql/backup
  rm -rf /var/opt/mssql/backup/*
#>
