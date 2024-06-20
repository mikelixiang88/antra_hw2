-- Question 14
SELECT DISTINCT p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
WHERE DATEDIFF(year, o.OrderDate, GETDATE()) <= 27;
-- Question 15
SELECT TOP 5 c.PostalCode, COUNT(od.OrderID) AS OrdersCount
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.PostalCode
ORDER BY OrdersCount DESC;
-- Question 16
SELECT TOP 5 c.PostalCode, COUNT(od.OrderID) AS OrdersCount
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE DATEDIFF(year, o.OrderDate, GETDATE()) <= 27
GROUP BY c.PostalCode
ORDER BY OrdersCount DESC;
-- Question 17
SELECT c.City, COUNT(c.CustomerID) AS NumberOfCustomers
FROM Customers c
GROUP BY c.City;
-- Question 18
SELECT c.City, COUNT(c.CustomerID) AS NumberOfCustomers
FROM Customers c
GROUP BY c.City
HAVING COUNT(c.CustomerID) > 2;
-- Question 19
SELECT c.ContactName, o.OrderDate
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > '1998-01-01';
-- Question 20
SELECT c.ContactName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName;
-- Question 21
SELECT c.ContactName, COUNT(od.ProductID) AS ProductCount
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.ContactName;
-- Question 22
SELECT c.CustomerID, COUNT(od.ProductID) AS ProductCount
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING COUNT(od.ProductID) > 100;
-- Question 23
SELECT s.CompanyName AS SupplierCompanyName, sh.CompanyName AS ShippingCompanyName
FROM Suppliers s JOIN Products p ON s.SupplierID = p.SupplierID JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID JOIN Shippers sh ON o.ShipVia = sh.ShipperID;
-- Question 24
SELECT o.OrderDate, p.ProductName
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate, p.ProductName;
-- Question 25
SELECT e1.FirstName + ' ' + e1.LastName AS Employee1, e2.FirstName + ' ' + e2.LastName AS Employee2, e1.Title
FROM Employees e1 JOIN Employees e2 ON e1.Title = e2.Title AND e1.EmployeeID < e2.EmployeeID;
-- Question 26
SELECT e.FirstName + ' ' + e.LastName AS ManagerName, COUNT(emp.EmployeeID) AS NumberOfEmployees
FROM Employees e JOIN Employees emp ON e.EmployeeID = emp.ReportsTo
GROUP BY e.FirstName, e.LastName
HAVING COUNT(emp.EmployeeID) > 2;
-- Question 27
SELECT c.City, c.CompanyName AS Name, c.ContactName, 'Customer' AS Type
FROM Customers c
UNION ALL
SELECT s.City, s.CompanyName AS Name, s.ContactName, 'Supplier' AS Type
FROM Suppliers s
ORDER BY City, Name;