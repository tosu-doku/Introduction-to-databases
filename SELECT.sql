--Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w
-- Hiszpanii

select CompanyName, Address
from Customers
where Country = 'France' or Country = 'Spain'


-- Wybierz nazwy i ceny produktów z kategorii 'Meat/Poultry'
SELECT
    [productname],
    [unitprice]
FROM Products, Categories
WHERE Categories.CategoryName = 'Meat/Poultry'
AND Categories.CategoryID = Products.CategoryID

-- inny sposob rozwiazania
-- Wybierz nazwy i ceny produktów z kategorii 'Meat/Poultry'
SELECT
    [productname],
    [unitprice]
FROM Products
JOIN Categories
ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryName = 'Meat/Poultry'


--Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę z zakresu od B do L

SELECT Title, LastName
FROM Employees
WHERE LastName like '[B-L]%'


-- to samo bez like

SELECT Title, LastName
FROM Employees
WHERE substring(LastName, 1,1) >= 'B' AND substring(LastName, 1,1) <= 'L'

-- też

SELECT Title, LastName
FROM Employees
WHERE left(LastName,1) between 'B' and 'L'


--Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę  B lub L

SELECT Title, LastName
FROM Employees
WHERE LastName like '[BL]%'

-- też
SELECT Title, LastName
FROM Employees
WHERE substring(LastName, 1,1) = 'B' OR substring(LastName, 1,1) = 'L'

-- też
SELECT Title, LastName
FROM Employees
WHERE left(LastName, 1) IN ('B', 'L')


--Wybierz zamówienia złożone w 1997 roku
select * 
from Orders 
where OrderDate >= '1997-01-01' AND OrderDate < '1998-01-01';

select * 
from Orders 
where OrderDate >= '1997-01-01' AND OrderDate <= '1997-12-31';
-- ^ tutaj tracimy dane z ostatniego dnia, po godzinie 00:00

select * from Orders
where year(OrderDate) = 1997

select *
from Suppliers
where fax = Null
-- Null = brak danych

select distinct year(orderdate) as rok from Orders

select sum(UnitPrice)
from [Order Details]


-- ćwiczenia na koniec SELECT
-- Napisz polecenie, które oblicza wartość każdej pozycji zamówienia o numerze 10250
select UnitPrice*Quantity*(1-Discount) as Value
from [Order Details]
where orderID = 10250


--Napisz polecenie które dla każdego dostawcy (supplier) pokaże pojedynczą kolumnę 
--zawierającą nr telefonu i nr faksu w formacie (numer telefonu i faksu oddz. ',')

select CONCAT(Phone, ',',  Fax) as Tel_i_fax
from Suppliers
