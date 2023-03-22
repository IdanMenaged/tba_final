CREATE TABLE [dbo].[usersTbl]
(
	[uName] NVARCHAR(50) NOT NULL PRIMARY KEY,
	[fName] nvarchar(50) NOT NULL,
	[lName] nvarchar(50) NOT NULL,
	[email] nvarchar(100) NOT NULL,
	[password] nvarchar(50) NOT NULL
)
