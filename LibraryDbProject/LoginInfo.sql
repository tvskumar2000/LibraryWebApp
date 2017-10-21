CREATE TABLE [dbo].[LoginInfo]
(
	[UserId] INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,[UserName] VARCHAR(20)
	,[Passcode] VARCHAR(200)
	
)
