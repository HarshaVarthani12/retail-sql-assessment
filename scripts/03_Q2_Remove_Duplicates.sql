-- Question 2: Remove duplicate order lines

CREATE TABLE OrderItems_Clean AS
SELECT * FROM OrderItems;

DELETE FROM OrderItems_Clean
WHERE rowid IN (
    SELECT rid
    FROM (
        SELECT rowid AS rid,
            ROW_NUMBER() OVER (
                PARTITION BY OrderItemID
                ORDER BY LoadedAt DESC, rowid DESC
            ) AS rn
        FROM OrderItems_Clean
    )
    WHERE rn > 1
);

CREATE UNIQUE INDEX idx_clean_orderitem
ON OrderItems_Clean(OrderItemID);

-- Verify duplicate removal

SELECT
    (SELECT COUNT(*) FROM OrderItems) AS BeforeCleaning,
    (SELECT COUNT(*) FROM OrderItems_Clean) AS AfterCleaning,
    (SELECT COUNT(*) FROM OrderItems) -
    (SELECT COUNT(*) FROM OrderItems_Clean) AS DuplicatesRemoved;