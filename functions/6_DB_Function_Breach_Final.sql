/*FUNCIÓN PARA REVISAR SI EL TICKET SUPERÓ O NO SU SLA*/
CREATE FUNCTION BREACH (@DIAS INT, @SLA INT)
RETURNS VARCHAR(10)
AS
BEGIN
	IF (@DIAS > @SLA) 
	BEGIN RETURN 'S';
	END
	RETURN 'N';
END;