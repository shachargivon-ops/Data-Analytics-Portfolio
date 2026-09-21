# SQL Business Analysis – WideWorldImporters

[Portfolio](../../README.md) · [Original SQL script](../../SQLQuery1%20%20Project%202%20%20SQL%20Data%20Analysis%20%28Shachar%20Givon%29.sql)

**Deliverable:** ten SQL learning exercises covering sales reporting, customer behavior and product analysis.

## Business / Research Question

How do sales vary over time, which customers and products contribute most, and which customers show unusually long gaps since their last order?

## Dataset

The script references the WideWorldImporters schemas `Sales`, `Warehouse`, `Purchasing` and `Application`. It joins invoices and invoice lines, customers, orders, stock items, suppliers and geographic tables. The database is not bundled; dataset version and extraction date are not recorded.

## Tools

SQL / Microsoft SQL Server (T-SQL).

## Data Preparation

Queries join related tables, extract years/months/quarters, aggregate transactions and use CTEs for intermediate results. Exercise 10 groups names beginning with Wingtip or Tailspin into common customer names. No separate data-cleaning pipeline is included.

## Analysis

| Exercise | Focus | Techniques |
| --- | --- | --- |
| 1 | Annual sales, annualized revenue and year-on-year growth | CTEs, SUM, AVG, LAG |
| 2 | Top customers each quarter | JOINs, aggregation, RANK |
| 3 | Top products by sales value | TOP, CTEs, ROW_NUMBER |
| 4 | Listed retail-price difference for current stock items | Filtering, ROW_NUMBER |
| 5 | Supplier product lists | JOIN, STRING_AGG |
| 6 | High-spending customers and geography | Multi-table JOINs, SUM |
| 7 | Monthly and cumulative sales | Windowed SUM, ROLLUP, GROUPING |
| 8 | Monthly order counts by year | PIVOT |
| 9 | Rule-based potential-churn detection | LAG, DATEDIFF, AVG, CASE |
| 10 | Customer-group distribution by category | CASE, COUNT DISTINCT, CROSS JOIN |

## Key Metrics

| Metric | Definition in the script | Interpretation |
| --- | --- | --- |
| Annual sales | Sum of monthly `ExtendedPrice` totals | Uses invoice-line extended price |
| Annualized revenue | Average of observed monthly totals × 12 | Missing months affect the annualization |
| Product/customer sales value | `SUM(UnitPrice * Quantity)` | Does not deduct cost |
| Listed price difference | `RecommendedRetailPrice - UnitPrice` | Not realized profit |
| Monthly order count | Count of order IDs | Pivot has fixed year columns 2013–2016 |
| Potential churn | Days since last customer order > 2 × average order gap | Measured relative to the dataset's latest order |
| Customer-group share | Distinct common customer names in category / total distinct common names | Measures grouped names, not all accounts |

## Key Insights

No executed result tables are included, so the repository does not establish which year, customer or product leads. The source demonstrates how to calculate and compare these measures; it does not establish business impact or validated churn predictions.

## Visualizations

No charts are included. Exercises 7 and 8 produce report-style cumulative totals and a pivoted table when executed.

## Technical Skills Demonstrated

CTEs, JOINs, aggregations, window functions, LAG, RANK, ROW_NUMBER, PIVOT, ROLLUP, STRING_AGG, date calculations and conditional logic.

## Review and Run Notes

Use a SQL Server environment supporting the functions used in the script, with WideWorldImporters installed. Select the database and run each exercise separately. Comment out or skip the opening plain-text title; dashed lines beginning with `--` are SQL comments. When combining statements, review statement termination before CTEs.

Known interpretation issues remain in the original source:
- Exercise 3 labels sales value as `TotalProfit`; no cost is deducted.
- Exercise 7 calculates money although the prompt refers to product quantities.
- Percentage formatting with `LEFT` can truncate values; zero-denominator handling needs review.
- `RANK() <= 5` may include more than five customers when values tie.
- Exercise 9 excludes customers without a previous order from its average-gap calculation and repeats the customer flag on order rows. It is not a one-row-per-customer output.

The script was inspected, not executed, during this documentation review.
