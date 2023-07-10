-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE TABLE  Cars 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR (100),
	Cost DECIMAL
);

INSERT INTO Cars (Name, Cost)
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

CREATE VIEW V_CARS AS (
	SELECT * 
    FROM Cars
    WHERE cost < 25000
);

SELECT * FROM V_CARS;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
-- (используя оператор ALTER VIEW) 

ALTER VIEW V_CARS AS (
	SELECT * 
    FROM Cars
    WHERE cost < 30000
);
SELECT * FROM V_CARS;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW V_CARS_SK_AU AS (
	SELECT * 
    FROM Cars
    WHERE Name in ('Audi','Skoda')
);
SELECT * FROM V_CARS_SK_AU;

-- Задача 4 Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

CREATE TABLE Analysis (
	an_id INT AUTO_INCREMENT PRIMARY KEY,
	an_name VARCHAR(50),
	an_cost decimal,
	an_price  decimal,
	an_group  INT
);
INSERT INTO Analysis (an_name, an_cost, an_price ,an_group) 
VALUES ('Кровь с вены', 66.56, 222.64, 1),
('КТ вн органов', 80.58, 162.10, 2),
('УЗИ почек', 71.97, 202.97, 3),
('ЭКГ', 54.33, 174.93, 4),
('Mult gest-plac/sac NOS', 51.3, 202.31, 5),
('Esophageal hemorrhage', 79.16, 202.67, 5),
('Opn subarach hem-concuss', 62.63, 179.59, 5),
('Mitral valve disorder', 77.82, 225.88, 5),
('Cancrum oris', 74.42, 167.15, 5);
 select * from Analysis;

CREATE TABLE Groups_ (
	gr_id INT AUTO_INCREMENT PRIMARY KEY,
	gr_name  VARCHAR(50),
	gr_temp  VARCHAR(50)
);
INSERT INTO Groups_ (gr_name, gr_temp) 
VALUES ('ОАК', '37'),
('КТ', '37'),
('УЗИ', '38'),
('ЭКГ', '37'),
('ДРУГОЕ', '36');
 select * from Groups_;

DROP TABLE Orders;
CREATE TABLE Orders (
	ord_id INT AUTO_INCREMENT PRIMARY KEY,
	ord_datetime  DATETIME,
	ord_an  INT
);

INSERT INTO Orders (ord_datetime, ord_an) 
VALUES ('2020-02-05 12:00', 1),
('2020-02-05 14:00', 3),
('2020-02-04 11:00', 2),
('2020-02-03 18:00', 2),
('2020-02-07 17:00', 1),
('2020-02-08 20:00', 2),
('2020-02-09 19:00', 3),
('2020-02-11 15:00', 2),
('2020-02-19 10:00', 1),
('2020-02-11 11:00', 3),
('2020-02-10 06:00', 5);
	 
SELECT a.an_name, a.an_cost, a.an_price,o.ord_datetime,WEEK(o.ord_datetime,1) as week_number,  DAYNAME(o.ord_datetime) as week_name 
FROM 	Analysis a
INNER JOIN Orders o ON a.an_id = o.ord_an
WHERE (YEAR(ord_datetime)=2020 and MONTH(ord_datetime)= 2 and DAY(ord_datetime) = 5) 
OR  (WEEK(ord_datetime,1) = WEEK('2020-02-05',1)+1)
ORDER BY o.ord_datetime;

-- Задача 5
CREATE TABLE Station (
	id INT AUTO_INCREMENT PRIMARY KEY,
    train_id INT,
	station  VARCHAR(20),
	station_time  time	
);
INSERT INTO Station (train_id,station, station_time) 
VALUES (110, 'San Francisko', '10:00:00'),
(110,'Redwood City', '10:54:00'),
(110,'Palo Alto', '11:02:00'),
(110,'San Jose', '12:35:00'),
(120,'San Francisko', '11:00:00'),
(120,'Palo Alto', '12:49:00'),
(120,'San Jose', '13:30:00');
 
SELECT *,
CASE WHEN 
	TIMEDIFF(LEAD(station_time, 1, '') OVER (PARTITION BY train_id ORDER BY station_time),station_time) is null THEN ''
ELSE 
	TIME_FORMAT(TIMEDIFF(LEAD(station_time, 1, '') OVER (PARTITION BY train_id ORDER BY station_time),station_time),'%H:%i:%s')
END as 'time_to_the_next_station'
FROM Station;
