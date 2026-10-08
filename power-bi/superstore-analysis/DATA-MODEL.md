# Final data model evidence

![Verified table names; no relationship edges](assets/table-inventory.svg)

This is a metadata illustration, not a Power BI screenshot or relationship diagram. Final `DiagramLayout` contains seven nodes: Customers, Geography, Orders, Products, Returns, !Measures and Dimdate. It contains no relationship endpoints, cardinalities, active states or filter directions.

| Node / report reference | Verified evidence | Interpretation and limit |
| --- | --- | --- |
| Orders | Diagram node; Ship Mode bindings | Transaction candidate; grain and keys unknown |
| Customers | Diagram node; Customer Name, Segment and hierarchy bindings | Customer dimension candidate |
| Products | Diagram node; Category, Sub-Category, Product Name | Product dimension candidate |
| Geography | Diagram node; Region, State, City and hierarchy bindings | Geographic dimension candidate |
| Returns | Diagram node; Return Reason binding | Return table; grain and keys unknown |
| !Measures | Diagram node; 45 referenced measure names | Measure organization; full inventory unknown |
| Dimdate | Diagram node; Product Analysis year slicer binds Dimdate.Year | Date-table candidate; designation unknown |
| dimDate! | Remaining date variation hierarchy queryRefs on seven pages; no final diagram node | Unresolved label; queryRef alone does not establish a separate current table |

The older diagram contained both `DimDate` and `dimDate!`; that diagram is not authoritative for the final report. Preserve exact casing and do not conflate final `Dimdate` with the remaining `dimDate!` query aliases. Resolve their actual model bindings in Desktop.

## Relationships and expressions

No technically verified relationships or calculated columns are available to publish. The compressed binary `DataModel` requires a compatible semantic-model reader; standard ZIP/JSON parsing does not expose its metadata. The earlier audit recorded a Windows Application Control failure for PBIXRay/xmhuffman on the previous source. The current runtime has no PBIXRay installed, and this final audit does not claim that the prior attempt extracted the final model. No parser policy was bypassed.

Export model metadata or save a working copy as PBIP/TMDL where supported. Record relationship endpoints, cardinality, cross-filter direction, active state, keys, date-table designation, original DAX and calculated columns. Verify slicer propagation and the date aliases before claiming a validated star schema.

Evidence: [report extraction](report-structure.json), [measures](MEASURES.md).
