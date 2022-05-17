

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