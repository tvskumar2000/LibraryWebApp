CREATE TABLE [dbo].[UserFavBook]
(
	[UserBookCode]	INT PRIMARY KEY IDENTITY(1,1), 
    [UserID]		INT FOREIGN KEY REFERENCES [dbo].[User]([Id]), 
    [BookID]		INT FOREIGN KEY REFERENCES [dbo].[BookInfo]([BookId])
)
