--London daki hangi müþteri kaç sipariþ verdi.

SELECT
a.CustomerID, a.CompanyName, a.City

FROM Customers a 
INNER JOIN Orders b On a.CustomerID=b.CustomerID
WHERE a.City='London'
GROUP BY a.CustomerID, a.CompanyName, a.City
--HAVING a.City='London'





