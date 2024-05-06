# Nashville Housing - Data Cleaning and Transformation in SQL Server

This project demonstrates my skills in data cleaning and transformation using SQL Server. The goal was to prepare a raw dataset for analysis by performing various cleaning and transformation tasks.

## Usage

The SQL script `Data Prep - Nashville Housing.sql` contains the queries used for this project. To run the script, you will need to access SQL Server instance and the raw dataset `Raw Data - Nashville Housing.xlsx`. To view final result dataset you can access the excel file `Data Cleaned - Nashville Housing.xlsx`.

## Project Overview

In this project, I worked with a dataset `Raw Data - Nashville Housing.xlsx` that required cleaning and restructuring to ensure data integrity and usability. The following tasks were performed:

1. **Standardize Date Format**: `SaleDate` column were converted to a consistent format (YYYY-MM-DD) to fasilitate data analysis and integration with other systems.

![Alt Text]('Images/Date Convert.jpg')
   
3. **Populate Missing Data**: Missing values in column `PropertyAddress` were identified and filled  with appropriate values based on matching values on the same `ParcelID`.

4. **Breakout out Address Columns**: The address columns `PropertyAddress` and `OwnerAddress` were split into individual columns for street address, city, and state, enabling more useful analysis.

5. **Standardize Values**: Values in column `SoldAsVacant` consisted of various representation (Y, Yes, N, No). This values were standardize to a consistent format (Yes/No) for better analysis.

6. **Remove Duplicates**: Duplicates records were identified and removed from the dataset to ensure data integrity and accurate analysis.

7. **Reorder Columns**: The column order in table was restructured to improve data organization and accessibility.

## Workflow

1. **Create Temporary Table**: A temporary table was created to hold the cleaned and transformed data in order to avoid any potential damage to the original data.
2. **Perform Data Cleaning and Transformation**: SQL queries were executed to clean and transform the data, storing the results in the temporary table.
3. **Create Permanent Table**: After completing the cleaning and transformation tasks, a new permanent table was created based on the temporary table, serving as the final cleaned dataset.

## Technical Skills Demonstrated

- **SQL Server**: Proficient in writing SQL queries for data cleaning, transformation, and table management tasks.
- **Data Cleaning and Preprocessing**: Demonstrated ability to handle missing data, inconsistent formats, and data quality issues.
- **Data Transformation**: Skilled in restructuring and reformatting data to meet specific requirements and improve data usability.
- **Attention to Detail**: Carefully identified and addressed data quality issues to ensure the integrity of the cleaned dataset.
- **Workflow Management**: Implemented a structured workflow to maintain data integrity and create a reliable final dataset.

## Conclusion

This project showcases my skills in data cleaning and transformation using SQL Server. By performing these tasks and following a structured workflow, I prepared a raw dataset for reliable analysis and integration with other systems or applications. Feel free to explore the code and provide feedback or suggestions for improvement.
