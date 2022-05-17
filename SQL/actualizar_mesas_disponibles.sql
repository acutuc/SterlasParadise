-- Evento que todos los días añada un dia a la tabla mesas_disponibles

-- Procedimiento que nos servirá para pasárselo al evento.
delimiter $$
CREATE PROCEDURE procSumaDia()
BEGIN
	DECLARE ultimaFecha DATE;
    SELECT IFNULL(MAX(fecha)+1, CURDATE()) INTO ultimaFecha
    FROM mesas_disponibles;
    call cargarDatosMesasDisponibles (1, ultimaFecha);
END $$
delimiter ;
	

delimiter $$
CREATE EVENT sumaDia
ON SCHEDULE 
	EVERY 1 DAY
DO
	BEGIN
		 CALL procSumaDia();
    END $$
delimiter ;