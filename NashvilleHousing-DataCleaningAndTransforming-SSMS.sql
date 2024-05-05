/*

Data Cleaning and Transforming in Microsoft SQL Server Management Studio

Skills: Data Cleaning dan Transforming


*/


-- a quick glance at the table layout.

EXEC sp_help '[dbo].[Nashville Housing]'

SELECT * 
FROM [dbo].[Nashville Housing]


-- Create temporary table from table Nashville Housing
-- (To prevent any potential damage to the original data when table is transformed)

SELECT *
INTO #nashville_housing
FROM [dbo].[Nashville Housing]

SELECT *
FROM #nashville_housing


-- Standardize Date Format (DATETIME -> DATE)

SELECT SaleDate, CONVERT(DATE, SaleDate)
FROM #nashville_housing

ALTER TABLE #nashville_housing
ADD SaleDateConverted DATE

UPDATE #nashville_housing
SET SaleDateConverted = CONVERT(DATE, SaleDate)


-- Populate Property Addres data (Because there are some missing data in Property Address)

SELECT a.[UniqueID ], a.ParcelID, a.PropertyAddress,b.[UniqueID ], b.ParcelID, b.PropertyAddress
FROM #nashville_housing a
JOIN #nashville_housing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE A.PropertyAddress IS NULL

SELECT a.[UniqueID ], a.ParcelID, a.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM #nashville_housing a
JOIN #nashville_housing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE A.PropertyAddress IS NULL

UPDATE a
SET a.PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM #nashville_housing a
JOIN #nashville_housing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE A.PropertyAddress IS NULL

-- To confirm that the NULL values in Property Address have been filled
SELECT *  
FROM #nashville_housing
WHERE #nashville_housing.PropertyAddress IS NULL


-- Breaking out address columns

-- 1. Property Address Column

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))
FROM #nashville_housing

ALTER TABLE #nashville_housing
ADD PropertyStreetAddress NVARCHAR(255)

UPDATE #nashville_housing
SET PropertyStreetAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)

ALTER TABLE #nashville_housing
ADD PropertyCityAddress NVARCHAR(255)

UPDATE #nashville_housing
SET PropertyCityAddress = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


-- 2. Owner Address Column

SELECT OwnerAddress
, PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) street
, PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2) city
, PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1) state
FROM #nashville_housing

ALTER TABLE #nashville_housing
ADD OwnerStreetAddress NVARCHAR(255)

UPDATE #nashville_housing
SET OwnerStreetAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

ALTER TABLE #nashville_housing
ADD OwnerCityAddress NVARCHAR(255)

UPDATE #nashville_housing
SET OwnerCityAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE #nashville_housing
ADD OwnerStateAddress NVARCHAR(255)

UPDATE #nashville_housing
SET OwnerStateAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)


-- Change "Y" and "N" to "Yes" and "No" in "SoldAsVacant" column

SELECT DISTINCT SoldAsVacant, COUNT(SoldAsVacant) AS CountOfElements
FROM #nashville_housing
GROUP BY SoldAsVacant
ORDER BY SoldAsVacant

SELECT SoldAsVacant
, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	   WHEN SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
FROM #nashville_housing
ORDER BY SoldAsVacant

UPDATE #nashville_housing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	   WHEN SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

-- Confirm the changes
SELECT DISTINCT SoldAsVacant
FROM #nashville_housing


-- Remove Duplicates

--  1. Check if there is duplicates

WITH CTE_row_num AS(
SELECT 
	ROW_NUMBER() OVER (PARTITION BY ParcelID,
									PropertyAddress,
									SaleDate,
									SalePrice,
									LegalReference
									ORDER BY UniqueID) AS row_num, *
FROM #nashville_housing)
SELECT *
FROM CTE_row_num
WHERE row_num > 1

-- 2. Remove the duplicates

WITH CTE_row_num AS(
SELECT 
	ROW_NUMBER() OVER (PARTITION BY ParcelID,
									PropertyAddress,
									SaleDate,
									SalePrice,
									LegalReference
									ORDER BY UniqueID) AS row_num, *
FROM #nashville_housing)
DELETE
FROM CTE_row_num
WHERE row_num > 1


-- Delete unused columns

ALTER TABLE #nashville_housing
DROP COLUMN PropertyAddress, SaleDate, OwnerAddress

SELECT *
FROM #nashville_housing

-- Create permanent table from the temp table for further analysis

SELECT *
INTO nashville_housing_cleaned
FROM #nashville_housing

SELECT * 
FROM nashville_housing_cleaned

-- Finally I reordered the columns from the table design