$connectionString = "Server=localhost,1433; Database=my-db; User Id=sa; Password=12345Abc%;"
$query = "SELECT * from [User]"

Invoke-Sqlcmd -Query $query -ConnectionString $connectionString
