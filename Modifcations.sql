# The following statement increases time seen of Shawshank Redemtpion for the user with id 000000. It also updates the date watched to today
SELECT * FROM Watching WHERE MovieID='000000' AND UserID='000000';
UPDATE Watching SET TimeSeen='01:20:13', DateWatched = curdate()  WHERE MovieID='000000';
#
SELECT * FROM Watching;
# First four statements shows who acts in Shawshank Redemption, instructs it and who is currently watching it or has it favorited.
SELECT * FROM ActsIn WHERE MovieID ='000000';
SELECT * FROM Instructs WHERE MovieID='000000';
SELECT * FROM Watching WHERE MovieID='000000';
SELECT * FROM Favorite WHERE MovieID='000000';
# Now we delete Shawshank Redemption. This will cascade in the above relations. An actor and instruct can't act and instruct a movie that doesn't exist. Similarly, a person can't watch or favorite 
# a movie that doesn't exist.
DELETE FROM Movie WHERE MovieID = '000000';
# No tuples with shawshank redemption should exist. 
SELECT * FROM ActsIn WHERE MovieID ='000000';
SELECT * FROM Instructs WHERE MovieID='000000';
SELECT * FROM Watching WHERE MovieID='000000';
SELECT * FROM Favorite WHERE MovieID='000000';
# Say a user hasn't payed his montly fee, then his subscription will get cancelled. 
SELECT * FROM Customer WHERE UserID='000000';
UPDATE Customer SET Subscription=false WHERE UserID='000000';
SELECT * FROM Customer WHERE UserID='000000';
# A user can also remove a movie from his list of favorite movies.
SELECT * FROM Favorite WHERE UserID='000001';
DELETE FROM Favorite WHERE UserID='000001' AND MovieID='000002';
SELECT * FROM Favorite WHERE UserID='000001';
# A user has finished a movie and is thus no longer watching it.
SELECT * FROM Watching WHERE UserID='000003' AND MovieID ='000003';
DELETE FROM Watching WHERE  UserID='000003' AND MovieID ='000003';
SELECT * FROM Watching WHERE UserID='000003' AND MovieID ='000003';
# An actor gets a new top fan
UPDATE TopFan SET FullName='Cristian Botezatu' WHERE ActorID='000001';