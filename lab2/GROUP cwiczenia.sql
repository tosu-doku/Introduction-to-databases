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

-- Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, 
-- dla których łączna liczba zamawianych jednostek produktów jest większa niż 250 

SELECT OrderID, sum(UnitPrice * Quantity * (1-Discount)) as value, sum(Quantity) as total_quantity
FROM [Order Details]
GROUP BY OrderID
HAVING sum(Quantity) > 250

-- Podaj liczbę zamówionych jednostek produktów dla  produktów, 
-- dla których productid jest mniejszy niż 3

SELECT productid, UnitsOnOrder
FROM Products
WHERE ProductID < 3



-- Ćw 2 - library
-- Ilu jest dorosłych czytekników
SELECT COUNT(*)
FROM adult


-- Ile jest dzieci zapisanych do biblioteki
SELECT COUNT(*)
FROM juvenile

-- Ilu z dorosłych czytelników mieszka w Kaliforni (CA)
SELECT COUNT(*)
FROM adult
WHERE adult.state = 'CA'

-- Dla każdego dorosłego czytelnika podaj liczbę jego dzieci.
SELECT adult.member_no, COUNT(juvenile.member_no)
FROM juvenile, adult
WHERE juvenile.adult_member_no = adult.member_no
-- nie pokazuje gdy jest ilosc dzieci = 0, bo pola nie są połączone
GROUP BY adult.member_no

-- Dla każdego dorosłego czytelnika podaj liczbę jego dzieci urodzonych przed 1998r
SELECT adult.member_no, COUNT(juvenile.member_no)
FROM juvenile, adult
WHERE juvenile.adult_member_no = adult.member_no AND juvenile.birth_date < '1998-01-01'
GROUP BY adult.member_no



-- Ćwiczenie 3
-- Dla każdego czytelnika podaj liczbę zarezerwowanych przez niego książek
SELECT member_no, COUNT(isbn)
FROM reservation
GROUP BY member_no

-- Dla każdego czytelnika podaj liczbę wypożyczonych przez niego książek
SELECT member_no, COUNT(isbn)
FROM loan
GROUP BY member_no

-- Dla każdego czytelnika podaj liczbę książek zwróconych przez niego w 2001r.
SELECT member_no, COUNT(isbn)
FROM loanhist
WHERE YEAR(in_date) = 2001
GROUP BY member_no

-- Dla każdego czytelnika podaj sumę kar jakie zapłacił w 2001r
SELECT member_no, SUM(fine_paid)
FROM loanhist
WHERE YEAR(in_date) = 2001
GROUP BY member_no

-- Ile książek wypożyczono w maju 2001
SELECT COUNT(out_date)
FROM loanhist
WHERE YEAR(out_date) = 2001 AND MONTH(out_date) = 5
-- BRAK - nie ma takich w maju

-- Na jak długo średnio były wypożyczane książki w maju 2001
SELECT AVG(out_date - in_date)
FROM loanhist
-- ??


-- Ćwiczenie 4 - Northwind?
-- Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień w 1997r
SELECT EmployeeID, COUNT(*)
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY EmployeeID


-- Dla każdego pracownika podaj ilu klientów (różnych klientów) obsługiwał ten pracownik w 1997r
SELECT EmployeeID, COUNT( DISTINCT CustomerID)
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY EmployeeID

-- Dla każdego spedytora/przewoźnika podaj łączną wartość "opłat za przesyłkę" dla 
-- przewożonych przez niego zamówień

SELECT ShipVia, SUM(Freight)
FROM Orders
GROUP BY ShipVia


-- Dla każdego spedytora/przewoźnika podaj łączną wartość "opłat za przesyłkę" 
-- przewożonych przez niego zamówień w latach od 1996 do 1997

SELECT ShipVia, SUM(Freight)
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipVia



-- Ćwiczenie 5
-- Dla każdego pracownika podaj liczbę obsługiwanych 
-- przez niego zamówień z podziałem na lata

SELECT EmployeeID, YEAR(orderdate),COUNT(*)
FROM Orders
GROUP BY ROLLUP (employeeid, YEAR(orderdate))

-- Dla każdego pracownika podaj liczbę obsługiwanych przez 
-- niego zamówień z podziałem na lata i miesiące.

SELECT EmployeeID, YEAR(OrderDate) as year, MONTH(OrderDate) as month,COUNT(*)
FROM Orders
GROUP BY ROLLUP (employeeid, YEAR(OrderDate), MONTH(OrderDate))


