/*TESTEO DE FUNCIÓN - IMPORTANTE: SE DEBE CORRER UNA VEZ SE HAYAN HECHO LOS PASOS DEL TRIGGER*/

SELECT ID_TICKET, dbo.CALCULAR_TIEMPO_RES(fecha_fin, fecha_inicio) AS CANT_DIAS
FROM HISTORIALESTADO
WHERE ID_TICKET = 6
AND fecha_fin IS NOT NULL

/*Testeo de funci�n Breach*/

SELECT HistorialEstado.id_ticket, Tipologia.id_Tipologia, Tipologia.SLA, Tipologia.nombre AS PRIORIDAD, HISTORIALESTADO.fecha_inicio, HISTORIALESTADO.fecha_fin, 
dbo.CALCULAR_TIEMPO_RES(HISTORIALESTADO.fecha_fin, HISTORIALESTADO.fecha_inicio) AS CANT_DIAS, 
dbo.BREACH(dbo.CALCULAR_TIEMPO_RES(HISTORIALESTADO.fecha_fin, HISTORIALESTADO.fecha_inicio), Tipologia.SLA) AS 'BREACH (S/N)'
FROM HistorialEstado
INNER JOIN TICKET ON TICKET.id_ticket=HistorialEstado.id_ticket
	JOIN Tipologia ON Tipologia.id_Tipologia=Ticket.TipologiaId_tipologia
WHERE HistorialEstado.id_ticket = 6
AND fecha_fin IS NOT NULL

/*Testeo de StoreProcedure: TICKET_OK*/

EXEC TICKET_OK @TICKET=6