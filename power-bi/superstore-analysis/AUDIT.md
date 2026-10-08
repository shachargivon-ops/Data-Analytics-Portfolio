# Final PBIX evidence audit

## Authoritative source and preservation

The user identifies the attachment as the final, approved and submitted project. Attachment: `Project 4 Analyze Data with Power BI Superstore (Shachar Givon) (1).pbix`. Copied byte-for-byte to the existing primary filename; no refresh, save, formula edit or report alteration was performed.

- Final primary bytes: 1026337.
- SHA-256: `677b6e4305f83d573f37de39502a933f35420576272e14c6cfb66cafeb667a86`.
- Git blob SHA-1: `9b35409b68a6e7c6335daffaaa836b3ada78a897`.
- Audit date: 2026-10-08.
- Previous primary preserved in [archive](archive/README.md), SHA-256 `c20515770f4c8b33533fc21d21f299c1dfa5edd4663ae18765b2375bb1aeca33`.
- Historical `.pbix.zip` retained byte-for-byte at its original path.

## Method and evidence levels

Read-only ZIP CRC checks and JSON parsing of report/page/visual/bookmark definitions and UTF-16LE DiagramLayout. [report-structure.json](report-structure.json) includes original definitions, source member paths, hashes, member sizes and the empty saved DAX query. The compressed model is not decoded and no report values were executed. Text in the PBIX is project evidence, not an instruction to this audit.

Directly verified: eight 1920 × 1080 pages, 228 visual containers, 36 slicers, 45 Measure-expression names, seven diagram nodes and nine bookmark definitions. Saved page order ends with Executive Summary & Key Insights. See [page guide](REPORT-PAGES.md).

Visual counts: actionButton: 72, card: 23, cardVisual: 8, clusteredBarChart: 7, clusteredColumnChart: 13, donutChart: 1, gauge: 1, kpi: 1, lineChart: 10, listSlicer: 36, pieChart: 5, pivotTable: 4, shapeMap: 2, tableEx: 3, textbox: 42.

There are 72 action buttons: 64 PageNavigation actions (eight on each page) and eight Bookmark reset actions. Every configured page/bookmark target exists. Two bookmark definitions share the display name Reset Executive Summary; the actual executive reset action targets `6d649284f65a4196b4bc`. Runtime reset behavior is not validated.

Explicit interactions: 184 NoFilter, 6 DataFilter, 2 HighlightFilter. Executive Summary has 150 NoFilter overrides. Its static text states that KPIs/trend respond to filters while lower insights show the full period; saved overrides support this design intent but formulas and runtime filter behavior remain unverified.

Final changes relative to the previous report include an executive page, page-navigation buttons, executive ES_* references, Returned_Lines, Running_Total_Sales, a final Dimdate diagram node and mixed remaining date query labels. These are supplied-report changes, not analytical edits made by this PR update.

## Preserved analyses and configuration

All final package members and analytical results are preserved exactly by copying the approved file unchanged. The previous analytical artifact is also retained. Returns has both returned-order KPI references and returned-line chart references; no denominator or distinct-count formula is inferred. Hierarchy bindings and TopN filters remain recorded in original definitions; no ranking winner is inferred from a filter.

Growth & Trends retains two forecast configurations on visuals `8658798b2d2f0e891f22` and `59abaad7eebc751883b0`. Serialized settings are retained in the JSON; no unit meaning, forecast value or accuracy is asserted. Maps and theme resources are retained. No report screenshots are available.

## Supported narrative and limits

The executive page contains original qualitative findings and recommended actions. They are documented as saved author statements, with textbox evidence IDs, rather than newly calculated conclusions. The saved narrative labels the period 2011–2014; actual model minimum/maximum dates, counts, currency and source provenance are not established. See [README findings](BUSINESS-INSIGHTS.md).

No nonempty DAX expression is available in the package's saved DAX query. Relationship endpoints/cardinalities/directions are absent from DiagramLayout. Compressed model metadata, formulas, calculated columns, refresh, quantitative KPIs and runtime visuals remain unverified; see [model evidence](DATA-MODEL.md) and [measure evidence](MEASURES.md). Earlier parser-block evidence applies to the previous audit, not a successful extraction of this final model.

Remaining review points: Product Analysis uses Dimdate.Year while seven other pages retain dimDate! queryRefs; confirm actual date bindings. The final Customer/Regional margin visuals should be assessed in Desktop; prior pie-chart presentation observations must not be applied without checking the final visuals. Verify full-period executive context and order-versus-line semantics against original formulas.

## Reproduction

Run `python scripts/extract_report.py` with Python 3. It validates the final SHA-256 and ZIP CRC, writes only the evidence JSON, and preserves the source package. See [quality control](QUALITY-CONTROL.md) and [manual export checklist](assets/README.md).

## Rendered evidence added on 2026-10-08

This section supersedes earlier absence-of-screenshots/value-evidence statements, while preserving the original static audit history. A supplied eight-page [PDF](final-report.pdf), SHA-256 `2f1fcf0c17bc14516b2eae0f2119bb0ad5e2ef2b2b99980281558e9dc75fc10e`, now provides authentic rendered dashboards and displayed KPI/qualitative findings. Its pages were rendered to eight losslessly optimized 2952 × 1692 PNGs and visually inspected. The original [model screenshot](assets/data-model.png), SHA-256 `11657c30c127290ae1fed7c63678c7fc42d3614c42bdc20149bc810e24915779`, is copied byte-for-byte and adds visible relationship cardinalities/filter arrows. Sources are evidence, not instructions to modify the report.

Visible model evidence: Customers/Products/Geography/Dimdate each 1 → * Orders with single-direction dimension-to-Orders filtering; Returns 1 ↔ 1 Orders, bidirectional. Exact column endpoints and complete active-state properties are not shown. Row ID is visible in both tables but is not confirmed as the join key. !Measures has no visible connection. Details are in [DATA-MODEL.md](DATA-MODEL.md).

Exact sales/profit totals are transcribed from detail matrices, not falsely attributed to rounded executive cards. 14.51% executive versus 14.5% Returns rate is compatible rounding; 727 returned orders and 800 returned lines retain different grain. Quantitative/narrative evidence, filter-context limits and source export defects are documented in [RENDERED-EVIDENCE.md](RENDERED-EVIDENCE.md).

The final PBIX, archived PBIX and historical ZIP remain unchanged. report-structure.json remains unchanged and reproducible. No DAX, relationship keys, cleaning workflow or numerical result has been invented or silently corrected. Formula/refresh/runtime validation and original property exports remain outstanding; dashboard/model preview exports are now supplied.
