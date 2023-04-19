use lesson3;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45),
	lasttname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
	salary DECIMAL(8, 2), 
    age INT
);
INSERT staff (firstname, lasttname, post, seniority, salary, age)
VALUES

 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
SELECT * FROM staff 
ORDER BY salary DESC;

-- -- Отсортируйте данные по полю заработная плата (salary) в порядке: возрастания ;
SELECT * FROM staff 
ORDER BY salary;

-- Выведите 5 максимальных заработных плат (saraly)
SELECT DISTINCT salary AS "5 максимальных заработных плат" 
FROM staff 
ORDER BY salary 
DESC LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT  post AS "Специальность", SUM(salary) AS "Суммарная зарплата" FROM staff GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) AS "кол-во рабочих в возрасте от 24 до 49"  
FROM staff 
WHERE post="Рабочий" and age BETWEEN 24 AND 49;

-- Найдите количество специальностей
SELECT count(DISTINCT post) AS "Количество специальностей" 
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
SELECT post AS "Специальность",  AVG(age) AS "Средний возраст" 
FROM staff 
GROUP BY POST 
HAVING AVG(age) <=30;


 