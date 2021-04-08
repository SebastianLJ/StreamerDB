#CREATE DATABASE streamerdb;
USE streamerdb;

DROP TABLE IF EXISTS TopFan;
DROP TABLE IF EXISTS Watching;
DROP TABLE IF EXISTS Favorite;
DROP TABLE IF EXISTS ActsIn;
DROP TABLE IF EXISTS Instructs;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Actor;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Movie;
DROP VIEW IF EXISTS crime_movies;



CREATE TABLE Customer
(
UserID	VARCHAR(6),
FullName	VARCHAR(50),
Subscription bool,
PRIMARY KEY(UserID)
);

CREATE TABLE Actor
(
ActorID	 VARCHAR(6),
FullName	VARCHAR(50),
PRIMARY KEY(ActorID)
);

CREATE TABLE Instructor
(
InstID	VARCHAR(6),
FullName VARCHAR(50),
PRIMARY KEY(InstID)
);

CREATE TABLE Movie
(
MovieID VARCHAR(6),
MovieName VARCHAR(50),
ReleaseDate DATE,
Genre SET('Action', 'Crime', 'Comedy', 'Documentary', 'Drama', 
			'Horror', 'Romantic', 'Sci-fi', 'Sport', 'Western'),
Length TIME,
PRIMARY KEY(MovieID)
);

CREATE TABLE ActsIn
(
ActorID VARCHAR(6),
MovieID VARCHAR(6),
PRIMARY KEY(ActorID, MovieID),
FOREIGN KEY(ActorID) REFERENCES Actor(ActorID) ON DELETE CASCADE,
FOREIGN KEY(MovieID) REFERENCES Movie(MovieID) ON DELETE CASCADE
);

CREATE TABLE Instructs
(
InstID VARCHAR(6),
MovieID VARCHAR(6),
PRIMARY KEY(InstID, MovieID),
FOREIGN KEY(InstID) REFERENCES Instructor(InstID) ON DELETE CASCADE,
FOREIGN KEY(MovieID) REFERENCES Movie(MovieID) ON DELETE CASCADE
);

CREATE TABLE TopFan
(
FullName VARCHAR(50),
ActorID VARCHAR(6),
PRIMARY KEY (FullName, ActorID),
FOREIGN KEY(ActorID) REFERENCES Actor(ActorID)
);

CREATE TABLE Watching
(
UserID VARCHAR(6),
MovieID VARCHAR(6),
DateWatched DATE,
TimeSeen TIME,
PRIMARY KEY(UserID, MovieID),
FOREIGN KEY(UserID) REFERENCES Customer(UserID) ON DELETE CASCADE,
FOREIGN KEY(MovieID) REFERENCES Movie(MovieID) ON DELETE CASCADE
);

CREATE TABLE Favorite
(
UserID VARCHAR(6),
MovieID VARCHAR(6),
DateFavorited DATE,
PRIMARY KEY(UserID, MovieID),
FOREIGN KEY(UserID) REFERENCES Customer(UserID) ON DELETE CASCADE,
FOREIGN KEY(MovieID) REFERENCES Movie(MovieID) ON DELETE CASCADE
);

# population of db

INSERT Customer VALUES
('184185', 'Emil Sommer Desler', true),
('184186', 'Noah Bastian Christiansen', true),
('184209', 'Sebastian Lund Jensen', true),
('000000', 'Fati Row', false);
 
 
Insert Movie VALUES
('000000', 'Shawshank Redemption', '1995-04-28', 'Drama', '02:22'),
('000001', 'Godfather', '1972-12-26', 'Crime,Drama', '02:55'),
('000002', 'Godfather Part 2', '1975-08-29', 'Crime,Drama', '03:22'),
('000003', 'The Dark Knight', '2008-07-22', 'Action,Crime,Drama', '02:32'),
('000004', 'Django Unchained', '2013-01-24', 'Drama,Western', '02:45');

INSERT Instructor VALUES
('100000', 'Frank Darabont'),
('100001', 'Francis Ford Coppola'),
('100002', 'Christopher Nolan'),
('100003', 'Quentin Tarantino');

INSERT Actor VALUES
('200000', 'Tim Robbins'),
('200001', 'Morgan Freeman'),
('200002', 'Marlon Brando'),
('200003', 'Al Pacino'),
('200004', 'Christian Bale'),
('200005', 'Heath Ledger'),
('200006', 'Michael Caine'),
('200007', 'Jamie Foxx'),
('200008', 'Christoph Waltz'),
('200009', 'Leonardo DiCaprio'),
('200010', 'Samuel L. Jackson'),
('200011', 'Margot Robbie');

INSERT Instructs VALUES
('100000', '000000'),
('100001', '000001'),
('100001', '000002'),
('100002', '000003'),
('100003', '000004');

INSERT ActsIn VALUES
('200000', '000000'),
('200001', '000000'),
('200001', '000003'),
('200002', '000001'),
('200002', '000002'),
('200003', '000001'),
('200003', '000002'),
('200004', '000003'),
('200005', '000003'),
('200006', '000003'),
('200007', '000004'),
('200008', '000004'),
('200009', '000004'),
('200010', '000004');

INSERT TopFan VALUES
('Noah Bastian Christiansen', '200011'),
('Anne Haxthausen', '200000');

INSERT Favorite VALUES
('184209', '000000', '2021-04-01'),
('184209', '000003', '2021-04-02'),
('184209', '000004', '2021-04-03');

Insert Watching VALUES
('184186', '000001', '2021-04-01', '01:22'),
('184186', '000003', '2021-04-03', '02:05'),
('184185', '000004', '2021-04-07', '00:35');

CREATE VIEW crime_movies as
	SELECT *
    FROM MOVIE
    WHERE Genre LIKE '%Crime%';

SELECT * FROM Customer;
SELECT * FROM Movie;
SELECT * FROM Instructor;
SELECT * FROM Actor;
SELECT * FROM Instructs;
SELECT * FROM ActsIn;
SELECT * FROM TopFan;
SELECT * FROM Watching;
SELECT * FROM crime_movies;