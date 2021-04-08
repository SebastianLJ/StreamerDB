CREATE DATABASE streamerdb;
USE streamerdb;

# A SELECT Query that uses NATURAL JOIN and WHERE to find the instructors who has instructed a film of the 'Crime' genre by using pattern matching. 
SELECT FullName, Genre 
FROM Movie NATURAL JOIN Instructs NATURAL JOIN Instructor
WHERE Genre LIKE '%Crime%'
GROUP BY InstID;

# A SELECT Query that uses GROUP BY to sort the actors in most movies acted in. 
SELECT FullName, COUNT(MovieId) as Movies 
FROM ActsIn NATURAL JOIN Actor 
GROUP BY FullName 
ORDER BY Movies DESC;

# A SELECT Query that uses IN to find actors who as acted in movies instructed by 'Cristopher Nolan'
SELECT FullName 
FROM Actor 
WHERE ActorId IN 
	(SELECT ActorId 
    FROM ActsIn NATURAL JOIN Instructs NATURAL JOIN Instructor 
    WHERE FullName = "Christopher Nolan");
    

# A SELECT Query that uses natural join to find a users favorite movie names
SELECT MovieName 
FROM Customer NATURAL JOIN Favorite NATURAL JOIN Movie
WHERE UserID = '184209';

# A SELECT Query that uses natural join to show most recently watched movies and time seen of movie
SELECT MovieName, TimeSeen, Length, DateWatched
FROM Customer NATURAL JOIN Watching NATURAL JOIN Movie
WHERE UserID = '184186'
ORDER BY DateWatched DESC;