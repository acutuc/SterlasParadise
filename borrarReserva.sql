delimiter $$
create procedure borrarReserva(codReserva int)
begin
	declare codRestaurante int;
    declare codZona int;
    declare horaReserva time;
    declare diaReserva date;
    declare numPer int;
    
    set numPer=(select numper
							from reservas
                            where corReserva=codreserva);
    set codRestaurante=(select codrest
							from reservas
                            where corReserva=codreserva);
	set codZona=(select codzona
							from reservas
                            where corReserva=codreserva);
	set horaReserva=(select horares
							from reservas
                            where corReserva=codreserva);
	set diaReserva=(select fecres
							from reservas
                            where corReserva=codreserva);
	
                            
	update mesas_disponibles
    set numMesas=numMesas+ mesasNecesarias(numPer)
    where codrest=codRestaurante and codZona=codzona and horaReserva=horares and diaReserva=fecres;
end $$
delimiter ;