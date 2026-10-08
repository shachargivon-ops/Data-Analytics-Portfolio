# Rendered report evidence and review issues

## Sources and context

- [Final report PDF](final-report.pdf): eight supplied original pages; copied unchanged. SHA-256 `2f1fcf0c17bc14516b2eae0f2119bb0ad5e2ef2b2b99980281558e9dc75fc10e`.
- [Model View screenshot](assets/data-model.png): copied unchanged from the user's image. SHA-256 `11657c30c127290ae1fed7c63678c7fc42d3614c42bdc20149bc810e24915779`.
- Final primary PBIX SHA-256 remains `677b6e4305f83d573f37de39502a933f35420576272e14c6cfb66cafeb667a86`; unchanged from the approved artifact already in PR #4. No current finding uses the archived report.

PDF labels identify 2011–2014 and the executive trend specifies USD millions. Visible radio options are unselected; totals match the displayed full-period matrices. The executive lower insights explicitly say full period and unaffected by slicers. Hidden filter-pane state, extraction date within the source report and independent model calculations are not established by the PDF. The documentation verification date is 2026-10-08, not a claimed original export date.

## Displayed KPI provenance

| Metric | Value transcribed | PDF evidence |
| --- | --- | --- |
| Total Sales | $2,297,200.86 | Pages 2, 3, 4 and 5 matrix totals; page 8 card $2.30M |
| Total Profit | $286,397.02 | Pages 2–5 matrix totals; page 8 card $286.40K |
| Profit Margin | 12.5% | Page 8 and detail pages |
| Total Orders | 5,009 | Page 8; page 3/4 totals 5009; several cards round to 5K |
| Total Customers | 793 | Pages 1, 3 and 8 |
| Returned Sales | Approximately $191K; page 6 $191.38K | Page 8 insight card / page 6 KPI |
| Returned Sales Share | 8.33% | Pages 6 and 8 |
| Order Return Rate | 14.51%; page 6 14.5% | Page 8 insight / page 6 rounded KPI |
| Returned Orders / Lines | 727 / 800 | Page 6 KPI / returned-lines reason donut |
| Average Order Value | $458.61 | Pages 1 and 4 |

The 14.51% versus 14.5% displays are compatible rounding, not a silent correction. A simple arithmetic check of displayed counts (727 ÷ 5009) is compatible with 14.51%, but does not verify the original DAX or filtering logic. No exact returned-sales amount beyond the displayed $191.38K is invented.

## Supporting category, region, growth and shipping values

- Page 2: Technology $836,154.03 sales, $145,454.95 profit, 17.4% margin, 36.4% share; Furniture $741,999.80, $18,451.27, 2.5%, 32.3%; Office Supplies $719,047.03, $122,490.80, 17.0%, 31.3%. Page 8 rounds Technology/Furniture sales to $836K/$742K.
- Page 4: West $725,457.82 sales, $108,418.45 profit, 14.9% margin; Central $501,239.89, $39,706.36, 7.9%. Page 8 rounds these sales to $725K/$501K.
- Pages 7 and 8: YoY -2.8% (2012), +29.3% (2013), +20.6% (2014).
- Page 5: Standard Class 59.8% order share and 5.01 average shipping days; the duration chart explicitly says line-weighted. Overall duration is 3.96. Second Class 3.24, First Class 2.18, Same Day 0.04.
- Page 3: Consumer leads revenue at $1,161,401.35 with 11.5% margin; Home Office margin is 14.0%. Their rounded sales shares are 50.6% and 18.7%.

These are visible output facts, not validation of data preparation, measure formulas, causation or forecast accuracy. See [business interpretations](BUSINESS-INSIGHTS.md).

## Export inconsistencies and limitations requiring attention

1. **Blank navigation labels:** the PDF shows colored top navigation blocks without readable button text. PBIX action destinations exist, but PDF rendering does not prove usable live navigation.
2. **Clipped and overlapping content:** Product Analysis sales/bottom-profit table amounts are horizontally clipped and only a subset of ranked rows is visible. Returns Segment and Ship Mode slicers overlap. Growth total-profit card text is clipped. Several slicer/category labels and chart labels are truncated. Higher-resolution PNGs retain these source defects; no values are guessed from clipped text.
3. **Sales target gauge:** page 1 shows $2.30M sales, a $1.72M marker and a displayed maximum of $2.06M. Actual sales exceed the shown maximum. Review Sales_Gauge_Max/target definitions and visual scaling in Desktop; the approved PBIX has not been modified.
4. **Time-card context:** Sales_YoY_% cards on pages 1 and 7 display `--`, while the annual YoY chart and executive insight show values. The title Sales Trends by Month on page 1 has year-level axis labels. Review selected hierarchy/context and blank-card logic before interpreting these as errors or changing them.
5. **Mixed date query labels:** Dimdate is visible in the model, but retained dimDate! queryRef aliases require actual model-binding verification. Aliases alone do not establish a broken model.
6. **Rounding and grain:** exact matrix totals, compact KPI cards and rounded return rates coexist. Returned-line breakdowns cannot be substituted for unique returned-order metrics. The chart labels shipping durations as line-weighted; do not relabel them as order-weighted.
7. **Forecast output:** page 7 visibly includes forecast lines/bands beyond historical data. Accuracy, validation method and horizon/unit meaning remain unverified.

## Image authenticity and reproducibility

All eight dashboard PNGs are direct PDFium renders at 144 dpi (2952 × 1692), saved with lossless PNG optimization. The extraction compares saved PNG pixels to the original render. No crop, redraw, cosmetic fix or generated dashboard was used. All pages and the original model screenshot were visually inspected. Filenames, page mapping and SHA-256 hashes are in [dashboard-provenance.json](assets/dashboard-provenance.json); the [extractor](scripts/extract_pdf_pages.py) has a source-PDF hash guard and requires pypdfium2/Pillow.
