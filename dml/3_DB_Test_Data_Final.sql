USE telenot;
/*INSERTS EN CLIENTES*/

INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL)
VALUES ('ROBERTO CARLOS', '12-02-1988', '34110577', '1', 'roberto_carlos@gmail.com')

INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL)
VALUES ('MARIA SILVA', '06-23-1977', '22516566', '2', 'maria_silva@hotmail.com')

INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL)
VALUES ('CLAUDIA SCHWARZ', '10-29-1978','23452771', '1', 'claudita89_@yahoo.com')

INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL)
VALUES ('CARINA GUERRERO', '07-01-1999', '37014587', '1', 'cariguerreroo@gmail.com')

INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL)
VALUES ('MARCOS RODRIGUEZ', '03-12-1991', '36012999', '2', 'marquitos_kpo77@gmail.com')

INSERT INTO CLIENTE (NOMBRE, FECHA_NAC, CUIL_CUIT, ID_ESTADO, EMAIL)
VALUES ('TOBIAS LUTZ', '03-21-1976', '95667443', '1', 'tobias__lutz@gmx.com')

/*INSERT DE TICKETS*/


INSERT INTO TICKET (SLA, DESCRIPCION, FECHA_RESOLUCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('5', 'Error de Windows al iniciar', '08-08-2020', '2', '2', '2', '3')

INSERT INTO TICKET (SLA, DESCRIPCION, FECHA_RESOLUCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('1', 'Ca�da global de telefon�a', '11-14-2021', '6', '1', '4', '1')

INSERT INTO TICKET (SLA, DESCRIPCION, FECHA_RESOLUCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('2', 'Problemas de conexi�n de VoIP', '10-12-2021', '2', '3', '3', '2')

INSERT INTO TICKET (SLA, DESCRIPCION, FECHA_RESOLUCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('7', 'Pedido de Modem', '10-10-2021', '3', '2', '4', '4')

INSERT INTO TICKET (SLA, DESCRIPCION, FECHA_RESOLUCION, ID_CLIENTE, SERVICIONUM_SERVICIO, ESTADOTICKETID_ESTADO_TICKET, TIPOLOGIAID_TIPOLOGIA)
VALUES ('7', 'Arreglo de l�nea fija', '07-10-2021', '5', '1', '4', '4')

/*INSERT DE SERVICIOS*/

INSERT INTO SERVICIO (CALLE, NUMERO_CALLE, PISO, DEPTO, FECHA_INICIO, ESTADO, NUMERO_DOC, CLIENTEID_CLIENTE, ID_TIPOSERVICIO, TELEFONO)
VALUES ('ALSINA', '3511', '4', '15', '01-01-2019', '0', '34110577', '1', '2', '43456700')

INSERT INTO SERVICIO (CALLE, NUMERO_CALLE, PISO, DEPTO, FECHA_INICIO, ESTADO, NUMERO_DOC, CLIENTEID_CLIENTE, ID_TIPOSERVICIO, TELEFONO)
VALUES ('SAN MARTIN', '187', '1', '3', '04-12-2018', '1', '23452771', '4', '1', '1563639474')

INSERT INTO SERVICIO (CALLE, NUMERO_CALLE, PISO, DEPTO, FECHA_INICIO, ESTADO, NUMERO_DOC, CLIENTEID_CLIENTE, ID_TIPOSERVICIO, TELEFONO)
VALUES ('MARCOS SASTRE', '2266', '2', '2', '11-18-2020', '1', '36012999', '5', '2', '42001217')

INSERT INTO SERVICIO (CALLE, NUMERO_CALLE, PISO, DEPTO, FECHA_INICIO, ESTADO, NUMERO_DOC, CLIENTEID_CLIENTE, ID_TIPOSERVICIO, TELEFONO)
VALUES ('UGARTE', '2788', '3', '2', '01-04-2021', '1', '95667443', '6', '3', '1543427782')

