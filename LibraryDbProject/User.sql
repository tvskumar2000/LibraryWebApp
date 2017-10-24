CREATE TABLE [dbo].[User]
(
	[Id]				 INT PRIMARY KEY IDENTITY(1,1)
	,[FirstName]		 VARCHAR(50)
	,[LastName]			 VARCHAR(50)
	,[Gendar]			 VARCHAR(10)
	,[PhoneNo]			 VARCHAR(15) NOT NULL
	,[EmailId]			 VARCHAR(50) NOT NULL
	,[DOB]				 DATE
	,[Address]			 VARCHAR(200)
	,[City]				 VARCHAR(20)
	,[State]			 VARCHAR(20)
	,[ZipCode]			 VARCHAR(8)
	,[IsActive]			 BIT
	,[IsAdmin]			 BIT
)
