IF OBJECT_ID('pos.pr_GetNouns','P') IS NOT NULL
DROP PROCEDURE pos.pr_GetNouns
GO

CREATE PROCEDURE pos.pr_GetNouns

AS
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRY
	
	SELECT 
		w.Word
	FROM pos.tb_WordType wt
		INNER JOIN pos.tb_Word w
	ON wt.WordTypeId = w.WordTypeId
	WHERE wt.WordTypeId = 1 AND wt.IsActive = 1
		
END TRY
BEGIN CATCH

 DECLARE @ErrorMessage varchar(MAX) = ERROR_MESSAGE(),
		 @ErrorSeverity int = ERROR_SEVERITY(),
		 @ErrorState smallint = ERROR_STATE()
 
 RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState);
            
END CATCH
GO