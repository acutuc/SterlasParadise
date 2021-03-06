/*ESQUEMA RELACIONAL:
+ Indica ser PK
* Indica ser FK

restaurantes(+codrest, nomrest)
zonas(+[codrest*,codzona], interior, planta, mesas)
resrevas(+codreserva, [codrest, codzona]*, fecha, hora, numper, nomcli, apecli, telefono, email)
*/

-- drop database bdsterlasparadise;

drop database if exists bdsterlasparadise;
create database bdsterlasparadise;
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
(1,1, '2000-01-01', '00:00:00', 10),
(1,1, '2012-01-01', '00:00:00', 10),
(1,1, '2022-05-09', '14:50:00', 10),
(1,1, '2022-05-11', '00:00:00', 10),
(1,1, '2022-05-10', '14:30:00', 10);



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
(codRestaurante int, zona int, numeroPersonas int, fechas date, horas time)
returns boolean
deterministic
begin
	declare mesasDisponibles int;
    declare mesasNecesarias int;
    
    set mesasDisponibles = ifnull((select numMesas
							from mesas_disponibles
							where codRestaurante=codrest and
								codzona=zona and
								fecha=fechas and
								hora=horas), 0);
                            
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
(codReserva int,fechaReserva date,horaReserva time,numeroPersonas int,nombreCliente varchar(30),
apellicdoCliente varchar(30),telefono char(9),emailCliente varchar(100),codZona int,codRestaurante int)
returns boolean
deterministic
begin
	if reservaPosible() then
    begin
		insert into reservas (codreserva,fecres,horares,numper,nomcli,apecli,tlfcli,emailcli,codzona,codrest)
        values
        (codReserva,fechaReserva,horaReserva,numeroPersonas,nombreCliente,apellicdoCliente,telefono,emailCliente,
        codZona,codRestaurante);
        update mesas_disponibles
        set numMesas=numMesas-mesasNecesarias(numeroPersonas)
        where codRestaurante=codrest and
								codzona=zona and
								fecha=fechas and
								hora=horas;
        return true;
    end;
    else 
    return false;
    end if;
end $$

select * from mesas_disponibles;

drop procedure if exists borrarAyer;

delimiter $$

create procedure borrarAyer()
begin
delete 
	from mesas_disponibles
	where fecha < curdate();
end $$

delimiter ;

call borrarAyer();

select * from mesas_disponibles;

drop procedure if exists procSumaDia;

delimiter $$
CREATE PROCEDURE procSumaDia()
BEGIN
	UPDATE mesas_disponibles
    SET fecha = date_add(curdate(), interval 1 day);
END $$
delimiter ;

call procSumaDia();

select * from mesas_disponibles;