PRAGMA foreign_keys = ON;

CREATE TABLE buildings(
    id INTEGER NOT NULL,
    building_name VARCHAR(63) NOT NULL, /* buidling name should be a string shorter than 63 chars */
    longitude NUMERIC(18,15) NOT NULL, /* -180 to +180; 4-digit decimal should be enough? */
    latitude NUMERIC(17,14) NOT NULL, /* -90 to +90 */
    PRIMARY KEY(id)
);

CREATE TABLE congestion(
    owner_id INTEGER NOT NULL, /* which buidling has the congestion info */
    day_of_week INTEGER NOT NULL, /* { 0 (Sunday), 1, 2, 3, 4, 5, 6} */
    time_period INTEGER NOT NULL, /* { 0 (00:00-00:59), 1, 2, ..., 22, 23 (23:00-23:59) } */
    cong_level NUMERIC(19,17) NOT NULL, /* 0 <= congestion level <= 1 */
    PRIMARY KEY(day_of_week, time_period),
    FOREIGN KEY(owner_id) REFERENCES buildings(id)
);