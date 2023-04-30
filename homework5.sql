DROP DATABASE IF EXISTS homework_5;
CREATE DATABASE IF NOT EXISTS homework_5;
USE homework_5;


CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW view_cars AS
SELECT * FROM cars
WHERE cost <= 25000;

-- или

CREATE OR REPLACE VIEW view_cars AS
SELECT * FROM cars
WHERE cost <= 25000;


SELECT * FROM view_cars;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW view_cars AS
SELECT * FROM cars
WHERE cost <= 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW skoda_audi AS
SELECT * FROM cars
WHERE name IN ("Skoda", "Audi");

SELECT * FROM skoda_audi;


DROP TABLE  IF EXISTS train;
CREATE TABLE train
( 
	id_train INT NOT NULL,
	station VARCHAR(45),
    station_time TIME
);

INSERT  train VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City','10:54:00'),
(110,'Palo Alto','11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto','12:49:00'),
(120, 'San Jose', '13:30:00');



SELECT * , 
timediff(LEAD(station_time) OVER (PARTITION BY id_train), station_time) AS 'interval'
FROM train;

