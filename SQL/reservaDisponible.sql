delimiter $$
drop function if exists reservaPosible $$
create function reservaPosible
(codRestaurante int,numeroPersonas int,zona int, fechas date,horas time)
returns boolean
deterministic
begin
	declare mesasDisponibles int;
    declare mesasNecesarias int;
    set mesasDisponibles=(select numMesas
    from numMesas
    where codRestaurante=codrest and
    codzona=zona and
    fecha=fechas and
    hora=horas);
	-- set mesasNecesarias= mesasNecesarias();
    if mesasDisponibles>=mesasNecesarias then
    -- realizarReserva(codRestaurante,zona,fechas,horas,mesasNecesarias);
    return true;
    else
    return false;
    end if;
    
end $$
