CREATE OR REPLACE VIEW fourth_down_plays AS
SELECT *
FROM plays
WHERE down = 4;

CREATE OR REPLACE VIEW red_zone_plays AS
SELECT *
FROM plays
WHERE yardline_100 <= 20;

CREATE OR REPLACE VIEW vikings_offense AS
SELECT *
FROM plays
WHERE posteam = 'MIN';


