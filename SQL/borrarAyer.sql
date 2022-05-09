delimiter $$
create event borraAyer
on schedule
	every 1 day
do
	begin
		delete 
        from mesas_disponibles
        where fecha<curdate();
	end $$

delimiter ;
