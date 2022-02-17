#!/bin/bash
# entrypoint.sh

# Exit immediately if a command exits with a non-zero status.
set -e

init_db () {
  INPUT_SQL_FILE="init-db.sql"
  until /opt/mssql-tools/bin/sqlcmd -S localhost,1433 -U sa -P "$MSSQL_SA_PASSWORD" -i $INPUT_SQL_FILE > /dev/null 2>&1
  do
    echo -e "\033[31mSQL server is unavailable - sleeping"
    sleep 1 # Sleep for a second....
  done
  echo -e "\033[31mDone initialize a database"
}

# Run init_db and start a SQL Server
init_db & /opt/mssql/bin/sqlservr