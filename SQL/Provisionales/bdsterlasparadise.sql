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


INSERT INTO restaurantes
VALUES
		(1, 'Hawai'),
        (2, 'Cerdeña'),
        (3, 'Marbella'),
        (4, 'London');
        
        

create table if not exists zonas(codrest int,codzona int,
 interior boolean, planta tinyint, mesas int,
 constraint pk_zonas primary key (codzona, codrest),
 constraint fk_zonas_restaurantes foreign key (codrest)
 references restaurantes (codrest) on delete no action on update cascade);

INSERT INTO zonas
-- interio impar, exterior par, se empieza por 1, planta baja 0, si no se espeficia 0
VALUES
		(1, 1, 1, 0, 10), -- Interior Hawai
        (1, 2, 1, 0, 10), -- Exterior Hawai
        (2, 1, 1, 0, 10),
        (2, 2 , 0, 0, 5),
        (3, 1, 1, 0, 5),
        (3, 3, 1, 1, 10),
        (4, 1, 1, 0, 20);


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

INSERT INTO mesas_disponibles
values
(1,1, '2000-01-01', '00:00:00', 10);


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
        

insert into reservas
values
(1, curdate(), curtime(), 1, 'Jetstream Sam', 'Rodriguez', 987654321, 'therewillbebloodshed@desperatto.com', 1, 1),
(2, "2011-05-15", "13:30", 2, 'Minius', 'Monsoon', 987654321, 'memesthednaofthesoul@desperatto.com', 1, 2),
(3, "2001-3-22", "15:00", 4, 'Asuka', 'Lansley', 987654321, 'felizjuevess@getintheevashinji.com', 2, 1),
(4, "2009-09-28", "16:30", 2, 'Senator', 'Armstrong', 987654321, 'nanomachines_son@worldmarshall.net', 2, 2),
(5, "2018-12-06", "14:30", 14, 'Will', 'Smith', 987654321, 'itsrewindtime@thatshot.youtube', 2, 3);


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
                            
	set mesasNecesarias= mesasNecesarias(numeroPersonas);
    
    if mesasDisponibles >= mesasNecesarias then

    return true;
    
    else
    return false;
    end if;
    
end $$


-- Realizar reserva

delimiter $$
drop function if exists realizarReserva $$
create function realizarReserva
(fechaReserva date,horaReserva time,numeroPersonas int,nombreCliente varchar(30),
apellicdoCliente varchar(30),telefono char(9),emailCliente varchar(100),zona int,restaurante int)
returns boolean
deterministic
begin
declare codReservaAux int;
if reservaPosible(restaurante, zona, numeroPersonas, fechaReserva, horaReserva) then
    begin
select ifnull(max(codreserva)+1,1) into codReservaAux
        from reservas;
insert into reservas (codreserva,fecres,horares,numper,nomcli,apecli,tlfcli,emailcli,codzona,codrest)
        values
        (codReservaAux,fechaReserva,horaReserva,numeroPersonas,nombreCliente,apellicdoCliente,telefono,emailCliente,
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

-- Datos mesas_disponibles (2 pts.)
 -- Rutina que rellena los 15 primeros días de la tabla mesas_disponibles



-- Actualizar las mesas disponibles (2 pts.)
-- Evento que todos los días añada un dia a la tabla mesas_disponibles


