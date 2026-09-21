# Verified measure-reference inventory

Evidence level: **measure names referenced in PBIX visual expressions**, not a complete semantic-model inventory. All 21 names below reference `!Measures`. No DAX expression, format string, denominator, target logic or result was extracted. Names are preserved exactly, including the embedded space in `Running _Total_Sales`.

| Exact name | Referenced on | DAX |
| --- | --- | --- |
| `Average_Order_Value` | Regional Analysis, Sales Overview | Not extracted |
| `Average_Sales_per_Customer` | Customer Analysis | Not extracted |
| `Average_Shipping_Days` | Shipping & Operations | Not extracted |
| `Count_Customers` | Customer Analysis, Sales Overview | Not extracted |
| `Count_Orders` | Customer Analysis, Regional Analysis, Sales Overview, Shipping & Operations | Not extracted |
| `Count_Orders_%` | Shipping & Operations | Not extracted |
| `Orders_per_Customer` | Customer Analysis | Not extracted |
| `Profit_Margin_%` | Customer Analysis, Product Analysis, Regional Analysis, Sales Overview | Not extracted |
| `Return_Rate_%` | Returns | Not extracted |
| `Returned_Orders` | Returns | Not extracted |
| `Returned_Sales` | Returns | Not extracted |
| `Returned_Sales_%` | Returns | Not extracted |
| `Running _Total_Sales` | Growth & Trends, Sales Overview | Not extracted |
| `Sales_Gauge_Max` | Sales Overview | Not extracted |
| `Sales_Previous_Year` | Growth & Trends, Sales Overview | Not extracted |
| `Sales_Target` | Growth & Trends, Sales Overview | Not extracted |
| `Sales_YoY_%` | Growth & Trends, Sales Overview | Not extracted |
| `Total_Profit` | Customer Analysis, Growth & Trends, Product Analysis, Regional Analysis, Sales Overview, Shipping & Operations | Not extracted |
| `Total_Quantity` | Customer Analysis, Product Analysis | Not extracted |
| `Total_Sales` | Customer Analysis, Growth & Trends, Product Analysis, Regional Analysis, Returns, Sales Overview, Shipping & Operations | Not extracted |
| `Total_Sales_%` | Customer Analysis, Product Analysis | Not extracted |

## Requested concept coverage

| Concept | Verified reference / status |
| --- | --- |
| Total Sales / Profit / Quantity | `Total_Sales`, `Total_Profit`, `Total_Quantity` |
| Total Orders / Customers | `Count_Orders`, `Count_Customers`; distinct-count logic unverified |
| Average Order Value / Profit Margin | `Average_Order_Value`, `Profit_Margin_%`; formulas unverified |
| Average Discount | No corresponding Measure expression identified; model absence not established |
| Previous Year / YoY / Running Total | `Sales_Previous_Year`, `Sales_YoY_%`, `Running _Total_Sales` |
| Shipping Days | No standalone measure or calculated-column definition verified |
| Average Shipping Days | `Average_Shipping_Days` |
| Return Rate / Returned Sales | `Return_Rate_%`, `Returned_Sales` |

## Binding ambiguity

The Product Analysis matrix retains a query reference `!Measures.%_of_Total`, but the projection’s actual Measure expression points to `Total_Sales_%`. This audit does **not** count `%_of_Total` as a separately verified measure. Inspect this alias in Desktop before renaming anything. See visual `15d6a8bc10c35ecc88b1` in [report-structure.json](report-structure.json).

Names suggest analytical intent only. Do not infer `SUM`, `DIVIDE`, `DISTINCTCOUNT`, time-intelligence functions or shipping-date arithmetic from a name. Obtain a TMDL/PBIP or trusted metadata export to publish original formulas and validate semantics.
