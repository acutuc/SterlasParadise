DROP PROCEDURE IF EXISTS cargarDatosMesasDisponibles;
delimiter $$
CREATE PROCEDURE cargarDatosMesasDisponibles()

BEGIN
	DECLARE contadorDias int default 0;
	DECLARE contadorTurnos int default 0;
	DELETE FROM mesas_disponibles; -- Borra los datos existentes

    WHILE contadorDias < 60 DO -- 60
		BEGIN
				-- Hawai
                -- Turnos comida zona 1
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(1,1, date_add(curdate(),interval contadorDias DAY), 
                            date_add('13:00:00', interval contadorTurnos*30 MINUTE) , 10);
                    END;
				END WHILE;
                
                SET contadorTurnos = 0;
                -- Turnos comida zona 2
                WHILE contadorTurno < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(1,2, date_add(curdate(),interval contadorDias DAY), 
                            date_add('13:00:00', interval contadorTurnos*30 MINUTE) , 10);
                    END;
				END WHILE;
                
                -- Cerdeña
                -- Turnos comida zona 1
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(2,1, date_add(curdate(),interval contadorDias DAY), 
                            date_add('13:00:00', interval contadorTurnos*30 MINUTE) , 10);
                    END;
				END WHILE;
                
                
                -- Turnos comida zona 2
                SET contadorTurnos = 0;
                WHILE contadorTurno < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(2,2, date_add(curdate(),interval contadorDias DAY), 
                            date_add('13:00:00', interval contadorTurnos*30 MINUTE) , 5);
                    END;
				END WHILE;

        END;
    END WHILE;
END$$
delimiter ;

call cargarDatosMesasDisponibles();