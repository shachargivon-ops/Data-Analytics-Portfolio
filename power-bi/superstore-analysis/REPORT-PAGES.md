# Report pages

Source: the primary PBIX, in saved page order. All pages are configured at 1920 × 1080. Business questions below are editorial interpretations of verified field bindings, not findings. Visual counts include slicers and buttons. Full definitions and source member paths are in [report-structure.json](report-structure.json).

No page has rendered business findings available in this audit. The inventories document configuration; runtime interactions and values still require Desktop review.

## Sales Overview

**Business question:** How do sales, profit and order economics compare across time, segments and categories?

**KPIs / card bindings:** `!Measures.Average_Order_Value`, `!Measures.Count_Customers`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Sales_Gauge_Max`, `!Measures.Sales_Target`, `!Measures.Sales_YoY_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`

**Filters / slicers:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Compare current and previous-year sales, cumulative sales, segment/category sales and the configured sales target.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 3 NoFilter, 1 DataFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredColumnChart | `!Measures.Total_Sales`, `Customers.Segment` | `1d38aae7f0e68fb4da88` |
| cardVisual | `!Measures.Average_Order_Value`, `!Measures.Count_Customers`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Sales_YoY_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales` | `1f863fb394ae0627f735` |
| lineChart | `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `520d4443e56b5cfb5256` |
| clusteredColumnChart | `!Measures.Total_Sales`, `Products.Category` | `6c36e340894604682afd` |
| gauge | `!Measures.Sales_Gauge_Max`, `!Measures.Sales_Target`, `!Measures.Total_Sales` | `790f3421716a3df0fd14` |
| lineChart | `!Measures.Running _Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Day`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `8b9302949b02c625c6c4` |
| clusteredColumnChart | `!Measures.Sales_Previous_Year`, `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `addc9fa6545ed190fad1` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.

## Product Analysis

**Business question:** Which products combine sales volume with strong or weak profitability?

**KPIs / card bindings:** `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Quantity`, `!Measures.Total_Sales`, `!Measures.Total_Sales_%`

**Filters / slicers:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `Products.Sub-Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Compare category/subcategory sales and profit; inspect three TopN=10 product tables and the category-to-product matrix. Ranking results require a rendered report.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 2 DataFilter, 1 NoFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| tableEx | `!Measures.Total_Profit`, `Products.Product Name` | `008285e61a96715982a1` |
| clusteredColumnChart | `!Measures.Total_Sales`, `Products.Sub-Category` | `11ff0faf0f92b8593afe` |
| pivotTable | `!Measures.%_of_Total`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Products.Category`, `Products.Product Name`, `Products.Sub-Category` | `15d6a8bc10c35ecc88b1` |
| tableEx | `!Measures.Total_Profit`, `Products.Product Name` | `7e606089499abde52168` |
| tableEx | `!Measures.Total_Sales`, `Products.Product Name` | `8ee4b2a6bd815577d6f1` |
| clusteredColumnChart | `!Measures.Total_Profit`, `Products.Sub-Category` | `a0bca7025ad2f417ec32` |
| clusteredColumnChart | `!Measures.Total_Sales`, `Products.Category` | `c3f536ecfa986a981c64` |
| cardVisual | `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Quantity`, `!Measures.Total_Sales`, `!Measures.Total_Sales_%` | `cfcb588cd9a44d9301ab` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.

## Customer Analysis

**Business question:** How do customer segments differ in sales, profit and order activity?

**KPIs / card bindings:** `!Measures.Average_Sales_per_Customer`, `!Measures.Count_Customers`, `!Measures.Orders_per_Customer`, `!Measures.Profit_Margin_%`, `!Measures.Total_Quantity`, `!Measures.Total_Sales`

**Filters / slicers:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Compare segment sales/profit and customer rankings; explore the segment/customer hierarchy and orders per customer.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 4 NoFilter, 2 HighlightFilter, 1 DataFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredBarChart | `!Measures.Total_Profit`, `Customers.Customer Name` | `58c3331d76fe1e78d1d0` |
| pieChart | `!Measures.Profit_Margin_%`, `Customers.Segment` | `6018b53e62b73b957e6f` |
| pivotTable | `!Measures.Count_Orders`, `!Measures.Orders_per_Customer`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Customers.Customers Hierarchy.Customer Name`, `Customers.Customers Hierarchy.Segment` | `743a01758afcebebbc39` |
| pieChart | `!Measures.Total_Sales`, `Customers.Segment` | `98993a83a561815c9036` |
| cardVisual | `!Measures.Average_Sales_per_Customer`, `!Measures.Count_Customers`, `!Measures.Orders_per_Customer`, `!Measures.Profit_Margin_%`, `!Measures.Total_Quantity`, `!Measures.Total_Sales` | `ac673869e3d1b980e6ea` |
| pieChart | `!Measures.Total_Profit`, `Customers.Segment` | `dc12dee5b2973fbe8bbe` |
| clusteredBarChart | `!Measures.Total_Sales`, `Customers.Customer Name` | `f7ef833f69c4ab0c44b7` |
| clusteredColumnChart | `!Measures.Total_Sales_%`, `Customers.Segment` | `fa6116671674e62716e2` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.

## Regional Analysis

**Business question:** How do sales and profitability vary by region, state and city?

**KPIs / card bindings:** `!Measures.Average_Order_Value`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`

**Filters / slicers:** `Customers.Segment`, `Geography.Region`, `Geography.State`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Compare regional distributions, state/city profit rankings and the state shape map; inspect the region/state/city matrix.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 9 NoFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredBarChart | `!Measures.Total_Profit`, `Geography.State` | `2cd9ee7f554ea465fc1b` |
| pieChart | `!Measures.Total_Profit`, `Geography.Region` | `31d344316fff2c65f8f8` |
| cardVisual | `!Measures.Average_Order_Value`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales` | `5a94a5b2ba712f988328` |
| clusteredBarChart | `!Measures.Total_Profit`, `Geography.City` | `7f35cc6e5bbacba718eb` |
| clusteredBarChart | `!Measures.Total_Profit`, `Geography.State` | `ad318f1ec6060c6a9293` |
| pieChart | `!Measures.Profit_Margin_%`, `Geography.Region` | `b77b670d543fd73b7617` |
| pieChart | `!Measures.Total_Sales`, `Geography.Region` | `beeaf4a918a461a32487` |
| shapeMap | `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Geography.State` | `f13b6b5174880aca38f6` |
| pivotTable | `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Geography.Region Hierarchy.City`, `Geography.Region Hierarchy.Region`, `Geography.Region Hierarchy.State` | `f4b953b24fd982ecabae` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.

## Shipping & Operations

**Business question:** How do order activity and shipping duration differ by ship mode?

**KPIs / card bindings:** `!Measures.Average_Shipping_Days`, `!Measures.Count_Orders`, `!Measures.Total_Profit`, `!Measures.Total_Sales`

**Filters / slicers:** `Geography.Region`, `Orders.Ship Mode`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Compare shipping days, orders and profit by ship mode; examine duration over time and the ship-mode/category/subcategory matrix.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 4 NoFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredColumnChart | `!Measures.Average_Shipping_Days`, `Orders.Ship Mode` | `20bef871e82c25274b6b` |
| cardVisual | `!Measures.Average_Shipping_Days`, `!Measures.Count_Orders`, `!Measures.Total_Profit`, `!Measures.Total_Sales` | `51c72a28fb5c8f3aed2b` |
| lineChart | `!Measures.Average_Shipping_Days`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `59ccf672a07626ffa5b5` |
| pivotTable | `!Measures.Average_Shipping_Days`, `!Measures.Count_Orders_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Orders.Ship Mode`, `Products.Category`, `Products.Sub-Category` | `6fd5f16d2f6f90055ceb` |
| clusteredColumnChart | `!Measures.Total_Profit`, `Orders.Ship Mode` | `7ee7af65a2426cced75c` |
| clusteredColumnChart | `!Measures.Count_Orders`, `Orders.Ship Mode` | `eb154314565c727fe8d7` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.

## Returns

**Business question:** How do returned orders and return rates vary across products, locations and reasons?

**KPIs / card bindings:** `!Measures.Return_Rate_%`, `!Measures.Returned_Orders`, `!Measures.Returned_Sales`, `!Measures.Returned_Sales_%`

**Filters / slicers:** `Customers.Segment`, `Geography.Region`, `Orders.Ship Mode`, `Products.Category`, `Returns.Return Reason`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Inspect returned orders by category, subcategory, ship mode, state and reason, with return-rate trends.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 4 NoFilter, 2 DataFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredBarChart | `!Measures.Returned_Orders`, `Products.Category` | `12feb1c2ef11f5d4cc96` |
| lineChart | `!Measures.Return_Rate_%`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `15b39f7c3a867908328a` |
| clusteredBarChart | `!Measures.Returned_Orders`, `Products.Sub-Category` | `37e9414887f28f2f947f` |
| pieChart | `!Measures.Returned_Orders`, `Orders.Ship Mode` | `6bc9245e0b4ed5093d56` |
| shapeMap | `!Measures.Returned_Orders`, `Geography.State` | `867bf47bf85f6486b89c` |
| cardVisual | `!Measures.Return_Rate_%`, `!Measures.Returned_Orders`, `!Measures.Returned_Sales`, `!Measures.Returned_Sales_%` | `bccdb254610189574f00` |
| donutChart | `!Measures.Returned_Orders`, `Returns.Return Reason` | `c6988d29dfa5aa273f1f` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.

## Growth & Trends

**Business question:** How does sales performance compare with prior periods, and what trend views are configured?

**KPIs / card bindings:** `!Measures.Sales_Target`, `!Measures.Sales_YoY_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Filters / slicers:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`

**Investigation:** Explore YoY, prior-year comparisons, cumulative sales, profit trends, sales versus target and two configured forecasts. Forecast output and accuracy are unverified.

**Key findings:** Pending actual report export; no numeric or ranking outcome claimed.

**Configured interactions:** 9 NoFilter. Unspecified pairs were not runtime-tested.

| Visual type | Bound fields | Evidence ID |
| --- | --- | --- |
| cardVisual | `!Measures.Total_Profit`, `!Measures.Total_Sales` | `45fb82e2b321f8084d6d` |
| clusteredColumnChart | `!Measures.Sales_YoY_%`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `494ec9ee7016e65730e8` |
| lineChart | `!Measures.Total_Profit`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `59abaad7eebc751883b0` |
| kpi | `!Measures.Sales_Target`, `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `6e10ff5ca50d668e6c2f` |
| lineChart | `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `8658798b2d2f0e891f22` |
| lineChart | `!Measures.Running _Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Day`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `bb1fed23efdf0de1eb86` |
| lineChart | `!Measures.Sales_Previous_Year`, `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `be40ebec2583089c2516` |
| lineChart | `!Measures.Total_Profit`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `d0bdf518962dff65e5b9` |
| cardVisual | `!Measures.Sales_YoY_%` | `dc9abf71f19eac6307a3` |

**Navigation:** One action button links to a saved bookmark and is titled “Reset Filters”. This is bookmark configuration, not verified drill-through or a tested reset action.
