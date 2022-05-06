/*ESQUEMA RELACIONAL:
+ Indica ser PK
* Indica ser FK

restaurantes(+codrest, nomrest)
zonas(+[codrest*,codzona], interior, planta, mesas)
resrevas(+codreserva, [codrest, codzona]*, fecha, hora, numper, nomcli, apecli, telefono, email)
*/

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

drop table if exists `reservas`;

create table `reservas` (

`codreserva` int NOT NULL,
`fecres` date,
`horares` time,
`numper` tinyint (2),
`nomcli` varchar (30),
`apecli` varchar (30),
`tlfcli` int(8),
`emailcli` varchar(12),
`codzona` int,
`codrest` int,

constraint `pk_reservas` primary key (`codreserva`),

constraint `fk_zonas_reservas` foreign key (`codzona`)
        references `zonas` (`codzona`) 
        on update cascade,
        
constraint `fk_restaurantes_reservas` foreign key (`codrest`)
        references `restaurantes` (`codrest`) 
        on update cascade
        );
        
        
INSERT INTO restaurantes
VALUES
		(1, 'Hawai'),
        (2, 'Cerdeña'),
        (3, 'Marbella'),
        (4, 'London');

