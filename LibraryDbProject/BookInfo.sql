CREATE TABLE [dbo].[BookInfo]
(
	[BookId]		INT PRIMARY KEY IDENTITY(1,1), 
    [BookName]		VARCHAR(200), 
    [BookPrice]		INT, 
    [BookAuthor]	VARCHAR(50), 
    [BookReview]	INT
)
