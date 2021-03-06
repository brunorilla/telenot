SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Description:	sp que da de baja un servicio si este existe caso contrario indica que no existe

-- Test Case: 
/*	

	EXEC	BAJA_SERVICIO 9

*/
---- =============================================
CREATE PROCEDURE BAJA_SERVICIO
--DECLARE
	
	-- SERVICIO	
	@ID_SERVICIO AS INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	

	-- IDENTIFICAR CLIENTE
	IF EXISTS (
				SELECT 	*
				FROM SERVICIO
				WHERE num_servicio = @ID_SERVICIO
				) 
	BEGIN

		 UPDATE SERVICIO
		 SET ESTADO = 0
		 WHERE num_servicio = @ID_SERVICIO

	END
	ELSE
	BEGIN

		PRINT('NO EXISTE EL SERVICIO')

	END
	
	

END
