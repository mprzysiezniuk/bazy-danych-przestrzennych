--1
SELECT matchid, player FROM gole WHERE teamid='POL';

--2
SELECT * FROM mecze JOIN gole on mecze.id=gole.matchid WHERE mecze.id=1004 and gole.player='Jakub Blaszczykowski';

--3
SELECT player, stadium, mdate, teamid FROM mecze JOIN gole ON (id=matchid) WHERE teamid='POL';

--4
SELECT player, team1, team2 FROM mecze JOIN gole ON (id=matchid) WHERE player LIKE 'Mario%';

--5
SELECT player, teamid, coach, gtime FROM mecze JOIN gole ON mecze.id=gole.matchid JOIN druzyny ON gole.teamid=druzyny.id WHERE gtime<=10;

--6
SELECT teamname, mdate FROM mecze JOIN druzyny ON mecze.team1=druzyny.id OR mecze.team2=druzyny.id WHERE coach='Franciszek Smuda';

--7
SELECT player FROM gole JOIN mecze ON gole.matchid=mecze.id WHERE stadium='National Stadium, Warsaw';

--8
SELECT player, gtime FROM mecze JOIN gole ON matchid = id
WHERE team1='GER' AND team2='GRE' AND teamid='GRE';

--9 
SELECT teamname, COUNT(matchid) as ilosc_goli FROM druzyny JOIN gole ON teamid=id GROUP BY teamname ORDER BY ilosc_goli DESC;

--10
SELECT stadium, COUNT(matchid) as ilosc_goli FROM mecze JOIN gole ON id=matchid GROUP BY stadium ORDER BY ilosc_goli DESC;
