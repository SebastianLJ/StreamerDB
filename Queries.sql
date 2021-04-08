CREATE DATABASE streamerdb;
USE streamerdb;

# A SELECT Query that uses NATURAL JOIN and WHERE to find the instructors who has instructed a film of the 'Crime' genre by using pattern matching. 
SELECT InstId, Genre FROM Movie NATURAL JOIN Instructs WHERE Genre LIKE '%Crime%';

# A SELECT Query that uses GROUP BY to sort the actors in most movies acted in. 
SELECT FullName, COUNT(MovieId) as Movies FROM ActsIn NATURAL JOIN Actor GROUP BY FullName ORDER BY Movies DESC;

# A SELECT Query that uses IN to find actors who as acted in movies instructed by 'Cristopher Nolan'
SELECT FullName FROM Actor WHERE ActorId IN (SELECT ActorId FROM ActsIn NATURAL JOIN Instructs NATURAL JOIN Instructor WHERE FullName = "Christopher Nolan");