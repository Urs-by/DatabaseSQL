DROP DATABASE IF EXISTS homework_4;
CREATE DATABASE IF NOT EXISTS homework_4;
USE homework_4;

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);


INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");
        

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT cat.name AS cat_name, shop.shopname AS shop_name
FROM cats cat
JOIN shops shop
ON shop.id = cat.shops_id;
       
-- Вывести магазин, в котором продается кот 'Мурзик' (попробуйте выполнить 2 способами)

SELECT shop.shopname AS shop_name
FROM shops shop 
JOIN (SELECT shops_id FROM cats WHERE name = 'Murzik') cat
ON cat.shops_id=shop.id;

SELECT shop.shopname AS shop_name
FROM shops shop 
LEFT JOIN cats cat
ON cat.shops_id=shop.id
WHERE cat.name = 'Murzik';

-- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
SELECT shop.shopname AS shop_name, cat.name AS cat_name
FROM shops shop  
LEFT JOIN cats cat
ON cat.shops_id=shop.id
WHERE cat.name != 'Murzik' and cat.name != 'Zuza'





