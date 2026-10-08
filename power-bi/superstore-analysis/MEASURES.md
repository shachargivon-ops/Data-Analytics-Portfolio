# Final measure-reference inventory

Evidence level: names found in Measure expressions within saved visuals, not a full semantic-model inventory. All 45 names reference `!Measures`. No DAX body or evaluated measure value was recovered.

| Exact name | Referenced on | DAX body |
| --- | --- | --- |
| `Average_Order_Value` | Regional Analysis, Sales Overview | Not extracted |
| `Average_Sales_per_Customer` | Customer Analysis | Not extracted |
| `Average_Shipping_Days` | Shipping & Operations | Not extracted |
| `Count_Customers` | Customer Analysis, Sales Overview | Not extracted |
| `Count_Orders` | Customer Analysis, Regional Analysis, Sales Overview, Shipping & Operations | Not extracted |
| `Count_Orders_%` | Shipping & Operations | Not extracted |
| `ES_Central_Margin` | Executive Summary & Key Insights | Not extracted |
| `ES_Central_Sales` | Executive Summary & Key Insights | Not extracted |
| `ES_Central_Share` | Executive Summary & Key Insights | Not extracted |
| `ES_Customers` | Executive Summary & Key Insights | Not extracted |
| `ES_Furniture_Margin` | Executive Summary & Key Insights | Not extracted |
| `ES_Furniture_Sales` | Executive Summary & Key Insights | Not extracted |
| `ES_Furniture_Share` | Executive Summary & Key Insights | Not extracted |
| `ES_Growth_Context` | Executive Summary & Key Insights | Not extracted |
| `ES_Growth_Context2` | Executive Summary & Key Insights | Not extracted |
| `ES_Growth_Value` | Executive Summary & Key Insights | Not extracted |
| `ES_Margin` | Executive Summary & Key Insights | Not extracted |
| `ES_Orders` | Executive Summary & Key Insights | Not extracted |
| `ES_Profit` | Executive Summary & Key Insights | Not extracted |
| `ES_Returns_Rate` | Executive Summary & Key Insights | Not extracted |
| `ES_Returns_Sales` | Executive Summary & Key Insights | Not extracted |
| `ES_Returns_Share` | Executive Summary & Key Insights | Not extracted |
| `ES_Sales` | Executive Summary & Key Insights | Not extracted |
| `ES_Technology_Margin` | Executive Summary & Key Insights | Not extracted |
| `ES_Technology_Sales` | Executive Summary & Key Insights | Not extracted |
| `ES_Technology_Share` | Executive Summary & Key Insights | Not extracted |
| `ES_West_Margin` | Executive Summary & Key Insights | Not extracted |
| `ES_West_Sales` | Executive Summary & Key Insights | Not extracted |
| `ES_West_Share` | Executive Summary & Key Insights | Not extracted |
| `Orders_per_Customer` | Customer Analysis | Not extracted |
| `Profit_Margin_%` | Customer Analysis, Product Analysis, Regional Analysis, Sales Overview | Not extracted |
| `Return_Rate_%` | Returns | Not extracted |
| `Returned_Lines` | Returns | Not extracted |
| `Returned_Orders` | Returns | Not extracted |
| `Returned_Sales` | Returns | Not extracted |
| `Returned_Sales_%` | Returns | Not extracted |
| `Running_Total_Sales` | Growth & Trends, Sales Overview | Not extracted |
| `Sales_Gauge_Max` | Sales Overview | Not extracted |
| `Sales_Previous_Year` | Growth & Trends, Sales Overview | Not extracted |
| `Sales_Target` | Growth & Trends, Sales Overview | Not extracted |
| `Sales_YoY_%` | Growth & Trends, Sales Overview | Not extracted |
| `Total_Profit` | Customer Analysis, Executive Summary & Key Insights, Growth & Trends, Product Analysis, Regional Analysis, Sales Overview, Shipping & Operations | Not extracted |
| `Total_Quantity` | Customer Analysis, Product Analysis | Not extracted |
| `Total_Sales` | Customer Analysis, Executive Summary & Key Insights, Growth & Trends, Product Analysis, Regional Analysis, Returns, Sales Overview, Shipping & Operations | Not extracted |
| `Total_Sales_%` | Customer Analysis, Product Analysis | Not extracted |

## Technically verifiable DAX source

The package contains `DAXQueries/Query%201.dax`, but it is zero bytes; it supplies no expression to publish. Query references are not DAX implementations. The compressed `DataModel` was not decoded. Do not reconstruct `SUM`, `DIVIDE`, `DISTINCTCOUNT`, date arithmetic, target logic or context removal from names.

The final report's actual Measure expression references `Running_Total_Sales` (the archived report used `Running _Total_Sales`) and adds `Returned_Lines` and executive `ES_*` references. Some final queryRef aliases still say `Running _Total_Sales`; the actual Measure expression is authoritative for this inventory. These changes came from the supplied final report; this update does not edit formulas. The `%_of_Total` matrix query alias still maps to the actual `Total_Sales_%` Measure expression and is not a separate verified measure.

Average Discount and standalone Shipping Days definitions are not verified. The executive footer states that returned orders count unique Order IDs while returned-line charts retain line detail; this intent does not verify the original DAX denominator or distinct-count implementation. Export original formulas and formats from Desktop/TMDL/PBIP before documenting them.

Evidence: [full source definitions](report-structure.json), [page guide](REPORT-PAGES.md).

## Supporting evidence added on 2026-10-08

The original model screenshot adds visible names `Average_Discount` and `Average_Sales` in !Measures, beyond the 45 names referenced by final report visuals. Their formulas and values are not visible; they are not added to the visual-expression count. Other visible names match Average_Order_Value and Average_Sales_per_Customer.

The supplied PDF now establishes displayed KPI values and analytical purposes, including prior-year/YoY/cumulative reporting, sales/profit/margin, customers/orders, shipping duration and order-versus-line returns. [Rendered KPI provenance](RENDERED-EVIDENCE.md) supplies values; [business insights](BUSINESS-INSIGHTS.md) supplies interpretations. The earlier statements that no rendered values were available describe the previous audit stage. DAX bodies, formats, denominator implementation and context-removal expressions remain unverified. The empty DAX query and compressed model extraction status are unchanged.

| Referenced family | Analytical purpose demonstrated in the PDF |
| --- | --- |
| Total_Sales, Total_Profit, Profit_Margin_%, Total_Quantity, Total_Sales_% | Revenue, profit, margin, quantity and contribution comparisons |
| Count_Orders, Count_Customers, Average_Order_Value, Average_Sales_per_Customer, Orders_per_Customer | Order/customer activity and average economics |
| Sales_Previous_Year, Sales_YoY_%, Running_Total_Sales | Prior-year comparison, annual growth and cumulative sales |
| Sales_Target, Sales_Gauge_Max | Target comparison and gauge scaling; definitions need review |
| Average_Shipping_Days, Count_Orders_% | Shipping-duration and order-share comparison; duration chart labeled line-weighted |
| Returned_Orders, Returned_Lines | Separate order-level KPI and line-level breakdowns |
| Returned_Sales, Returned_Sales_%, Return_Rate_% | Returned-sales value/share and order return-rate reporting |
| ES_* | Executive KPI/context cards for sales, profit, margin, customers/orders, category/region contributions, growth and returns |

This table documents displayed analytical purpose, not formula semantics. Screenshot-only Average_Discount and Average_Sales have names/icons but no visible formula or rendered metric in this evidence set.
