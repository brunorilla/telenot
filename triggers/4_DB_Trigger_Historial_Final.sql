/*TRIGGER REGISTRO_HISTORIAL*/

CREATE TRIGGER REGISTRO_HISTORIAL ON TICKET
FOR INSERT, UPDATE
AS 
	DECLARE @EstadoTicketId_estado_ticket INT,
		@id_ticket INT,
		@fecha_resolucion DATE;

	SELECT @EstadoTicketId_estado_ticket = ins.EstadoTicketId_estado_ticket FROM INSERTED INS;  	
	SELECT @id_ticket = INS.id_ticket FROM INSERTED INS;
	SELECT @fecha_resolucion = INS.fecha_resolucion FROM INSERTED INS;
	
	INSERT INTO HISTORIALESTADO (ID_ESTADO_TICKET, ID_TICKET, 	FECHA_INICIO, FECHA_FIN)
	VALUES (@EstadoTicketId_estado_ticket, @id_ticket, GETDATE(), @fecha_resolucion)

	PRINT 'Se ha creado un registro en la tabla de historiales para tickets'

/*TESTEO DE TRIGGER*/

/*Paso_1*/

INSERT INTO TICKET (SLA, DESCRIPCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('3', 'Línea telefónica ocupada', '5', '1', '1', '3')

/*Paso_2*/

UPDATE TICKET
   SET FECHA_RESOLUCION = '2021-11-20', ESTADOTICKETID_ESTADO_TICKET = '4'
WHERE id_ticket = 6

/*Paso_3*/

SELECT * FROM HistorialEstado

SELECT * FROM TICKET






