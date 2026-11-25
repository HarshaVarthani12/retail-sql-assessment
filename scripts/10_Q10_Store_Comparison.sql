-- Question 10A: Gross sales by store

SELECT
    r.RegionName,
    s.StoreID,
    s.StoreName,
    ROUND(COALESCE(SUM(oi.Quantity * oi.UnitPrice), 0), 2)
        AS GrossSales
FROM Stores s
JOIN Regions r ON s.RegionID = r.RegionID
LEFT JOIN Orders o ON s.StoreID = o.StoreID
    AND o.OrderStatus = 'Completed'
    AND o.OrderDate >= '2026-10-01'
    AND o.OrderDate < '2026-11-01'
LEFT JOIN OrderItems_Clean oi ON o.OrderID = oi.OrderID
GROUP BY r.RegionName, s.StoreID, s.StoreName
ORDER BY r.RegionName, s.StoreID;

-- Question 10B: Return value by store

SELECT
    r.RegionName,
    s.StoreID,
    s.StoreName,
    ROUND(COALESCE(SUM(rt.ReturnQuantity * oi.UnitPrice), 0), 2)
        AS ReturnValue
FROM Stores s
JOIN Regions r ON s.RegionID = r.RegionID
LEFT JOIN Orders o ON s.StoreID = o.StoreID
    AND o.OrderStatus = 'Completed'
LEFT JOIN OrderItems_Clean oi ON o.OrderID = oi.OrderID
LEFT JOIN Returns rt ON oi.OrderItemID = rt.OrderItemID
    AND rt.ReturnDate >= '2026-10-01'
    AND rt.ReturnDate < '2026-11-01'
GROUP BY r.RegionName, s.StoreID, s.StoreName
ORDER BY r.RegionName, s.StoreID;