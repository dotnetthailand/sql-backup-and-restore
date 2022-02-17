$connectionString = "Server=localhost,1433; Database=my-db; User Id=sa; Password=12345Abc%;"
Invoke-Sqlcmd -Query "SELECT * from [User]" -ConnectionString $connectionString
