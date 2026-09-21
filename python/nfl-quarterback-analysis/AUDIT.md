# Audit of NFL Quarterback Performance Analysis

All **198 original cells** were reviewed. Cell references are one-based, including blank and comment-only cells. [cell-audit.csv](cell-audit.csv) provides coverage and source excerpts for each cell. Related defects are grouped below; a missing duplicate or merge error is not invented where no defect was observed.

## Issue register

### A01 — Reproducibility

Original cells: 1, 2

- **Existing logic:** Unused pyodbc/pandasql imports; implicit first sheet and working directory.
- **Problem:** Unnecessary dependencies can stop execution; source choice is implicit.
- **Corrected logic:** Minimal dependencies, explicit NFL_Data, root/notebook directory resolution.
- **Finding impact:** No numerical change.

### A02 — Data quality

Original cells: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25

- **Existing logic:** Shape/info/describe inspected; no key, coverage or formula controls.
- **Problem:** A 2001–2023 label conceals absent 2007; old workbook summaries report 2,350 rows.
- **Corrected logic:** 2,246 rows, 22 seasons, 0 duplicate player-season keys; export current controls. Never reconstruct missing 2007.
- **Finding impact:** Era and career scope changes materially; first era is nine years.

### A03 — Data quality / selection

Original cells: 6, 7, 8, 9, 116

- **Existing logic:** Derive experience and stage from enriched dates; missing experience would fall into Late Career.
- **Problem:** 51 DOB/age inconsistencies; no independent entry-date validation; early career exclusion is not a longevity filter.
- **Corrected logic:** Parse/report invalid dates; avoid experience eligibility; use number of observed qualifying seasons.
- **Finding impact:** Efficiency cohort and leader can change; age conclusions provisional.

### A04 — Missingness / provenance

Original cells: 11, 12, 13, 14, 15, 16, 17, 18, 19

- **Existing logic:** Fill estimated columns with year medians; flag only missing Contract_Value; replace source label; cast to integer.
- **Problem:** Existing 2026 estimates remain incorrectly unflagged; medians imply unsupported contracts, APY rounding loses precision; filled columns are unused downstream.
- **Corrected logic:** No imputation. Explicit historical/2026 estimate/missing/other status, preserve source values.
- **Finding impact:** Contract sample changes; 222 estimates excluded and 942 missing rows reported.

### A05 — Presentation

Original cells: 21, 22, 23, 24

- **Existing logic:** Broad pairplot/correlation includes arbitrary encodings, dates, estimates and redundant metrics.
- **Problem:** Does not answer a focused question; inferred significance unsupported.
- **Corrected logic:** Focused volume and score correlation tables; remove decorative pairplot.
- **Finding impact:** No lost defensible finding.

### A06 — Population / inference

Original cells: 26, 27, 28, 29, 55, 69, 115, 128, 147, 161

- **Existing logic:** Questions ask what influences quality, which teams develop QBs, or optimal age; thresholds described as removing non-QBs.
- **Problem:** No position ID or causal design; thresholds do not verify position.
- **Corrected logic:** Describe participation-qualified passing players and observed associations.
- **Finding impact:** Causal/development/optimal-age claims withdrawn.

### A07 — Logic / index alignment

Original cells: 31, 34, 37, 40, 43, 46, 49

- **Existing logic:** season_stats lower-bound mask combined with df upper-bound mask.
- **Problem:** Pandas aligns unrelated indexes; upper bounds do not select the intended season years.
- **Corrected logic:** Use season_means.Year.between(start,end) on the same table; report years included.
- **Finding impact:** All seven decade benchmarks recalculated; see era-mask-before-after.csv.

### A08 — Aggregation / narrative

Original cells: 30, 32, 33, 35, 36, 38, 39, 41, 42, 44, 45, 47, 48, 50, 51, 52, 53

- **Existing logic:** Equal-player annual means; rounded before era averages; selected TD/INT totals labeled NFL totals; hard-coded changes.
- **Problem:** Equal-weight and pooled rates answer different questions; selected rows omit low-volume players; 2007 gap and stale 2023 outlier language.
- **Corrected logic:** Retain labeled mean comparison, add pooled rates, full precision, gap in time line, generated findings.
- **Finding impact:** Era estimates change; no evidence to remove 2023 or assert significant/causal improvement.

### A09 — Chart labels

Original cells: 41, 52, 81, 154

- **Existing logic:** INT sum labeled Average INT; TD sum labeled Average TD; ANY/A labeled Passer Rating; cramped multi-panel plot.
- **Problem:** Axes misstate quantities/units.
- **Corrected logic:** Accurate units and population-specific charts; omit redundant cramped panel.
- **Finding impact:** Interpretation corrected, not raw counts.

### A10 — Join / selection

Original cells: 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67

- **Existing logic:** Join five-season Player/Tm groups without cardinality assertion; compare persistent player-team groups.
- **Problem:** Join keys are unique here (no observed multiplication), but tenure is survivorship selection; team relocations split codes; 2TM/3TM are not teams.
- **Corrected logic:** Retain useful descriptive team table, validate many_to_one, exclude multi-team codes, report rows/players and pooled rates.
- **Finding impact:** Team ranking may change under pooled denominator; development claims withdrawn.

### A11 — Aggregation

Original cells: 70, 71, 72, 73, 74, 75, 76, 77, 79, 80, 81, 83, 84, 85, 87, 88, 89, 91, 92, 93, 95, 96, 97

- **Existing logic:** Season means labeled career metrics, early rounding, TD summed and TD/game pooled.
- **Problem:** Low-volume seasons weigh equally with full seasons; incomplete years/careers and eligible-season exclusions. TD sum and matched TD/game are valid.
- **Corrected logic:** Pool counts for primary career rates; keep equal-season comparison and original cohort; retain TD logic without early rounding.
- **Finding impact:** Rating/ANYA/score values and ranks change; TD leader unchanged.

### A12 — Narrative / selection

Original cells: 74, 78, 82, 86, 90, 94, 98, 99, 100, 106, 112, 113

- **Existing logic:** Five-season filter selected after observing Purdy; hard-coded rankings (e.g. Rodgers first in mean rating, Cousins first in completion).
- **Problem:** Outcome-motivated threshold and stale claims; actual original mean-rating leader is Mahomes (103.93 vs Rodgers 103.83).
- **Corrected logic:** Disclose history, retain threshold for comparability, show 3/5/7-year sensitivity and generate current findings.
- **Finding impact:** Stale claims replaced; no preferred ranking target.

### A13 — Score

Original cells: 101, 102, 103, 104, 105, 106

- **Existing logic:** Weighted sum of raw rating, ANYA, NYA, completion, TD and TD/game.
- **Problem:** Different numerical scales make nominal weights misleading; TD dominates.
- **Corrected logic:** Retire raw-unit score; retain original normalized specification with pooled inputs.
- **Finding impact:** Raw score ranking not used as a headline.

### A14 — Score / methodology

Original cells: 107, 108, 109, 110, 111, 112, 113

- **Existing logic:** Scale by sample maximum, apply 25/25/15/15/10/10 weights; claim comprehensive superiority.
- **Problem:** Max scaling is cohort-dependent and does not remove overlapping inputs or longevity; no outcome validation.
- **Corrected logic:** Retain as subjective descriptive index, explain directions/weights, correlations, eligibility and leave-one-out sensitivity.
- **Finding impact:** Numerical correction from pooled inputs; no claim of validated superiority.

### A15 — Chart logic

Original cells: 111

- **Existing logic:** Draw meanQB_Score from unnormalized score while label uses meanQB_Score1.
- **Problem:** Position and label represent different scales.
- **Corrected logic:** Draw and label mean from current normalized score.
- **Finding impact:** Benchmark position fixed.

### A16 — Selection / score

Original cells: 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126

- **Existing logic:** Att>=150, Years_in_League>=5, G>=5; raw .45 ANYA + .35 AYA + .20 Rate.
- **Problem:** Removes first four years instead of requiring five observed seasons; allows one late qualifying season; raw rating scale dominates; metrics overlap.
- **Corrected logic:** Same career eligibility, pooled ANYA with companion metrics; retire Efficiency Score.
- **Finding impact:** Original late-career efficiency ranking is not retained as overall career efficiency.

### A17 — Denominator

Original cells: 129, 130, 131, 132

- **Existing logic:** Unique players counted separately at each age and plotted as pie.
- **Problem:** Same player appears in several slices, so not a partition of unique players.
- **Corrected logic:** Report player-season rows and distinct players per age band.
- **Finding impact:** Distribution interpretation corrected.

### A18 — Age aggregation / narrative

Original cells: 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145

- **Existing logic:** Mean of age-specific means; n counts players but mean weights rows; claim peak 31–35 and declining rating.
- **Problem:** Rare ages equally weighted; survivor selection; stated rating trend conflicts with own rising age averages; DOB discrepancies unresolved.
- **Corrected logic:** Direct row-weighted bands with both counts, supplied Age, no peak or causal aging claim.
- **Finding impact:** Age band values change; optimal-age conclusion withdrawn.

### A19 — Alignment / inference

Original cells: 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159

- **Existing logic:** Series.corr combines filtered G with df metrics.
- **Problem:** It happens to align correctly here because original indexes survive; brittle if reset. Repeated players invalidate naive independent inference.
- **Corrected logic:** Use columns of one cohort; keep descriptive correlations, no causal effects or significance.
- **Finding impact:** Correlation logic preserved; no demonstrated numerical alignment bug in cell 157.

### A20 — Contracts / cohort

Original cells: 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179

- **Existing logic:** value_df uses Att>100, but plots use filteredDf Att>10; Contract_APY includes estimates.
- **Problem:** Different charts answer different population questions; historic and estimated dollars mixed; APY called salary. Cells 173 and 182 also save SettingWithCopyWarning messages when assigning into a filtered view.
- **Corrected logic:** One explicit main cohort with source-labeled historical values and quality filters; missingness by year. Use explicit .loc filters and .copy() before assigning derived columns.
- **Finding impact:** Correlations and samples change; compare reconciliation sensitivity.

### A21 — Contracts / chart

Original cells: 167, 168, 169, 170, 171, 172

- **Existing logic:** Select highest APY per player; plot all value_df.Year but title says top 10 contracts by signing year.
- **Problem:** Season year differs from signing year; data are all rows, not just top 10; repeated contracts over-weight long durations.
- **Corrected logic:** Unique contract tuple summary grouped by actual Contract_Year_Signed; label APY as nominal average contract value.
- **Finding impact:** Signing-year conclusions recalculated; no realized-pay claim.

### A22 — Metric / denominator

Original cells: 181, 182, 183

- **Existing logic:** ANYA divided by APY millions; player-only labels on season records.
- **Problem:** Near-zero denominator dominates; repeated names obscure season; not ROI.
- **Corrected logic:** Retire ratio leaderboard; use labeled player-season residual table and scatter.
- **Finding impact:** Best-value ranking withdrawn.

### A23 — Leakage / inference

Original cells: 185, 186, 187, 188, 189, 190, 191, 192, 193

- **Existing logic:** Fit and rank residuals on same sample; call expected performance, best contracts, significant outperformance.
- **Problem:** In-sample residuals are not held-out predictions; repeated players/contracts, nominal era effects, selection of best season, and same-year information bias interpretation.
- **Corrected logic:** Label descriptive in-sample fitted residuals, include season, no predictive/ROI/significance claims.
- **Finding impact:** Best-value and predictive interpretations withdrawn.

### A24 — Conclusion

Original cells: 196

- **Existing logic:** Claims age/experience influence performance, contracts grow significantly, and combining metrics is more accurate.
- **Problem:** No causal, significance, predictive accuracy or external validation test.
- **Corrected logic:** Generated findings with explicit cohort, estimates, missing coverage and limitations.
- **Finding impact:** Unsupported claims removed.

### D01 — Source quality

Original cells: Source workbook / validation gap

- **Existing logic:** 1D dictionary says first-down count; 1,689 rows have fractional values.
- **Problem:** Ambiguous field cannot safely be interpreted as a count.
- **Corrected logic:** Preserve raw field; flag and omit from metrics pending source verification.
- **Finding impact:** No primary ranking effect: original did not use 1D for rankings.

### D02 — Contract quality

Original cells: Source workbook / validation gap

- **Existing logic:** APY assumed consistent with total value and length; 32 rows differ by more than $1/year.
- **Problem:** Different definitions, rounding or source error possible; cannot resolve from enrichment alone.
- **Corrected logic:** Export flagged rows, exclude from conservative main subset and show inclusion sensitivity; never overwrite APY.
- **Finding impact:** Main contract sample/association changes.

### D03 — Source validation

Original cells: Source workbook / validation gap

- **Existing logic:** One player has G greater than Games_In_Season, and G% >100.
- **Problem:** Trade-related schedule differences can be legitimate; not automatic corruption.
- **Corrected logic:** Flag for review, retain; no blanket G<=schedule filter. Negative passing yards/ANYA also can be legitimate.
- **Finding impact:** No arbitrary loss of observations.

### D04 — Source provenance

Original cells: Source workbook / validation gap

- **Existing logic:** Workbook contains summary/audit sheets with prior fixes and original Excel row references.
- **Problem:** Old row offsets/counts do not identify current records reliably; source histories are not fresh validation.
- **Corrected logic:** Treat NFL_Data as current input, use Player/Year keys; report schema, missingness, ratio and key tests anew.
- **Finding impact:** No double-counting or reapplying historical fixes.

## Preservation and validation

Original notebook and both XLSX files are unchanged. The root README makes no numerical NFL claim requiring correction and is unchanged. No unrelated project is edited.

The corrected notebook executes its code cells sequentially, exports reproducible result tables and four PNGs, checks source hashes, key uniqueness, merge cardinality, aggregate reconciliation and metric formula tolerances. The original notebook was inspected, not run with its unnecessary imports and plotting side effects; its important formulas are independently reproduced in comparison tables.

## Interview discussion

- Explain why sum(completions)/sum(attempts) differs from mean(season completion percentage).
- Demonstrate how pandas aligns boolean Series by index and why same-frame masks are safer.
- Explain why a five-season filter and late-career-only filter select different populations.
- Discuss subjective score weights, conceptual overlap, max scaling and rank sensitivity.
- Distinguish a missing year from a zero value and an estimated contract from historical attribution.
- Explain why repeated observations, contemporaneous contracts and in-sample residuals do not support forecasts or causal claims.
