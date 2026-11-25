-- Question 9: Regional sales comparison

WITH Gross AS (
    SELECT s.RegionID,
           SUM(oi.Quantity * oi.UnitPrice) AS GrossSales
    FROM Orders o
    JOIN OrderItems_Clean oi ON o.OrderID = oi.OrderID
    JOIN Stores s ON o.StoreID = s.StoreID
    WHERE o.OrderStatus = 'Completed'
    AND o.OrderDate >= '2026-10-01'
    AND o.OrderDate < '2026-11-01'
    GROUP BY s.RegionID
),
ReturnTotals AS (
    SELECT s.RegionID,
           SUM(rt.ReturnQuantity * oi.UnitPrice) AS ReturnValue
    FROM Returns rt
    JOIN OrderItems_Clean oi ON rt.OrderItemID = oi.OrderItemID
    JOIN Orders o ON oi.OrderID = o.OrderID
    JOIN Stores s ON o.StoreID = s.StoreID
    WHERE o.OrderStatus = 'Completed'
    AND rt.ReturnDate >= '2026-10-01'
    AND rt.ReturnDate < '2026-11-01'
    GROUP BY s.RegionID
),
Sales AS (
    SELECT r.RegionName,
           ROUND(COALESCE(g.GrossSales, 0), 2) AS GrossSales,
           ROUND(COALESCE(t.ReturnValue, 0), 2) AS ReturnValue,
           ROUND(COALESCE(g.GrossSales, 0) -
                 COALESCE(t.ReturnValue, 0), 2) AS NetSales
    FROM Regions r
    LEFT JOIN Gross g ON r.RegionID = g.RegionID
    LEFT JOIN ReturnTotals t ON r.RegionID = t.RegionID
)
SELECT *,
       RANK() OVER (ORDER BY GrossSales DESC) AS GrossRank,
       RANK() OVER (ORDER BY NetSales DESC) AS NetRank
FROM Sales
ORDER BY NetRank, RegionName;