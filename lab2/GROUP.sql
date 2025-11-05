SELECT top 5 with ties orderid, productid, quantity
FROM [order details]
ORDER BY Quantity desc

-- with ties - jeżeli jest kilka rzeczy na ostatnim miejscu to wypisuje wszystko

SELECT count (*)
FROM Employees

-- można włączyć różne statystyki serwera

set statistics time on

----Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20
select max(UnitPrice) as maks
from products
where UnitPrice<20

-- alt rozw
select top 1 with ties UnitPrice as maks
from products
where UnitPrice<20
ORDER BY UnitPrice DESC

-- suma ilosci każdego produktu
SELECT productid, sum(quantity) as total_quantity
FROM orderhist
GROUP BY productid
ORDER BY productid


--Podaj maksymalną cenę zamawianego produktu dla każdego zamówienia
SELECT OrderID, max(UnitPrice) as max_cena
FROM [Order Details]
GROUP BY OrderID

--Posortuj zamówienia wg maksymalnej ceny produktu
SELECT OrderID, max(UnitPrice) as max_cena
FROM [Order Details]
GROUP BY OrderID
ORDER BY max_cena DESC

--Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego zamówienia
SELECT OrderID, max(UnitPrice) as max_cena, min(UnitPrice) as min_cena
FROM [Order Details]
GROUP BY OrderID

--Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów (przewoźników)
SELECT ShipVia, count(OrderID)
from Orders
GROUP BY ShipVia

--Który ze spedytorów był najaktywniejszy w 1997 roku
SELECT TOP 1 ShipVia, count(OrderID) as amount_delivered
from Orders
WHERE year(ShippedDate) = 1997 
GROUP BY ShipVia
ORDER BY amount_delivered DESC

--alt
SELECT TOP 1 ShipVia
FROM Orders
WHERE (YEAR(ShippedDate) = 1997)
GROUP BY ShipVia
ORDER BY COUNT(*) DESC


SELECT productid, sum(quantity) as total_quantity
FROM [order details]
where orderid between 10250 and 40000
GROUP BY productid
having sum(quantity) > 1200

-- having = where tylko po grupowaniu

--Wyświetl zamówienia dla których liczba pozycji zamówienia jest większa niż 5
select OrderID, count(ProductID)
from [Order Details]
group by OrderID
having count(ProductID)>5
 
select OrderID, count(*)
from [Order Details]
group by OrderID
having count(*)>5

-- 2. Wyświetl klientów dla których w 1998 roku
-- zrealizowano więcej niż 8 zamówień (wyniki posortuj
-- malejąco wg łącznej kwoty za dostarczenie zamówień dla każdego z klientów)
SELECT CustomerID, Count(*) as OrdersCount,
    SUM(Freight) AS TotalFreight
FROM Orders
WHERE (YEAR(ShippedDate) = 1998)
GROUP BY CustomerID
HAVING Count(*) > 8
ORDER BY TotalFreight DESC
 


select productid, orderid, sum(quantity) as total_quantity  
from orderhist  
group by rollup (productid, orderid)   
--group by productid, orderid
order by productid, orderid

-- rollup - podsumowywuje poniższe komórki i daje wyżej wynik 
-- (np. w styczniu x, i potem pojedyncze transakcje)