-- Question 8A: Regional gross sales

SELECT
    r.RegionName,
    COUNT(DISTINCT o.OrderID) AS CompletedOrders,
    ROUND(SUM(oi.Quantity * oi.UnitPrice), 2) AS GrossSales
FROM Orders o
JOIN OrderItems_Clean oi ON o.OrderID = oi.OrderID
JOIN Stores s ON o.StoreID = s.StoreID
JOIN Regions r ON s.RegionID = r.RegionID
WHERE o.OrderStatus = 'Completed'
AND o.OrderDate >= '2026-10-01'
AND o.OrderDate < '2026-11-01'
GROUP BY r.RegionID, r.RegionName
ORDER BY r.RegionName;


-- Question 8B: Regional return value

SELECT
    r.RegionName,
    ROUND(SUM(rt.ReturnQuantity * oi.UnitPrice), 2) AS ReturnValue
FROM Returns rt
JOIN OrderItems_Clean oi
    ON rt.OrderItemID = oi.OrderItemID
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Stores s ON o.StoreID = s.StoreID
JOIN Regions r ON s.RegionID = r.RegionID
WHERE o.OrderStatus = 'Completed'
AND rt.ReturnDate >= '2026-10-01'
AND rt.ReturnDate < '2026-11-01'
GROUP BY r.RegionID, r.RegionName
ORDER BY r.RegionName;