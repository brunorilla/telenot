/* Retorna 1 si es válido // 0 si es inválido */
create function validarEmail
(
	@email varchar(255)
)
RETURNS bit 
AS
BEGIN
	DECLARE @esValido bit = 1
	IF (@email IS NOT NULL)
		IF (@email NOT LIKE  '%_@__%.__%')
			SET @esValido=0
	RETURN @esValido

END

/*
PRUEBA: 

SELECT [dbo].[validarEmail] ('asasgmail.com')

Va a retornar 0
*/

/*
SELECT [dbo].[validarEmail] ('telenot@gmail.com')

VA A RETORNAR 1 

*/
