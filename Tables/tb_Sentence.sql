IF OBJECT_ID('pos.tb_Sentence') IS NULL
BEGIN
CREATE TABLE [pos].[tb_Sentence](
 [SentenceId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL
,[Sentence] NVARCHAR(MAX) NOT NULL
,[CreatedBy] NVARCHAR(250)  NULL
,[CreatedDate] DATETIME NOT NULL
,[ModifiedDate] DATETIME NOT NULL
) 
END
GO


IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Sentence_CreatedDate')
ALTER TABLE [pos].[tb_Sentence] ADD  CONSTRAINT [DF_tb_Sentence_CreatedDate]  DEFAULT (GETDATE()) FOR [CreatedDate]
GO
IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Sentence_ModifiedDate')
ALTER TABLE [pos].[tb_Sentence] ADD  CONSTRAINT [DF_tb_Sentence_ModifiedDate]  DEFAULT (GETDATE()) FOR [ModifiedDate]
GO

IF NOT EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'DF_tb_Sentence_CreatedBy')
ALTER TABLE [pos].[tb_Sentence] ADD  CONSTRAINT [DF_tb_Sentence_CreatedBy]  DEFAULT (HOST_NAME()) FOR [CreatedBy]
GO