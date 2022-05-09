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
