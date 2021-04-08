USE streamerdb;

DROP FUNCTION IF EXISTS getActorName;
DROP FUNCTION IF EXISTS getInstName;
DROP PROCEDURE IF EXISTS getMovieName;
DROP TRIGGER IF EXISTS finished_movie_check;


DELIMITER // 
CREATE FUNCTION getActorName(vActorId VARCHAR(6)) RETURNS VARCHAR(50)
BEGIN
DECLARE ActorName VARCHAR(50); 
SELECT FullName INTO ActorName FROM Actor WHERE ActorId = vActorId;
RETURN ActorName;
END//
DELIMITER ;

SELECT getActorName('200000');

DELIMITER // 
CREATE FUNCTION getInstName(vInstId VARCHAR(6)) RETURNS VARCHAR(50)
BEGIN
DECLARE InstName VARCHAR(50); 
SELECT FullName INTO InstName FROM Instructor WHERE InstId = vInstId;
RETURN InstName;
END//
DELIMITER ;

SELECT getInstName(100000);


DELIMITER //
CREATE PROCEDURE getMovieName(IN vMovieId VARCHAR(6), OUT vMovieName VARCHAR(50))
BEGIN 
SELECT MovieName INTO vMovieName FROM Movie WHERE MovieId = vMovieId;
END//
DELIMITER ;

SELECT * FROM Movie;

CALL getMovieName('000001', @MovieName);
SELECT @MovieName;

DELIMITER //
CREATE TRIGGER finished_movie_check BEFORE UPDATE ON Watching
FOR EACH ROW
BEGIN
	IF NEW.TimeSeen >= (SELECT Length FROM Movie WHERE MovieID = NEW.MovieID)
    THEN DELETE FROM Favorite WHERE UserID = NEW.UserID AND MovieID = NEW.MovieID;
	END IF;
END// 
DELIMITER ;

SELECT * FROM watching;
SELECT * FROM Favorite;
UPDATE Watching SET TimeSeen='02:22', DateWatched = curdate() WHERE MovieID='000000';
SELECT * FROM Favorite