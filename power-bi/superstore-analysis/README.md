# Power BI – Superstore Analysis

[Portfolio](../../README.md) · [Download Power BI report](Project%204%20Analyze%20Data%20with%20Power%20BI%20Superstore%20%28Shachar%20Givon%29.pbix) · [Inspect report structure](report-structure.json)

**Deliverable:** a seven-page Power BI report package with sales, customer, product, regional, return, shipping and growth views.

## Business / Research Question

How do sales, profitability, customer activity, returns and shipping performance vary across products, regions, customer segments and time?

## Dataset

The supplied file contains a Power BI DataModel and report definitions. Diagram metadata lists Orders, Customers, Products, Geography, Returns, two date-table entries (`DimDate` and `dimDate!`) and `!Measures`. Raw source files, refresh instructions and dataset provenance were not separately supplied. Relationship cardinalities and transformations were not verified.

## Tools

Power BI. The report visuals reference model measures. DAX is part of the stated stack, but the underlying expressions are stored inside the binary model and were not extracted in this review; no specific DAX function is claimed.

## Data Preparation

The package separates subject areas in its model diagram. The actual Power Query steps, type conversions, cleaning and relationship setup need inspection in Power BI Desktop or a text model export before they can be documented precisely.

## Analysis

| Page | Report content verified in definitions |
| --- | --- |
| Sales Overview | Sales, profit, margin, orders, customers, targets and time comparisons |
| Product Analysis | Category/subcategory comparisons, quantity, sales and profit |
| Customer Analysis | Segments, customer comparisons and orders per customer |
| Regional Analysis | Region/state/city views and a shape map |
| Returns | Returned orders/sales, return rates and return reasons |
| Shipping & Operations | Ship-mode comparisons and average shipping days |
| Growth & Trends | Year-on-year sales, running totals and configured forecasting visuals |
| Page 1 | Additional summary visuals; original page name retained |

## Key Metrics

Verified measure references include `Total_Sales`, `Total_Profit`, `Profit_Margin_%`, `Average_Order_Value`, `Count_Orders`, `Return_Rate_%`, `Average_Shipping_Days` and `Sales_YoY_%`. Their names indicate intended reporting topics; formulas, denominators, numeric values and correctness remain unverified. The extracted structure records all 21 referenced measure names.

## Key Insights

The package demonstrates broad reporting coverage and consistent use of filters and measures. No numeric findings, strongest region/product, validated forecast or business impact is asserted without inspecting rendered report values and model formulas.

## Visualizations

Report definitions include cards, line and bar/column charts, matrices, pie/donut charts, gauges, KPI visuals, shape maps, slicers and bookmark buttons. Conditional-formatting and forecast settings are present. Screenshots or a PDF export are still needed for a browser-friendly visual preview and layout verification.

## Technical Skills Demonstrated

Multi-page Power BI report construction, visual field bindings, slicer configuration, hierarchies, measure-based visuals, conditional formatting and bookmark configuration. Runtime filter behavior and refresh have not been tested.

## Opening the File

Download the linked `.pbix` file and open it directly in a compatible Power BI Desktop version. This file supersedes the earlier `.pbix.zip` for portfolio review. The earlier archive is retained to preserve existing files and links. The direct PBIX has seven report pages; the extra `Page 1` from the archive is absent. The file has not been opened in Power BI Desktop during this review.

For deeper review, provide a report PDF/screenshots and a PBIP/TMDL or measure export with source/refresh information. No analytical model or report logic was changed.
