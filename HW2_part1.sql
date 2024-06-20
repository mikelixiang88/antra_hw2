-- Question 1 Answer is 504, using following query
SELECT COUNT(*) as product_count
FROM Production.Product
-- Question 2
SELECT COUNT(ProductSubcategoryID) as product_with_subcatagory
FROM Production.Product
-- Question 3
SELECT ProductSubcategoryID, COUNT(ProductID) AS CountedProducts
FROM Production.Product
GROUP By ProductSubcategoryID
-- Question 4 Answer is 209, using same query as question 3
-- Question 5
SELECT SUM(Quantity) as total_quantity
FROM Production.ProductInventory
-- Question 6
SELECT ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100;
-- Question 7
SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100;
-- Question 8
SELECT ProductID, AVG(Quantity) AS AverageQuantity
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID;
-- Question 9
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf
-- Question 10
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
WHERE Shelf!='N/A'
GROUP BY ProductID, Shelf
-- Question 11
SELECT Color, Class, COUNT(*) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class
-- Question 12
SELECT cr.Name AS Country, sp.Name AS Province
FROM person.CountryRegion cr JOIN person.StateProvince sp ON cr.CountryRegionCode = sp.CountryRegionCode;
-- Question 13
SELECT cr.Name AS Country, sp.Name AS Province
FROM person.CountryRegion cr JOIN person.StateProvince sp ON cr.CountryRegionCode = sp.CountryRegionCode
WHERE cr.Name IN ('Germany', 'Canada');