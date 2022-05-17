/*ESQUEMA RELACIONAL:
+ Indica ser PK
* Indica ser FK

restaurantes(+codrest, nomrest)
zonas(+[codrest*,codzona], interior, planta, mesas)
resrevas(+codreserva, [codrest, codzona]*, fecha, hora, numper, nomcli, apecli, telefono, email)
*/

-- drop database bdsterlasparadise;

create database if not exists bdsterlasparadise;
use bdsterlasparadise;

create table if not exists restaurantes
(
	codrest int not null,
    nomrest varchar(50),
    
    constraint pk_restaurantes primary key (codrest)
);    

create table if not exists zonas(codrest int,codzona int,
 interior boolean, planta tinyint, mesas int,
 constraint pk_zonas primary key (codzona, codrest),
 constraint fk_zonas_restaurantes foreign key (codrest)
 references restaurantes (codrest) on delete no action on update cascade);

create table if not exists mesas_disponibles
(
	codrest int,
    codzona int,
    fecha date,
    hora time,
    numMesas int,
    
    constraint pk_mesas_disponibles primary key (codrest, codzona, fecha, hora),
    constraint fk_mesas_disponibles_restaurantes foreign key (codrest)
	references restaurantes (codrest)
    on delete no action on update cascade,
    constraint fk_mesas_disponibles_zonas foreign key (codzona)
	references zonas (codzona)
    on delete no action on update cascade
);

drop table if exists reservas;

create table reservas (

codreserva int NOT NULL,
fecres date,
horares time,
numper tinyint,
nomcli varchar (30),
apecli varchar (30),
tlfcli char(9),
emailcli varchar(100),
codzona int,
codrest int,

constraint pk_reservas primary key (codreserva),

constraint fk_zonas_reservas foreign key (codzona)
        references zonas (codzona) 
        on delete no action on update cascade,
        
constraint fk_restaurantes_reservas foreign key (codrest)
        references restaurantes (codrest) 
        on delete no action on update cascade
        );
        




-- RUTINAS

-- Dado un número de personas, devuelve las mesas que serán necesarias
DROP FUNCTION IF EXISTS mesasNecesarias;
delimiter $$
CREATE FUNCTION mesasNecesarias(
	numeroPersonas int)
    
    RETURNS int
    
LANGUAGE SQL
DETERMINISTIC
READS SQL DATA

BEGIN
	IF numeroPersonas < 4 or numeroPersonas = 4 THEN
		RETURN 1;
        
    ELSE
		RETURN (numeroPersonas-4)/2 + 1;
        
	END IF;
END$$
delimiter ;


-- Reserva posible
-- Comprueba que la reserva es posible dada la cita y el numero de personas
-- Entendemos por cita el restaurante, zona, fecha y hora.
delimiter $$
drop function if exists reservaPosible $$
create function reservaPosible
(restaurante int, zona int, numeroPersonas int, fechaReserva date, horaReserva time)
returns boolean
deterministic
begin
	declare mesasDisponibles int;
    declare mesasNecesarias int;
    
    set mesasDisponibles = ifnull((select numMesas
							from mesas_disponibles
							where codrest = restaurante and
								codzona = zona and
								fecha = fechaReserva and
								hora = horaReserva), 0);
                            
	set mesasNecesarias = mesasNecesarias(numeroPersonas);
    
    if mesasDisponibles >= mesasNecesarias then

    return true;
    
    else
    return false;
    end if;
    
end $$


-- Realizar reserva
-- Si la reserva es posible, realiza la reserva
delimiter $$
drop function if exists realizarReserva $$
create function realizarReserva
(fechaReserva date,horaReserva time,numeroPersonas int,nombreCliente varchar(30),
apellicdoCliente varchar(30),telefono char(9),emailCliente varchar(100),zona int,restaurante int)
returns boolean
deterministic
begin
	if reservaPosible(restaurante, zona, numeroPersonas, fechaReserva, horaReserva) then
    begin
		declare codReserva int;
		select ifnull(max(codreserva)+1,1) into codReserva
        from reservas;
    
		insert into reservas (codreserva,fecres,horares,numper,nomcli,apecli,tlfcli,emailcli,codzona,codrest)
        values
        (codReserva,fechaReserva,horaReserva,numeroPersonas,nombreCliente,apellicdoCliente,telefono,emailCliente,
        zona,restaurante);
        
        update mesas_disponibles
        set numMesas=numMesas-mesasNecesarias(numeroPersonas)
        where codrest = restaurante and
				codzona = zona and
				fecha = fechaReserva and
				hora = horaReserva;
        return true;
    end;
    else 
    return false;
    end if;
end $$


-- Datos mesas_disponibles
 -- Rutina que rellena los 'numeroDias' primeros días de la tabla mesas_disponibles

DROP PROCEDURE IF EXISTS cargarDatosMesasDisponibles;
delimiter $$
CREATE PROCEDURE cargarDatosMesasDisponibles(in numeroDias int,
												in fechaDesde DATE)

BEGIN
	DECLARE contadorDias int default 0;
	DECLARE contadorTurnos int default 0;
	

    WHILE contadorDias < numeroDias DO 
		BEGIN
				-- Hawai
                SET contadorTurnos = 0;
                -- Turnos comida zona 1                
                WHILE contadorTurnos < 6 DO
					BEGIN
						INSERT INTO mesas_disponibles -- De 13 a 15:30 y 20 a 22:30:
						VALUES
							(1,1, date_add(fechaDesde,interval contadorDias DAY), 
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
							(1,2, date_add(fechaDesde,interval contadorDias DAY), 
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
							(2,1, date_add(fechaDesde,interval contadorDias DAY), 
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
							(2,2, date_add(fechaDesde,interval contadorDias DAY), 
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
							(2,1, date_add(fechaDesde,interval contadorDias DAY), 
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
							(2,2, date_add(fechaDesde,interval contadorDias DAY), 
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
							(3,1, date_add(fechaDesde,interval contadorDias DAY), 
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
							(3,3, date_add(fechaDesde,interval contadorDias DAY), 
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
							(3,1, date_add(fechaDesde,interval contadorDias DAY), 
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
							(3,3, date_add(fechaDesde,interval contadorDias DAY), 
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
							(4,1, date_add(fechaDesde,interval contadorDias DAY), 
                            (time '20:00:00' + interval contadorTurnos*30 minute) , 20);
						SET contadorTurnos = contadorTurnos + 1;
                    END;
				END WHILE;
                
                
                SET contadorDias = contadorDias + 1;
                
        END;
    END WHILE;
END$$
delimiter ;


-- Actualizar las mesas disponibles
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

-- Evento que todos los días añade un dia a la tabla mesas_disponibles

delimiter $$
CREATE EVENT sumaDia
ON SCHEDULE 
	EVERY 1 DAY
DO
	BEGIN
		 CALL procSumaDia();
    END $$
delimiter ;

-- Evento que todos los dias borra las fechas antiguas

delimiter $$
create event borraAyer
on schedule
	every 1 day
do
	begin
		delete 
        from mesas_disponibles
        where fecha<curdate();
	end $$

delimiter ;


