-- 01. Wyświetl nazwy wszystkich produktów dostępnych w sklepie.

select name from Products;

-- 02. Wyświetl nazwy oraz ceny wszystkich produktów dostępnych w sklepie.

select name, price from Products;

-- 03. Wyświetl nazwy wszystkich produktów których cena jest mniejsza lub równa 200.

select name from Products where price <= 200;

-- 04. Wyświetl wszystkie produkty, których cena jest pomiędzy 60 i 120.

select name from Products where price > 60 and price < 120;

-- 05. Wyświetl nazwy oraz ceny w groszach wszystkich produktów dostępnych w sklepie.(ceny powinny zostać pomnożone przez 100)

select name, price * 100 from Products;

-- 06. Oblicz średnią cenę z wszystkich produktów.

select avg(price) as average_price from Products;

-- 07. Oblicz średnią cenę z wszystkich produktów, które zostały wyprodukowane przez producenta o id 2.

select avg(price) as average_price from Products where manufacturer = 2;

-- 08. Oblicz ilość produktów, których cena jest większa bądź równa 180.

select count(*) as price_180 from Products where price = 180;

-- 09. Wyświetl nazwy i ceny produktów, których cena jest większa bądź równa 180. Wyniki posortuj po cenie(malejąco) oraz po nazwie(rosnąco).

select name, price from Products where price >= 180 order by price desc, name;

-- 10. Wyświetl wszystkie dane o produktach oraz odpowiadającym ich producentach.

select products.code, products.name, price, manufacturer, manufacturers.name from Products join Manufacturers on products.manufacturer = manufacturers.code;

-- 11. Wyświetl nazwę, cenę oraz nazwę producenta wszystkich produktów dostępnych w sklepie.

select products.name, price, manufacturers.name from Products join Manufacturers on products.manufacturer = manufacturers.code;

-- 12. Wyświetl średnią cenę produktów dla każdego producenta oraz jego id.

select manufacturer, avg(price) as average_price from products group by manufacturer order by manufacturer;

-- 13. Wyświetl średnią cenę produktów dla każdego producenta oraz jego nazwę.

select manufacturers.name, products.manufacturer, avg(price) as average_price from products join manufacturers on products.manufacturer = manufacturers.code group by manufacturers.name, products.manufacturer order by manufacturer;


-- 14. Wyświetl nazwy producentów których produkty mają średnią cenę większą bądź równą 150.

select manufacturers.name, avg(price) as average_price from products join manufacturers on products.manufacturer = manufacturers.code group by manufacturers.name having avg(price) >= 150 order by avg(price);

-- 15. Wyświetl nazwę oraz cenę najtańszego produktu w sklepie.

select name, price from products where price = (select min(price) from products);

-- 16. Wyświetl nazwę każdego producenta wraz z nazwą oraz ceną najdroższego produktu tego producenta.

select manufacturer, manufacturers.name, max(price) from products join manufacturers on products.manufacturer = manufacturers.code group by manufacturer, manufacturers.name order by manufacturer;

-- 17. Dodaj nowy produkt przypisany do producenta o id 2 z danymi: Loudspeakers, 70.

insert into products(name, price, manufacturer) values ('Loudspeakers', 70, 2);

-- 18. Zaktualizuj nazwę produktu o id 8 na Laser Printer

update products set name = 'Laser Printer' where code = 8;

-- 19. Zaktualizuj ceny wszystkich produktów o 10% rabat.

update products set price = price - (price * 0.1);

-- 20. Zaktualizuj ceny wszystkich produktów, których ceny są większe od 120, o 10% rabat.

update products set price = price - (price * 0.1) where price > 120;
