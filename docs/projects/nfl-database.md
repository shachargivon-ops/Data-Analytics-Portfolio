# NFL database | Relational design in SQL Server

[Portfolio home](../../README.md) · [SQL source](../../Project%201%20%E2%80%93%20Table%20Design%20%26%20Cretaion%20%28Shachar%20Givon%29.sql)

## Purpose

Structure NFL passing statistics into related tables for player, team and season analysis. The script creates an `NFL_Analysis` database and loads tables from an existing `NFL_Passing` source table.

## Model and implementation

| Table | Role |
| --- | --- |
| `Players` | Player identity, birth date and league entry date |
| `Teams` | Team identity and name |
| `Seasons` | Season year and number of games |
| `PassingStats` | Passing metrics linked to player, team and season |
| `SackStats` | Sack and efficiency metrics linked to a passing-stat record |

The source demonstrates `CREATE TABLE`, identity columns, primary and foreign keys, `INSERT ... SELECT`, joins and `DISTINCT`. Its comments also explain the intended entities and relationships.

## How to review or run

Use a disposable SQL Server database environment. Review the database-creation statements separately and select the intended database before running table and insert sections.

The `NFL_Passing` table must first be supplied with the columns expected by the inserts. Its source dataset and import instructions are not included, so the script is not currently a complete reproducible setup. Review the table-definition syntax in your SQL Server environment before execution.

## Assumptions and limitations

- The script filters passing records using `Attempts > 10`. That threshold selects by passing volume and does not itself verify a player's position.
- Player matching uses names; duplicate names or inconsistent spelling could affect joins.
- The documented one-to-one relationship between passing and sack records is not enforced by a unique constraint on `SackStats.PassingStatID`.
- Source grain and uniqueness should be checked before loading, particularly for players associated with more than one team in a season.
- The script creates objects and inserts rows without a rerun strategy. Repeating sections may fail or duplicate data.

This project demonstrates database modeling and loading logic. It does not establish production deployment or validated analytical results.
