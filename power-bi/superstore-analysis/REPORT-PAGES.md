# Final report page guide

Source: the final, approved and submitted PBIX supplied by the user. All eight pages are 1920 × 1080, listed below in saved page order. Counts include decorative text, buttons and slicers. Questions are interpretations of bindings. Values and runtime behavior were not evaluated. The Bound fields columns preserve queryRef strings; aliases such as Running _Total_Sales may differ from the actual Running_Total_Sales Measure expression (see MEASURES.md). Full original definitions are in [report-structure.json](report-structure.json).

## Sales Overview

**Business question:** How do sales, profit and order economics compare across time, segments and categories?

**Page evidence:** `Report/definition/pages/5db9cc082f3bbff69a7b/page.json`; 22 containers.

**Visual inventory:** actionButton: 9, cardVisual: 1, clusteredColumnChart: 3, gauge: 1, lineChart: 2, listSlicer: 4, textbox: 2.

**KPI/card bindings:** `!Measures.Average_Order_Value`, `!Measures.Count_Customers`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Sales_Gauge_Max`, `!Measures.Sales_Target`, `!Measures.Sales_YoY_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`.

**Slicer fields:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** DataFilter: 1, NoFilter: 3. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredColumnChart | `!Measures.Total_Sales`, `Customers.Segment` | `1d38aae7f0e68fb4da88` |
| cardVisual | `!Measures.Average_Order_Value`, `!Measures.Count_Customers`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Sales_YoY_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales` | `1f863fb394ae0627f735` |
| lineChart | `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `520d4443e56b5cfb5256` |
| clusteredColumnChart | `!Measures.Total_Sales`, `Products.Category` | `6c36e340894604682afd` |
| gauge | `!Measures.Sales_Gauge_Max`, `!Measures.Sales_Target`, `!Measures.Total_Sales` | `790f3421716a3df0fd14` |
| lineChart | `!Measures.Running _Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Day`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `8b9302949b02c625c6c4` |
| clusteredColumnChart | `!Measures.Sales_Previous_Year`, `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `addc9fa6545ed190fad1` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Product Analysis

**Business question:** Which products combine sales volume with strong or weak profitability?

**Page evidence:** `Report/definition/pages/568da0237824b6ca6dff/page.json`; 24 containers.

**Visual inventory:** actionButton: 9, cardVisual: 1, clusteredColumnChart: 3, listSlicer: 5, pivotTable: 1, tableEx: 3, textbox: 2.

**KPI/card bindings:** `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Quantity`, `!Measures.Total_Sales`, `!Measures.Total_Sales_%`.

**Slicer fields:** `Customers.Segment`, `Dimdate.Year`, `Geography.Region`, `Products.Category`, `Products.Sub-Category`.

**Explicit interaction overrides:** DataFilter: 2, NoFilter: 1. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| tableEx | `!Measures.Total_Profit`, `Products.Product Name` | `008285e61a96715982a1` |
| clusteredColumnChart | `!Measures.Total_Sales`, `Products.Sub-Category` | `11ff0faf0f92b8593afe` |
| pivotTable | `!Measures.%_of_Total`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Products.Category`, `Products.Product Name`, `Products.Sub-Category` | `15d6a8bc10c35ecc88b1` |
| tableEx | `!Measures.Total_Profit`, `Products.Product Name` | `7e606089499abde52168` |
| tableEx | `!Measures.Total_Sales`, `Products.Product Name` | `8ee4b2a6bd815577d6f1` |
| clusteredColumnChart | `!Measures.Total_Profit`, `Products.Sub-Category` | `a0bca7025ad2f417ec32` |
| clusteredColumnChart | `!Measures.Total_Sales`, `Products.Category` | `c3f536ecfa986a981c64` |
| cardVisual | `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Quantity`, `!Measures.Total_Sales`, `!Measures.Total_Sales_%` | `cfcb588cd9a44d9301ab` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Customer Analysis

**Business question:** How do customer segments differ in sales, profit and order activity?

**Page evidence:** `Report/definition/pages/835a33d81672e6e83b22/page.json`; 23 containers.

**Visual inventory:** actionButton: 9, cardVisual: 1, clusteredBarChart: 2, clusteredColumnChart: 2, listSlicer: 4, pieChart: 2, pivotTable: 1, textbox: 2.

**KPI/card bindings:** `!Measures.Average_Sales_per_Customer`, `!Measures.Count_Customers`, `!Measures.Orders_per_Customer`, `!Measures.Profit_Margin_%`, `!Measures.Total_Quantity`, `!Measures.Total_Sales`.

**Slicer fields:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** DataFilter: 1, HighlightFilter: 2, NoFilter: 4. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredBarChart | `!Measures.Total_Profit`, `Customers.Customer Name` | `58c3331d76fe1e78d1d0` |
| clusteredColumnChart | `!Measures.Profit_Margin_%`, `Customers.Segment` | `6018b53e62b73b957e6f` |
| pivotTable | `!Measures.Count_Orders`, `!Measures.Orders_per_Customer`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Customers.Customers Hierarchy.Customer Name`, `Customers.Customers Hierarchy.Segment` | `743a01758afcebebbc39` |
| pieChart | `!Measures.Total_Sales`, `Customers.Segment` | `98993a83a561815c9036` |
| cardVisual | `!Measures.Average_Sales_per_Customer`, `!Measures.Count_Customers`, `!Measures.Orders_per_Customer`, `!Measures.Profit_Margin_%`, `!Measures.Total_Quantity`, `!Measures.Total_Sales` | `ac673869e3d1b980e6ea` |
| pieChart | `!Measures.Total_Profit`, `Customers.Segment` | `dc12dee5b2973fbe8bbe` |
| clusteredBarChart | `!Measures.Total_Sales`, `Customers.Customer Name` | `f7ef833f69c4ab0c44b7` |
| clusteredColumnChart | `!Measures.Total_Sales_%`, `Customers.Segment` | `fa6116671674e62716e2` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Regional Analysis

**Business question:** How do sales and profitability vary by region, state and city?

**Page evidence:** `Report/definition/pages/bc6a1e13b783f8d932a3/page.json`; 25 containers.

**Visual inventory:** actionButton: 9, cardVisual: 1, clusteredBarChart: 3, clusteredColumnChart: 1, listSlicer: 5, pieChart: 2, pivotTable: 1, shapeMap: 1, textbox: 2.

**KPI/card bindings:** `!Measures.Average_Order_Value`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`.

**Slicer fields:** `Customers.Segment`, `Geography.Region`, `Geography.State`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** NoFilter: 9. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredBarChart | `!Measures.Total_Profit`, `Geography.State` | `2cd9ee7f554ea465fc1b` |
| pieChart | `!Measures.Total_Profit`, `Geography.Region` | `31d344316fff2c65f8f8` |
| cardVisual | `!Measures.Average_Order_Value`, `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales` | `5a94a5b2ba712f988328` |
| clusteredBarChart | `!Measures.Total_Profit`, `Geography.City` | `7f35cc6e5bbacba718eb` |
| clusteredBarChart | `!Measures.Total_Profit`, `Geography.State` | `ad318f1ec6060c6a9293` |
| clusteredColumnChart | `!Measures.Profit_Margin_%`, `Geography.Region` | `b77b670d543fd73b7617` |
| pieChart | `!Measures.Total_Sales`, `Geography.Region` | `beeaf4a918a461a32487` |
| shapeMap | `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Geography.State` | `f13b6b5174880aca38f6` |
| pivotTable | `!Measures.Count_Orders`, `!Measures.Profit_Margin_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Geography.Region Hierarchy.City`, `Geography.Region Hierarchy.Region`, `Geography.Region Hierarchy.State` | `f4b953b24fd982ecabae` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Shipping & Operations

**Business question:** How do order activity and shipping duration differ by ship mode?

**Page evidence:** `Report/definition/pages/eac22fd0da1991814511/page.json`; 21 containers.

**Visual inventory:** actionButton: 9, cardVisual: 1, clusteredColumnChart: 3, lineChart: 1, listSlicer: 4, pivotTable: 1, textbox: 2.

**KPI/card bindings:** `!Measures.Average_Shipping_Days`, `!Measures.Count_Orders`, `!Measures.Total_Profit`, `!Measures.Total_Sales`.

**Slicer fields:** `Geography.Region`, `Orders.Ship Mode`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** NoFilter: 4. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredColumnChart | `!Measures.Average_Shipping_Days`, `Orders.Ship Mode` | `20bef871e82c25274b6b` |
| cardVisual | `!Measures.Average_Shipping_Days`, `!Measures.Count_Orders`, `!Measures.Total_Profit`, `!Measures.Total_Sales` | `51c72a28fb5c8f3aed2b` |
| lineChart | `!Measures.Average_Shipping_Days`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `59ccf672a07626ffa5b5` |
| pivotTable | `!Measures.Average_Shipping_Days`, `!Measures.Count_Orders_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Orders.Ship Mode`, `Products.Category`, `Products.Sub-Category` | `6fd5f16d2f6f90055ceb` |
| clusteredColumnChart | `!Measures.Total_Profit`, `Orders.Ship Mode` | `7ee7af65a2426cced75c` |
| clusteredColumnChart | `!Measures.Count_Orders`, `Orders.Ship Mode` | `eb154314565c727fe8d7` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Returns

**Business question:** How do returned orders, returned lines and return rates vary by product, location and reason?

**Page evidence:** `Report/definition/pages/47e55f8667e70102a6e2/page.json`; 24 containers.

**Visual inventory:** actionButton: 9, cardVisual: 1, clusteredBarChart: 2, donutChart: 1, lineChart: 1, listSlicer: 6, pieChart: 1, shapeMap: 1, textbox: 2.

**KPI/card bindings:** `!Measures.Return_Rate_%`, `!Measures.Returned_Orders`, `!Measures.Returned_Sales`, `!Measures.Returned_Sales_%`.

**Slicer fields:** `Customers.Segment`, `Geography.Region`, `Orders.Ship Mode`, `Products.Category`, `Returns.Return Reason`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** DataFilter: 2, NoFilter: 4. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| clusteredBarChart | `!Measures.Returned_Lines`, `Products.Category` | `12feb1c2ef11f5d4cc96` |
| lineChart | `!Measures.Return_Rate_%`, `dimDate!.Date.Variation.Date Hierarchy.Month`, `dimDate!.Date.Variation.Date Hierarchy.Quarter`, `dimDate!.Date.Variation.Date Hierarchy.Year` | `15b39f7c3a867908328a` |
| clusteredBarChart | `!Measures.Returned_Lines`, `Products.Sub-Category` | `37e9414887f28f2f947f` |
| pieChart | `!Measures.Returned_Lines`, `Orders.Ship Mode` | `6bc9245e0b4ed5093d56` |
| shapeMap | `!Measures.Returned_Lines`, `Geography.State` | `867bf47bf85f6486b89c` |
| cardVisual | `!Measures.Return_Rate_%`, `!Measures.Returned_Orders`, `!Measures.Returned_Sales`, `!Measures.Returned_Sales_%` | `bccdb254610189574f00` |
| donutChart | `!Measures.Returned_Lines`, `Returns.Return Reason` | `c6988d29dfa5aa273f1f` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Growth & Trends

**Business question:** How do sales and profit compare with prior periods, targets and configured forecasts?

**Page evidence:** `Report/definition/pages/1a5da028f5cdd42702d9/page.json`; 24 containers.

**Visual inventory:** actionButton: 9, cardVisual: 2, clusteredColumnChart: 1, kpi: 1, lineChart: 5, listSlicer: 4, textbox: 2.

**KPI/card bindings:** `!Measures.Sales_Target`, `!Measures.Sales_YoY_%`, `!Measures.Total_Profit`, `!Measures.Total_Sales`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Slicer fields:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** NoFilter: 9. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
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

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Results:** Original visual definitions are preserved. Numeric values and ranking outcomes require a genuine rendered export with filter context.

## Executive Summary & Key Insights

**Business question:** Which full-period findings and recommended actions should decision makers prioritize?

**Page evidence:** `Report/definition/pages/977bdd6b973d4486aeb4/page.json`; 65 containers.

**Visual inventory:** actionButton: 9, card: 23, lineChart: 1, listSlicer: 4, textbox: 28.

**KPI/card bindings:** `!Measures.ES_Central_Margin`, `!Measures.ES_Central_Sales`, `!Measures.ES_Central_Share`, `!Measures.ES_Customers`, `!Measures.ES_Furniture_Margin`, `!Measures.ES_Furniture_Sales`, `!Measures.ES_Furniture_Share`, `!Measures.ES_Growth_Context`, `!Measures.ES_Growth_Context2`, `!Measures.ES_Growth_Value`, `!Measures.ES_Margin`, `!Measures.ES_Orders`, `!Measures.ES_Profit`, `!Measures.ES_Returns_Rate`, `!Measures.ES_Returns_Sales`, `!Measures.ES_Returns_Share`, `!Measures.ES_Sales`, `!Measures.ES_Technology_Margin`, `!Measures.ES_Technology_Sales`, `!Measures.ES_Technology_Share`, `!Measures.ES_West_Margin`, `!Measures.ES_West_Sales`, `!Measures.ES_West_Share`.

**Slicer fields:** `Customers.Segment`, `Geography.Region`, `Products.Category`, `dimDate!.Date.Variation.Date Hierarchy.Year`.

**Explicit interaction overrides:** NoFilter: 150. Unspecified pairs and runtime behavior require Desktop verification.

| Analytical visual | Bound fields | Evidence ID |
| --- | --- | --- |
| card | `!Measures.ES_Margin` | `01a7cf2b7b6c4d9d878d` |
| card | `!Measures.ES_Furniture_Share` | `098c5752fdb44e0b8a21` |
| card | `!Measures.ES_Central_Sales` | `1686fb5b038049e497da` |
| card | `!Measures.ES_Profit` | `1bac972ffe6f4a17bb43` |
| card | `!Measures.ES_Orders` | `220588e8b66a408883da` |
| card | `!Measures.ES_Technology_Sales` | `2e8554bdf3f544379bf9` |
| card | `!Measures.ES_Growth_Value` | `3806689909be4395afea` |
| card | `!Measures.ES_Sales` | `459580199c9d47b1b44f` |
| card | `!Measures.ES_Returns_Rate` | `4c6cccdd19994dcab383` |
| card | `!Measures.ES_Central_Share` | `55b71a0088054c5cb5aa` |
| card | `!Measures.ES_Furniture_Margin` | `573455771131463c8490` |
| card | `!Measures.ES_West_Margin` | `603fed6f66b24b5da673` |
| card | `!Measures.ES_Growth_Context` | `669ae7b418494facb722` |
| card | `!Measures.ES_Central_Margin` | `7a9a2631956c429da04d` |
| card | `!Measures.ES_West_Sales` | `7c773b42303d486081ca` |
| card | `!Measures.ES_Technology_Share` | `94e53c518e5a4f9c9f87` |
| card | `!Measures.ES_Customers` | `975b2b200ea74f68b871` |
| card | `!Measures.ES_Returns_Sales` | `a33d1efe9d4946f586d4` |
| card | `!Measures.ES_Growth_Context2` | `a52abbe9a77a421bb54a` |
| card | `!Measures.ES_Furniture_Sales` | `b51cfc6f6aa346bfad08` |
| lineChart | `!Measures.Total_Profit`, `!Measures.Total_Sales`, `Dimdate.Date.Variation.Date Hierarchy.Year` | `c8bc173734e54331abce` |
| card | `!Measures.ES_Returns_Share` | `d3d84a5ef25448d58985` |
| card | `!Measures.ES_Technology_Margin` | `d7fc3c2f7cb34b8fa11b` |
| card | `!Measures.ES_West_Share` | `e7dff401bcdc44758481` |

**Navigation:** Eight PageNavigation buttons target all eight existing pages; one Bookmark action targets an existing reset bookmark. Destination existence is verified; execution is not.

**Saved report narrative:** The page distinguishes KPIs/trend that respond to filters from full-period insights. Its saved text describes 2011–2014 and the order-versus-line distinction for returns. These are author statements, not independently recalculated results. See [supported findings](README.md#supported-findings).

| Textbox evidence ID | Saved nonblank text (verbatim) |
| --- | --- |
| `13fe64650a87471384b9` | Furniture Risk |
| `24d38108b6954d18bea3` | High sales, low profitability.<br>Review pricing, costs and product mix. |
| `272ceb3f7dfd4475ad14` | Key Insights |
| `27922f3f371844f2bd2e` | Recommended Actions |
| `28350f9cd8fb4c4fb09b` | Investigate return drivers in<br>Office Supplies and shipping modes. |
| `31ee2dd170a9419283d1` | Central Underperforms |
| `41736f014d2946e7876b` | • Technology and Office Supplies drive profit.<br>• Furniture has high sales but a weak margin.<br>• Consumer leads revenue; Home Office leads margin.<br>• West leads; Central has the lowest regional margin.<br>• Standard Class leads volume and is slowest.<br>• Growth strengthened during 2013–2014. |
| `483e799049884ac2aef7` | Executive Summary & Key Insights |
| `48c63e3a874547dea2bc` | Strong demand and profitability<br>make Technology a key growth driver. |
| `55e53940ec4444dea71a` | Returns Need Attention |
| `599bfb4dc7164e0b9934` | West leads both sales and profit,<br>with the strongest regional margin. |
| `6aa713cc297842ab8431` | Key Takeaways |
| `77e6d1d389ab4857b544` | FULL PERIOD · 2011–2014 · UNAFFECTED BY SLICERS |
| `7b4b08d3e2bf47948a04` | SUPERSTORE ANALYSIS  \|  2011–2014     •     Returned orders count unique Order IDs; returned-line charts retain line-level detail. |
| `88f38a9fe40444fc8101` | A complete view of Superstore's performance, customers, products, regions, operations and trends (2011–2014). |
| `8f26f0ce83134c9ab6d4` | Technology Leads |
| `95c06a33ffb4419c9bc1` | Sales momentum strengthened<br>during 2013–2014. |
| `a7c3001299bb4b8fb6a8` | 1  Protect profitable category growth.<br>2  Review Furniture pricing, discounts and product mix.<br>3  Investigate Central and loss-making states (e.g. Texas).<br>4  Analyze return reasons, products and shipping modes.<br>5  Monitor sales growth alongside profitability. |
| `b01e39d52eeb4b018b3c` | Strong Growth |
| `d86bf5cfd5b043fdb612` | Lowest regional margin.<br>Investigate loss-making markets. |
| `db397ae9750e41a8a965` | KPIs and trend respond to filters.<br>Insights below show the full period. |
| `e92419f1bc2142c08bab` | West Leads |

The machine-readable extraction preserves the source text exactly, including any replacement characters present in the saved strings. Rendering and typography require Desktop inspection.
