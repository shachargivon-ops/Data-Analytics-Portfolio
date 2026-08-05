CREATE DATABASE NFL_Analysis

USE NFL_Analysis

--VIEW FULL DATASET TABLE
SELECT*
FROM NFL_Passing

/*
--Overview of the Dataset
---------------------------------------------------------------------------------------------------------------
The dataset contains passing statistics for National Football League players across multiple seasons.

Each row in the dataset represents the passing performance of a specific player during a specific season.

The dataset includes information about:

* Players
* Teams
* Seasons
* Passing statistics
* QB efficiency metrics
* Sack statistics
* Touchdowns and turnovers



--Entities
---------------------------------------------------------------------------------------------------------------
Existing Entities in the Dataset:
1. Players
An entity representing the players.

Relevant Data:
*Player name
*Age in a specific season (Created duplications and therefore was not used)
*League Entry Date
*Birth Date

Purpose of the Table:
To enable player performance analysis across multiple seasons.

2. Teams

An entity representing National Football League teams.
Relevant Data:
*Team name

Purpose of the Table:
To compare team performance and analyze playing styles.

3. Seasons
An entity representing NFL seasons.

*Relevant Data:
*Year
*Number of Games in season

Purpose of the Table:
To analyze trends and changes over time.

4. Passing Statistics
The core entity containing passing performance metrics.

Relevant Data:
*Cmp
*Att
*Cmp%
*Yds
*TD
*Int
*Rate
*AY/A
*ANY/A
*(and additional passing metrics)

Purpose of the Table:
To perform advanced analysis of passing efficiency and quarterback performance.

5. Sack Statistics
An entity focused on sack analysis.

Relevant Data:
*Sk
*Yds-s
*Sk%

Purpose of the Table:
To analyze offensive line quality and quarterback pressure.

--Realations between the tables:
---------------------------------------------------------------------------------------------------------------
--Players → PassingStats
Each player can appear in multiple seasons;
therefore, there is a one-to-many (1:N) relationship between the Players table and the PassingStats table.

--Teams → PassingStats
Each team can have passing statistics for multiple players across multiple seasons;
therefore, there is a one-to-many (1:N) relationship between the Teams table and the PassingStats table.

--Seasons → PassingStats
Each season contains passing statistics for many players;
therefore, there is a one-to-many (1:N) relationship between the Seasons table and the PassingStats table.

*All three tables (Players, Teams, Seasons) are acting as foreign keys in the PassingStats table.

--PassingStats → SackStats
Each passing statistics record can have at most one corresponding sack statistics record that describes sack-related performance metrics.
Therefore, there is a one-to-one (1:1) relationship between the PassingStats table and the SackStats table through the PassingStatID foreign key.

--Summary
The PassingStats table serves as the central fact table, linking players, teams, and seasons.
The SackStats table extends the passing statistics by storing advanced metrics related to sacks and their impact on passing efficiency.

--Tables:
Explantion about the columns in each table

--1 Players:
| Column Name                | Short Description                                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| PlayerID                   | Unique identifier for each player.                                                                              |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| PlayerName                 | Full name of the player.                                                                                        |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| BirthDate                  | Birth date of the player.                                                                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| LeagueEntryDate            | Date the player entered the NFL league, based on the first day of the NFL Draft for the player's rookie season. |

--2 Teams:
| Column Name                | Short Description                                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| TeamID                     | Unique identifier for each team.                                                                                |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| TeamName                   | Official name of the NFL team.                                                                                  |

--3 Seasons:
| Column Name                | Short Description                                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SeasonID                   | Unique identifier for each NFL season.                                                                          |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SeasonYear                 | Year in which the NFL season was played.                                                                        |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| GamesInSeason              | Total number of games played during the season.                                                                 |

--4 PassingStats:
| Column Name                | Short Description                                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| PassingStatID              | Unique identifier for a player's passing statistics record for a season.                                        |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| PlayerID                   | Identifier of the player associated with the passing statistics.                                                |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| TeamID                     | Identifier of the team associated with the passing statistics.                                                  |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SeasonID                   | Identifier of the season associated with the passing statistics.                                                |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| GamesPlayed                | Number of games in which the player participated.                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| GamesStarted               | Number of games in which the player started.                                                                    |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| GamesPlayedPercentage      | Percentage of season games in which the player participated.                                                    |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| GamesStartedPercentage     | Percentage of season games in which the player started.                                                         |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Completions                | Number of completed passes.                                                                                     |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Attempts                   | Number of pass attempts made by the player.                                                                     |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| CompletionPercentage       | Percentage of completed passes out of total attempts.                                                           |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| PassingYards               | Total passing yards gained from completed passes.                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Touchdowns                 | Number of touchdown passes thrown by the player.                                                                |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| TouchdownPercentage        | Percentage of pass attempts resulting in touchdowns.                                                            |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Interceptions              | Number of passes intercepted by opposing players.                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| InterceptionPercentage     | Percentage of pass attempts resulting in interceptions.                                                         |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| FirstDowns                 | Number of passing plays resulting in a first down.                                                              |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| LongestPass                | Longest completed pass measured in yards.                                                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| YardsPerAttempt            | Average passing yards gained per pass attempt.                                                                  |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| AdjustedYardsPerAttempt    | Passing efficiency metric adjusted for touchdowns and interceptions.                                            |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| YardsPerCompletion         | Average yards gained per completed pass.                                                                        |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| YardsPerGame               | Average passing yards gained per game played.                                                                   |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| QuarterbackRating          | Overall quarterback passing performance rating.                                                                 |

--5 SackStats
| Column Name                | Short Description                                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SackStatID                 | Unique identifier for each sack statistics record.                                                              |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| PlayerID                   | Identifier of the player associated with the sack statistics.                                                   |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| TeamID                     | Identifier of the team associated with the sack statistics.                                                     |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SeasonID                   | Identifier of the season associated with the sack statistics.                                                   |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Sacks                      | Number of times the quarterback was sacked.( tackled behind the line of scrimmage                               |
|                            | results in a loss of yardage on the play, with the next down starting from the new spot of the ball)            |                                                        
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SackYardsLost              | Total yards lost due to sacks.                                                                                  |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| SackPercentage             | Percentage of passing plays resulting in a sack.                                                                |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| NetYardsPerAttempt         | Average net passing yards per attempt after subtracting sack yard losses.                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| AdjustedNetYardsPerAttempt | Advanced passing efficiency metric adjusted for touchdowns, interceptions, and sacks.                           |

Added Explanation:
| Column Name                | Extended Description                                                                                            |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| AdjustedYardsPerAttempt    | An advanced passing efficiency statistic that improves the basic Yards Per Attempt metric                       | 
|                            | by rewarding touchdown passes and penalizing interceptions.                                                     |
|                            | It is used to measure how effective and productive a quarterback is when passing the ball.                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| QuarterbackRating          | A calculated NFL performance rating that combines several passing statistics,                                   |
|                            |  including completions, passing yards, touchdowns, and interceptions,                                           |
|                            | into a single score representing the quarterback’s overall passing performance.                                 |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| NetYardsPerAttempt         | A passing efficiency metric that measures the average yards gained per pass attempt                             |
|                            | after subtracting yards lost from sacks.                                                                        |
|                            | It reflects both passing production and the impact of defensive pressure.                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| AdjustedNetYardsPerAttempt | An advanced quarterback efficiency metric that extends Net Yards Per Attempt                                    |
|                            | by also rewarding touchdown passes and penalizing interceptions.                                                |
|                            | It is considered one of the most accurate indicators of overall passing efficiency.                             |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
*/


--CREATE TABLES
---------------
--1 Players

CREATE TABLE Players
(
PlayerID INT IDENTITY (1,1),
PlayerName varchar(255) NOT NULL, 
BirthDate DATE NOT NULL, 
LeagueEntryDate DATE NOT NULL,
CONSTRAINT Pk_playerID PRIMARY KEY(PlayerID),
)

--2 Teams

CREATE TABLE Teams
(
TeamID INT IDENTITY (1,1), 
TeamName varchar(255) NOT NULL,
CONSTRAINT Pk_teamID PRIMARY KEY(TeamID),
)


--3 Seasons

CREATE TABLE Seasons
(
SeasonID INT IDENTITY (1,1),
SeasonYear INT NOT NULL, 
GamesInSeason INT NOT NULL,
CONSTRAINT Pk_seasonID PRIMARY KEY(SeasonID),
)

--4 PassingStats

CREATE TABLE PassingStats
(
PassingStatID INT IDENTITY(1,1),
PlayerID INT,
TeamID INT,
SeasonID INT,

GamesPlayed INT NOT NULL,
GamesStarted INT NOT NULL,
GamesPlayedPercentage FLOAT NOT NULL,
GamesStartedPercentage FLOAT NOT NULL,

Completions INT NOT NULL,
Attempts INT NOT NULL,
CompletionPercentage FLOAT NOT NULL,

PassingYards INT NOT NULL,
Touchdowns INT NOT NULL,
TouchdownPercentage FLOAT NOT NULL,

Interceptions INT NOT NULL, 
InterceptionPercentage FLOAT NOT NULL,

FirstDowns INT NOT NULL, 
LongestPass INT NOT NULL,

YardsPerAttempt FLOAT NOT NULL,
AdjustedYardsPerAttempt FLOAT NOT NULL,
YardsPerCompletion FLOAT NOT NULL,
YardsPerGame FLOAT NOT NULL,

QuarterbackRating FLOAT NOT NULL,

CONSTRAINT Pk_passingStatID PRIMARY KEY(PassingStatID),
CONSTRAINT Fk_passingsstat_players FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
CONSTRAINT Fk_passingsstat_teams FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
CONSTRAINT Fk_passingsstat_seasons FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID),
)


--5 SackStats

CREATE TABLE SackStats
(
SackStatID INT IDENTITY(1,1),
PassingStatID INT,

Sacks INT NOT NULL,
SackYardsLost INT NOT NULL,
SackPercentage FLOAT NOT NULL,

NetYardsPerAttempt FLOAT NOT NULL,
AdjustedNetYardsPerAttempt FLOAT NOT NULL,

CONSTRAINT Pk_SackStatID1 PRIMARY KEY(SackStatID),
CONSTRAINT Fk_SackStat_passingsstat FOREIGN KEY (PassingStatID) REFERENCES PassingStats(PassingStatID)
)

--INSERT VALUES INTO CREATED TABLES
-----------------------------------


-- INSERT PLAYERS 
INSERT INTO Players(PlayerName,BirthDate,LeagueEntryDate)
SELECT DISTINCT PlayerName,BirthDate,LeagueEntryDate
FROM NFL_Passing 
WHERE Attempts>10

/*
I used 'WHERE Attempts>10' sort to filter out players who are not in the QB role.
*/

--VIEW FULL TABLE
SELECT*
FROM Players

--INSERT TEAMS
INSERT INTO Teams(TeamName)
SELECT DISTINCT TeamName
FROM NFL_Passing
ORDER BY TeamName

--VIEW FULL TABLE
SELECT*
FROM Teams

--INSERT SEASONS
INSERT INTO Seasons(SeasonYear,GamesInSeason)
SELECT DISTINCT SeasonYear,GamesInSeason
FROM  NFL_Passing 
ORDER BY SeasonYear

--VIEW FULL TABLE
SELECT*
FROM Seasons


--INSERT PASSING STATS
INSERT INTO PassingStats(PlayerID, TeamID, SeasonID, GamesPlayed, GamesStarted,
GamesPlayedPercentage, GamesStartedPercentage, Completions, Attempts, CompletionPercentage, PassingYards,
Touchdowns, TouchdownPercentage, Interceptions, InterceptionPercentage, FirstDowns, LongestPass,
YardsPerAttempt, AdjustedYardsPerAttempt, YardsPerCompletion, YardsPerGame, QuarterbackRating)

SELECT DISTINCT PlayerID, TeamID, SeasonID, GamesPlayed, GamesStarted,
GamesPlayedPercentage, GamesStartedPercentage, Completions, Attempts, CompletionPercentage, PassingYards,
Touchdowns, TouchdownPercentage, Interceptions, InterceptionPercentage, FirstDowns, LongestPass,
YardsPerAttempt, AdjustedYardsPerAttempt, YardsPerCompletion, YardsPerGame, QuarterbackRating

FROM NFL_Passing AS NFLP JOIN Players AS PLAY
ON NFLP.PlayerName=PLAY.PlayerName
JOIN Teams AS TEAM
ON NFLP.TeamName=TEAM.TeamName
JOIN Seasons AS SEAS
ON NFLP.SeasonYear=SEAS.SeasonYear

WHERE Attempts>10
ORDER BY PlayerID,SeasonID,TeamID

--VIEW FULL TABLE
SELECT*
FROM PassingStats


-- INSERT SACKS STATS (PRESSURE)
INSERT INTO SackStats (PassingStatID, Sacks,SackYardsLost, SackPercentage,
NetYardsPerAttempt, AdjustedNetYardsPerAttempt)

SELECT PASS.PassingStatID,NFLP.Sacks,NFLP.SackYardsLost, NFLP.SackPercentage,
NFLP.NetYardsPerAttempt, NFLP.AdjustedNetYardsPerAttempt

FROM NFL_Passing AS NFLP
JOIN Players AS PLAY
ON NFLP.PlayerName = PLAY.PlayerName
JOIN Teams AS TEAM
ON NFLP.TeamName = TEAM.TeamName
JOIN Seasons AS SEAS
ON NFLP.SeasonYear = SEAS.SeasonYear
JOIN PassingStats AS PASS
ON PASS.PlayerID=PLAY.PlayerID
AND PASS.TeamID=TEAM.TeamID
AND PASS.SeasonID=SEAS.SeasonID

WHERE NFLP.Attempts>10

--VIEW FULL TABLE
SELECT*
FROM SackStats


--VIEW ALL FULL TABLES
----------------------
SELECT*
FROM Players

SELECT*
FROM Teams

SELECT*
FROM Seasons

SELECT*
FROM PassingStats

SELECT*
FROM SackStats




