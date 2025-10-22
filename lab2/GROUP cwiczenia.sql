-- Dla każdego zamówienia podaj jego wartość. 
-- Posortuj wynik wg wartości zamówień (w malejęcej kolejności)


-- Northwind - ćw 1
-- Dla każdego zamówienia podaj jego wartość. 
-- Posortuj wynik wg wartości zamówień (w malejęcej kolejności)
SELECT OrderID, sum(UnitPrice * Quantity * (1-Discount)) as value
FROM [Order Details]
GROUP BY OrderID
ORDER BY value DESC


-- Zmodyfikuj zapytanie z poprzedniego punktu, 
-- tak aby zwracało tylko pierwszych 10 wierszy

SELECT TOP 10 UnitPrice * Quantity * (1-Discount) as value
FROM [Order Details]
ORDER BY value DESC

