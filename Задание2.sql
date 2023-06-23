
-- Задача №1
use myfirstdb;
CREATE TABLE sales
(
Id serial PRIMARY KEY,
order_date Date,
busket VARCHAR(100) NOT NULL
);

INSERT INTO sales (`order_date`, `busket`) 
VALUES 
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-03', 'less than equal to 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');

-- Задача №2
SELECT * FROM sales;

SELECT 
	order_date,
    busket,
    CASE busket
		WHEN 'less than equal to 100' THEN 'Маленький заказ.'
		WHEN '101 to 300' THEN 'Средний заказ.'
        WHEN 'greater than 300' THEN 'Большой заказ.'
	END AS busket_grouped
FROM sales;


-- Задача №3
CREATE TABLE orders
(
orderid serial PRIMARY KEY,
employeeid VARCHAR(10) NOT NULL,
amount decimal,
orderstatus VARCHAR(100) NOT NULL
);

INSERT INTO orders (`employeeid`, `amount`, `orderstatus`) 
VALUES 
('e03', '15.00','OPEN'),
('e01', '25.50','OPEN'),
('e05', '100.70','CLOSED'),
('e02', '22.18','OPEN'),
('e04', '9.50','CANCELLED'),
('e04', '99.99','OPEN');


SELECT * FROM orders;

SELECT 
	orderid,
    orderstatus,
    CASE orderstatus
		WHEN 'OPEN' THEN 'Order is in open state.'
        WHEN 'CLOSED' THEN 'Order is closed.'
        WHEN 'CANCELLED' THEN 'Order is cancelled.'
	END AS order_summury
FROM orders
	
-- Задача №4
/** 
Чем 0 отличается от NULL?
Напишите ответ в комментарии к домашнему заданию на платформе

ОТВЕТ:
"0" — это значение, константа. A null указывает на "пустое место" — объявленную, 
но неинициализированную переменную, объект и т. п.
**/