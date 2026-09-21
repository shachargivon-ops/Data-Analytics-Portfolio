# Data model evidence

![Verified diagram-node inventory; no relationship edges](assets/table-inventory.svg)

The image is a documentation illustration generated from verified `DiagramLayout` node names. It is not a Power BI screenshot or a relationship model. The package does not expose relationship edges in this metadata, so none have been drawn.

| Diagram node | Other direct report evidence | Inferred role, not verified model design |
| --- | --- | --- |
| Orders | `Ship Mode` used by shipping/returns visuals | Transaction/fact candidate; row grain unknown |
| Customers | `Customer Name`, `Segment`, customer hierarchy | Customer dimension candidate |
| Products | Category, Sub-Category, Product Name | Product dimension candidate |
| Geography | Region, State, City; geographic hierarchy | Geography dimension candidate |
| Returns | Return Reason | Return-related table; grain and keys unknown |
| DimDate | Diagram node only in this audit | Date-table candidate |
| dimDate! | Date variation hierarchy used throughout the report | Date-table candidate; do not conflate with DimDate |
| !Measures | 21 distinct Measure-expression names referenced | Measure-organizing table candidate |

## Not established

Primary/foreign keys, relationship endpoints, active/inactive relationships, cardinalities, cross-filter direction, referential integrity, date-table designation, full column inventory, calculated columns, data types and transformations were not extracted. There is no evidence here to claim a validated star schema. Diagram entries alone do not prove current model-table state or that a relationship exists.

The `DataModel` member is a compressed binary model (its header identifies XPress9). A read-only PBIXRay 0.15.5 extraction attempt could not initialize because Windows Application Control blocked the `xmhuffman` extension. No measures, relationships or calculated columns were recovered by that attempt. This limitation is environmental, not proof that the model lacks them.

## Verification to finish in Desktop

Export the semantic model as text where supported or use a trusted metadata export. Record all tables/columns, each relationship’s endpoints/cardinality/direction/active state, the designated date table and original DAX. Confirm which date table drives the report and whether relationships propagate the intended slicers. Then replace this inventory illustration with a relationship diagram derived from those verified records.

Evidence: [full report extraction](report-structure.json), [measure references](MEASURES.md). Parser reference: [PBIXRay source](https://github.com/Hugoberry/pbixray).
