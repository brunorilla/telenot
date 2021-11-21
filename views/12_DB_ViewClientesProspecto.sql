CREATE VIEW prospectos_view  
AS   
SELECT C.id_cliente, C.nombre, C.fecha_nac, C.email, C.cuil_cuit, E.nombre  as 'Estado'
FROM dbo.Cliente  AS C   
INNER JOIN dbo.EstadoCli AS E ON E.id_estado = C.id_estado
WHERE E.id_estado = 3
GO  