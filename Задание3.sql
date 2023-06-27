USE myfirstdb;

CREATE TABLE salespeople (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	snum INT,
	sname VARCHAR(50),
	city VARCHAR(50),
    comm DECIMAL	
);
INSERT INTO salespeople (snum, sname, city,comm)
VALUES
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1004, 'Motika', 'London', 0.11),
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'Axelrod', 'New York', 0.10);

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	cnum INT,
	cname VARCHAR(50),
	city VARCHAR(50),
    rating INT,
    snum INT
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),	
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	onum INT,
    amt DECIMAL,
    odate DATE,
	cnum INT,
	snum INT
);
INSERT INTO ORDERS (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990.03.10', 2008, 1007),
(3003, 767.19, '1990.03.10', 2001, 1001),
(3002, 1900.10, '1990.03.10', 2007, 1004),
(3005, 5160.45, '1990.03.10', 2003, 1002),
(3006, 1098.16, '1990.03.10', 2008, 1007),
(3009, 1713.23, '1990.04.10', 2002, 1003),
(3007, 75.75, '1990.04.10', 2004, 1002),
(3008, 4723.00, '1990.05.10', 2006, 1001),
(3010, 1309.95, '1990.06.10', 2004, 1002),
(3011, 9891.88, '1990.06.10', 2006, 1001);

DROP TABLE staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);


-- задание №1 
SELECT city,sname,snum,comm
FROM salespeople;

-- задание  №2 
SELECT cname,rating
FROM customers
WHERE city = 'San Jose';

-- задание  №3
SELECT DISTINCT snum
FROM orders;

-- задание  №4
SELECT *
FROM customers
WHERE lower(cname) like 'g%';

-- задание  №5
SELECT *
FROM orders
WHERE amt > 1000;


-- задание  №6
SELECT onum, MIN(amt) as min_amt
FROM orders
GROUP BY onum
limit 1;


-- задание  №7
SELECT *
FROM customers
WHERE rating > 100 and city not in ('Rome');

-- Из класной работы
-- 1
SELECT *
FROM staff
ORDER BY salary ASC;
SELECT *
FROM staff
ORDER BY salary DESC;

-- 2
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3
SELECT post, SUM(salary)
FROM staff
GROUP BY post
HAVING SUM(salary)>100000;








