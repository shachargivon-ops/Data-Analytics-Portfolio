# Final report quality control

Checks performed on 2026-10-08 against the final approved attachment and previous PR head 14459aaf01b31c00497479cbf56fac38932f1bb3.

- Primary PBIX matches the user attachment byte-for-byte: 1026337 bytes; SHA-256 677b6e4305f83d573f37de39502a933f35420576272e14c6cfb66cafeb667a86.
- Archived previous primary matches the previous Git blob byte-for-byte: 904614 bytes; SHA-256 c20515770f4c8b33533fc21d21f299c1dfa5edd4663ae18765b2375bb1aeca33.
- Historical PBIX ZIP matches the previous Git blob byte-for-byte at its original path.
- ZIP CRC checks pass for final primary, archived previous primary and historical ZIP.
- Standard-library extraction confirms eight pages, 228 visual containers, 36 slicers and 45 distinct Measure-expression names. Regeneration is reproducible without editing the PBIX.
- All 64 page-navigation targets and eight bookmark action targets exist; nine bookmark definitions are retained.
- Every explicit visual interaction source and target resolves to a visual on its page.
- All 60 relative Markdown links/image paths checked across the project, portfolio README, repository inventory and compatibility guide resolve, including Markdown anchors.
- Updated table-inventory SVG parses as XML and contains seven labels matching final DiagramLayout; no relationship edges or screenshot claims are introduced. Desktop visual rendering is not part of this check.
- Changes are confined to the Superstore project and the portfolio README/repository inventory references that described the previous report.
- Saved qualitative findings retain source textbox IDs and are labeled as author statements. No numerical findings, DAX bodies, relationship edges or dashboard screenshots were invented.

Static checks do not validate Power BI execution, formulas, source refresh, evaluated values, typography, filter propagation, reset behavior or forecasts. Complete the [manual export checklist](assets/README.md) for all eight pages, model metadata and numerical evidence before claiming these are independently validated.

## Rendered-evidence upgrade checks — 2026-10-08

The checks above describe the earlier static audit. Supplied PDF/model images now add visible dashboard values and relationship evidence; original calculations and runtime behavior still require verification.

- Final PBIX, archived previous PBIX and historical ZIP match their PR-head binary blobs byte-for-byte. The report-structure JSON content remains unchanged.
- Source PDF and Model View image match the supplied files byte-for-byte. SHA-256 values are recorded in RENDERED-EVIDENCE.md.
- Eight dashboard PNGs match fresh PDFium renders pixel-for-pixel at 2952 × 1692. Lossless optimization preserves source appearance; combined dashboard PNG size is 3,335,265 bytes.
- All eight report pages and the model screenshot were visually inspected; authentic source clipping, blank navigation labels and slicer overlap are retained and documented.
- Numerical/text assertions against seven relevant PDF pages pass, covering exact sales/profit totals, executive KPIs, category/region figures, YoY, returns grain and shipping values. Transcription is not independent DAX verification.
- Relative Markdown paths and anchors resolve, including every dashboard and model image. Final staged diff is confined to power-bi/superstore-analysis/.
- Existing audit history is retained with an added evidence section. No approved analytical artifact, numeric result or screenshot was silently corrected.

Remaining checks: original DAX, complete relationship properties/keys, date designation, Power Query/source refresh, runtime filtering/navigation/reset and forecast validation. Review the source export issues in [rendered evidence](RENDERED-EVIDENCE.md).
