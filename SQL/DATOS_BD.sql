use bdsterlasparadise;

-- Inserción de datos

-- Restaurantes
INSERT INTO restaurantes
VALUES
		(1, 'Hawai'),
        (2, 'Cerdeña'),
        (3, 'Marbella'),
        (4, 'London');
        
	
-- Zonas

INSERT INTO zonas
-- Interior impar, exterior par, se empieza por 1, planta baja 0, si no se espeficia 0
VALUES
		(1, 1, 1, 0, 10), -- Interior Hawai
        (1, 2, 1, 0, 10), -- Exterior Hawai
        (2, 1, 1, 0, 10),
        (2, 2 , 0, 0, 5),
        (3, 1, 1, 0, 5),
        (3, 3, 1, 1, 10),
        (4, 1, 1, 0, 20);
        
        
-- Introduce datos en mesas_disponibles

-- DELETE FROM mesas_disponibles; -- Borra los datos existentes

CALL cargarDatosMesasDisponibles(14, curdate());
    
    
-- Ejemplos de reservas (pruebas)

insert into reservas
values
	(1, curdate(), curtime(), 1, 'Jetstream Sam', 'Rodriguez', 987654321, 'therewillbebloodshed@desperatto.com', 1, 1),
	(2, "2011-05-15", "13:30", 2, 'Minius', 'Monsoon', 987654321, 'memesthednaofthesoul@desperatto.com', 1, 2),
	(3, "2001-3-22", "15:00", 4, 'Asuka', 'Lansley', 987654321, 'felizjuevess@getintheevashinji.com', 2, 1),
	(4, "2009-09-28", "16:30", 2, 'Senator', 'Armstrong', 987654321, 'nanomachines_son@worldmarshall.net', 2, 2),
	(5, "2018-12-06", "14:30", 14, 'Will', 'Smith', 987654321, 'itsrewindtime@thatshot.youtube', 2, 3);



