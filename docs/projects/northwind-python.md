# Northwind | SQL-to-Python analysis

[Portfolio home](../../README.md) · [Jupyter notebook](../../pyodbc%20class.ipynb)

## Purpose and evidence

Explore Northwind data by querying SQL Server from Python and visualizing the results.

The notebook uses `pyodbc` to connect to a local Northwind database, `pandas.read_sql_query` to load query results, and seaborn/Matplotlib to chart:

- Top ten customers by the sum of unit price multiplied by quantity.
- Supplier counts by country.
- Order counts by shipping country.
- Product counts by supplier and category.

These examples demonstrate a SQL-to-DataFrame-to-chart workflow. The customer-spend calculation does not apply the order-detail discount.

## Requirements and review notes

Use Jupyter, a local SQL Server with Northwind installed, a compatible SQL Server ODBC driver and Python packages matching the notebook imports. The notebook imports pandas, pandasql, seaborn, matplotlib, numpy and pyodbc; some imports are not used by the shown analysis.

The connection uses `localhost`, the `NorthWind` database, the `SQL SERVER` driver and Windows trusted authentication. Adjust these settings to match your environment. Package versions and database setup are not recorded.

Saved outputs are included, but the notebook has not been rerun in a clean environment for this documentation review. This is Northwind analysis, separate from the NFL Python project.
