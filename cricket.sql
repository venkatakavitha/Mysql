create database cricketes;
show databases;
USE `cricketes`;
CREATE TABLE teams (
    teamid INT PRIMARY KEY,
    teamname VARCHAR(100),
    teamcode INT,
    team_capitan VARCHAR(100),
    vice_capitan VARCHAR(100),
    teamcoach VARCHAR(100)
);
SELECT * From teams;
INSERT INTO teams (teamid, teamname, teamcode, team_capitan, vice_capitan, teamcoach)
VALUES (2, 'India', 102, 'Rohit sharma', 'Virat Kohli', 'Gutham gambhir');
CREATE TABLE player(playerid INT primary key, firstname varchar(100),Lastname varchar(100),age INT, isbat boolean,isball boolean,
iswicketkeeper boolean);
SELECT * From player;
INSERT INTO player (playerid, firstname, lastname, age, isbat, isball, iswicketkeeper)
VALUES (4, 'Jasprit', 'Bhumbra', 37, FALSE, TRUE, FALSE);
CREATE TABLE points(play varchar(100),Won INT,Lost INT,Draw INT,points INT);
SELECT * From points;
INSERT INTO points (play, Won, Lost, Draw, points)
VALUES ('Australia', 4, 2, 3, 14);
ALTER TABLE points 
RENAME column points to Scorecard;
CREATE TABLE Matchs(matchid INT primary key, matchno INT, Team1 varchar(100),Team2 varchar(100));
SELECT * From Matchs;
INSERT INTO Matchs (matchid, matchno, Team1, Team2)
VALUES
    (1, 102, 'India', 'Team D'),
    (2, 103, 'Australia', 'Team F'),
    (3, 104, 'Srilanka', 'Team H');
CREATE TABLE Toss (
    matchid INT PRIMARY KEY,
    team_tosswin TINYINT,
    choose VARCHAR(100),
    toss_lost VARCHAR(100)
);
SELECT * From Toss;
INSERT INTO Toss (matchid, team_tosswin, choose, toss_lost)
VALUES
    (2, 1, 'India', 'Australia'),
    (3, 0, 'England', 'New Zealand'),
    (4, 1, 'Pakistan', 'Sri Lanka');
    CREATE TABLE batting (
    playerid INT PRIMARY KEY,
    playername VARCHAR(100),
    runs INT,
    balls INT,
    fours INT,
    sixes INT,
    strike_rate DECIMAL(5, 2)
);
SELECT * From batting;
INSERT INTO batting (playerid, playername, runs, balls, fours, sixes, strike_rate)
VALUES
    (1, 'Virat Kohli', 50, 30, 5, 2, 166.67),
    (2, 'Rohit Sharma', 75, 50, 7, 4, 150.00),
    (3, 'Shikhar Dhawan', 40, 35, 4, 1, 114.29);
     CREATE TABLE bowling (
    playerid INT PRIMARY KEY,
    playername VARCHAR(100),
    overs DECIMAL(4, 1),
    runs INT,
    wickets INT,
    economy_rate DECIMAL(5, 2),
    best_bowling VARCHAR(50)
);
SELECT * From bowling;
INSERT INTO bowling (playerid, playername, overs, runs, wickets, economy_rate, best_bowling)
VALUES
    (1, 'Jasprit Bumrah', 10.0, 45, 3, 4.50, '3/30'),
    (2, 'Mohammad Shami', 8.2, 40, 2, 4.80, '2/25'),
    (3, 'Ravichandran Ashwin', 9.0, 35, 4, 3.89, '4/28');
    ALTER TABLE bowling
ADD COLUMN team_name VARCHAR(100);
ALTER TABLE bowling
MODIFY COLUMN economy_rate DECIMAL(6, 2);
CREATE TABLE result (
    matchid INT PRIMARY KEY,
    winning_team VARCHAR(100),
    losing_team VARCHAR(100),
    margin VARCHAR(50),
    result_date DATE
);
SELECT * From result;
INSERT INTO result (matchid, winning_team, losing_team, margin, result_date)
VALUES
    (1, 'India', 'Australia', 'By 50 Runs', '2025-01-22'),
    (2, 'Pakistan', 'Sri Lanka', 'By 5 Wickets', '2025-01-23'),
    (3, 'England', 'New Zealand', 'By 100 Runs', '2025-01-24');
    