
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Description:	SP que recibe un cliente y un servicio a dar de alta.
---- En caso de que el cliente no exista lo debe crear
---- En caso de que el cliente exista, y su estado sea PROSPECTO, debe actualizarse a ACTIVO
---- En caso de que el cliente exista, esté activo y tenga servicios, se le asigna uno nuevo

---- =============================================
CREATE PROCEDURE [dbo].[AGREGAR_SERVICIO_CLIENTE]
--DECLARE
	
	-- CLIENTE
	@CUIT_CUIL AS BIGINT,
	@NOMBRE_COMPLETO AS VARCHAR(255),
	@FECHA_NAC AS DATE, 
	@EMAIL AS VARCHAR(255),
	
	-- SERVICIO
	@CALLE AS VARCHAR(255) = 'N/A',
	@NUMERO_CALLE AS INT = 0,
	@PISO AS INT = 0,
	@DEPTO AS VARCHAR(5) = 'N/A',
	@TELEFONO AS INT,
	@ID_TIPO_SERVICIO AS INT


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- DEFINICIÓN DE VARIABLES INTERNAS
	DECLARE @ID_CLIENTE_EXISTENTE AS INT 
	SET @ID_CLIENTE_EXISTENTE = -1
	
	DECLARE	@FECHA_INICIO AS DATETIME
	SET @FECHA_INICIO = GETDATE()

	DECLARE @ESTADO_SERVICIO AS BIT
	SET @ESTADO_SERVICIO = 1
	
	-- IDENTIFICAR CLIENTE
	IF EXISTS (
				SELECT 	*
				FROM CLIENTE AS CL
				WHERE CL.CUIL_CUIT = @CUIT_CUIL
				AND CL.NOMBRE = @NOMBRE_COMPLETO
				AND CL.fecha_nac = @FECHA_NAC
				AND CL.email = @EMAIL
				AND CL.ID_ESTADO IN (1, 3)
				) 
	BEGIN

		PRINT('EXISTE')

		-- GUARDAR ID DEL EXISTENTE
		SELECT 	@ID_CLIENTE_EXISTENTE = ISNULL(CL.ID_CLIENTE,-1)
		FROM CLIENTE AS CL
		WHERE CL.CUIL_CUIT = @CUIT_CUIL
		AND CL.NOMBRE LIKE '%'+@NOMBRE_COMPLETO+'%'

		PRINT(@ID_CLIENTE_EXISTENTE)

		
		-- EL CLIENTE ES PROSPECTO?
		IF (
				(SELECT id_estado FROM CLIENTE WHERE ID_CLIENTE = @ID_CLIENTE_EXISTENTE) = 3 --PROSPECTO
			)			
			UPDATE CLIENTE
			SET ID_ESTADO = 1
			WHERE id_cliente = @ID_CLIENTE_EXISTENTE
		ELSE 
			PRINT('ELSE - EL CLIENTE ES ACTIVO')
		

	END
	ELSE
	BEGIN

		PRINT('NO EXISTE: CREAR CLIENTE')
		INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL) -- ACTIVO POR DEFECTO
		VALUES (@NOMBRE_COMPLETO, @FECHA_NAC, @CUIT_CUIL, 1, @EMAIL)

		SELECT TOP 1 @ID_CLIENTE_EXISTENTE = ID_CLIENTE
		FROM CLIENTE ORDER BY 1 DESC

	END
	
	

	-- AGREGAR SERVICIO
	
	IF (
			(SELECT id_estado FROM CLIENTE WHERE ID_CLIENTE = @ID_CLIENTE_EXISTENTE) = 1 --ACTIVO
		)
		PRINT('Agrego Servicio')
		INSERT INTO SERVICIO (CALLE, NUMERO_CALLE, PISO, DEPTO, FECHA_INICIO, ESTADO, NUMERO_DOC, CLIENTEID_CLIENTE, ID_TIPOSERVICIO, TELEFONO)
		VALUES (@CALLE, @NUMERO_CALLE, @PISO, @DEPTO, @FECHA_INICIO,@ESTADO_SERVICIO,@CUIT_CUIL , @ID_CLIENTE_EXISTENTE, @ID_TIPO_SERVICIO, @TELEFONO)
			
END
