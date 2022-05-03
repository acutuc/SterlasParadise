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
 
 drop table if exists 'reservas';

create table 'reservas' (

`codres` int NOT NULL,
`fecres` date,
`horares` time,
`numper` tinyint (2),
`nomcli` varchar (30),
`apecli` varchar (30),
`tlfcli` int(8),
`emailcli` varchar(12),
`codzona` int,
`codrest` int,

constraint `pk_reservas` primary key (`codres`),

constraint `fk_zonas_reservas` foreign key (`codzona`)
        references `zonas` (`codzona`) 
        on update cascade,
        
constraint `fk_restaurantes_reservas` foreign key (`codrest`)
        references `restaurantes` (`codzona`) 
        on update cascade
        );
 

-- A partir de aqui ni caso
/*
create table if not exists departamentos
(
	numcentro int not null,
    numdepto int not null,
    presupuesto decimal(10,2),
    nomdepto varchar(40),
    centrodepen int,
    deptodepen int,
    
    -- decimal(10,2) = 10 cifras de las cuales 2 son decimales
    
    constraint pk_departamentos primary key (numcentro,numdepto),
    constraint fk_departamentos_centros foreign key (numcentro)
			references centros (numcentro)
				on delete no action on update cascade,
    constraint fk_departamentos_departamentos foreign key (centrodepen,deptodepen)
			references departamentos (numcentro,numdepto)
				on delete no action on update cascade
);

create table if not exists empleados
(
	numempleado int not null,
    numcentro int,
    numdepto int,
    extelefon char(3),
    fecnacim date not null, 
    fecingreo date not null, 
    salario decimal(10,2), 
    comision decimal(10,2),
    numhijos tinyint unsigned default '0', 
    nomemp varchar(20),
    ap1emp varchar(20),
    ap2emp varchar(20),
    
    -- tinyint = int(1) Es 1 byte, -128 - 127
    -- Si es unsigned, 0 - 255, ya que utiliza los negativos

    constraint pk_empleados primary key (numempleado),
    constraint fk_empleados_departamentos foreign key (numcentro, numdepto)
			references departamentos (numcentro,numdepto)
				on delete no action on update cascade
);

create table if not exists dirigir
(
	numempleado int,
    numcentro int,
    numdepto int, 
    fecinidir date, 
    fecfindir date,
    
    constraint pk_dirigir primary key (numempleado,numcentro,numdepto,fecinidir),
    constraint fk_dirigir_empleados foreign key (numempleado)
			references empleados (numempleado)
				on delete no action on update cascade,
    constraint fk_dirigir_departamentos foreign key (numcentro,numdepto)
			references departamentos (numcentro,numdepto)
				on delete no action on update cascade
);

/*ALTER TABLE nombredetabla
	add column dfdsf
    add column sgsdg
    add constraint ...*/
    
    /*Para la BD correspondiente al ejercicio 1 de la Unidad 5
    (empleados, deptos, centros de trabajo y directores de 
    departamento), da de alta los registros correspondientes a 
    los centros de trabajo, departamentos y los primeros 10 
    empleados que aparecen en el documento anexo.*/
 /*
 insert into centros
	(numcentro, nomcentro, direccion)
 values
	(10,'SEDE CENTRAL','C.ALCALA, 820, MADRID'),
    (20,'RELACION CON CLIENTES','C.ATOCHA, 405, MADRID');
    
 insert into departamentos
	(numcentro, numdepto, presupuesto, nomdepto, centrodepen, deptodepen)
 values
	(10, 100, 129000, 'DIRECCION GENERAL', null, null),
    (20, 110, 100000, 'DIRECC.COMERCIAL', 10, 100),
    (20, 111, 90000, 'SECTOR INDUSTRIAL', 20, 110),
    (20, 112, 175000, 'SECTOR SERVICIOS', 20, 110),
    (10, 120, 50000, 'ORGANIZACION', 10, 100),
    (10, 121, 74000, 'PERSONAL', 10, 120),
    (10, 122, 68000, 'PROCESO DE DATOS', 10, 120),
    (10, 130, 85000, 'FINANZAS', 10, 100);
    
insert into empleados
    (numempleado, numcentro, numdepto, extelefon, fecnacim, fecingreo,
    salario, comision, numhijos, nomemp, ap1emp, ap2emp)
values
	()*/