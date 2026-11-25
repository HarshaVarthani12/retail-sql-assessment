-- Question 6: Customers with no orders

SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.CustomerID;