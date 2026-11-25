
# Retail SQL Assessment

## Project Overview

This project involves cleaning, organizing and analysing retail sales data using SQL. The objective is to evaluate regional sales performance, store performance, product returns and customer order activity for October 2026.

## Tools and Technologies

- SQL
- Online SQL Platform: Sqlime (https://sqlime.org/)
- Database Engine: SQLite
- Visual Studio Code
- Microsoft Word
- Microsoft PowerPoint

## Project Structure

```text
retail-sql-assessment/
├── data/
├── scripts/
├── screenshots/
├── diagrams/
├── presentation/
├── Retail SQL Assessment.docx
└── README.md
```

## Dataset

The original dataset contains six tables:

| Table | Number of Records |
|---|---:|
| Customers | 100 |
| Stores | 6 |
| Products | 24 |
| Orders | 300 |
| OrderItems | 490 |
| Returns | 80 |

A Regions table was created to standardize store regions.

## Data Cleaning

- Standardized inconsistent region names into North, South and West.
- Mapped all six stores to their respective regions.
- Verified that no stores remained unmapped.
- Created a working copy of the OrderItems table.
- Removed one duplicate order item by retaining the latest LoadedAt record.
- Used the cleaned table containing 489 records for subsequent analysis.

## SQL Analysis

The following analyses were performed:

- Orders with matching customers.
- Orders with unmatched customer IDs.
- Customers with no orders.
- Order lines with multiple return transactions.
- Regional gross sales, return values and net sales.
- Regional sales rankings.
- Store-level sales performance.
- Product category return analysis.

## Key Findings

- Total completed orders: 190
- Total gross sales: $42,757.75
- Total return value: $4,131.75
- Total net sales: $38,626.00
- North recorded the highest gross sales.
- South recorded the highest net sales of $13,037.00.
- Cedar Market was the highest-performing store with net sales of $7,112.50.
- North recorded the highest return value of $1,562.25.
- Electronics contributed the highest return value of $669.00 in the North region.

## Management Recommendations

- Investigate the reasons for high Electronics returns in the North region.
- Improve product quality checks, packaging and product descriptions where necessary.
- Evaluate and share successful practices from high-performing stores such as Cedar Market.

## Execution Instructions

1. Open Sqlime using https://sqlime.org/.
2. Create the database tables using 01_create_tables.sql.
3. Execute the six insert files from the data folder in numerical order.
4. Execute 02_Q1_Standardize_Regions.sql.
5. Execute 03_Q2_Remove_Duplicates.sql.
6. Execute the remaining SQL scripts in numerical order.
7. Refer to the screenshots folder for query outputs.

## Deliverables

- SQL scripts
- Original data insertion files
- SQL output screenshots
- Retail assessment worksheet
- PowerPoint slide presenting key findings and recommendations

## Conclusion

The analysis identified important differences in regional and store-level sales performance. The findings can help management reduce product returns, improve operational efficiency and increase net sales.
