IF OBJECT_ID('pos.tb_Word') IS NULL
BEGIN
CREATE TABLE [pos].[tb_Word](
 [WordId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL
,[Word] NVARCHAR(250) NOT NULL
,[WordTypeId] INT NOT NULL
,[IsActive] BIT NOT NULL
,[CreatedBy] NVARCHAR(250)  NULL
,[CreatedDate] DATETIME NOT NULL
,[ModifiedDate] DATETIME NOT NULL
) 
END
GO

IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Word_IsActive')
ALTER TABLE [pos].[tb_Word] ADD CONSTRAINT [DF_tb_Word_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Word_CreatedDate')
ALTER TABLE [pos].[tb_Word] ADD  CONSTRAINT [DF_tb_Word_CreatedDate]  DEFAULT (GETDATE()) FOR [CreatedDate]
GO
IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Word_ModifiedDate')
ALTER TABLE [pos].[tb_Word] ADD  CONSTRAINT [DF_tb_Word_ModifiedDate]  DEFAULT (GETDATE()) FOR [ModifiedDate]
GO

IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Word_[CreatedBy]')
ALTER TABLE [pos].[tb_Word] ADD  CONSTRAINT [DF_tb_Word_CreatedBy]  DEFAULT (HOST_NAME()) FOR [CreatedBy]
GO
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_WordType_Word_WordTypeId')
ALTER TABLE [pos].[tb_Word]  WITH CHECK ADD  CONSTRAINT [FK_WordType_Word_WordTypeId] FOREIGN KEY([WordTypeId])
REFERENCES [pos].[tb_WordType] ([WordTypeId])
GO