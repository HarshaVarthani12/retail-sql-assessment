-- Question 7: Order lines with multiple returns

SELECT
    oi.OrderItemID,
    COUNT(r.ReturnID) AS ReturnTransactionCount,
    SUM(r.ReturnQuantity) AS TotalReturnedUnits
FROM OrderItems_Clean oi
INNER JOIN Returns r
ON oi.OrderItemID = r.OrderItemID
GROUP BY oi.OrderItemID
HAVING COUNT(r.ReturnID) > 1
ORDER BY oi.OrderItemID;