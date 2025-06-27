CREATE TABLE leagues (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    understatNotation VARCHAR(100)
);

CREATE TABLE teams (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE players (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE games (
    game_id INT PRIMARY KEY,
    league_id INT,
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
    FOREIGN KEY (homeTeamID) REFERENCES teams(id),
    FOREIGN KEY (awayTeamID) REFERENCES teams(id),
    FOREIGN KEY (league_id) REFERENCES leagues(id)
);

CREATE TABLE appearances (
    game_id INT,
    player_id INT,
    team_id INT,
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
    minutes_played INT,
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (player_id) REFERENCES players(id),
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE teamstats (
    game_id INT,
    team_id INT,
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
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE shots (
    game_id INT,
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
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (shooterID) REFERENCES players(id),
    FOREIGN KEY (assisterID) REFERENCES players(id)
);