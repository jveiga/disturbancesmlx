DROP TABLE station_has_wifiap;
DROP TABLE wifiap;
DROP TABLE line_has_station;
DROP TABLE station;
DROP TABLE line_disturbance_has_status;
DROP TABLE line_disturbance;
DROP TABLE line_status;
DROP TABLE mline;
DROP TABLE network;
DROP TABLE source;

CREATE TABLE IF NOT EXISTS "source" (
    id VARCHAR(36) PRIMARY KEY,
    name TEXT NOT NULL,
    automatic BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS "network" (
    id VARCHAR(36) PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "mline" (
    id VARCHAR(36) PRIMARY KEY,
    name TEXT NOT NULL,
    color VARCHAR(6) NOT NULL,
    network VARCHAR(36) NOT NULL REFERENCES network (id)
);

CREATE TABLE IF NOT EXISTS "line_status" (
    id VARCHAR(36) PRIMARY KEY,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    mline VARCHAR(36) NOT NULL REFERENCES mline (id),
    downtime BOOL NOT NULL,
    status TEXT NOT NULL,
    source VARCHAR(36) NOT NULL REFERENCES source (id)
);

CREATE TABLE IF NOT EXISTS "line_disturbance" (
    id VARCHAR(36) PRIMARY KEY,
    time_start TIMESTAMP WITH TIME ZONE NOT NULL,
    time_end TIMESTAMP WITH TIME ZONE,
    mline VARCHAR(36) NOT NULL REFERENCES mline (id),
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "line_disturbance_has_status" (
    disturbance_id VARCHAR(36) NOT NULL REFERENCES line_disturbance(id),
    status_id VARCHAR(36) NOT NULL REFERENCES line_status (id),
    PRIMARY KEY (disturbance_id, status_id)
);

CREATE TABLE IF NOT EXISTS "station" (
    id VARCHAR(36) PRIMARY KEY,
    name TEXT NOT NULL,
    network VARCHAR(36) NOT NULL REFERENCES network (id)
);

CREATE TABLE IF NOT EXISTS "line_has_station" (
    line_id VARCHAR(36) NOT NULL REFERENCES mline (id),
    station_id VARCHAR(36) NOT NULL REFERENCES station (id),
    position INT NOT NULL,
    PRIMARY KEY (line_id, station_id)
);

CREATE TABLE IF NOT EXISTS "wifiap" (
    bssid VARCHAR(17) PRIMARY KEY,
    ssid TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "station_has_wifiap" (
    station_id VARCHAR(36) NOT NULL REFERENCES station (id),
    bssid VARCHAR(17) NOT NULL REFERENCES wifiap (bssid),
    PRIMARY KEY (station_id, bssid)
);

CREATE TABLE IF NOT EXISTS "dataset_info" (
    network_id VARCHAR(36) NOT NULL REFERENCES network (id) PRIMARY KEY,
    version TIMESTAMP WITH TIME ZONE NOT NULL,
    authors TEXT[] NOT NULL
);