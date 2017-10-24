CREATE TABLE [dbo].[UserBooksStatus]
(
	[UserBookCode]	INT PRIMARY KEY IDENTITY(1,1), 
    [BookID]		INT FOREIGN KEY REFERENCES [dbo].[BookInfo]([BookId]),
	[UserID]		INT FOREIGN KEY REFERENCES [dbo].[User]([Id])
)
