CREATE TABLE [dbo].[LoginInfo]
(
	[UserId]		INT PRIMARY KEY IDENTITY(1,1)
	,[UserName]		VARCHAR(20) NOT NULL
	,[Passcode]		VARCHAR(200) NOT NULL
	
)
