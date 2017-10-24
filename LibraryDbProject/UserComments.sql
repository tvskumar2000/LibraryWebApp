CREATE TABLE [dbo].[UserComments]
(
	[CommentId]			INT PRIMARY KEY IDENTITY(1,1), 
    [UserID]			INT FOREIGN KEY REFERENCES [dbo].[User]([Id]), 
    [Description]		CHAR(300), 
    [PostId]			INT, 
    [TimeStamp]			INT
)
