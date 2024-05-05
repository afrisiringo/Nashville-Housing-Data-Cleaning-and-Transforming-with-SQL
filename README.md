# Nashville Housing - Data Cleaning and Transformation in SQL Server

This project demonstrates my skills in data cleaning and transformation using SQL Server. The goal was to prepare raw dataset for analysis by performing various cleaning and transformation tasks.

## Project Overview

In this project, I worked with a dataset that required cleaning and restructuring to ensure data integrity and usability. The following tasks were performed:

1. **Standardize Date Format**: "SaleDate" column were converted to a consistent format (YYYY-MM-DD) to fasilitate data analysis and integration with other systems.
   
2. **Populate Missing Data**: Missing values in column "PropertyAddress" were identified and filled  with appropriate values based on matching values on the same "ParcelID".

3. **Breakout out Address Columns**: The address columns (i.e. "PropertyAddress" and "OwnerAddress") were split into individual columns for street address, city, and state, enabling more useful analysis.

4. **Standardize Values**: Values in column "SoldAsVacant" consisted of various representation (Y, Yes, N, No). This values were standardize to a consistent format (Yes/No) for better consistency.

5. **Remove Duplicates**: Duplicates records were identified and removed from the dataset to ensure data integrity and accurate analysis.

6. **Reorder Columns**: The column order in table was restructured to imporove data organization and accessibility.

## Workflow


1. **Create Temporary Table**: A temporary table was created to hold the cleaned and transformed data.
2. **Perform Data Cleaning and Transformation**: SQL queries were executed to clean and transform the data, storing the results in the temporary table.
3. **Create Permanent Table**: After completing the cleaning and transformation tasks, a new permanent table was created based on the temporary table, serving as the final cleaned dataset.

## Technical Skills Demonstrated

- **SQL Server**: Proficient in writing SQL queries for data cleaning, transformation, and table management tasks.
- **Data Cleaning and Preprocessing**: Demonstrated ability to handle missing data, inconsistent formats, and data quality issues.
- **Data Transformation**: Skilled in restructuring and reformatting data to meet specific requirements and improve data usability.
- **Attention to Detail**: Carefully identified and addressed data quality issues to ensure the integrity of the cleaned dataset.
- **Workflow Management**: Implemented a structured workflow to maintain data integrity and create a reliable final dataset.

## Usage

The SQL script `data_cleaning.sql` contains the queries used for this project. To run the script, you will need access to a SQL Server instance and the source database containing the raw dataset.

## Conclusion

This project showcases my skills in data cleaning and transformation using SQL Server. By performing these tasks and following a structured workflow, I prepared a raw dataset for reliable analysis and integration with other systems or applications. Feel free to explore the code and provide feedback or suggestions for improvement.
