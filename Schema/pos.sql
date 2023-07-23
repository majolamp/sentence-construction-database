/*Create Schema pos(Parts Of Sentence*/
IF NOT EXISTS (
		SELECT *
		FROM sys.schemas
		WHERE NAME = N'pos'
		)
	EXEC ('CREATE SCHEMA [pos] AUTHORIZATION [dbo]');
GO