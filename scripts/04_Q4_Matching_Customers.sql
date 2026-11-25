-- Question 4: Orders with matching customers

SELECT
    o.OrderID,
    o.CustomerID,
    c.CustomerName
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID;