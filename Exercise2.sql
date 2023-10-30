/* joins: select all the computers from the Products table:
using the Products table and the Categories table, return the Product Name and the category Name */

SELECT p.Name, c.Name
FROM Products p
INNER JOIN Categories c 
ON p.CategoryID = c.CategoryID
WHERE c.Name LIKE 'Computers';
 
/* joins: find all Product Names, Product prices, and Products ratings that have a rating of 5 */

SELECT p.Name, p.Price, r.Rating
FROM Products p
INNER JOIN Reviews r 
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most Total Quantity sold.  use the sum() function and group by */

SELECT e.EmployeeID, SUM(s.Quantity) AS TotalQuantitySold
FROM Employees e
INNER JOIN Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY TotalQuantitySold DESC
LIMIT 1;

/* joins: find the Name of the Department, and the Name of the Category for Appliances and Games */

SELECT d.Name, c.Name
FROM Departments d 
INNER JOIN Categories c ON d.DepartmentID = c.DepartmentID
WHERE c.Name LIKE 'Appliances' OR c.Name LIKE 'Games';

/* joins: find the Product Name, Total # sold, and Total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT p.Name,
SUM(s.Quantity) AS TotalQuantitySold,
SUM(s.Quantity * s.PricePerUnit) AS TotalPriceSold
FROM Sales s
INNER JOIN Products p ON p.ProductID = s.ProductID
WHERE p.Name = 'Eagles: Hotel California'
GROUP BY p.Name;

/* joins: find Product Name, reviewer Name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment 
FROM Products p 
INNER JOIN Reviews r ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%Visio TV'
GROUP BY p.Name, r.Reviewer, r.Rating, r.Comment;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee Sales report.
This query should return:
-  the EmployeeID
-  the employee's first and last Name
-  the Name of each Product
-  and how many of that Product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity
FROM Employees e
INNER JOIN Sales s ON e.EmployeeID = s.EmployeeID
INNER JOIN Products p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity;