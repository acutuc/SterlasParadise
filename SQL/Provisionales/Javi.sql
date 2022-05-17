use bdsterlasparadise;

DROP FUNCTION IF EXISTS mesasNecesarias;
delimiter $$
CREATE FUNCTION mesasNecesarias(
	numeroPersonas int)
    
    RETURNS int
    
LANGUAGE SQL
DETERMINISTIC
READS SQL DATA

BEGIN

RETURN (numeroPersonas-4)/2 + 1;

END$$

delimiter ;


-- SELECT mesasNecesarias(11);    
    
    
