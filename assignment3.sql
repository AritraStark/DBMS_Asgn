CREATE TABLE employee_db(
    ID int(6) CHECK (BINARY UPPER(ID) = BINARY ID)),
    DEPT_ID int(6),
    NAME varchar(10),
    ADDRESS varchar(20),
    CITY varchar(10),
    BASIC int(10) CHECK(BASIC>=5000 AND BASIC<9000),
    DATE_OF_JOIN date,
    PRIMARY KEY(ID),
    FOREIGN KEY(DEPT_ID) REFERENCES departments_db,
);

CREATE TABLE departments_db(
    ID int(6),
    DEPT_NAME varchar(6),
);

CREATE TABLE leaves_db(
    ID int(6),
    TYPE varchar(2)
    DATE_FROM date,
    DATE_TO date,
);

INSERT INTO employee_db()
