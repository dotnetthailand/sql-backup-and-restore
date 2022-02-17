$databaseName = "my-db"
$connectionString = "Server=localhost,1433; Database=$databaseName; User Id=sa; Password=12345Abc%;"
$inputFile = "./create-fulll-backup.sql"

$variables = @(
  "databaseName=$databaseName"
  "backupFilePath=/var/opt/mssql/backup/$databaseName.bak"
)

Invoke-Sqlcmd `
  -ConnectionString $connectionString `
  -InputFile $inputFile `
  -Variable $variables `
  -Verbose

