CREATE TABLE [dbo].[UserComments]
(
	[CommentId] INT NOT NULL PRIMARY KEY, 
    [UserID] INT FOREIGN KEY REFERENCES [dbo].[User]([Id]) NOT NULL, 
    [Description] CHAR(300) NOT NULL, 
    [PostId] INT NULL, 
    [TimeStamp] INT NULL
)
