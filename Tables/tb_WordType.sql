IF OBJECT_ID('pos.tb_WordType') IS NULL
BEGIN
CREATE TABLE [pos].[tb_WordType](
 [WordTypeId] INT PRIMARY KEY NOT NULL
,[Type] NVARCHAR(250) NOT NULL
,[IsActive] BIT NOT NULL
,[CreatedBy] NVARCHAR(250)  NULL
,[CreatedDate] DATETIME NOT NULL
,[ModifiedDate] DATETIME NOT NULL
) 
END
GO
IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_WordType_IsActive')
ALTER TABLE [pos].[tb_WordType] ADD CONSTRAINT [DF_tb_WordType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_WordType_CreatedDate')
ALTER TABLE [pos].[tb_WordType] ADD  CONSTRAINT [DF_tb_WordType_CreatedDate]  DEFAULT (GETDATE()) FOR [CreatedDate]
GO
IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_WordTyper_ModifiedDate')
ALTER TABLE [pos].[tb_WordType] ADD  CONSTRAINT [DF_tb_WordType_ModifiedDate]  DEFAULT (GETDATE()) FOR [ModifiedDate]
GO

IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_WordType_[CreatedBy]')
ALTER TABLE [pos].[tb_WordType] ADD  CONSTRAINT [DF_tb_WordType_CreatedBy]  DEFAULT (HOST_NAME()) FOR [CreatedBy]
GO