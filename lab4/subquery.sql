-- Subquery
select t.orderid, t.customerid  
 from (select orderid, customerid  
         from orders) as t


-- znajdź średnią cene
select productname, unitprice  
     , (select avg(unitprice) from products) as average  
from products;

-- odchylenie od średniej ceny
select productname, unitprice  
     , (select avg(unitprice) from products) as average  
     , unitprice - (select avg(unitprice) from products) as diff  
from products; 



select productname, unitprice  
     , (select avg(unitprice) from products) as average  
     , unitprice - (select avg(unitprice) from products) as diff  
from products  
where unitprice > (select avg(unitprice) from products)


select *, unitPrice - average as diff  
from  
  (select productname, unitprice  
     , (select avg(unitprice) from products) as average  
   from products) t  
where unitPrice > average;

-- MySql
set @sr = (select avg(unitprice) from products)
select productname, unitprice,
@sr as average, 
UnitPrice - @sr diff
from products
where Unitprice > @sr


select productname, p.categoryid, unitprice, UnitPrice - average diff
from Products p
    join
        (select categoryid, avg(unitprice) average
        from products
        group by categoryid) cav
        on p.CategoryID = cav.CategoryID
where UnitPrice > average;

-- alternatywne rozwiazanie
with cav as
(
    select categoryid, avg(unitprice) average
    from products
    group by categoryID
)
select productname, p.categoryid, UnitPrice, UnitPrice - average diff
from products p
    join cav
    on p.CategoryID = cav.CategoryID
where UnitPrice > average


select distinct lastname, e.employeeid
from orders o
right join Employees e
on o.EmployeeID = e.EmployeeID
and o.OrderDate = '1997-09-05'
where OrderID is null

-- alternatywne do wyzej
select lastname, employeeid
from Employees e
except  -- przez zrobionie przypadku przeciwnego i zaprzeczenie
select lastname, Employeeid
from Employees e
where EmployeeID in (select EmployeeID from orders o
    where o.OrderDate = '1997-09-05')


select lastname, employeeid  
 from employees as e  
 where exists (select * from orders as o  
                where e.employeeid = o.employeeid  
                 and  o.orderdate = '1997-09-05')

-- alternatywne, zamiast exists - join
select distinct lastname, e.employeeid  
 from orders as o  
 inner join employees as e  
  on o.employeeid = e.employeeid  
 where o.orderdate = '1997-09-05'

SELECT @@VERSION



