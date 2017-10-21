CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,[FirstName]		 VARCHAR(50)
	,[LastName]			 VARCHAR(50)
	,[Gendar]			 VARCHAR(10)
	,[PhoneNo]			 VARCHAR(15)
	,[EmailId]			 VARCHAR(50)
	,[DOB]				 DATE
	,[Address]			 VARCHAR(200)
	,[City]				 VARCHAR(20)
	,[State]			 VARCHAR(20)
	,[ZipCode]			 VARCHAR(8)
	,[IsActive]			 BIT
	,[IsAdmin]			 BIT
)
