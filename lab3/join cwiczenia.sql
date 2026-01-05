-- Northwind

-- Ćwiczenie 1

-- Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru 
-- oraz nazwę klienta.

SELECT c.CompanyName, SUM(od.quantity) as sum_of_orders
FROM Orders AS o
JOIN [Order Details] AS od
on o.OrderID = od.OrderID
RIGHT JOIN Customers AS c -- pokazanie klientów bez zamówień
on o.CustomerID = c.CustomerID
GROUP BY CompanyName


-- Dla każdego zamówienia podaj łączną wartość zamówionych produktów 
-- (wartość zamówienia bez opłaty za przesyłkę) oraz nazwę klienta.

SELECT c.CompanyName, SUM(od.quantity * od.UnitPrice * (1-od.Discount)) as sum_of_orders
FROM Orders AS o
JOIN [Order Details] AS od
on o.OrderID = od.OrderID
RIGHT JOIN Customers AS c 
on o.CustomerID = c.CustomerID
GROUP BY CompanyName

-- Dla każdego zamówienia podaj łączną wartość tego zamówienia 
-- (wartość zamówienia wraz z opłatą za przesyłkę) oraz nazwę klienta.

SELECT c.CompanyName, SUM(od.quantity * od.UnitPrice * (1-od.Discount) + o.Freight) as sum_of_orders_with_freight
FROM Orders AS o
JOIN [Order Details] AS od
on o.OrderID = od.OrderID
RIGHT JOIN Customers AS c
on o.CustomerID = c.CustomerID
GROUP BY CompanyName

-- Zmodyfikuj poprzednie przykłady tak żeby dodać jeszcze 
-- imię i nazwisko pracownika obsługującego zamówień

SELECT c.CompanyName, SUM(od.quantity * od.UnitPrice * (1-od.Discount) + o.Freight) as sum_of_orders_with_freight,
e.FirstName,e.LastName
FROM Orders AS o
JOIN [Order Details] AS od
on o.OrderID = od.OrderID
RIGHT JOIN Customers AS c
on o.CustomerID = c.CustomerID
LEFT JOIN Employees AS e	-- zachowanie klientów bez zamówień
on o.EmployeeID = e.EmployeeID
GROUP BY CompanyName, LastName, FirstName



-- Ćwiczenie 2

-- Podaj nazwy przewoźników, którzy w marcu 1998 przewozili produkty 
-- z kategorii 'Meat/Poultry'


SELECT CompanyName --, CategoryName, ShippedDate
FROM categories AS c
JOIN products AS p
ON c.CategoryID = p.CategoryID
JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
JOIN orders as o
ON od.OrderID = o.OrderID
JOIN Shippers as s
ON o.ShipVia = s.ShipperID
WHERE CategoryName = 'Meat/Poultry' AND MONTH(ShippedDate) = 3 AND YEAR(ShippedDate) = 1998
GROUP BY CompanyName

-- Podaj nazwy przewoźników, którzy w marcu 1997r 
-- nie przewozili produktów z kategorii 'Meat/Poultry'

SELECT CompanyName -- , CategoryName, ShippedDate
FROM categories AS c
JOIN products AS p
ON c.CategoryID = p.CategoryID
JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
JOIN orders as o
ON od.OrderID = o.OrderID
JOIN Shippers as s
ON o.ShipVia = s.ShipperID
WHERE CategoryName = 'Meat/Poultry' AND NOT (MONTH(ShippedDate) = 3 AND YEAR(ShippedDate) = 1997)
GROUP BY CompanyName


-- Dla każdego przewoźnika podaj wartość produktów z kategorii 'Meat/Poultry' 
-- które ten przewoźnik przewiózł w marcu 1997


SELECT CompanyName, sum(od.UnitPrice * od.Quantity) as value
FROM categories AS c
JOIN products AS p
ON c.CategoryID = p.CategoryID
JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
JOIN orders as o
ON od.OrderID = o.OrderID
JOIN Shippers as s
ON o.ShipVia = s.ShipperID
WHERE CategoryName = 'Meat/Poultry' AND NOT (MONTH(ShippedDate) = 3 AND YEAR(ShippedDate) = 1997)
GROUP BY CompanyName


-- Ćwiczenie 3
-- Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych 
-- przez klientów jednostek towarów z tej kategorii.

SELECT CategoryName, SUM(od.Quantity)
FROM Categories c
LEFT JOIN Products p
ON p.CategoryID = c.CategoryID
LEFT JOIN [Order Details] od
ON od.ProductID = p.ProductID
GROUP BY CategoryName

--Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych 
-- w 1997r jednostek towarów z tej kategorii.

SELECT CategoryName, SUM(od.Quantity)
FROM Categories c
LEFT JOIN Products p
ON p.CategoryID = c.CategoryID
LEFT JOIN [Order Details] od
ON od.ProductID = p.ProductID
LEFT JOIN Orders o
ON od.OrderID = o.OrderID
WHERE YEAR(ShippedDate) = 1997
GROUP BY CategoryName

--Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych towarów z tej kategorii

SELECT CategoryName, SUM(od.Quantity*od.UnitPrice * (1-Discount))
FROM Categories c
LEFT JOIN Products p
ON p.CategoryID = c.CategoryID
LEFT JOIN [Order Details] od
ON od.ProductID = p.ProductID
GROUP BY CategoryName


-- Ćwiczenie 4
--Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r
SELECT CompanyName, COUNT(orderid)
FROM Shippers s
JOIN Orders o
on o.ShipVia = s.ShipperID
where year(ShippedDate) = 1997
group by CompanyName


--Który z przewoźników był najaktywniejszy (przewiózł największą liczbę zamówień) w 1997r, 
--podaj nazwę tego przewoźnika

select TOP 1 CompanyName, COUNT(orderid)
from shippers s
join orders o
on s.ShipperID = o.ShipVia
where year(ShippedDate) = 1997
group by CompanyName
order by count(orderid) DESC

-- Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych 
-- przez tego pracownika w maju 1996

select FirstName, LastName, COUNT(OrderID)
from Employees e
join Orders o
on e.EmployeeID = o.EmployeeID
where year(ShippedDate) = 1996 AND month(ShippedDate) = 5
group by FirstName, LastName

-- Który z pracowników obsłużył największą liczbę zamówień w 1996r, 
-- podaj imię i nazwisko takiego pracownika

select firstname, lastname, count(orderid)
from Employees
join orders on 
orders.EmployeeID = Employees.EmployeeID
where year(OrderDate) = 1996
group by firstname, lastname

--Który z pracowników był najaktywniejszy (obsłużył zamówienia o największej wartości) w 1996r, 
--podaj imię i nazwisko takiego pracownika

select top 1 firstname, lastname--, sum(unitprice * quantity * (1-discount))
from Employees e
join orders o 
on o.EmployeeID = e.EmployeeID
join [Order Details] od
on od.orderid = o.orderid
where year(orderdate) = 1996
group by firstname, lastname
order by sum(unitprice * quantity * (1-discount)) DESC