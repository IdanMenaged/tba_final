CREATE TABLE [dbo].[usersTbl]
(
	[uName] nvarchar(10) NOT NULL PRIMARY KEY,
	[fName] nvarchar(10) NOT NULL,
	[lName] nvarchar(10) NOT NULL,
	[email] nvarchar(10) NOT NULL,
	[password] nvarchar(10) NOT NULL
)
