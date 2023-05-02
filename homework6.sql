-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

/* DELIMITER $$
CREATE FUNCTION format_date(seconds INT) RETURNS VARCHAR(255) READS SQL DATA
BEGIN
    DECLARE days,hours, minutes INT;
	DECLARE formatted  VARCHAR(255);

    SET days = seconds / (24 * 60 * 60);
    SET seconds = seconds - (days * 24 * 60 * 60);
    SET hours = seconds / (60 * 60);
    SET seconds = seconds - (hours * 60 * 60);
    SET minutes = seconds / 60;
    SET seconds = seconds - (minutes * 60);

    SET formatted = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN formatted;
END; $$

SELECT format_date(360000) AS "Отформатированная дата"; 


/*-- Выведите только четные числа от 1 до 10.
  -- Пример: 2,4,6,8,10
*/

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER //
CREATE PROCEDURE print_numbers
(
	IN inp_number INT -- N
)
BEGIN
	DECLARE i INT;
    DECLARE n VARCHAR(5);
    DECLARE result VARCHAR(145) DEFAULT "";
    SET i = 1;
    SET n = 1;
    WHILE i <= inp_number DO
		SET n = IF(i%2 = 0, i, ' ');        
        SET result = CONCAT(result, n );        
        
		-- или
		-- IF i%2 = 0 THEN		
		-- SET result = CONCAT(result, i, " ,"); 
        -- END IF;
        SET i = i + 1;
                 
	END WHILE;
    SELECT result;
END; //

CALL print_numbers(10); 

