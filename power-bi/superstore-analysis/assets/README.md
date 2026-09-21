# Manual Power BI export checklist

The primary PBIX contains no raster dashboard preview or thumbnail. Its only static resources are two theme JSON files and a US-state shape-map topology. These are not dashboard screenshots. No dashboard has been recreated.

Open a copy of the original PBIX in compatible Power BI Desktop. Preserve the original. Capture each entire page at 1920 × 1080 or higher, with readable labels and all visuals finished rendering. Record the actual slicer selections, date range, export date and any visual errors beside each image. Test the Reset Filters bookmark before selecting the intended export state.

| Priority | Actual page | Suggested filename in this directory | Capture focus |
| --- | --- | --- | --- |
| 1 | Sales Overview | `sales-overview.png` | Compare current and previous-year sales, cumulative sales, segment/category sales and the configured sales target. |
| 2 | Product Analysis | `product-analysis.png` | Compare category/subcategory sales and profit; inspect three TopN=10 product tables and the category-to-product matrix. Ranking results require a rendered report. |
| 3 | Customer Analysis | `customer-analysis.png` | Compare segment sales/profit and customer rankings; explore the segment/customer hierarchy and orders per customer. |
| 4 | Regional Analysis | `regional-analysis.png` | Compare regional distributions, state/city profit rankings and the state shape map; inspect the region/state/city matrix. |
| 5 | Shipping & Operations | `shipping-operations.png` | Compare shipping days, orders and profit by ship mode; examine duration over time and the ship-mode/category/subcategory matrix. |
| 6 | Returns | `returns.png` | Inspect returned orders by category, subcategory, ship mode, state and reason, with return-rate trends. |
| 7 | Growth & Trends | `growth-trends.png` | Explore YoY, prior-year comparisons, cumulative sales, profit trends, sales versus target and two configured forecasts. Forecast output and accuracy are unverified. |

Also export Model view with readable relationship endpoints, cardinalities and active/inactive styling. Save as `data-model-desktop.png`; include relationship-properties evidence for ambiguous lines. These filenames are planned outputs, not links to existing images.

For each claimed finding, record the page, metric, value, units, time window and complete filter context. Include one filtered comparison and its baseline. Verify forecast rendering, error bands and time units before describing a forecast result. Only then add real dashboard image embeds to the README.
