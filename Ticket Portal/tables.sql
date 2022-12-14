--Creates all the tables required


--Train Information
CREATE TABLE trains (
    number INT NOT NULL,
    name CHAR(50) ,
    PRIMARY KEY(number)
);


--Keeps track of trains released into the system for booking
CREATE TABLE runs (
    train_number INT NOT NULL,
    departure_date DATE NOT NULL,
    ac_coach INT,
    sleeper_coach INT,
    PRIMARY KEY(train_number,departure_date),
    FOREIGN KEY(train_number) REFERENCES trains(number)
);

-- Enumrating all possible type of berths
CREATE TYPE berth AS ENUM ('LB', 'UB', 'MB', 'SL', 'SU');

CREATE TYPE seats_schema AS (
    berth_number INT, coach INT, berth_type berth
);

--Stores ticket information
CREATE TABLE tickets (
    PNR CHAR(19) ,
    train_number INT ,
    journey_date DATE ,
    passenger_name CHAR(16) ,
    coach CHAR(4) ,
    berth_type berth ,
    berth_number INT ,
    FOREIGN KEY(train_number) REFERENCES trains(number)
);


-- Part 2
CREATE TABLE stations (
    station_code CHAR(4) ,
    station_name CHAR(30),
    PRIMARY KEY(station_code)
);

CREATE TABLE schedules (
    from_station CHAR(4),
    to_station CHAR(4),
    train_number INT,
    source_day INT,
    destination_day INT,
    SDT time,
    DAT time,
    FOREIGN KEY(from_station) REFERENCES stations(station_code),
    FOREIGN KEY(to_station) REFERENCES stations(station_code),
    FOREIGN KEY(train_number) REFERENCES trains(number)
);

