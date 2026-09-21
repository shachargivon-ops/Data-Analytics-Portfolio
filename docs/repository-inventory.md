# Repository Inventory and Structure

[Portfolio](../README.md)

## Inspection baseline

Inspected every tracked file on `main` at commit `cb88126b4938e4885bd6aa978da4af771497a4d6` before making changes: **10 files — two SQL scripts, one notebook and seven Markdown documents**.

| Existing file | Content |
| --- | --- |
| [NFL SQL script](../Project%201%20%E2%80%93%20Table%20Design%20%26%20Cretaion%20%28Shachar%20Givon%29.sql) | Database/table creation, entity documentation and loading queries |
| [WideWorldImporters SQL script](../SQLQuery1%20%20Project%202%20%20SQL%20Data%20Analysis%20%28Shachar%20Givon%29.sql) | Ten business-analysis exercises |
| [pyodbc class.ipynb](../pyodbc%20class.ipynb) | 30 cells including one raw exercise cell and one empty code cell; Northwind queries, saved tables, warnings and eight PNG chart outputs |
| [README.md](../README.md) | Portfolio introduction and project navigation |
| [docs/portfolio-review.md](portfolio-review.md) | Review findings and next steps |
| [docs/projects/wideworldimporters.md](projects/wideworldimporters.md) | Existing SQL guide URL |
| [docs/projects/nfl-database.md](projects/nfl-database.md) | Existing database guide URL |
| [docs/projects/northwind-python.md](projects/northwind-python.md) | Existing notebook guide URL |
| [docs/projects/nfl-python.md](projects/nfl-python.md) | NFL Python status page |
| [docs/projects/power-bi-superstore.md](projects/power-bi-superstore.md) | Superstore status page |

No standalone datasets, database backups, Excel workbooks, Power BI reports, NFL Python code, environment manifests or standalone images were present. SQL entity descriptions serve as an embedded data dictionary; notebook tables and images are saved outputs rather than separately supplied source datasets.

## Implemented structure

```text
Data-Analytics-Portfolio/
├── README.md
├── sql/
│   ├── wideworldimporters-analysis/README.md
│   └── nfl-database/README.md
├── python/
│   ├── northwind-analysis/README.md
│   └── nfl-quarterback-analysis/README.md
├── power-bi/
│   └── superstore-analysis/README.md
├── assets/
│   ├── README.md
│   └── northwind-suppliers-by-country.png
├── docs/
│   ├── repository-inventory.md
│   ├── portfolio-review.md
│   └── projects/  (existing guide URLs retained)
└── original SQL scripts and notebook at their existing root paths
```

The new project folders contain documentation entry points. NFL Python and Superstore are clearly marked as awaiting files. The source files are not duplicated, renamed or moved, preserving existing direct links. Older guide pages point to the current project READMEs.

One original notebook chart is extracted unchanged into assets for convenient review. Future analysis files can be added to their project folders; any later relocation of existing sources should include a link migration plan.
