# Data model: visible relationships and analytical purpose

![Original Power BI Model View screenshot](assets/data-model.png)

Source: the user-supplied Model View PNG, copied unchanged. SHA-256: `11657c30c127290ae1fed7c63678c7fc42d3614c42bdc20149bc810e24915779`. It visibly contains Orders, Customers, Products, Geography, Returns, Dimdate and !Measures. The final PBIX remains authoritative for implementation; the screenshot establishes visible table names, connection lines, endpoint markers and filter arrows, not hidden relationship properties.

## Visible structure

Orders is the central transaction table in this view, connected to customer, product, geographic and date tables. Its visible fields include Customer ID, Discount, GeoID, Order Date, Order ID, Product ID, Profit, Quantity and Row ID. This supports a transaction-centered analytical model; order-line grain is a design interpretation consistent with the report's order-versus-line labels, not an independently audited uniqueness constraint.

| Visible connection | Endpoint cardinalities | Visible cross-filter direction | Supported interpretation |
| --- | --- | --- | --- |
| Customers — Orders | Customers 1, Orders * | Customers → Orders | Customer attributes filter transactions |
| Products — Orders | Products 1, Orders * | Products → Orders | Product/category attributes filter transactions |
| Geography — Orders | Geography 1, Orders * | Geography → Orders | Location attributes filter transactions |
| Dimdate — Orders | Dimdate 1, Orders * | Dimdate → Orders | Date attributes filter transactions |
| Returns — Orders | Returns 1, Orders 1 | Bidirectional double arrow | Returns and Orders can filter one another |
| !Measures | No visible line | Not established | Visible measure-organizing table |

Lines are solid in the screenshot. They are consistent with active relationships in Model View, but exact active-state properties and other relationships outside the screenshot require a metadata/properties export. The screenshot does not reveal which columns form the endpoints. Matching visible names such as Customer ID, Product ID, GeoID and Row ID are candidate keys, not verified joins.

Customers, Products, Geography and Dimdate serve dimension-like analytical roles supported by their one-side positions and descriptive fields. Returns is a separate return-detail table; !Measures visibly includes Average_Discount, Average_Order_Value, Average_Sales and Average_Sales_per_Customer. This is not a full table/measure inventory: scrollbars indicate hidden fields.

## Returns granularity and filter implications

Both Orders and Returns visibly contain Row ID. The report's footer states that returned orders count unique Order IDs while returned-line charts retain line-level detail. Page 6 displays 727 returned orders and 800 returned lines. Together these support the need to distinguish transaction lines from orders, but they do not prove that Row ID is the actual relationship endpoint or that each key is unique.

The visible Orders–Returns relationship is **one-to-one and bidirectional**, not an assumed one-to-many join. A filter originating in Returns can therefore propagate to Orders, and vice versa. Return-reason selection may affect the order population used by a measure, including a denominator unless the original DAX deliberately controls context. This is a potential implication of the configuration, not evidence of an incorrect calculation. Export the original endpoints and measure expressions; test a baseline and filtered return-reason state before validating return-rate semantics.

## Date evidence and unverified properties

The final diagram and screenshot both show Dimdate. Product Analysis binds Dimdate.Year, while seven pages retain dimDate! queryRef aliases in report definitions. An alias does not prove a separate current model table; resolve actual expression bindings in Desktop before asserting model inconsistency. Date designation, relationship columns, data types, keys, referential integrity, calculated-column formulas and Power Query steps remain unverified.

The screenshot shows calculated-column icons for some Dimdate fields but no expressions. No DAX or relationship key has been reconstructed. The saved .dax query is empty and the compressed DataModel has not been decoded.

## Evidence history

The earlier [PBIX audit](AUDIT.md) documented seven diagram nodes without relationship endpoints. The new screenshot adds visible cardinality and direction evidence; it does not retroactively extract hidden metadata. The older [table inventory illustration](assets/table-inventory.svg) is retained for provenance, while the authentic screenshot is now the primary model preview.

See [rendered evidence](RENDERED-EVIDENCE.md), [measure references](MEASURES.md) and [remaining export work](assets/README.md).
