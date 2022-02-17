$databaseName = "my-db"
$connectionString = "Server=localhost,1433; Database=master; User Id=sa; Password=12345Abc%;"

# https://stackoverflow.com/a/4046767/1872200
$query = "ALTER DATABASE [$databaseName] SET Single_User WITH Rollback Immediate;"
Invoke-Sqlcmd -ConnectionString $connectionString -Query $query -Verbose

$inputFile = "./2-restore-to-the-latest-differential-backups.sql"
$variables = @(
  "databaseName=$databaseName"
  "fullBackupFilePath=/var/opt/mssql/backup/$databaseName.bak"
  "differentialBackupFilePath=/var/opt/mssql/backup/$databaseName.dif"

  "databaseFilePath=/var/opt/mssql/data/$databaseName.mdf"
  "logFilePath=/var/opt/mssql/log/$databaseName.ldf"
)

Invoke-Sqlcmd `
  -ConnectionString $connectionString `
  -InputFile $inputFile `
  -Variable $variables `
  -Verbose

$query = "ALTER DATABASE [$databaseName] SET Multi_User;"
Invoke-Sqlcmd -ConnectionString $connectionString -Query $query -Verbose