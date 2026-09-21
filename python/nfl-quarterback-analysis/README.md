# NFL Quarterback Performance Analysis

A Python/pandas analysis of NFL passing production, efficiency and contract associations across available 2001–2023 seasons.

**Recommended version:** [Review the corrected notebook](nfl-quarterback-analysis-corrected.ipynb), with executed results and charts.

## Business / Research Questions

- How do passing production and efficiency differ across players and observed seasons?
- How do pooled career rates differ from equally weighted season averages?
- How sensitive is the QB Score to eligibility and overlapping metrics?
- How is historical-attributed contract APY associated with passing efficiency?

## Dataset

**2,246 player-season records · 36 columns · 22 observed seasons · 2001–2023, excluding 2007.**

The supplied Excel workbook contains passing statistics and contract fields, supported by a bilingual data dictionary. There are no duplicate Player/Year keys. A position column is unavailable, so participation filters identify passing players rather than verified quarterbacks. Career comparisons cover available qualifying seasons, not complete careers.

## Python / pandas Methodology

Use pandas to validate dates, missing values and player-season keys; filter explicit cohorts; aggregate counts; and check merge cardinality. NumPy supports numerical operations and descriptive line fitting; Matplotlib presents the results.

Career efficiency is calculated from **pooled counts** rather than averaging season percentages. Career comparisons require games played > 5, attempts > 30 and at least five qualifying observed seasons. Trend and contract analyses use their own documented participation thresholds. Contract estimates are separated from historical-attributed values; sensitivity checks assess eligibility, score components and contract reconciliation.

## Key Metrics

| Metric | What it measures |
| --- | --- |
| Passer rating and completion % | Passing efficiency and the share of attempts completed, calculated from pooled counts |
| ANY/A and NY/A | Adjusted net yards and net yards per attempt, including sacks in the denominator |
| TD and TD/game | Total passing touchdowns and touchdowns per game in qualifying observations |
| QB Score | A normalized weighted comparison of efficiency and production; subjective, with overlapping inputs |
| Contract APY | Average contract value per year in nominal USD; not salary paid, cap charge or ROI |

## Key Findings

Career rankings use **75 eligible players** and available qualifying seasons; era and contract results use their respective cohorts.

- **Aaron Rodgers leads pooled passer rating (103.81); Patrick Mahomes leads pooled ANY/A (7.77).**
- **Tom Brady leads touchdown production with 599 passing TDs.** This is an observed qualifying-season total, not a full-career total.
- **Aaron Rodgers leads the exploratory normalized QB Score (94.23).** Subjective weights and overlapping inputs limit interpretation.
- **Pooled ANY/A is 5.59 in observed 2001–2010 seasons and 6.23 in 2011–2020.** This descriptive comparison has unequal coverage because 2007 is missing.
- **Contract APY and ANY/A have Pearson r = 0.272** across 627 reconciled, source-labeled historical player-seasons. This is an association, without a significance or causal claim.

## Visualizations

**Passing efficiency over time.** The gap makes the missing 2007 season visible.

![Observed season efficiency trend](assets/performance-trend.png)

**Career efficiency comparison.** Pooled ANY/A compares production per passing opportunity, including sacks.

![Pooled passing efficiency](assets/efficiency-comparison.png)

**Exploratory QB Score.** The comparison combines efficiency and production; total TD retains a longevity preference.

![Exploratory QB Score](assets/qb-score-comparison.png)

**Contract relationship.** Historical-attributed APY is compared with season efficiency; estimates and reconciliation flags are excluded.

![Historical-attributed APY and efficiency](assets/contract-relationship.png)

## Limitations

- **Coverage and identity:** 2007 is missing and career windows are incomplete. No position/player IDs are supplied. There are **51 DOB/age inconsistencies**; age summaries remain provisional. The ambiguous first-down field has **1,689 fractional values** and is excluded from metrics.
- **Contract provenance and missingness:** 1,082 rows are source-labeled historical, 222 are 2026 rookie-scale estimates and 942 are missing. Historical attribution is not independently verified record by record. Estimates are excluded from historical comparisons; missingness is nonrandom. APY is not inflation- or salary-cap-adjusted, and effective signing dates are unavailable.
- **Subjective scoring:** QB Score weights overlap conceptually, depend on the comparison cohort and retain longevity influence. The score is not a validated measure of player ability.
- **Selection and survivorship:** Participation and career-length filters select which players remain. Age comparisons are cross-sectional; team relocation codes are not harmonized. Passing metrics omit rushing, opponents, offensive line, scheme and game state.
- **No causal claims:** Repeated players/contracts and same-season information limit interpretation. No statistical significance, causal effects or out-of-sample predictive accuracy are claimed.

## Explore the Project

| Resource | Purpose |
| --- | --- |
| **[Corrected notebook — recommended](nfl-quarterback-analysis-corrected.ipynb)** | Full analysis, methodology, executed tables and charts |
| [Detailed audit](AUDIT.md) | 28 grouped issues covering the 198-cell original analysis, corrections and finding impacts |
| [Original analysis — retained for transparency](Project%203%20NFL%20Passing%20Statistics%20Analysis%20%28Shachar%20Givon%29%20.ipynb) | Unmodified original notebook for comparison |
| [Input workbook](Project%203%20NFL%20Passing%20Statistics%20Analysis%20%28Shachar%20Givon%29.xlsx) · [Data dictionary](project%203%20-%20Table%20explanation%20%28Shachar%20Givon%29.xlsx) | Unmodified source files |
| [Validation and result tables](tables/) · [Cell-by-cell review](cell-audit.csv) | Detailed controls, cohort counts, sensitivity results and audit coverage |

<details>
<summary>Technical methods and reproducibility</summary>

### Cohort definitions

| Analysis | Eligibility |
| --- | --- |
| Season trends and playing-volume correlations | G > 5 and Att > 10 |
| Career and efficiency | G > 5 and Att > 30; at least 5 qualifying observed seasons |
| Age summaries | GS ≥ 5 |
| Contract relationship | G > 5 and Att > 100; source-labeled historical, positive, active interval and APY reconciliation |

G means games played; GS means games started; Att means pass attempts. Sensitivity tables compare attempt thresholds and 3/5/7-season eligibility. Multi-team player-season totals remain in player analyses but are excluded from team attribution.

### Metric definitions

Completion % = 100 × completions / attempts. ANY/A = (yards + 20 × TD − 45 × interceptions − sack yards) / (attempts + sacks). NY/A = (yards − sack yards) / (attempts + sacks). Passer rating uses the standard four-component formula, with each component clipped to [0, 2.375], recomputed from pooled counts. TD/game uses games from the same observations as the TD numerator.

Definitions were checked against the [Pro Football Reference glossary](https://www.pro-football-reference.com/about/glossary.htm) and [Pro Football Hall of Fame](https://www.profootballhof.com/news/nfl-s-passer-rating).

QB Score weights are rating 25%, ANY/A 25%, NY/A 15%, completion percentage 15%, total TD 10% and TD/game 10%. Each input is divided by its eligible-cohort maximum and multiplied by 100; higher is better for every input. Metric correlations and leave-one-component-out ranks expose sensitivity. Raw-unit scores are retired.

### Contract and validation details

Each of the five contract fields has 942 missing observations. Thirty-two source rows fail APY ≈ value/length within $1/year. The main analysis excludes these flags; including them yields 653 historical player-seasons and r = 0.266 instead of 627 and r = 0.272. Signing-year summaries use actual signing year and deduplicated contract tuples. Fitted residuals describe the fitting sample, not predictions.

The bilingual dictionary defines 31 fields. Six workbook audit/summary sheets describe earlier enrichment; old 2,350-row counts are not current controls. Current validation includes source-file hashes, formula reconciliation, key uniqueness and merge cardinality. Negative passing yards/ANY/A and trade-related games above a team schedule are not automatically deleted.

### Run the analysis

Use Python 3.12 and install [requirements.txt](requirements.txt), then run `python verify_notebook.py` from this directory. The [verification script](verify_notebook.py) executes the corrected notebook in a fresh process and checks its format and assertions. Alternatively, open the corrected notebook in Jupyter and run all cells from this directory or the repository root.

Execution regenerates result tables and [PNG previews](assets/). It does not edit the original notebook or XLSX files. Additional tools are openpyxl for reading XLSX and IPython/Jupyter.

</details>
