CREATE PROCEDURE spNuevoCliente 
@cuil_cuit bigint,
@nombre varchar(255),
@fecha_nac date = null,
@email varchar(255)
AS

BEGIN
	BEGIN TRY
	/* validación existencia de cliente */
	DECLARE @id_cliente int;
	SELECT @id_cliente = COUNT(id_cliente) from dbo.Cliente
		WHERE cuil_cuit = @cuil_cuit;
		IF @id_cliente = 0
			/* Si el cliente no existe se valida el email */
			BEGIN TRY
				DECLARE @esValido bit		
				SELECT @esValido = dbo.validarEmail(@email);
				IF (@esValido = 1)
					/* Si el email es v�lido, se comienza la transacci�n */
					BEGIN TRY 
						BEGIN TRANSACTION
							INSERT INTO [dbo].[Cliente]
											([nombre]
										   ,[fecha_nac]
										   ,[id_estado]
										   ,[email]
										   ,[cuil_cuit])
							VALUES
								(@nombre
										   ,@fecha_nac
										   ,3
										   ,@email
										   ,@cuil_cuit)
					COMMIT TRANSACTION
					print 'Cliente como prospecto añadido correctamente'
					END TRY

					BEGIN CATCH
						print 'Error en la transacción de inserción de cliente. Rollbacking...'
						ROLLBACK TRANSACTION
						Select
							ERROR_NUMBER() as ErrorNumber,
							ERROR_MESSAGE() as ErrorMessage,
							ERROR_PROCEDURE() as ErrorProcedure,
							ERROR_STATE() as ErrorState,
							ERROR_SEVERITY() as ErrorSeverity,
							ERROR_LINE() as ErrorLine
					END CATCH
				ELSE 
					RAISERROR ('El email es inválido',2,2);
			END TRY 
			BEGIN CATCH
				DECLARE @ErrorMessage VARCHAR(300);  
				SELECT @ErrorMessage = ERROR_MESSAGE();
			END CATCH
		ELSE
			RAISERROR ('El cliente ya existe',1,1);			
	END TRY
	BEGIN CATCH 
		DECLARE @cliErrMsg VARCHAR(300);  
		SELECT @cliErrMsg = ERROR_MESSAGE();
	END CATCH
	
END