# Portfolio Review and Next Steps

[Portfolio](../README.md) · [Complete inventory](repository-inventory.md)

## Review outcome

The portfolio now introduces Shachar's career transition, target roles in Germany, stated tools and languages, and provides direct access to the available source. The two SQL projects and Northwind notebook are the substantial reviewable work. NFL Python source, two Excel workbooks and the Superstore package are now supplied.

The review inspected every tracked file, notebook source and saved output, including all eight embedded charts. It did not run SQL Server or re-execute the full notebooks. Selected NFL calculations were independently checked against the supplied workbook.

## Technical findings

| Project | Finding | Next action |
| --- | --- | --- |
| WideWorldImporters | Product sales value is labeled profit; monthly monetary totals are described as quantities | Correct definitions and labels in a separately validated analytical update |
| WideWorldImporters | Opening title is plain text; CTE statement boundaries need review for whole-file execution | Make the script runnable and capture representative results |
| WideWorldImporters | Percentage strings can truncate values; annualization uses observed months | Review numeric formatting, zero denominators and missing-month assumptions |
| WideWorldImporters | Churn is an inactivity heuristic, with repeated order rows and no single-order customers | Document population and output grain before interpreting flags |
| NFL database | Source data/import steps absent; name-based joins and uniqueness need checking | Supply data provenance and validate loading cardinality |
| NFL database | Intended one-to-one sack relationship is not enforced | Validate the intended grain before adding constraints |
| Northwind | Saved tables support the reported observations; database/version not supplied | Record dependencies and verify a clean run |
| Northwind | Generic chart labels and crowded category/supplier charts reduce readability | Improve labels and category encoding in a future notebook revision |

These findings are documented without changing analytical logic. No employer achievements or quantitative business impact are inferred from the exercises.

## Input still needed

- NFL data provenance and reconciliation of stale audit summaries.
- Power BI screenshots/PDF, measure expressions and source/refresh information.
- A formula-based Excel analysis, if you want to demonstrate skills beyond structured data and documentation.
- Database provenance/import instructions and environment/package versions for reproducible runs.

Power BI report definitions and Excel structure are now inspected. DAX expressions remain unverified. Languages are listed as supplied: Hebrew (Native), English and German (A1), without an invented English proficiency level.

## Changes and validation

- Created five project-folder READMEs, an assets guide, a full inventory and one chart copied from the notebook.
- Revised the root README and this review; retained the five old project-guide URLs as navigation pages.
- Preserved the SQL and notebook files without moving, renaming or editing them.
- Checked internal Markdown links against the complete proposed repository tree.
- Checked documented Northwind findings against saved notebook tables.

The separate portfolio website repository was not modified in this change.

## Supplied-file follow-up

The NFL guide records mixed-DataFrame period filters, narrative/output mismatches, a normalized-score benchmark issue and contract-estimate limitations. Two saved charts and selected output-backed observations are now presented. Excel contains static summaries, not demonstrated formula calculations. The Power BI guide distinguishes verified report configuration from unverified model expressions and report values.
