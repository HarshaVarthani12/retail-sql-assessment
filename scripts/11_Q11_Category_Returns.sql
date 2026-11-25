-- Question 11: Return value by product category

WITH RegionReturns AS (
    SELECT
        s.RegionID,
        SUM(rt.ReturnQuantity * oi.UnitPrice) AS ReturnValue
    FROM Returns rt
    JOIN OrderItems_Clean oi
        ON rt.OrderItemID = oi.OrderItemID
    JOIN Orders o ON oi.OrderID = o.OrderID
    JOIN Stores s ON o.StoreID = s.StoreID
    JOIN Regions r ON s.RegionID = r.RegionID
    WHERE o.OrderStatus = 'Completed'
    AND rt.ReturnDate >= '2026-10-01'
    AND rt.ReturnDate < '2026-11-01'
    GROUP BY s.RegionID
    ORDER BY ReturnValue DESC, r.RegionName ASC
    LIMIT 1
)
SELECT
    r.RegionName,
    p.Category,
    ROUND(SUM(rt.ReturnQuantity * oi.UnitPrice), 2)
        AS ReturnValue
FROM Returns rt
JOIN OrderItems_Clean oi
    ON rt.OrderItemID = oi.OrderItemID
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Stores s ON o.StoreID = s.StoreID
JOIN Regions r ON s.RegionID = r.RegionID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE o.OrderStatus = 'Completed'
AND rt.ReturnDate >= '2026-10-01'
AND rt.ReturnDate < '2026-11-01'
AND s.RegionID = (SELECT RegionID FROM RegionReturns)
GROUP BY r.RegionName, p.Category
ORDER BY ReturnValue DESC, p.Category ASC;