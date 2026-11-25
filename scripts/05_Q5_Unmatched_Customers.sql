-- Question 5: Orders with unmatched customer IDs

SELECT
    o.OrderID,
    o.CustomerID
FROM Orders o
LEFT JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL
ORDER BY o.OrderID;