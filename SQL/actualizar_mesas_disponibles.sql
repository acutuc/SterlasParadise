-- Evento que todos los días añada un dia a la tabla mesas_disponibles

-- Procedimiento que nos servirá para pasárselo al evento.
delimiter $$
CREATE PROCEDURE procSumaDia()
BEGIN
	UPDATE mesas_disponibles
    SET fecha = date_add(curdate(), interval 1 day);
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