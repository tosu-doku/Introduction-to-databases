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

