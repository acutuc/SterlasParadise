-- CREATE DATABASE  IF NOT EXISTS `sterlas_paradise` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- USE `sterlas_paradise`;

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
