-- Create Regions table
CREATE TABLE Regions (
    RegionID INTEGER PRIMARY KEY,
    RegionName TEXT UNIQUE NOT NULL
);

INSERT INTO Regions (RegionID, RegionName)
VALUES
    (1, 'North'),
    (2, 'South'),
    (3, 'West');

-- Add RegionID to Stores
ALTER TABLE Stores
ADD COLUMN RegionID INTEGER REFERENCES Regions(RegionID);

-- Standardize regions
UPDATE Stores
SET RegionID = CASE
    WHEN UPPER(TRIM(RegionRaw)) IN ('N', 'NORTH') THEN 1
    WHEN UPPER(TRIM(RegionRaw)) IN ('S', 'SOUTH') THEN 2
    WHEN UPPER(TRIM(RegionRaw)) IN ('W', 'WEST') THEN 3
    ELSE NULL
END;

-- Display region mapping
SELECT
    s.StoreID,
    s.StoreName,
    s.RegionRaw,
    r.RegionID,
    r.RegionName
FROM Stores s
LEFT JOIN Regions r
ON s.RegionID = r.RegionID
ORDER BY s.StoreID;

-- Check unmapped stores
SELECT s.StoreID, s.StoreName, s.RegionRaw
FROM Stores s
LEFT JOIN Regions r
ON s.RegionID = r.RegionID
WHERE r.RegionID IS NULL;