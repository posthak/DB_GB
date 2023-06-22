SELECT * FROM myfirstdb.Phones;

select ProductName,Manufacture,Price  from `myfirstdb`.`Phones` where 
ProductCount >2;

select *  from `myfirstdb`.`Phones` where 
Manufacture >'Samsung';


select ProductName, Manufacture, ProductCount,Price, ProductCount * Price as tot_price
from `myfirstdb`.`Phones` 
Where  (ProductCount * Price) between  100000 and  145000;

select ProductName, Manufacture, ProductCount,Price
from `myfirstdb`.`Phones` 
Where   upper(ProductName) like '%iphone%';

select ProductName, Manufacture, ProductCount,Price
from `myfirstdb`.`Phones` 
Where   upper(ProductName) like '%galaxy%';


select ProductName, Manufacture, ProductCount,Price
from `myfirstdb`.`Phones` 
Where   upper(ProductName) like '%8%';

select ProductName, Manufacture, ProductCount,Price
from `myfirstdb`.`Phones` 
Where   ProductName REGEXP  '[0-9]';