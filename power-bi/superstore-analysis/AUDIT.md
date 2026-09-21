# PBIX evidence audit

## Source and method

Primary file: `Project 4 Analyze Data with Power BI Superstore (Shachar Givon).pbix`.

- Source repository snapshot: `63cd0d8fc6dcad24e4268dbf2a5a488ed05d56ac`.
- Git blob SHA-1: `241965c664247d3ebbd861718cfc6e47c7b12a71`.
- SHA-256: `c20515770f4c8b33533fc21d21f299c1dfa5edd4663ae18765b2375bb1aeca33`.
- Opened only as a read-only ZIP archive. JSON report definitions and UTF-16LE DiagramLayout parsed; no save, refresh or modification to the PBIX.
- `report-structure.json` now records the **primary PBIX**, not the older `.pbix.zip`. It includes original report/page/visual/bookmark definitions, source member paths and member sizes. No data rows or evaluated results are included.
- The earlier documentation listed `Page 1` from the archive despite describing seven pages. The primary file’s page order contains seven pages and no `Page 1`.

## Directly verified configuration

- Seven 1920 × 1080 pages and 93 visual containers; see [page-by-page evidence](REPORT-PAGES.md).
- Eight DiagramLayout nodes; relationships are not present in that diagram metadata.
- 21 distinct Measure-expression names, all on `!Measures`; no DAX bodies extracted.
- Visual types/counts: actionButton: 7, cardVisual: 8, clusteredBarChart: 7, clusteredColumnChart: 11, donutChart: 1, gauge: 1, kpi: 1, lineChart: 9, listSlicer: 32, pieChart: 7, pivotTable: 4, shapeMap: 2, tableEx: 3.
- Explicit interaction overrides: DataFilter: 6, HighlightFilter: 2, NoFilter: 34. These describe saved configuration, not tested runtime behavior.
- Seven bookmark definitions and one bookmark-linked “Reset Filters” action button per page. Target bookmark IDs exist in the archive. Page switching via report tabs is implied by multiple pages; no custom page-navigation or drill-through destination is verified.
- Product Analysis has three TopN filters with `Top=10` (two profit rankings with opposing sort directions, one sales ranking); Customer Analysis has two TopN=10 customer rankings; Regional Analysis has three TopN=10 state/city rankings. No ranking outcomes are asserted.
- Returns’ Return Reason slicer has an advanced non-null filter. No report-level or page-level `filterConfig` is present. Visual-level filter definitions and saved bookmark states remain in the evidence JSON.
- `drillFilterOtherVisuals=true` and hierarchy bindings are present. This is not proof of a configured drill-through destination. Page definitions contain no drill-through binding in this extraction.
- Growth & Trends has two line-chart forecast objects: sales (`8658798b2d2f0e891f22`) and profit (`59abaad7eebc751883b0`). Both specify `show=true`, algorithm `Forecast`, `ForecastLength=10D`, `Unit=7D`, `IgnoreLast=0D`, `ConfidenceLevel=0.95D`. `D` values are preserved serialized literals; the unit enum has not been interpreted as days/months. No forecast result or validity claimed.
- Shape maps occur on Regional Analysis and Returns. The archive contains US-state topology and two theme JSON resources; no raster preview/thumbnail exists.

## Inferences, not validated results

Business questions and potential investigations are inferred from field bindings. Orders as a fact table, Customers/Products/Geography as dimensions, and the two date labels as date-table candidates are interpretations, not verified relationship architecture. Titles such as “Reset Filters” express intent; reset correctness needs execution.

## Unverified

DAX formulas; calculated columns; relationship metadata; marked date table; source provenance and refresh instructions; row counts/date coverage; currency; numeric KPIs; ranking winners/losers; profitability conclusions; returned-order denominators; target definitions; forecast quality; visual rendering, accessibility and runtime navigation/filtering. No business outcome is invented.

The model extractor was attempted using PBIXRay 0.15.5, but Windows Application Control blocked loading `xmhuffman`; the extraction did not produce model metadata. Application-control policy was not bypassed. Report extraction does not require that library.

## Interpretation risks to review

The report uses pie charts bound to `Profit_Margin_%` on Customer and Regional pages. Review whether that presentation communicates a rate clearly; actual formulas and rendering are unverified. Some slicer-to-chart pairs deliberately use `NoFilter`, including year-to-forecast pairs on Growth & Trends. Verify that retained comparison context is understandable to readers. The matrix query alias `%_of_Total` points to `Total_Sales_%` in its Measure expression; this is not counted as a new measure.

## Reproduction

Run `python scripts/extract_report.py` from this project directory with Python 3. No third-party dependencies are required. The script reads the PBIX, regenerates `report-structure.json`, and checks the known source hash. It never writes the source package.

Before publishing screenshots, follow the [export checklist](assets/README.md). Business findings need a rendered value plus page, date and filter context.
