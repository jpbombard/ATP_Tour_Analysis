Create Table IF NOT EXISTS Matches(
	tourney_id Varchar(255),
	tourney_name Varchar(255),
	surface	Varchar(255),
	draw_size Numeric,
	tourney_level Varchar(255),
	tourney_date Date,
	match_num Numeric,
	winner_id Numeric,	
	winner_seed	Numeric,
	winner_entry Varchar(255),	
	winner_name	Varchar(255),
	winner_hand	Varchar(255),
	winner_ht Numeric,
	winner_ioc Varchar(255),
	winner_age Numeric,
	loser_id Numeric,
	loser_seed Numeric,
	loser_entry	Varchar(255),
	loser_name Varchar(255),
	loser_hand Varchar(255),
	loser_ht Numeric,
	loser_ioc Varchar(255),
	loser_age Numeric,
	score Varchar(255),
	best_of	Numeric,
	round Varchar(255),
	minutes	Numeric,
	w_ace Numeric,
	w_df Numeric,
	w_svpt Numeric,
	w_1stIn	Numeric,
	w_1stWon Numeric,
	w_2ndWon Numeric,
	w_SvGms	Numeric,
	w_bpSaved Numeric,
	w_bpFaced Numeric,	
	l_ace Numeric,
	l_df Numeric,
	l_svpt Numeric,
	l_1stIn Numeric,
	l_1stWon Numeric,
	l_2ndWon Numeric,
	l_SvGms	Numeric,
	l_bpSaved Numeric,
	l_bpFaced Numeric,
	winner_rank	Numeric,
	winner_rank_points Numeric,
	loser_rank Numeric,
	loser_rank_points Numeric, 
	Foreign Key (winner_name) References Matches(loser_name)
)


-- Data checks

Select count(*)
from matches


-- # of Titles that Novak Djokovic won from 2015-2024
Select winner_name as Player, count(winner_name) as Titles
From Matches 
Where winner_name = 'Novak Djokovic' and round = 'F'

-- # of Titles that Rafael Nadal won on clay from 2015-2024
Select winner_name as Player, count(winner_name) as Titles
From Matches 
Where winner_name = 'Rafael Nadal' and round = 'F' and surface = 'Clay'

-- List of Titles that a qualifier won between 2015-2024
Select winner_name as Player, winner_rank as Ranking, tourney_name as Tournament, tourney_date as Date
From Matches
Where round = 'F' and winner_entry = 'Q'

-- List of players who won Olympic Gold Medals between 2015-2024
Select *
From Matches
Where round = 'F' and tourney_name Like '%Olympics'

-- List of players who have played at least 50 matches between 2015-2024 ordered by win percentage
With Winner as (
	Select winner_name as Player, count(winner_name) as Wins
	From Matches 
	Group by Player
),
Loser as (
	Select loser_name as Player, count(loser_name) as Losses
	From Matches 
	Group by Player
),
Players as (
	Select Player From Winner 
	UNION
	Select Player From Loser
)
Select p.Player, w.Wins, l.Losses, (w.Wins + l.Losses) as Matches_Played, Round((w.Wins * 100.0 / (w.Wins + l.Losses)), 2) as Winning_Percentage
From Players p
Left Join Winner w on w.Player = p.Player
Left Join Loser l on l.player = p.Player
Where Matches_Played > 50
Order By Winning_Percentage DESC










