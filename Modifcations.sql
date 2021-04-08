# The following statement increases time seen of Django Unchained for the user with id 000004. It also updates the date watched to today
SELECT * FROM Watching WHERE MovieID='000004' AND UserID='184185';
UPDATE Watching SET TimeSeen='01:20:13', DateWatched = curdate()  WHERE MovieID='000004';
SELECT * FROM Watching;

# First four statements shows who acts in The Dark Knight, instructs it and who is currently watching it or has it favorited.
SELECT * FROM ActsIn WHERE MovieID ='000003';
SELECT * FROM Instructs WHERE MovieID='000003';
SELECT * FROM Watching WHERE MovieID='000003';
SELECT * FROM Favorite WHERE MovieID='000003';
# Now we delete The Dark Knight. This will cascade in the above relations. An actor and instruct can't act and instruct a movie that doesn't exist. Similarly, a person can't watch or favorite 
# a movie that doesn't exist.
DELETE FROM Movie WHERE MovieID = '000003';
# No tuples with The Dark Knight should exist. 
SELECT * FROM ActsIn WHERE MovieID ='000003';
SELECT * FROM Instructs WHERE MovieID='000003';
SELECT * FROM Watching WHERE MovieID='000003';
SELECT * FROM Favorite WHERE MovieID='000003';

# Say a user hasn't payed his montly fee, then his subscription will get cancelled. 
SELECT * FROM Customer WHERE UserID='184186';
UPDATE Customer SET Subscription=false WHERE UserID='184186';
SELECT * FROM Customer WHERE UserID='184186';

# A user removes Shawshank Redemption from his list of favorite movies.
SELECT * FROM Favorite WHERE UserID='184209';
DELETE FROM Favorite WHERE UserID='184209' AND MovieID='000000';
SELECT * FROM Favorite WHERE UserID='184209';

# A user has finished watching Godfather and is no longer watching it.
SELECT * FROM Watching WHERE UserID='184186' AND MovieID ='000001';
DELETE FROM Watching WHERE  UserID='184186' AND MovieID ='000001';
SELECT * FROM Watching WHERE UserID='184186' AND MovieID ='000001';

# Tim Robbins gets a new top fan
SELECT * FROM TopFan WHERE ActorID='200000';
UPDATE TopFan SET FullName='Cristian Botezatu' WHERE ActorID='200000';
SELECT * FROM TopFan WHERE ActorID='200000';