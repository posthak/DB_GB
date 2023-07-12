/* 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
-- DELIMITER $$
-- drop function time_;

DELIMITER $$
CREATE FUNCTION time_(totalSeconds INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
	DECLARE days INT;-- DEFAULT 0;
    DECLARE hours INT;-- DEFAULT 1;
    DECLARE minutes INT;-- DEFAULT 0;
	DECLARE seconds INT;-- DEFAULT 0;
    DECLARE res VARCHAR(200); -- DEFAULT '0 1';
	SET seconds = (totalSeconds % 60); 
    SET minutes = (totalSeconds % 3600) / 60; 
    SET hours = (totalSeconds % 86400) / 3600; 
    SET days = (totalSeconds % (86400 * 30)) / 86400; 
    SET res = CONCAT(days, ' days ', hours,' hours ', minutes, ' minutes ', seconds, ' seconds');
    RETURN res;
END $$
DELIMITER ;

SELECT time_(123456);

/*
2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/
DELIMITER $$
DROP procedure loop_odd;
DELIMITER $$
CREATE PROCEDURE loop_odd()
BEGIN
	DECLARE x INT DEFAULT 0;
    DECLARE res VARCHAR(30) DEFAULT '';
    REPEAT
        SET x = x + 2;
        IF x = 10 THEN 
			SET res = CONCAT(res, x, '');
		ELSE 
			SET res = CONCAT(res, x, ', ');
        END IF;
		UNTIL x >= 10
	END REPEAT;
    SELECT res;
END $$
DELIMITER ;

CALL loop_odd();