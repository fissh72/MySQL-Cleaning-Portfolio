# MySQL-Cleaning-Portfolio
End-to-end data cleaning and standardization of a messy sales dataset using MySQL. Features advanced techniques like Window Functions (ROW_NUMBER), multi-format date conversion (STR_TO_DATE), and string manipulation.
# World Layoffs Data Cleaning Project

## Project Overview
In this project, I performed a comprehensive data cleaning process on a raw dataset containing global tech layoffs. The goal was to transform the data from a messy, redundant format into a structured, reliable dataset ready for business analysis.

## 🛠️ Data Cleaning Roadmap
1. **Remove Duplicates**: Identified and removed redundant entries to ensure data unique integrity.
2. **Standardize Data**: Fixed naming inconsistencies (e.g., Crypto/CryptoCurrency) and trimmed whitespace.
3. **Handle Null & Blank Values**: Populated missing information using self-joins and removed unusable records.
4. **Schema Optimization**: Converted data types (Strings to Dates) and dropped unnecessary helper columns.

## 🚀 Technical Highlights
- **Window Functions**: Used `ROW_NUMBER()` with `PARTITION BY` to isolate duplicates.
- **Self-Joins**: Implemented joins to fill missing `industry` data by matching companies with existing records.
- **Pattern Matching**: Used `LIKE` and `TRIM` to clean country names and industry categories.
- **Type Conversion**: Mastered the `STR_TO_DATE` function to fix inconsistent date strings.

## 📊 Before & After
*View the repository images for the transformation from raw text to structured SQL tables.*
<img width="1920" height="1080" alt="Screenshot (205)" src="https://github.com/user-attachments/assets/3d1b5d6b-c155-4904-8478-ffddab7de9be" />
Raw Dataset with inconsistencies
<img width="1920" height="1080" alt="Screenshot (206)" src="https://github.com/user-attachments/assets/37c37dd4-abf3-4b08-8c7c-2e84307f8004" />
Cleaned and Standardized Dataset

## 💻 How to Use
1. Import the `layoffs.csv` file into your MySQL database.
2. Run the `Data_Cleaning_Script.sql` file provided in this repository.
