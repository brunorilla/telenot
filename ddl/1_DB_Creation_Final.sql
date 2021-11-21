
GO
CREATE DATABASE telenot

GO
CREATE TABLE telenot.[dbo].[ActividadTicket](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[ticketId_ticket] [int] NOT NULL,
 CONSTRAINT [PK_ActividadTicket] PRIMARY KEY 
(
	[id_actividad] ASC
))

CREATE TABLE telenot.[dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[cuil_cuit] [bigint] NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[fecha_nac] [date],
	[id_estado] [int] NOT NULL,
	[email] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY 
(
	[id_cliente] ASC
))

CREATE TABLE telenot.[dbo].[EstadoCli](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EstadoCli] PRIMARY KEY 
(
	[id_estado] ASC
))

CREATE TABLE telenot.[dbo].[EstadoTicket](
	[id_estado_ticket] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EstadoTicket] PRIMARY KEY 
(
	[id_estado_ticket] ASC
))

CREATE TABLE telenot.[dbo].[HistorialEstado](
	[id_historial_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_estado_ticket] [int] NOT NULL,
	[id_ticket] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
 CONSTRAINT [PK_HistorialEstado] PRIMARY KEY 
(
	[id_historial_estado] ASC
))

CREATE TABLE telenot.[dbo].[MensajeTicket](
	[id_MensajeTicket] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[id_ticket] [int] NOT NULL,
 CONSTRAINT [PK_MensajeTicket] PRIMARY KEY 
(
	[id_MensajeTicket] ASC
))

CREATE TABLE telenot.[dbo].[Servicio](
	[num_servicio] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[numero_calle] [int] NOT NULL,
	[piso] [int] NULL,
	[depto] [varchar](50) NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[numero_doc] [bigint] NOT NULL,
	[ClienteId_cliente] [int] NOT NULL,
	[id_tipoServicio] [int] NOT NULL,
	[telefono] [int] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY 
(
	[num_servicio] ASC
))

CREATE TABLE telenot.[dbo].[Ticket](
	[id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[SLA] [int] NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[fecha_resolucion] [date] NULL,
	[id_cliente] [int] NOT NULL,
	[ServicioNum_servicio] [int] NOT NULL,
	[EstadoTicketId_estado_ticket] [int] NOT NULL,
	[TipologiaId_tipologia] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY 
(
	[id_ticket] ASC
))

CREATE TABLE telenot.[dbo].[Tipologia](
	[id_Tipologia] [int] IDENTITY(1,1) NOT NULL,
	[SLA] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
 CONSTRAINT [PK_Tipologia] PRIMARY KEY 
(
	[id_Tipologia] ASC
))

CREATE TABLE telenot.[dbo].[Tipologia_TipoServicio](
	[TipologiaId_tipologia] [int] NOT NULL,
	[TipoServicioId_tipoServicio] [int] NOT NULL
) ON [PRIMARY]


CREATE TABLE telenot.[dbo].[TipoServicio](
	[id_tipoServicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY 
(
	[id_tipoServicio] ASC
))
ALTER TABLE telenot.[dbo].[ActividadTicket]  WITH CHECK ADD  CONSTRAINT [FK_ActividadTicket_Ticket] FOREIGN KEY([ticketId_ticket])
REFERENCES telenot.[dbo].[Ticket] ([id_ticket])

ALTER TABLE telenot.[dbo].[ActividadTicket] CHECK CONSTRAINT [FK_ActividadTicket_Ticket]

ALTER TABLE telenot.[dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_EstadoCli] FOREIGN KEY([id_estado])
REFERENCES telenot.[dbo].[EstadoCli] ([id_estado])

ALTER TABLE telenot.[dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_EstadoCli]

ALTER TABLE telenot.[dbo].[HistorialEstado]  WITH CHECK ADD  CONSTRAINT [FK_HistorialEstado_EstadoTicket] FOREIGN KEY([id_estado_ticket])
REFERENCES telenot.[dbo].[EstadoTicket] ([id_estado_ticket])

ALTER TABLE telenot.[dbo].[HistorialEstado] CHECK CONSTRAINT [FK_HistorialEstado_EstadoTicket]

ALTER TABLE telenot.[dbo].[HistorialEstado]  WITH CHECK ADD  CONSTRAINT [FK_HistorialEstado_Ticket] FOREIGN KEY([id_ticket])
REFERENCES telenot.[dbo].[Ticket] ([id_ticket])

ALTER TABLE telenot.[dbo].[HistorialEstado] CHECK CONSTRAINT [FK_HistorialEstado_Ticket]

ALTER TABLE telenot.[dbo].[MensajeTicket]  WITH CHECK ADD  CONSTRAINT [FK_MensajeTicket_Ticket] FOREIGN KEY([id_ticket])
REFERENCES telenot.[dbo].[Ticket] ([id_ticket])

ALTER TABLE telenot.[dbo].[MensajeTicket] CHECK CONSTRAINT [FK_MensajeTicket_Ticket]

ALTER TABLE telenot.[dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Cliente] FOREIGN KEY([ClienteId_cliente])
REFERENCES telenot.[dbo].[Cliente] ([id_cliente])

ALTER TABLE telenot.[dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Cliente]

ALTER TABLE telenot.[dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_TipoServicio] FOREIGN KEY([id_tipoServicio])
REFERENCES telenot.[dbo].[TipoServicio] ([id_tipoServicio])

ALTER TABLE telenot.[dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_TipoServicio]

ALTER TABLE telenot.[dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Cliente] FOREIGN KEY([id_cliente])
REFERENCES telenot.[dbo].[Cliente] ([id_cliente])

ALTER TABLE telenot.[dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Cliente]

ALTER TABLE telenot.[dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_EstadoTicket] FOREIGN KEY([EstadoTicketId_estado_ticket])
REFERENCES telenot.[dbo].[EstadoTicket] ([id_estado_ticket])

ALTER TABLE telenot.[dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_EstadoTicket]

ALTER TABLE telenot.[dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Tipologia] FOREIGN KEY([TipologiaId_tipologia])
REFERENCES telenot.[dbo].[Tipologia] ([id_Tipologia])

ALTER TABLE telenot.[dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Tipologia]

ALTER TABLE telenot.[dbo].[Tipologia_TipoServicio]  WITH CHECK ADD  CONSTRAINT [FK_Tipologia_TipoServicio_Tipologia] FOREIGN KEY([TipologiaId_tipologia])
REFERENCES telenot.[dbo].[Tipologia] ([id_Tipologia])

ALTER TABLE telenot.[dbo].[Tipologia_TipoServicio] CHECK CONSTRAINT [FK_Tipologia_TipoServicio_Tipologia]

ALTER TABLE telenot.[dbo].[Tipologia_TipoServicio]  WITH CHECK ADD  CONSTRAINT [FK_Tipologia_TipoServicio_TipoServicio] FOREIGN KEY([TipoServicioId_tipoServicio])
REFERENCES telenot.[dbo].[TipoServicio] ([id_tipoServicio])

ALTER TABLE telenot.[dbo].[Tipologia_TipoServicio] CHECK CONSTRAINT [FK_Tipologia_TipoServicio_TipoServicio]