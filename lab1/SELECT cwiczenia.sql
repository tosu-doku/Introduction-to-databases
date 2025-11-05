--Napisz polecenie select za pomocą którego uzyskasz id/numer tytułu oraz tytuł książki
Select title_no, title
from title

--Napisz polecenie, które wybiera tytuł o numerze/identyfikatorze 10
Select title, title_no
from title
where title_no = 10

--Napisz polecenie select, za pomocą którego uzyskasz numer książki (nr tyułu)  
--i autora dla wszystkich książek, których autorem jest Charles Dickens lub Jane Austen

Select title_no, author
from title
where author in ('Charles Dickens','Jane Austen')

-- Ćw 2

--Napisz polecenie, które wybiera numer tytułu i tytuł dla wszystkich  
--książek, których tytuły zawierających słowo 'adventure'

Select title_no, title
from title
where title like '%adventure%'

--Napisz polecenie, które wybiera numer czytelnika, oraz zapłaconą karę 
--dla wszystkich książek, ktore zostały zwrócone w listopadzie 2001

Select member_no, fine_paid --, in_date
from loanhist
where in_date between '2001-11-01' and '2001-11-30'

--Napisz polecenie, które wybiera wszystkie unikalne pary miast i stanów z tablicy adult.
SELECT DISTINCT(CONCAT(city, state))
FROM adult

--Napisz polecenie, które wybiera wszystkie tytuły z tablicy title 
--i wyświetla je w porządku alfabetycznym.
SELECT title
FROM title
ORDER BY title

-- cw 3
-- wybiera numer członka biblioteki (member_no), isbn książki (isbn) i wartość 
-- naliczonej kary (fine_assessed) z tablicy loanhist dla wszystkich wypożyczeń/zwrotów, 
-- dla których naliczono karę (wartość nie NULL w kolumnie fine_assessed)
SELECT member_no, isbn, 2*fine_assessed as double_fine, (2*fine_assessed - fine_assessed) as diff
FROM loanhist
WHERE fine_assessed is not Null and (2*fine_assessed - fine_assessed) > 3

--stwórz kolumnę wyliczeniową zawierającą podwojoną wartość kolumny fine_assessed
--stwórz alias double_fine dla tej kolumny (zmień nazwą kolumny na double_fine
--stwórz kolumnę o nazwie diff, zawierającą różnicę wartości w kolumnach double_fine i fine_assessed
--wybierz wiersze dla których wartość w kolumnie diff jest większa niż 3


--cw 4
--generuje pojedynczą kolumnę, która zawiera kolumny: firstname (imię członka biblioteki), middleinitial (inicjał drugiego imienia) i lastname (nazwisko) z tablicy member dla wszystkich członków biblioteki, którzy nazywają się Anderson
--nazwij tak powstałą kolumnę email_name (użyj aliasu email_name dla kolumny)
--zmodyfikuj polecenie, tak by zwróciło 'listę proponowanych loginów e-mail'  utworzonych przez połączenie imienia członka biblioteki, z inicjałem drugiego imienia i pierwszymi dwoma literami nazwiska (wszystko małymi małymi literami).
--wykorzystaj funkcję SUBSTRING do uzyskania części kolumny znakowej oraz LOWER do zwrócenia wyniku małymi literami.
--wykorzystaj operator (+) do połączenia napisów.

SELECT LOWER(REPLACE([firstname], ' ', '') + [middleinitial] + SUBSTRING([lastname], 1, 2) + CAST(member_no AS VARCHAR)) as email_name,
    firstname, lastname
FROM member
WHERE lastname='Anderson'
ORDER BY firstname;