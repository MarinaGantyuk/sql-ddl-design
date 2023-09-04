BEGIN;


CREATE TABLE IF NOT EXISTS Region
(
    id integer NOT NULL,
    title text NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO Region (id, title)
VALUES
(1, 'San Francisco'),
(2, 'Atlanta'),
(3, 'Seattle');

CREATE TABLE IF NOT EXISTS users
(
    id integer NOT NULL,
    "prefer region" integer NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT regionid FOREIGN KEY ("prefer region")
    REFERENCES Region (id)
);
INSERT INTO users
(id, "prefer region", name)
VALUES
(1,1, 'John Doe'),
(2,3, 'Sonya Zind'),
(3,2, 'Daniel Smith');

CREATE TABLE IF NOT EXISTS Categories
(
    id integer NOT NULL,
    title text NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO Categories
(id, title)
VALUES
(2, 'Electronics'),
(1, 'Toys'),
(3, 'Clothes');

CREATE TABLE IF NOT EXISTS Posts
(
    id integer NOT NULL,
    title text NOT NULL,
    userid integer NOT NULL,
    location text NOT NULL,
    regionid integer NOT NULL,
    categoryid integer NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT userid FOREIGN KEY (userid)
    REFERENCES users (id),
	CONSTRAINT regionid FOREIGN KEY (regionid)
    REFERENCES Region (id),
	CONSTRAINT categoryid FOREIGN KEY (categoryid)
    REFERENCES Categories (id)
);
INSERT INTO Posts
(id, title, userid, location, regionid, categoryid)
VALUES
(1, 'drone', 1, '2117 s Todd Ave', 1, 2),
(2, 'hockey stick', 3, '3650 w Bullrun st', 2, 3),
(3, 'dress', 2, '700 s Lexington Ave', 3, 1);




END;

SELECT *
FROM Posts
JOIN users ON userid = users.id
JOIN Region ON regionid = Region.id
JOIN Categories ON categoryid = Categories.id