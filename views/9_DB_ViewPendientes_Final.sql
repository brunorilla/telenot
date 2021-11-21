/*Creación de vista para tickets pendientes*/

CREATE VIEW TICKETS_PENDIENTES AS
SELECT TICKET.id_ticket, TICKET.id_cliente, EstadoTicket.descripcion,
Cliente.nombre, Cliente.email
FROM Ticket
INNER JOIN EstadoTicket ON EstadoTicket.id_estado_ticket=Ticket.EstadoTicketId_estado_ticket
	INNER JOIN Cliente ON Cliente.id_cliente=Ticket.id_cliente 
WHERE EstadoTicketId_estado_ticket=2