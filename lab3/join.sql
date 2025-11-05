
-- joindb
select buyer_name, sales.buyer_id, prod_id, qty  
from buyers, sales  
where buyers.buyer_id = sales.buyer_id

select buyer_name, sales.buyer_id, prod_id, qty  
from buyers inner join sales  
on buyers.buyer_id = sales.buyer_id

-- northwind
select companyname, customers.CustomerID, orderdate
from customers
join Orders
on customers.CustomerID = Orders.CustomerID

select companyname, customers.CustomerID, orderdate
from customers
left join Orders
on customers.CustomerID = Orders.CustomerID
--where shippeddate is null
where OrderID is null	-- nie ma odpowiedników w tabeli

-- zadanie z group ćwiczenia - dodanie imienia i nazwiska
SELECT firstname, lastname, Employees.EmployeeID, COUNT( DISTINCT CustomerID)
FROM Orders 
LEFT JOIN Employees 
ON orders.EmployeeID = Employees.EmployeeID
WHERE YEAR(OrderDate) = 1997
GROUP BY Employees.EmployeeID, firstname, lastname


-- zadanie 3
--Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku,
--jeśli tak to pokaż ich dane adresowe
SELECT
  c.CustomerID,
  c.CompanyName,
  c.ContactName,
  c.Address,
  c.City,
  c.Region,
  c.PostalCode,
  c.Country
FROM Customers c
LEFT OUTER JOIN Orders o
  ON o.CustomerID = c.CustomerID
  AND o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
WHERE o.OrderID IS NULL;


--5. Wybierz zamówienia złożone w marcu 1997.

--Dla każdego takiego zamówienia wyświetl jego numer, datę złożenia zamówienia oraz nazwę i numer telefonu klienta
 
SELECT OrderID, OrderDate, ContactName, Phone
FROM Orders INNER JOIN Customers
ON orders.customerid = customers.customerid
WHERE MONTH(orderdate) = 3 and YEAR(orderdate) = 1997
 

select CompanyName, Phone FROM Suppliers join Products
ON Suppliers.SupplierID = Products.SupplierID where UnitsInStock = 0;
 

-- dla każdego kl. podaj liczbe zamówień
select companyname, customers.CustomerID, COUNT(OrderID)
from customers LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
GROUP BY customers.CustomerID, CompanyName

select CustomerID, COUNT(*)
from orders
GROUP BY CustomerID

-- dla każdego kl. podaj liczbe zamówień z 1997r.
select companyname, customers.CustomerID, COUNT(OrderID)
from customers LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
AND YEAR(orderdate) = 1997
GROUP BY customers.CustomerID, CompanyName
--HAVING COUNT(OrderID) = 0


-- Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówieńod 20 maja 97 do 22 maja 97
SELECT employees.EmployeeID, lastname, firstname, COUNT(orderid)
FROM Employees
LEFT JOIN Orders ON orders.EmployeeID = Employees.EmployeeID
AND OrderDate > '1997-05-20' AND OrderDate < '1997-05-22'
GROUP BY employees.EmployeeID, lastname, firstname;

select * from orders
where OrderDate > '1997-05-20' AND OrderDate < '1997-05-22' and EmployeeID = 1




-- napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki 
-- (baza library). Interesuje nas imię, nazwisko i data urodzenia dziecka

SELECT member.firstname, member.lastname, juvenile.birth_date
FROM juvenile
-- tutaj right/full join, pokazałby nam wszystkich, co jest błędne
INNER JOIN member
    ON juvenile.member_no = member.member_no

-- 2. Napisz polecenie, które podaje tytuły aktualnie
-- wypożyczonych książek
SELECT DISTINCT title.title
FROM loan
JOIN title
    ON title.title_no = loan.title_no



-- joindb, te 3 poniżej, są takie same
select buyer_name, qty
from buyers cross join sales

select buyer_name, qty
from buyers, sales

select buyer_name, qty
from buyers join sales
on 1 = 1


-- potrojne join
-- używając desing query in editor (crtl+shift+q)
SELECT   Buyers.buyer_name, Produce.prod_name, Sales.qty
FROM      Buyers INNER JOIN
                Sales ON Buyers.buyer_id = Sales.buyer_id INNER JOIN
                Produce ON Sales.prod_id = Produce.prod_id

-- koniec lab 3
