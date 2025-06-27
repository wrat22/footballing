CREATE TABLE leagues (
    leagueID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    understatNotation VARCHAR(100)
);

CREATE TABLE teams (
    teamID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE players (
    playerID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE games (
    gameID INT PRIMARY KEY,
    leagueID INT,
    season VARCHAR(20),
    date DATE NOT NULL,
    homeTeamID INT,
    awayTeamID INT,
    homeGoals INT,
    awayGoals INT,
    homeProbability DECIMAL(5,2),
    drawProbability DECIMAL(5,2),
    awayProbability DECIMAL(5,2),
    homeGoalsHalfTime INT,
    awayGoalsHalfTime INT,
    B365H DECIMAL(5,2),
    B365D DECIMAL(5,2),
    B365A DECIMAL(5,2),
    BWH DECIMAL(5,2),
    BWD DECIMAL(5,2),
    BWA DECIMAL(5,2),
    IWH DECIMAL(5,2),
    IWD DECIMAL(5,2),
    IWA DECIMAL(5,2),
    PSH DECIMAL(5,2),
    PSD DECIMAL(5,2),
    PSA DECIMAL(5,2),
    WHH DECIMAL(5,2),
    WHD DECIMAL(5,2),
    WHA DECIMAL(5,2),
    VCH DECIMAL(5,2),
    VCD DECIMAL(5,2),
    VCA DECIMAL(5,2),
    PSCH DECIMAL(5,2),
    PSCD DECIMAL(5,2),
    PSCA DECIMAL(5,2),
    FOREIGN KEY (homeTeamID) REFERENCES teams(teamID),
    FOREIGN KEY (awayTeamID) REFERENCES teams(teamID),
    FOREIGN KEY (leagueID) REFERENCES leagues(leagueID)
);

CREATE TABLE appearances (
    gameID INT,
    playerID INT,
    goals INT,
    ownGoals INT,
    shots INT,
    xGoals DECIMAL(4,3),
    xGoalsChain DECIMAL(4,3),
    xGoalsBuildup DECIMAL(4,3),
    assists INT,
    keyPasses INT,
    xAssists DECIMAL(4,3),
    position VARCHAR(50),
    positionOrder INT,
    yellowCard INT,
    redCard INT,
    timeOnPitch INT,
    substituteIn INT,
    substituteOut INT,
    leagueID INT,
    FOREIGN KEY (gameID) REFERENCES games(gameID),
    FOREIGN KEY (playerID) REFERENCES players(playerID),
    FOREIGN KEY (leagueID) REFERENCES leagues(leagueID)
);

CREATE TABLE teamstats (
    gameID INT,
    teamID INT,
    season VARCHAR(20),
    date DATE NOT NULL,
    location VARCHAR(10),
    goals INT,
    xGoals DECIMAL(4,3),
    shots INT,
    shotsOnTarget INT,
    deep INT,
    ppda DECIMAL(5,2),
    fouls INT,
    corners INT,
    yellowCards INT,
    redCards INT,
    result VARCHAR(10),
    FOREIGN KEY (gameID) REFERENCES games(gameID),
    FOREIGN KEY (teamID) REFERENCES teams(teamID)
);

CREATE TABLE shots (
    gameID INT,
    shooterID INT,
    assisterID INT,
    minute INT,
    situation VARCHAR(50),
    lastAction VARCHAR(50),
    shotType VARCHAR(50),
    shotResult VARCHAR(50),
    xGoal DECIMAL(4,3),
    positionX DECIMAL(5,2),
    positionY DECIMAL(5,2),
    FOREIGN KEY (gameID) REFERENCES games(gameID),
    FOREIGN KEY (shooterID) REFERENCES players(playerID),
    FOREIGN KEY (assisterID) REFERENCES players(playerID)
);