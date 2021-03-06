/*FUNCIÓN PARA CALCULAR EL TIEMPO DE RESOLUCIÓN EN DÍAS*/

CREATE FUNCTION CALCULAR_TIEMPO_RES (@FECHA_FIN DATE, @FECHA_INICIO DATE) 
    RETURNS INTEGER
    BEGIN 
        RETURN DATEDIFF(DAY, @FECHA_INICIO, @FECHA_FIN);
    END;