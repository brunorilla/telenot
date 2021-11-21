/*Creación de Stored Procedure para verificar si un ticket está dentro del SLA o no*/
CREATE PROCEDURE TICKET_OK @TICKET INT
AS
SELECT HistorialEstado.id_ticket, Tipologia.id_Tipologia, Tipologia.SLA, Tipologia.nombre AS PRIORIDAD, HISTORIALESTADO.fecha_inicio, HISTORIALESTADO.fecha_fin, 
dbo.CALCULAR_TIEMPO_RES(HISTORIALESTADO.fecha_fin, HISTORIALESTADO.fecha_inicio) AS CANT_DIAS, 
dbo.BREACH(dbo.CALCULAR_TIEMPO_RES(HISTORIALESTADO.fecha_fin, HISTORIALESTADO.fecha_inicio), Tipologia.SLA) AS 'BREACH (S/N)'
FROM HistorialEstado
INNER JOIN TICKET ON TICKET.id_ticket=HistorialEstado.id_ticket
	JOIN Tipologia ON Tipologia.id_Tipologia=Ticket.TipologiaId_tipologia
WHERE HistorialEstado.id_ticket = @TICKET
AND fecha_fin IS NOT NULL

