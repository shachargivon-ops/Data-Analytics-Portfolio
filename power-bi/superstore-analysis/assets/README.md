# Authentic dashboard and model assets

All eight dashboard PNGs are direct, unmodified renders of the [supplied final PDF](../final-report.pdf) at 144 dpi, 2952 × 1692 pixels. Lossless PNG optimization preserves every rendered pixel. Executive Summary is shown first in documentation while remaining the eighth original page.

| Original PDF page | Dashboard PNG |
| --- | --- |
| 8 | [executive-summary.png](executive-summary.png) |
| 1 | [sales-overview.png](sales-overview.png) |
| 2 | [product-analysis.png](product-analysis.png) |
| 3 | [customer-analysis.png](customer-analysis.png) |
| 4 | [regional-analysis.png](regional-analysis.png) |
| 5 | [shipping-operations.png](shipping-operations.png) |
| 6 | [returns-analysis.png](returns-analysis.png) |
| 7 | [growth-trends.png](growth-trends.png) |
| Model View | [data-model.png](data-model.png), original user screenshot copied unchanged |

Source PDF SHA-256: `2f1fcf0c17bc14516b2eae0f2119bb0ad5e2ef2b2b99980281558e9dc75fc10e`. Model screenshot SHA-256: `11657c30c127290ae1fed7c63678c7fc42d3614c42bdc20149bc810e24915779`. [Dashboard provenance](dashboard-provenance.json) records page mapping, dimensions and PNG hashes. [PDF renderer](../scripts/extract_pdf_pages.py) checks the source hash and saved pixel equality; it requires pypdfium2/Pillow. No generated, retouched or recreated dashboards are included. [table-inventory.svg](table-inventory.svg) remains a labeled metadata illustration, not a screenshot.

## Remaining manual evidence

Dashboard pages and Model View are now available. Export original DAX/calculated columns, full relationship endpoints/properties, date-table designation, data types, Power Query steps and source/refresh instructions. Verify blank YoY cards, date aliases, target-gauge scaling, reset/navigation behavior, executive full-period context, order/line return denominators and forecast settings in Desktop. Re-export source layout issues if a future approved revision fixes them; preserve this approved report and current authentic exports.

Original export timestamp and hidden filter-pane state were not supplied. [Rendered evidence](../RENDERED-EVIDENCE.md) records the visible context, rounding and defects; use evaluated baseline/filtered comparisons to establish formula correctness.
