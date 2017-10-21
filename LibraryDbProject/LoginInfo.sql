CREATE TABLE [dbo].[LoginInfo]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,[UserName] VARCHAR(20)
	,[Passcode] VARCHAR(200)
	,[UserId] INT
)
