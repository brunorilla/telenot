USE telenot;

/* CASO 1: 
Una persona llama al call center y quiere averig�ar por los servicios. No contrata ning�n servicio. Igualmente se lo a�ade a la bbdd como prospecto */

EXEC	[dbo].[spNuevoCliente]
		@cuil_cuit = 20252141278,
		@nombre = 'Carlos Berardi',
		@fecha_nac = '19891002',
		@email = N'juanmanuel@prueba.com'

/* Retorno: (1 row affected)
Cliente como prospecto a�adido correctamente */

/* El operador se confunde y ejecuta nuevamente el store con el nuevo n�mero de cliente */ 

EXEC	[dbo].[spNuevoCliente]
		@cuil_cuit = 20252141278,
		@nombre = 'Carlos Berardi',
		@fecha_nac = '19891002',
		@email = N'juanmanuel@prueba.com'

/* Retorno: El cliente ya existe */

/* CASO 2: El cliente llama al d�a siguiente y quiere agregar un servicio de Internet (tipo servicio 2) */
EXEC	[dbo].[AGREGAR_SERVICIO_CLIENTE]
		
		@CUIT_CUIL = 20252141278,
		@NOMBRE_COMPLETO = 'Carlos Berardi',
		@FECHA_NAC = '19891002',
		@CALLE = 'Cuba',
		@NUMERO_CALLE = 2544,
		@PISO = 1,
		@DEPTO = 'a',
		@TELEFONO = 47895213,
		@email = 'juanmanuel@prueba.com',
		@ID_TIPO_SERVICIO = 2

/* Revisamos los servicios */
SELECT * FROM SERVICIO;

/* CASO 3: Despu�s de un mes, el mismo cliente disconforme llama y quiere dar de baja el servicio de internet. Hacemos una baja l�gica. */ 
EXEC	[dbo].[BAJA_SERVICIO]
		@ID_SERVICIO = 5

/* CASO 4: quiero ver los tickets que se encuentran en estado pendiente. Para eso uso la view TICKETS_PENDIENTES */
SELECT * FROM TICKETS_PENDIENTES;

/* CASO 5: Quiero ver la tipolog�a de los tickets y cuando se resolvi� el �ltimo por cada tipo de tipolog�a. Para eso uso la view TICKETS_CONTROL */ 
SELECT * FROM TICKETS_CONTROL;

/* CASO 6: Quiero ver los clientes en estado prospecto. Para ello uso la view prospectos_view: */
-- A�ado un nuevo prospecto:
EXEC	[dbo].[spNuevoCliente]
		@cuil_cuit = 22251141278,
		@nombre = 'Prueba Prospecto',
		@fecha_nac = '19791002',
		@email = 'pruebaprospecto@prueba.com'
/* UTILIZO LA VISTA PROSPECTOS_VIEW */
SELECT * FROM Prospectos_view;

/* CASO 7: MANEJO DE TICKETS */
/*TESTEO DE TRIGGER*/
/* El trigger se ejecutar� cuando se a�ada un ticket. Verificar� que el ticket posea los valores correspondientes seg�n el proceso esperado */
/*Paso_1*/

INSERT INTO TICKET (SLA, DESCRIPCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('2', 'Baja senal internet', '5', '1', '1', '3')

/*Paso_2*/
/* El ticket se resuelve mucho tiempo despu�s */
UPDATE TICKET
   SET FECHA_RESOLUCION = '2023-11-20', ESTADOTICKETID_ESTADO_TICKET = '4'
WHERE id_ticket = 1

/* CASO 8: Quiero ver si el ticket est� dentro de su SLA o no. Para eso uso el sp_TICKET_OK: */
DECLARE	@return_value int

EXEC	@return_value = [dbo].[TICKET_OK]
		@TICKET = 1

SELECT	'Return Value' = @return_value

GO


/*Paso_3*/
/* Vemos el historial de estado de los tickets y sus tickets */
SELECT * FROM HistorialEstado

SELECT * FROM TICKET

GO




