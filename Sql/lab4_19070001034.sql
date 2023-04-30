CREATE DATABASE  IF NOT EXISTS `week04_lab`;
USE `week04_lab`;
DROP TABLE IF EXISTS worldcountries;

CREATE TABLE SteamGameStats(
GameID int NOT NULL primary key,
GameName varchar(50),
DailyMaxPlayers int default null,
AllTimeMax int default NULL,
Developer varchar(50),
ReleaseDate Date,
USDPrice Double DEFAULT NULL
);

INSERT INTO SteamGameStats values(101,"Counter-Strike: Global Offensive",10000,151664,"Hidden Path Entertainment","2012-09-21",14.99);
INSERT INTO SteamGameStats values(111,"The Witcher 3: Wild Hunt",14700,120000,"CD Projekt","2015-05-18",49.99);
INSERT INTO SteamGameStats values(121,"Sims 4",1300,15664,"The Sims Studio","2014-09-02",19.99);
INSERT INTO SteamGameStats VALUES(131, "Portal 2" ,6010 ,300030 ,"Valve", "2011-04-18", 9.99);
INSERT INTO SteamGameStats values(141,"Half-Life: Alyx",270,10764,"Valve","2020-03-23",59.99);
update steamgamestats set developer="Valve" where GameId=141;

select* from SteamGameStats;


ALTER TABLE SteamGameStats ADD TRYPrice double default null ;

SET SQL_SAFE_UPDATES = 0;
UPDATE SteamGameStats SET TRYPrice =9.2*14.99 WHERE GameID=101;
UPDATE SteamGameStats SET TRYPrice =9.2*49.99 WHERE GameID=111;
UPDATE SteamGameStats SET TRYPrice =9.2*19.99 WHERE GameID=121;
UPDATE SteamGameStats SET TRYPrice =9.2*9.99 WHERE GameID=131;
UPDATE SteamGameStats SET TRYPrice =9.2*59.99 WHERE GameID=141;

select * from SteamGameStats where Developer like "%Valve" ;
drop table SteamGameStats;

-- Ece Mutlu 19070001034

