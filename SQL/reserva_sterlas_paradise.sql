-- CREATE DATABASE  IF NOT EXISTS `sterlas_paradise` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- USE `sterlas_paradise`;

drop table if exists reservas;

create table reservas (

codreserva int NOT NULL,
fecres date,
horares time,
numper tinyint (2),
nomcli varchar (30),
apecli varchar (30),
tlfcli int(8),
emailcli varchar(69),
codzona int,
codrest int,

constraint pk_reservas primary key (codreserva)/*,

constraint fk_zonas_reservas foreign key (codzona)
        references zonas (codzona) 
        on update cascade,
        
constraint fk_restaurantes_reservas foreign key (codrest)
        references restaurantes (codrest) 
        on update cascade*/
        );
        
insert into reservas
values
(1, curdate(), curtime(), 1, 'Jetstream Sam', 'Rodriguez', 987654321, 'therewillbebloodshed@desperatto.com', 1, 1),
(2, "2011-05-15", "13:30", 2, 'Minius', 'Monsoon', 987654321, 'memesthednaofthesoul@desperatto.com', 1, 2),
(3, "2001-3-22", "15:00", 4, 'Asuka', 'Lansley', 987654321, 'felizjuevess@getintheevashinji.com', 2, 1),
(4, "2009-09-28", "16:30", 2, 'Senator', 'Armstrong', 987654321, 'nanomachines_son@worldmarshall.net', 2, 2),
(5, "2018-12-06", "14:30", 14, 'Will', 'Smith', 987654321, 'itsrewindtime@thatshot.youtube', 2, 3);

select * from reservas;
