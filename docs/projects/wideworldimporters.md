# SQL analysis | WideWorldImporters

[Portfolio home](../../README.md) · [SQL source](../../SQLQuery1%20%20Project%202%20%20SQL%20Data%20Analysis%20%28Shachar%20Givon%29.sql)

## Purpose

Explore sales performance and customer behavior using the WideWorldImporters SQL Server schema. The script contains ten numbered exercises covering reporting questions such as annual revenue, leading customers, product sales and customer inactivity.

## What the source demonstrates

- Multi-table joins across sales, stock items, suppliers and geography.
- CTEs and aggregations for monthly and annual reporting.
- `LAG`, `RANK` and `ROW_NUMBER` for comparisons and rankings.
- Running totals, `ROLLUP`, `PIVOT` and `STRING_AGG`.
- A rule-based potential-churn flag based on time since the last order.

## Guide to the exercises

| Exercises | Analytical question |
| --- | --- |
| 1–2 | How do annualized sales change, and which customers lead each quarter? |
| 3–4 | Which products lead by sales value or listed price difference? |
| 5–6 | What do suppliers stock, and where are the highest-spending customers? |
| 7–8 | How do monthly sales totals and order counts vary? |
| 9–10 | Which customers show inactivity, and how are customer groups distributed? |

## How to review or run

Use a SQL Server instance with the WideWorldImporters sample database and a SQL client. Select that database before executing individual exercises. The opening title and dashed separator are plain text rather than a valid SQL comment; comment out or skip those lines before execution. No database backup or captured result tables are included.

## Interpretation and limitations

- Exercise 3 calls `SUM(UnitPrice * Quantity)` “TotalProfit.” This calculates sales value without deducting cost; it does not establish profit.
- Exercise 7 calculates monetary sales totals, although its prompt refers to quantities.
- The annualized revenue calculation averages months present in the data and multiplies by 12; missing months affect its meaning.
- The inactivity flag is a heuristic relative to the latest order in the dataset, not a validated prediction of churn.
- `RANK() <= 5` can return more than five customers when values tie.
- Percentage strings use `LEFT`, which can truncate values. Result formatting and zero-denominator handling need review.
- Exercise 10 groups customer names into common names; its distribution represents those groups rather than a count of all customer accounts.

The source shows analytical techniques. No verified business outcome or performance improvement is claimed.
