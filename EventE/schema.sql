DROP TABLE IF EXISTS EVENT;
DROP TABLE IF EXISTS ATTENDEE;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS SCHEDULE;
DROP TABLE IF EXISTS TASK;
DROP TABLE IF EXISTS VENUE;
DROP TABLE IF EXISTS VENDOR;
DROP TABLE IF EXISTS SUPPLIES;
DROP TABLE IF EXISTS WEATHER_CONDITION;

CREATE TABLE EVENT (
    EVENT_ID INTEGER PRIMARY KEY,
    EVENT_NAME VARCHAR(100) NOT NULL,
    EVENT_DATE VARCHAR(100) NOT NULL
);

CREATE TABLE ATTENDEE (
    ATTENDEE_ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    PHONE_NUMBER VARCHAR(100),
    EVENT_ID INTEGER NOT NULL,
    FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
);

CREATE TABLE STAFF (
    STAFF_ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    ROLE VARCHAR(100) CHECK (ROLE IN ('Coordinator', 'Worker', 'Supervisor', 'Manager', 'Security', 'Volunteer')) NOT NULL,
    EVENT_ID INTEGER NOT NULL,
    FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
);

CREATE TABLE SCHEDULE (
    SCHEDULE_ID INTEGER PRIMARY KEY,
    START_DATE VARCHAR(100) NOT NULL,
    END_DATE VARCHAR(100) NOT NULL,
    EVENT_ID INTEGER NOT NULL,
    FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
);

CREATE TABLE TASK (
    TASK_ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    EVENT_ID INTEGER NOT NULL,
    FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
);

CREATE TABLE VENUE (
    VENUE_ID INTEGER PRIMARY KEY,
    VENUE_NAME VARCHAR(100) NOT NULL,
    LOCATION VARCHAR(100) NOT NULL,
    CAPACITY INTEGER CHECK (CAPACITY >= 0)
);

CREATE TABLE VENDOR (
    VENDOR_ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    AVAILABILITY VARCHAR(100)
);

CREATE TABLE SUPPLIES (
    SUPPLY_ID INTEGER PRIMARY KEY,
    SUPPLY_NAME VARCHAR(100) NOT NULL,
    QUANTITY INTEGER CHECK (QUANTITY >= 0),
    VENDOR_ID INTEGER NOT NULL,
    EVENT_ID INTEGER NOT NULL,
    FOREIGN KEY (VENDOR_ID) REFERENCES VENDOR(VENDOR_ID),
    FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
);

CREATE TABLE WEATHER_CONDITION (
    DATASET_ID INTEGER PRIMARY KEY,
    TEMPERATURE REAL CHECK (TEMPERATURE BETWEEN -50 AND 50),
    HUMIDITY REAL CHECK (HUMIDITY BETWEEN 0 AND 100),
    EVENT_ID INTEGER NOT NULL,
    FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
);