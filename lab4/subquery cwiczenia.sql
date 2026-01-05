--Ćwiczenie 1
--Podaj łączną wartość zamówienia o numerze 10250 (uwzględnij cenę za przesyłkę)

--podproblem
SELECT UnitPrice*Quantity*(1-Discount) as Cost
FROM [Order Details] od
JOIN Orders o ON o.OrderID = od.OrderID
WHERE o.OrderID = 10250

SELECT sum(Cost)+max(Freight) as CostSummary
FROM(
	SELECT UnitPrice*Quantity*(1-Discount) as Cost,Freight
	FROM [Order Details] od
	JOIN Orders o ON o.OrderID = od.OrderID
	WHERE o.OrderID = 10250) as t




-- Ćwiczenie 5
--Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu

select ProductName, UnitPrice
from products
where Unitprice < (select avg(unitprice) from products)

-- alternatywne
with avgp as (select avg(unitprice) as avgprice from products)

select ProductName, UnitPrice
from products
cross join avgp
where Unitprice < avgp.avgprice

-- Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu danej kategorii
with t2 as (select CategoryName, avg(unitprice) as avgp
	from products p
	join Categories c 
	on p.categoryID = c.CategoryId
	group by CategoryName)

select ProductName, UnitPrice, avgp
from Products p
join Categories c
	on c.CategoryID = p.CategoryID
join t2 
	on t2.CategoryName = c.CategoryName
where UnitPrice < avgp


--Dla każdego produktu podaj jego nazwę, cenę, średnią cenę wszystkich produktów 
-- oraz różnicę między ceną produktu a średnią ceną wszystkich produktów

with avgp as (select avg(unitprice) as avgprice from products)

select ProductName, UnitPrice, UnitPrice-avgprice as odchylka
from products
cross join avgp

-- Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, 
-- średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu 
-- a średnią ceną wszystkich produktów danej kategorii
with t2 as (select CategoryName, avg(unitprice) as avgp
	from products p
	join Categories c 
	on p.categoryID = c.CategoryId
	group by CategoryName)

select ProductName, UnitPrice, avgp, UnitPrice-avgp
from Products p
join Categories c
	on c.CategoryID = p.CategoryID
join t2 
	on t2.CategoryName = c.CategoryName
where UnitPrice < avgp

-- Ćwiczenie 6
--Podaj produkty kupowane przez więcej niż jednego klienta

select p.ProductID, COUNT(CustomerID)
from Products p 
join [Order Details] od
	on p.ProductID = od.ProductID
join Orders o
	on o.orderid = od.orderid
group by p.ProductID
