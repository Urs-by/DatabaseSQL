CREATE TABLE IF NOT EXISTS homework1 
( 
id INT PRIMARY KEY AUTO_INCREMENT,
ProductName varchar(45),
Manufacturer varchar(45),
ProductCount int, 
Price int
);

INSERT homework1
	(ProductName, Manufacturer, ProductCount, Price)
VALUES 
	("iPhone X", "Apple", 3, 76000),
    ("iPhone8", "Apple", 2, 51000), 
    ("Galaxy S9", "Samsung" , 2, 56000),
    ("Galaxy S8", "Samsung" ,1 ,41000),
    ("P20Pro", "Huawei" ,5 ,36000);
    
SELECT homework1.* FROM homework1;    

# Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT productName, Manufacturer, Price FROM homework1 WHERE ProductCount>2;


# Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM homework1 WHERE Manufacturer = "Samsung";

# Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT * FROM homework1 WHERE ProductCount * Price > 100000 and ProductCount * Price < 145000;

/* С помощью регулярных выражений найти:
	Товары, в которых есть упоминание "Iphone"
*/
SELECT * FROM homework1 WHERE ProductName LIKE "%Iphone%";
# или
SELECT * FROM homework1 WHERE ProductName RLIKE "Iphone";

#	Товары, в которых есть упоминание "Galaxy"
SELECT * FROM homework1 WHERE ProductName RLIKE "Galaxy";

# 	Товары, в которых есть ЦИФРЫ
SELECT * FROM homework1 WHERE ProductName RLIKE "[0-9]";

# Товары, в которых есть ЦИФРА "8"
SELECT homework1.* FROM homework1 WHERE ProductName RLIKE "[8]";


