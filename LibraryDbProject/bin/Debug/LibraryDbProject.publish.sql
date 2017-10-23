﻿/*
Deployment script for LibraryApp

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "LibraryApp"
:setvar DefaultFilePrefix "LibraryApp"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[LoginInfo]...';


GO
CREATE TABLE [dbo].[LoginInfo] (
    [UserId]   INT           IDENTITY (1, 1) NOT NULL,
    [UserName] VARCHAR (20)  NULL,
    [Passcode] VARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (50)  NULL,
    [LastName]  VARCHAR (50)  NULL,
    [Gendar]    VARCHAR (10)  NULL,
    [PhoneNo]   VARCHAR (15)  NULL,
    [EmailId]   VARCHAR (50)  NULL,
    [DOB]       DATE          NULL,
    [Address]   VARCHAR (200) NULL,
    [City]      VARCHAR (20)  NULL,
    [State]     VARCHAR (20)  NULL,
    [ZipCode]   VARCHAR (8)   NULL,
    [IsActive]  BIT           NULL,
    [IsAdmin]   BIT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UserBooks]...';


GO
CREATE TABLE [dbo].[UserBooks] (
    [BookId]     INT          NOT NULL,
    [BookName]   INT          NULL,
    [BookPrice]  INT          NULL,
    [BookAuthor] VARCHAR (50) NULL,
    [BookReview] INT          NULL,
    PRIMARY KEY CLUSTERED ([BookId] ASC)
);


GO
PRINT N'Creating [dbo].[UserBooksStatus]...';


GO
CREATE TABLE [dbo].[UserBooksStatus] (
    [UserBookCode] INT NOT NULL,
    [BookID]       INT NOT NULL,
    [UserID]       INT NOT NULL,
    PRIMARY KEY CLUSTERED ([UserBookCode] ASC)
);


GO
PRINT N'Creating [dbo].[UserComments]...';


GO
CREATE TABLE [dbo].[UserComments] (
    [CommentId]   INT        NOT NULL,
    [UserID]      INT        NOT NULL,
    [Description] CHAR (300) NOT NULL,
    [PostId]      INT        NULL,
    [TimeStamp]   INT        NULL,
    PRIMARY KEY CLUSTERED ([CommentId] ASC)
);


GO
PRINT N'Creating [dbo].[UserFavBook]...';


GO
CREATE TABLE [dbo].[UserFavBook] (
    [UserBookCode] INT NOT NULL,
    [UserID]       INT NOT NULL,
    [BookID]       INT NOT NULL,
    PRIMARY KEY CLUSTERED ([UserBookCode] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[UserBooksStatus]...';


GO
ALTER TABLE [dbo].[UserBooksStatus]
    ADD FOREIGN KEY ([BookID]) REFERENCES [dbo].[UserBooks] ([BookId]);


GO
PRINT N'Creating unnamed constraint on [dbo].[UserBooksStatus]...';


GO
ALTER TABLE [dbo].[UserBooksStatus]
    ADD FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating unnamed constraint on [dbo].[UserComments]...';


GO
ALTER TABLE [dbo].[UserComments]
    ADD FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating unnamed constraint on [dbo].[UserFavBook]...';


GO
ALTER TABLE [dbo].[UserFavBook]
    ADD FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating unnamed constraint on [dbo].[UserFavBook]...';


GO
ALTER TABLE [dbo].[UserFavBook]
    ADD FOREIGN KEY ([BookID]) REFERENCES [dbo].[UserBooks] ([BookId]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '056d17c5-0ac2-4184-8752-38ec00f67731')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('056d17c5-0ac2-4184-8752-38ec00f67731')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9c631d26-c067-4019-998b-33d4267d79d1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9c631d26-c067-4019-998b-33d4267d79d1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fe25c693-61c2-4462-a6e2-9487863ee828')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fe25c693-61c2-4462-a6e2-9487863ee828')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0ff3c95d-aa0a-44c8-95b8-01b51b0d2b01')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0ff3c95d-aa0a-44c8-95b8-01b51b0d2b01')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7eb0468b-d3fa-4ce3-b621-163e6edffa86')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7eb0468b-d3fa-4ce3-b621-163e6edffa86')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2e1f8959-6887-47a8-bcb0-0c34e0bc0670')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2e1f8959-6887-47a8-bcb0-0c34e0bc0670')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd1f8dd5a-c355-4794-a7c4-c0abfbb5d3cb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d1f8dd5a-c355-4794-a7c4-c0abfbb5d3cb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7fa2e601-d65b-44a0-9de0-d57f048ac235')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7fa2e601-d65b-44a0-9de0-d57f048ac235')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd72e6a88-c44d-4ce6-8c96-5194ca0cc665')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d72e6a88-c44d-4ce6-8c96-5194ca0cc665')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '33035126-b4b8-4890-b14e-77dc5db399ff')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('33035126-b4b8-4890-b14e-77dc5db399ff')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
