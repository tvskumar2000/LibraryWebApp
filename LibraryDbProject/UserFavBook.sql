CREATE TABLE [dbo].[UserFavBook]
(
	[UserBookCode] INT NOT NULL PRIMARY KEY, 
    [UserID] INT FOREIGN KEY REFERENCES [dbo].[User]([Id]) NOT NULL, 
    [BookID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[UserBooks]([BookId])
	
)
