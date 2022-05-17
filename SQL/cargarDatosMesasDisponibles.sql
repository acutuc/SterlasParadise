use bdsterlasparadise;
DROP PROCEDURE IF EXISTS cargarDatosMesasDisponibles;
delimiter $$
CREATE PROCEDURE cargarDatosMesasDisponibles()

BEGIN
	DECLARE contadorDias int default 0;
	DECLARE contadorTurnos int default 0;
	DELETE FROM mesas_disponibles; -- Borra los datos existentes

    WHILE contadorDias < 5 DO -- 60 días
		BEGIN
				-- Hawai
                SET contadorTurnos = 0;
                -- Turnos comida zona 1                
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(1,1, date_add(curdate(),interval contadorDias DAY), 
                            (time '13:00:00' + interval contadorTurnos*30 minute) , 10);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                SET contadorTurnos = 0;
                -- Turnos comida zona 2
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(1,2, date_add(curdate(),interval contadorDias DAY), 
                            (time '13:00:00' + interval contadorTurnos*30 minute) , 10);
						SET contadorTurnos = contadorTurnos + 1;
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
                            (time '13:00:00' + interval contadorTurnos*30 minute) , 10);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                
                -- Turnos comida zona 2
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30
						VALUES
							(2,2, date_add(curdate(),interval contadorDias DAY), 
							(time '13:00:00' + interval contadorTurnos*30 minute) , 5);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                -- Turnos cena zona 1
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 20 a 22:30:
						VALUES
							(2,1, date_add(curdate(),interval contadorDias DAY), 
                            (time '20:00:00' + interval contadorTurnos*30 minute) , 10);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                
                -- Turnos cena zona 2
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 20 a 22:30:
						VALUES
							(2,2, date_add(curdate(),interval contadorDias DAY), 
                            (time '20:00:00' + interval contadorTurnos*30 minute) , 5);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                 -- Marbella
                -- Turnos comida zona 1
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(3,1, date_add(curdate(),interval contadorDias DAY), 
                            (time '13:00:00' + interval contadorTurnos*30 minute) , 5);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                
                -- Turnos comida zona 3
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(3,3, date_add(curdate(),interval contadorDias DAY), 
                            (time '13:00:00' + interval contadorTurnos*30 minute) , 10);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                -- Turnos cena zona 1
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 20 a 22:30:
						VALUES
							(3,1, date_add(curdate(),interval contadorDias DAY), 
                            (time '20:00:00' + interval contadorTurnos*30 minute) , 5);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                
                -- Turnos cena zona 3
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 20 a 22:30:
						VALUES
							(3,3, date_add(curdate(),interval contadorDias DAY), 
                            (time '20:00:00' + interval contadorTurnos*30 minute) , 10);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                -- London
                -- Turnos cena zona 1
                SET contadorTurnos = 0;
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(4,1, date_add(curdate(),interval contadorDias DAY), 
                            (time '20:00:00' + interval contadorTurnos*30 minute) , 20);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                
                SET contadorDias = contadorDias + 1;
                
        END;
    END WHILE;
END$$
delimiter ;

-- call cargarDatosMesasDisponibles();