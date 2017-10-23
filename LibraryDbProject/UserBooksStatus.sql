CREATE TABLE [dbo].[UserBooksStatus]
(
	[UserBookCode] INT NOT NULL PRIMARY KEY, 
    [BookID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[UserBooks]([BookId]),
	[UserID] INT FOREIGN KEY REFERENCES [dbo].[User]([Id]) NOT NULL, 
    
)
