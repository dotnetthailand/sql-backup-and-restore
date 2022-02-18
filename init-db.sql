/* init-db.sql */
IF DB_ID('my-db') IS NOT NULL
BEGIN
  ALTER DATABASE [my-db] SET Single_User WITH Rollback Immediate;
  DROP DATABASE [my-db];
END
GO

CREATE DATABASE [my-db];
GO

USE [my-db];
CREATE TABLE [User] (
  Id INT NOT NULL IDENTITY(1,1),
  FirstName VARCHAR(50) NOT null,
  LastName VARCHAR(50) NOT NULL,
  DateOfBirth DATETIME NOT NULL
  CONSTRAINT PK_User_Id PRIMARY KEY (Id ASC)
);

INSERT INTO [User] VALUES ('Jose', 'Realman', '2018-01-01');
GO
